/// Author: QP
/// Version: 1.0
/// Date:2021/08/23
/// RESTful interface for HCC WS management
Class HCC.Interface.WS Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/DocumentHTML/:Id" Method="GET" Call="GetDocumentHTML"/>
<Route Url="/Document/:Id" Method="GET" Call="GetDocument"/>
<Route Url="/Document/:Id" Method="DELETE" Call="DeleteDoc"/>
<Route Url="/GenDocument/:Id" Method="GET" Call="GenerateDocFromSQL"/>
<Route Url="/DE" Method="GET" Call="ListDE"/>
<Route Url="/DE/:Id" Method="GET" Call="GetDE"/>
<Route Url="/DE" Method="PUT" Call="PUTDE"/>
<Route Url="/VS/:Id" Method="GET" Call="ListValueSetItems"/>
<Route Url="/VS/:Id/:key" Method="GET" Call="GetValueSetItem"/>
<Route Url="/VS/:Id" Method="PUT" Call="PutValueSetItem"/>
<Route Url="/DocSection/:Doctype" Method="GET" Call="GetDocSections"/>
<Route Url="/DocSection/:Doctype" Method="PUT" Call="UpdateDocSections"/>

</Routes>
}

/// 根据文档号，输出其HTML格式
/// pDocNo：文档编号
ClassMethod GetDocumentHTML(pDocNo) As %Status
{
        #dim tSC As %Status = $$$OK    
        #dim e As %Exception.AbstractException    
        Try     
        {    
            Set tInput = ##class(TRIP.GXWD.MODEL.GXWDDOC).%OpenId(6).Content
            Set tXSL = "C:\HCC\XSLT\backup\C32ViewerJW.xsl"
            Set tHTML=""
            If tInput '="" 
            {
                Set tInput = $P(tInput,"<?xml version=""1.0"" encoding=""UTF-8""?>",2)
                Set tParams="",tCompiledStyleSheet=""
                
                Set tSC=##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(tXSL,.tCompiledStyleSheet)
                If $$$ISERR(tSC) Quit
                
                Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(tInput,tCompiledStyleSheet,.tHTML,,.tParams)
                //W:($$$ISERR(tSC)) tSC
                Set tHTML = $ZCVT(tHTML,"I","UTF8")
                W tHTML
            }        
        } 
        Catch (e) 
        {        
            Set tSC=e.AsStatus()    
        }    
        Quit tSC
}

/// 获取HCC文档
/// pDocNo：文档编号
ClassMethod GetDocument(pDocNo) As %Status
{
    &SQL(
    select Content into :tRet 
    from HCC_DocRepository.LatestDocs
    where DocId=:pDocNo
    )
    If SQLCODE = 0
    {
        W tRet
    }
    Else
    {
        W "未查找到文档号:"_pDocNo
    }
    Return $$$OK
}

/// 产生文档
/// 将文档号压入任务队列 
ClassMethod GenerateDocFromSQL(pDocNo As %String) As %Status
{
    Set tSC=##class(HCC.Util).PushDocGenQueue(pDocNo)
    W tSC
    Return tSC
}

/// 删除文档的SQL记录 
ClassMethod DeleteDoc(pDocNo As %String) As %Status
{
    W ##class(HCC.SQL.Tools).ClearDoc(pDocNo)
    Return $$$OK
}

/// 获取文档章节设置 
ClassMethod GetDocSections(pDocType As %Numeric) As %Status
{
    &SQL(
    SELECT JSON_ARRAYAGG(JSON_OBJECT('Section':DocumentSection,'Cardinality':Cardinality))
      INTO :tRet
      FROM WS_DOC.DocumentConfig
     WHERE DocumentType=:pDocType
    )
    W tRet
    Return $$$OK
}

/// 更新文档章节设置 
ClassMethod UpdateDocSections(pDocType As %Numeric) As %Status
{
    Return $$$OK
}

/// 列出所有数据元
ClassMethod ListDE() As %Status
{
    &SQL(
        SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
        'name':name, 
        'category':category, 
        'description':description, 
        'format':format, 
        'valueset':valueset, 
        'datatype':datatype
        ))
      INTO :tRet
      FROM HCC.WSDataElement
    )
    W tRet
    Return $$$OK
}

