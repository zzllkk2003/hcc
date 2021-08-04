/// 
/// Author: Jeff Liu
/// Date: 2021-08-02 10:44:56
/// LastEditTime: 2021-08-03 15:36:50
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/src/HCC/Utils/test.cls
/// Jeff.liu@intersytems.com
/// 
/// Description
Class HCC.Utils.test
{

/// Description
ClassMethod test() As %Status
{
  w "asf"
  #Dim BusinessHost as Ens.Config.Item = ##class(Ens.Config.Item).%New()
  #Dim production as Ens.Config.Production = ##class(Ens.Config.Production).%OpenId("HCCPKG.FoundationProduction")
  set BusinessHost.ClassName="HCC.SVR.Prod.BO.StandardHCCOutBound"
  //set BusinessHost.Enabled =1
  w "vas"
  set BusinessHost.Name ="Mocksys"
  set BusinessHost.Production =production
  w "123"
  #Dim Setting as Ens.Config.Setting = ##class(Ens.Config.Setting).%New()
  set Setting.Name="Web Service URL"
  set Setting.Value="http://172.19.86.19:52773/csp/healthshare/mocksys/EMR.WS.PatientService.cls"
  do BusinessHost.Settings.Insert(Setting)
  Do production.Items.Insert(BusinessHost)
  Set tSC = production.%Save()
 //do b.OutputToDevice()
  do ##class(Ens.Director).UpdateProduction()
  w tSC
}

/// Description
ClassMethod test2() As %Status
{
  #Dim con as Ens.Config.Item
 set con = ##class(Ens.Config.Item).%OpenId(15)
 zw con
}

/// Description
ClassMethod test3() As %Status
{
  #Dim production as Ens.Config.Production = ##class(Ens.Config.Production).%OpenId("HCCPKG.FoundationProduction")
  #Dim x as Ens.Config.Item
  job ##class(Ens.Director).EnableConfigItem("abc",0)
  set x = ##class(Ens.Config.Item).%OpenId(37)
   set a= production.Items.Find(x."%%OID")
   do production.Items.RemoveAt(a)
  //do ##class(Ens.Config.Item).%DeleteId()
   do production.%Save()
   do ##class(Ens.Director).UpdateProduction()
}

/// Description
ClassMethod stream() As %Status
{

    #Dim doc as EnsLib.EDI.XML.Document
  set stream =##class(%Stream.GlobalCharacter).%New()
  set doc =##class(EnsLib.EDI.XML.Document).ImportFromFile("/home/UCR/1.xml")
  //zw doc
  set msg=""
  set tsc= doc.OutputToLibraryStream(.stream)

  w tsc
  set x= ##class(HCC.Utils.XMLValid).Valid(stream,"PatientInfoRegister")

  w x
}

/// Description
ClassMethod schema() As %Status
{
       #Dim doc as EnsLib.EDI.XML.Document
  set stream =##class(%Stream.GlobalCharacter).%New()
  set tsc =##class(HS.Util.StreamUtils).ReadFromFile("/home/UCR/V3SCHEMA/msg/1.xml",.stream,"UTF8")
 Set tSchema="urn:hl7-org:v3 /home/UCR/V3SCHEMA/multicacheschemas/PRPA_IN201311UV02.xsd"	
 //Set tSC=##class(%XML.TextReader).ParseStream(stream,.tReader,,,,tSchema)
 Set tSC=##class(%XML.TextReader).ParseFile("/home/UCR/V3SCHEMA/msg/1.xml",.tReader,,,,tSchema)
 set verifyResult=0	
 set errCount=0
 set ErrMsg=""
 If $$$ISERR(tSC) Quit		
 While (tReader.Read()) 	
  {		
	if (tReader.NodeType="error") 		
	{		set errCount= errCount+1
		set ErrMsg= ErrMsg_"*ERROR* "_tReader.Value_$char(10)_tReader.Path_$char(10)
        write ErrMsg
	}	
  }	
  if (errCount=0)
  {
  set verifyResult=1

  }
   write verifyResult,!
   write "error count:"_errCount
}

}
