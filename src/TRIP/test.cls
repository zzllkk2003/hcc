/// Description
Class TRIP.test
{

/// Description
ClassMethod test() As %Status
{
 #dim b as EnsLib.EDI.XML.Document
 #dim doc as EnsLib.EDI.XML.Document
 #dim d1 as TRIP.GXWD.MODEL.GXWDDOC
 set x = ##class(TRIP.GXWD.MODEL.DocRetrieveModel).%New()
 set d1=##class(TRIP.GXWD.MODEL.GXWDDOC).%OpenId(14)
 set d2=##class(TRIP.GXWD.MODEL.GXWDDOC).%OpenId(15)
 set tsc= x.DocRetrieveResults.Insert(d2)
 w tsc,!
 set tsc= x.DocRetrieveResults.Insert(d1)
 //set b=##class(EnsLib.EDI.XML.Document).%New()
 //set b.DocType="RCMR_IN000030UV01:RCMR_IN000030UV01"
 set tsc = ##class(TRIP.GXWD.DT.SearchDOCRetrive).Transform(x,.b)
 set str =""
 set str= b.OutputToString()
 //w str,!
 w !
 SET str= $REPLACE(str,"xsd_3:","")
 SET str= $REPLACE(str,"xmlns:xsd_3='urn:hl7-org:v3'","xmlns=""urn:hl7-org:v3""")
 set str = $REPLACE(str,"xmlns:xsd_1='urn:hl7-org:v3/mif2'","ITSVersion=""XML_1.0""")
 set str = $REPLACE(str,"xmlns:xsd_2='http://www.w3.org/2001/XMLSchema'","xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance""")
 set str = $REPLACE(str,"xmlns:xsd_4='urn:hl7-org:v3/mif'","xsi:schemaLocation=""urn:hl7-org:v3 ../multicacheschemas/RCMR_IN000030UV01.xsd""")
 SET str= $REPLACE(str,"xmlns:xsd_5='urn:hl7-org/v3-example' xmlns:xsd_6='http://www.ascc.net/xml/schematron'","")
 w str
 w tsc,!
 

 //do b.OutputToDevice()
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
  set x= ##class(HLHTPKG.Util.XMLValid).Valid(stream,"PatientInfoRegister")

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
