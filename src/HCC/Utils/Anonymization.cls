/// 匿名化处理
Class HCC.Utils.Anonymization Extends %RegisteredObject
{

Method %OnNew() As %Status [ Private ]
{
	d:'$d(^HCC.Anonymization("Enable")) ##class(HCC.Utils.Anonymization).Init()
	q $$$OK
}

Property Enable As %Boolean;

Method EnableGet() As %Boolean [ ServerOnly = 1 ]
{
	Quit ^HCC.Anonymization("Enable")
}

Method EnableSet(Arg As %Boolean) As %Status [ ServerOnly = 1 ]
{
	s ^HCC.Anonymization("Enable") = Arg
	Quit $$$OK
}

Property patientName As %Boolean;

Method patientNameGet() As %Boolean [ ServerOnly = 1 ]
{
	Quit ^HCC.Anonymization("patientName")
}

Method patientNameSet(Arg As %Boolean) As %Status [ ServerOnly = 1 ]
{
	s ^HCC.Anonymization("patientName") = Arg
	Quit $$$OK
}

Property patientIds As %Boolean;

Method patientIdsGet() As %Boolean [ ServerOnly = 1 ]
{
	Quit ^HCC.Anonymization("patientIds")
}

Method patientIdsSet(Arg As %Boolean) As %Status [ ServerOnly = 1 ]
{
	s ^HCC.Anonymization("patientIds") = Arg
	Quit $$$OK
}

Property patientAddrs As %Boolean;

Method patientAddrsGet() As %Boolean [ ServerOnly = 1 ]
{
	Quit ^HCC.Anonymization("patientAddrs")
}

Method patientAddrsSet(Arg As %Boolean) As %Status [ ServerOnly = 1 ]
{
	s ^HCC.Anonymization("patientAddrs") = Arg
	Quit $$$OK
}

Property patientTelcom As %Boolean;

Method patientTelcomGet() As %Boolean [ ServerOnly = 1 ]
{
	Quit ^HCC.Anonymization("patientTelcom")
}

Method patientTelcomSet(Arg As %Boolean) As %Status [ ServerOnly = 1 ]
{
	s ^HCC.Anonymization("patientTelcom") = Arg
	Quit $$$OK
}

ClassMethod Init(Arg As %Boolean = 0) As %Status
{
	s ^HCC.Anonymization("Enable") = Arg
	s ^HCC.Anonymization("patientName") = Arg
	s ^HCC.Anonymization("patientIds") = Arg
	s ^HCC.Anonymization("patientAddrs") = Arg
	s ^HCC.Anonymization("patientTelcom") = Arg
	q $$$OK
}

ClassMethod Do(docString As %String, ByRef reString As %String) As %Status
{
  s tSC=$$$OK

	d:'$d(^HCC.Anonymization("Enable")) ##class(HCC.Utils.Anonymization).Init()
	s anony = ##class(HCC.Utils.Anonymization).%New()
	if ('anony.Enable){
		s reString = docString
		q tSC
	}
  s docString=$ZCONVERT(docString,"O","UTF8")
  // 加载xsl转换文件
  Set tSplit=$Case($system.Version.GetOS(),"Windows":"\",:"/")
  Set tFilePath = $ZStrip($G(^HCC("XSLFilePath")), "<>W")
  if ($E(tFilePath,$L(tFilePath))'="\") || ($E(tFilePath,$L(tFilePath))'="/") 
  {
      Set tFilePath = tFilePath_tSplit
  }
  Set tXSL = tFilePath_"Anonymous.xsl"
  If ('##class(%File).Exists(tXSL))
  {
      q $$$ERROR(-10001,"xsl转换文件:"_tXSL_"不存在!")
  }  
  
  Set reString="",params="",tCompiledStyleSheet=""
  
  Set tSC=##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(tXSL,.tCompiledStyleSheet)
  if $$$ISERR(tSC){
	  s reString = $System.OBJ.DisplayError(tSC)
	  q tSC
  }
  
	set params("patientName") = "'"_anony.patientName_"'"
	set params("patientIds") = "'"_anony.patientIds_"'"
	set params("patientAddrs") = "'"_anony.patientAddrs_"'"
	set params("patientTelcom") = "'"_anony.patientTelcom_"'"
	
  Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(docString,tCompiledStyleSheet,.reString,,.params)
  if $$$ISERR(tSC){
	  s reString = $System.OBJ.DisplayError(tSC)
	  q tSC
  }
  s reString=$ZCONVERT(reString,"I","UTF8")
  
  q $$$OK
}

}