/// 获取数据元
ClassMethod GetDE(pDECode As %String) As %Status
{
    Set tRet=""
    Set tDEName = "WS.DE."_$Replace(pDECode,".","")
    Try
    { 
        &SQL(
            SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
            'name':name, 
            'category':category, 
            'description':description, 
            'format':format, 
            'valueset':valueset, 
            'datatype':datatype
            ))
          INTO :tRet
          FROM HCC.WSDataElement
          WHERE name = :tDEName
        )
        
        If SQLCODE = 100
        {
            Set tRet="数据元"_pDECode_"不存在"
        }
    }
    Catch (e)
    {
        Set tRet=$$$ERROR(-10001,"数据元"_pDECode_"不存在")
    }
    w tRet
    Return $$$OK
}

/// 设置数据元类参数和属性
ClassMethod SetDEClass(pClassName, pCategory, pDescription, pFormat, pValueset, pDatatype) As %Status
{
    Set tSC = $$$OK
    Try
    {
        Set tPa = ##class(%Dictionary.ParameterDefinition).%OpenId(pClassName_"||Category")
        Set tPa.Default=pCategory
        Do tPa.%Save()
        Set tPa = ##class(%Dictionary.ParameterDefinition).%OpenId(pClassName_"||Description")
        Set tPa.Default=pDescription
        Do tPa.%Save()
        Set tPa = ##class(%Dictionary.ParameterDefinition).%OpenId(pClassName_"||Format")
        Set tPa.Default=pFormat
        Do tPa.%Save()
        Set tPa = ##class(%Dictionary.ParameterDefinition).%OpenId(pClassName_"||ValueSet")
        Set tPa.Default=pValueset
        Do tPa.%Save()
        Set tPa = ##class(%Dictionary.ParameterDefinition).%OpenId(pClassName_"||WSDT")
        Set tPa.Default=pDatatype
        Do tPa.%Save()

        Set tPr = ##class(%Dictionary.PropertyDefinition).%Open($LB(pClassName_"||Value"), 0, .tSC)
        Set tPr.Type = $case(pDatatype,"L":"%Boolean","N":"%Integer","D":"WS.DT.Date","DT":"WS.DT.TimeStamp","S1":"%String","S2":"WS.DT.CodedString","S3":"WS.DT.CodedString","T":"%Time","BY":"%Stream.GlobalBinary",:"%String")
        If (pDatatype="D")
        {
            Do tPr.Parameters.SetAt(8,"FORMAT")
        }
        ElseIf (pDatatype="N") && ($Find(pFormat,",")>0)
        {
            Set tPr.Type = "%Decimal", tScale = +$P(pFormat,",",2)
            Do tPr.Parameters.SetAt(tScale,"SCALE")
        }
        ElseIf (pDatatype="N") && ($Find(pFormat,",")=0)
        {
            Set (tTmpDT,tMin,tMax,tScale)=""
            // get value range for %String, %Integer and %Decimal
            Set tSC = ##class(WS.DE.Tools).GetDTDetails(pFormat,.tTmpDT,.tMin,.tMax,.tScale)
            Set:(tMin'=0) tMin = $ZPOWER(10,(tMin-1))
            Set:(tMax'=0) tMax = $ZPOWER(10,tMax)-1
            Do:(tMin'=0) tPr.Parameters.SetAt(tMin,"MINVAL")
            Do:(tMax'=0) tPr.Parameters.SetAt(tMax,"MAXVAL")
        }
        ElseIf (pDatatype="S1") && ($Find(pFormat,",")=0)
        {
            Set (tTmpDT,tMin,tMax,tScale)=""
            // get value range for %String, %Integer and %Decimal
            Set tSC = ##class(WS.DE.Tools).GetDTDetails(pFormat,.tTmpDT,.tMin,.tMax,.tScale)
            Do tPr.Parameters.SetAt(tMax,"MAXLEN")
            Do tPr.Parameters.SetAt(tMin,"MINLEN")
        }
        Do tPr.%Save()
    }
    catch(e)
    {
    }
    Return tSC
}

/// 更新&新建数据元
ClassMethod PutDE() As %Status
{
    Try 
    {
        #; Ensure we are only passed json
        If %request.ContentType'="application/json" 
        {  
            Set %response.Status=..#HTTP415UNSUPPORTEDMEDIATYPE
            Quit
        }

        If '$IsObject(%request.Content) 
        {
            Set tSC=$$$ERROR(-10001,"没有提交的Content")
            Set %response.Status=..#HTTP400BADREQUEST
            Quit    
        }

        #; Parse the content (JSON array)
        #dim tDEObj As %DynamicObject
        Set tDEObj=##class(%DynamicObject).%FromJSON(%request.Content)
        
        If 'tDEObj.%IsA("%DynamicObject")
        {
            Set %response.Status=..#HTTP400BADREQUEST
            Quit    
        }
        /*
        'name':name, 
        'category':category, 
        'description':description, 
        'format':format, 
        'valueset':valueset, 
        'datatype':datatype*/
        
        /*
        Parameter Category = "标识";
        Parameter Description = "报卡类别代码";
        Parameter Format = "N1";
        Parameter ValueSetDisplay = "1:初次报告;2:订正报告;";
        Parameter ValueSet = "DE01.00.002.00";
        Parameter WSDT = "S2";
        Property Value As WS.DT.CodedString(ValueSet = "DE01.00.002.00");
        */

        
        Set tName=$ZCVT(tDEObj.name,"I","UTF8"), 
        tCategory = $ZCVT(tDEObj.category, "I","UTF8"), 
        tFormat = tDEObj.format, 
        tDatatype = tDEObj.datatype, 
        tValueset = tDEObj.valueset,
        tDescription = $ZCVT(tDEObj.description,"I","UTF8")
        If (tName="")||(tDatatype="")||(tFormat="")
        {
            Set %response.Status=..#HTTP400BADREQUEST
            Quit     
        } 
        
        Set tDEClassName = "WS.DE."_$Replace(tName,".","")
        Set tDEExist=##class(%Dictionary.ClassDefinition).%ExistsId(tDEClassName)
        If ('tDEExist) 
        {
            Set tDEClass=##class(%Dictionary.ClassDefinition).%New()
            Set tDEClass.Super = "WS.DE.Base"
            Set tP1=##class(%Dictionary.ParameterDefinition).%New()
            Set tP1.Name="Category"
            Set tP1.Default = ""
            Do tDEClass.Parameters.Insert(tP1)
            
            Set tP2=##class(%Dictionary.ParameterDefinition).%New()
            Set tP2.Name="Description"
            Set tP2.Default = ""
            Do tDEClass.Parameters.Insert(tP2)
            
            Set tP3=##class(%Dictionary.ParameterDefinition).%New()
            Set tP3.Name="Format"
            Set tP3.Default = ""
            Do tDEClass.Parameters.Insert(tP3)
           
            Set tP4=##class(%Dictionary.ParameterDefinition).%New()
            Set tP4.Name="ValueSet"
            Set tP4.Default = ""
            Do tDEClass.Parameters.Insert(tP4)
            
            Set tP5=##class(%Dictionary.ParameterDefinition).%New()
            Set tP5.Name="WSDT"
            Set tP5.Default = ""
            Do tDEClass.Parameters.Insert(tP5)
            
            Set tPp=##class(%Dictionary.PropertyDefinition).%New()
            Set tPp.Name="Value"
            Set tPp.Type="%String"
            Do tDEClass.Properties.Insert(tPp)
            Do tDEClass.%Save()
            Do tDEClass.%Close()
        }
        
        // 如果是值集约束类型
        If (tValueset'="") && ((tDatatype = "S2") ||(tDatatype = "S3"))
        {
            Do ..SetDEClass(tDEClassName,tCategory,tDescription,tFormat,tValueset,tDatatype)
        }
        // 如果是布尔类型
        elseIf (tValueset="") && (tDatatype = "L")
        {
            Do ..SetDEClass(tDEClassName,tCategory,tDescription,tFormat,tValueset,tDatatype)
        }
        // 如果是字符串类型
        elseIf (tValueset="") && (tDatatype = "S1")
        {
            Do ..SetDEClass(tDEClassName,tCategory,tDescription,tFormat,tValueset,tDatatype)
        }
        // 如果是日期类型
        elseIf (tValueset="") && (tDatatype = "D8")
        {
            Do ..SetDEClass(tDEClassName,tCategory,tDescription,tFormat,tValueset,tDatatype)
        }
        // 如果是时间戳类型
        elseIf (tValueset="") && (tDatatype = "DT")
        {
            Do ..SetDEClass(tDEClassName,tCategory,tDescription,tFormat,tValueset,tDatatype)
        }
        // 其它组合错误
        else
        {
            Set %response.Status=..#HTTP400BADREQUEST
            Quit
        }
        
        //检查是否tDEClass发生了变化
        //If (tDEClass.Modified)
        //{
            //Do tDEClass.%Save()
            Do $System.OBJ.Compile(tDEClassName,"-d")
        //}
    }
    catch (e)
    {
    }
    Return tSC
}

/// 列出值集所有元素
ClassMethod ListValueSetItems(pValueSet As %String = "CV0201101") As %Status
{
    Set tSC = $$$OK
    Set tGol = "^WS.VS."_$replace(pValueSet,".","")
    If $D(@tGol)=0
    {
        Set tMsg = "值集:"_pValueSet_"不存在"
        W tMsg
        Return $$$ERROR(-10001,tMsg)
    }
    
    Set tSub = "", tOutput = ##class(%DynamicArray).%New()
    Set tSub = $O(@tGol@(tSub))
    While tSub '=""
    {
        Set tItem = ##class(%DynamicObject).%New()
        Set tItem.Key = tSub, tItem.Value = $G(@tGol@(tSub))
        Do tOutput.%Push(tItem)
        Set tSub = $O(@tGol@(tSub))
    }

    W tOutput.%ToJSON()
    Return tSC
}

/// 获取值集元素
ClassMethod GetValueSetItem(pValueSet As %String, pKey As %String) As %Status
{
    Set tSC = $$$OK
    Set tGol = "^WS.VS."_$replace(pValueSet,".",""), tSub=pKey
    If $D(@tGol@(tSub))'=1
    {
        Set tMsg = "值集:"_pValueSet_"不存在"
        W tMsg
        Return $$$ERROR(-10001,tMsg)
    }
    W $G(@tGol@(tSub))
    Return tSC
}

/// 更新值集元素
ClassMethod PutValueSetItem(pValueSet As %String) As %Status
{
    Set tSC = $$$OK,tVS = $ZStrip(pValueSet, "<>W")
    If tVS =""
    {
        Return $$$ERROR(-10001,"请输入值集名称")
    }
    Set tGol = "^WS.VS."_$Replace(tVS,".","")
        
    Try 
    {
        #; Ensure we are only passed json
        If %request.ContentType'="application/json" 
        {  
            Set %response.Status=..#HTTP415UNSUPPORTEDMEDIATYPE
            Quit
        }

        If '$IsObject(%request.Content) 
        {
            Set tSC=$$$ERROR(-10001,"没有提交的Content")
            Set %response.Status=..#HTTP400BADREQUEST
            Quit    
        }

        #; Parse the content (JSON array)
        #dim tItemArray As %DynamicArray
        Set tItemArray=##class(%DynamicArray).%FromJSON(%request.Content)
        
        For tI=0:1:tItemArray.%Size()-1 
        {
            #; Get the KV object
            Set tKV=tItemArray.%Get(tI)
            If 'tKV.%IsA("%DynamicObject")
            {
                Set %response.Status=..#HTTP400BADREQUEST
                Quit    
            }
            Set tSub=tKV.Key, tValue = $ZCVT(tKV.Value,"I","UTF8")
            If (tSub="")||(tValue="")
            {
                Set %response.Status=..#HTTP400BADREQUEST
                Quit     
            } 
            Set tTemArray(tSub)=tValue
        }
        Merge @tGol=tTemArray
        kill tTemArray
    }
    catch (e)
    {
    }
    Return tSC
}

}
