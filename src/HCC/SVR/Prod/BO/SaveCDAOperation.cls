/// 
/// Author: Jeff Liu
/// Date: 2021-07-13 15:14:20
/// LastEditTime: 2021-08-27 16:42:37
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/src/HCC/SVR/Prod/BO/SaveCDAOperation.cls
/// Jeff.liu@intersytems.com
/// 
/// 对共享文档进行解析和操作（存储、更新等）
Class HCC.SVR.Prod.BO.SaveCDAOperation Extends Ens.BusinessOperation [ Language = objectscript ]
{

/// 文档结构验证设置
Property DocSchemaValidate As %Boolean [ InitialExpression = 0 ];

/// 文档值集验证设置
Property DocValueSetValidate As %Boolean [ InitialExpression = 0 ];

Parameter SETTINGS = "DocSchemaValidate:Basic,DocValueSetValidate:Basic";

Parameter INVOCATION = "Queue";

Method GetDocForSave(pRequest As HCC.SVR.Prod.MSG.SVRRequest, Output pResponse As HCC.SVR.Prod.MSG.SVRResponse) As %Status
{
    Try {
        #Dim pDoc as EnsLib.EDI.XML.Document
        #Dim gxwdDoc as HCC.DocRepository.AllDocs
        #Dim tsc as %Status
        //HANG 5
        Set pDoc= ##class(EnsLib.EDI.XML.Document).ImportFromLibraryStream(pRequest.Message)
        Set pDoc.DocType=pRequest.DocType_":"_pRequest.DocType
        Set ValueVResult =""
        Set SchemaVResult =""
        Set ValueErr =""
        Set SchemaErr =""
        Set gxwdDoc=##class(HCC.DocRepository.AllDocs).%New()
        /// 身份证号
        Set PatCardId =pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/recordTarget[1]/patient[1]/patientPerson[1]/id[1]/item[1]/@extension")

        set PatName =pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/recordTarget[1]/patient[1]/patientPerson[1]/name[1]/item[1]/part[1]/@value")
        /// 若病人不存在 注册至病人表
        If (##class(HCC.DocRepository.Patient).UKPatIdIExists(PatCardId)=0)
        {
         #dim Patient as HCC.DocRepository.Patient = ##class(HCC.DocRepository.Patient).%New()
         /// 患者唯一标识
         Set Patient.PatId =PatCardId
         /// 身份证号
         Set Patient.PatCardId=PatCardId
         /// 患者姓名
         Set Patient.PatName = PatName
         
         Set tsc =Patient.%Save()
         Set gxwdDoc.Patient= ##class(HCC.DocRepository.Patient).UKPatCardIdIOpen(PatCardId)
         If $$$ISERR(tsc) { 
          Set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"保存病人失败"_$CHAR(10)_tsc) 
          Quit
          }
        }
        //更新病人信息
        else {
           
           set Pat = ##class(HCC.DocRepository.Patient).UKPatIdIOpen(PatCardId)
           set Pat.PatId =PatCardId
           set Pat.PatCardId =PatCardId
           Set Pat.PatName = PatName

        }
        Set gxwdDoc.Patient= ##class(HCC.DocRepository.Patient).UKPatCardIdIOpen(PatCardId)
        
        // 住院号标识 virdoc seems not be able to get xpath search
        // have to use xpath document this slows down speed
        
        set InHosCS="""2.16.156.10011.1.12"""
        SET OutPatCS="""2.16.156.10011.1.11"""
        Set tStatus = ##class(%XML.XPATH.Document).CreateFromStream(pRequest.Message, .tDocument)
        set tDocument.PrefixMappings="s urn:hl7-org:v3"     
	    Set tStatus = tDocument.EvaluateExpression("//*[@root="_InHosCS_"]", "@extension", .tResults)
	     If (tResults.Count() > 0) 
	     Set gxwdDoc.PatInHosCode = tResults.GetAt(1).Value
	     Else  Set gxwdDoc.PatInHosCode = ""
        
        Set tStatus = tDocument.EvaluateExpression("//*[@root="_OutPatCS_"]", "@extension", .tResultsb)
	     If (tResults.Count() > 0) 
	     Set gxwdDoc.PatOutHosCode = tResultsb.GetAt(1).Value
	     Else  Set gxwdDoc.PatOutHosCode = ""
        
       // set InHosCS="""2.16.156.10011.1.12"""
        //Set gxwdDoc.PatInHosCode =pDoc.GetValueAt("//*[@root="_InHosCS_"]/@extension")
        $$$LOGINFO(gxwdDoc.PatInHosCode)
        /// 门诊号标识
       // SET OutPatCS="""2.16.156.10011.1.11"""
       // Set gxwdDoc.PatOutHosCode =pDoc.GetValueAt("//*[@root="_OutPatCS_"]/@extension")
        $$$LOGINFO(gxwdDoc.PatOutHosCode)
        /// 患者姓名
        //Set gxwdDoc.PatName =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).recordTarget(1).patient(1).choice.patientPerson(1).name(1).item(1).part(1).value")


        /// 文档类型代码
        Set DocCode =pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/code[1]/@code")

        //获得文档BASE64字符串
        Set DocBase64 = pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/storageCode[1]/originalText[1]/@value") 
        $$$LOGINFO(DocBase64)
        //Base64 解码
        Set DocContent= ##class(%SYSTEM.Encryption).Base64Decode(DocBase64)

        /// 文档原始内容
        Set DocContent = $ZCONVERT(DocContent,"I","UTF8")
        
        
        
        $$$LOGINFO("验证设置"_..DocSchemaValidate_"  "_..DocValueSetValidate)
        // 验证文档是否符合值域规则
        
        If (..DocValueSetValidate =1)
        {   
           Set DocContent = $ZCONVERT(DocContent,"O","UTF8")
           Set ValueVResult= ##class(HCC.Utils.XMLValid).ValidDocsValueRange(##class(HS.Util.StreamUtils).EnsureStream(DocContent),pDoc.DocType,.ValueErr)

           $$$LOGINFO(DocContent)

           $$$LOGINFO("验证结果"_ValueVResult_"-----------"_SchemaVResult)

           $$$LOGINFO(ValueErr)
           
        }
        // 验证文档是否符合schema 规则
        If (..DocSchemaValidate =1)
        {
            Set SchemaVResult = ##class(HCC.Utils.SchemaValidate).Validate(##class(HS.Util.StreamUtils).EnsureStream(DocContent),.SchemaErr)
        }

        If (ValueVResult=0)&&(SchemaVResult=1)
        {
            Set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"文档结构验证成功，文档值域验证失败："_$CHAR(10)_ValueErr)
            Quit
        }
         If (ValueVResult=0)&&(SchemaVResult="")
        {
            Set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"文档结构验证未验证，文档值域验证失败："_$CHAR(10)_ValueErr)
            Quit
        }
        If (ValueVResult=1)&&(SchemaVResult=0)
        {
            Set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"文档值域验证成功，文档结构验证失败："_$CHAR(10)_SchemaErr)
            Quit
        }
         If (ValueVResult="")&&(SchemaVResult=1)
        {
            Set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"文档值域未验证，文档结构验证失败："_$CHAR(10)_SchemaErr)
            Quit
        }
        If (ValueVResult=0)&&(SchemaVResult=0)
        {
            Set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"文档值域验证失败："_ValueErr_$CHAR(10)_ "文档结构验证失败："_SchemaErr)
            Quit
        }
        Set gxwdDoc.Content=DocContent
        Set gxwdDoc.DocCode=DocCode
        /// 消息创建时间
        Set msgCreatTime=pDoc.GetValueAt("creationTime(1).value")
        Set gxwdDoc.MsgCreatTime = ##class(Ens.Util.Time).ConvertDateTime(msgCreatTime,"%Y%m%d%H%M%S","%q(1)",,.tsc)

        /// 发送系统标识
        Set gxwdDoc.SenderId =pDoc.GetValueAt("/RCMR_IN000002UV02/sender[1]/device[1]/id[1]/item[1]/@extension")

        /// 文档流水号 文档唯一标识
        Set gxwdDoc.DocId =pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/id[1]/item[1]/@extension")

        
        /// 文档类型名称
        Set gxwdDoc.DocName =pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/code[1]/displayName[1]/@value")

        /// 文档生成日期时间
        Set docCreatTime =pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/effectiveTime[1]/@value")
        Set gxwdDoc.DocCreatTime=##class(Ens.Util.Time).ConvertDateTime(docCreatTime,"%Y%m%d","%q(1)",,.tsc)

        /// 文档版本号
        Set vnStr=pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/versionNumber[1]/@value")
        Set gxwdDoc.VersionNumber = ##class(%Integer).DisplayToLogical(vnStr)
    

        /// 患者就诊日期起始时间 20170101
        Set pelt=pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/recordTarget[1]/patient[1]/effectiveTime[1]/low[1]/@value")
        Set gxwdDoc.PatEffectiveLowTime =##class(Ens.Util.Time).ConvertDateTime(pelt,"%Y%m%d","%q(1)",,.tsc)
        
        /// 患者就诊日期截至时间  
        Set peht=pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/recordTarget[1]/patient[1]/effectiveTime[1]/high[1]/@value")
        Set gxwdDoc.PatEffectiveHighTime =##class(Ens.Util.Time).ConvertDateTime(peht,"%Y%m%d","%q(1)",,.tsc)


        /// 文档提供的医院标识
        Set gxwdDoc.ProHosCode =pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/recordTarget[1]/patient[1]/providerOrganization[1]/id[1]/item[1]/@extension")

        /// 文档提供的医院名称
        Set gxwdDoc.ProHosName =pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/recordTarget[1]/patient[1]/providerOrganization[1]/name[1]/item[1]/part[1]/@value")

        /// 科室代码
        Set gxwdDoc.DeptCode =pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/recordTarget[1]/patient[1]/providerOrganization[1]/organizationContains[1]/id[1]/item[1]/@extension")

        /// 文档创建者编号
        Set gxwdDoc.DocUserCode =pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/author[1]/assignedAuthor[1]/id[1]/item[1]/@extension")

        /// 文档创建者姓名
        Set gxwdDoc.DocUserName =pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/author[1]/assignedAuthor[1]/assignedPerson[1]/name[1]/item[1]/part[1]/@value")

        /// 文档保管的医院标识                    
        Set gxwdDoc.RepHosCode =pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/custodian[1]/assignedCustodian[1]/representedOrganization[1]/id[1]/item[1]/@extension")

        /// 文档保管的医院名称
        Set gxwdDoc.RepHosName =pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/custodian[1]/assignedCustodian[1]/representedOrganization[1]/name[1]/item[1]/part[1]/@value")

        /// 文档保存的服务器时间
        Set gxwdDoc.AddDate =$ZDATETIME($ZDATETIMEH($ZTIMESTAMP,-3),3,1,4)

        If (gxwdDoc.PatInHosCode ="") && (gxwdDoc.PatInHosCode ="")
        {
             Set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"住院号和门诊号必须要传递其中一个。")
             Quit
        }
        Set tsc = ##class(HCC.DocRepository.LatestDocs).UKDocIdExists(gxwdDoc.DocId)
        Set lDoc = ##class(HCC.Utils.SharedDocTransfer).AllDocToLatestDoc(gxwdDoc)
        If tsc =1
        {   Set tscd= ##class(HCC.DocRepository.LatestDocs).UKDocIdDelete(gxwdDoc.DocId)
            
            Set tsc = lDoc.%Save() 
        }
        Else{
            Set tsc = lDoc.%Save()
        }
        Set tsc =gxwdDoc.%Save()
        If (tsc){
            Set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnSuccessMsgNoContentAndSenderInfo(pRequest.MsgId)
        } Else{
            Set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"保存共享文档失败。")
        }
        
 }

  Catch exp{

  Set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"解析共享文档消息失败。"_exp.Code_exp.Data_exp.Name_exp.Location)
 }
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="HCC.SVR.Prod.MSG.SVRRequest">
        <Method>GetDocForSave</Method>
    </MapItem>
</MapItems>
}

}
