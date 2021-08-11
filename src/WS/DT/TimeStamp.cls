Class WS.DT.TimeStamp Extends %Library.TimeStamp [ ClassType = datatype, ClientDataType = TIMESTAMP, OdbcType = TIMESTAMP, SqlCategory = TIMESTAMP ]
{

/// Converts the value of <var>%val</var>, which is in logical format <code>YYYY-MM-DD HH:MM:SS[.nnnnnnnnn]</code>, into a display string.
/// The Logical value and Display values are the same unless there are <a href="#VALUELIST">VALUELIST</a> and <a href="#DISPLAYLIST">DISPLAYLIST</a> parameters specified.
/// <p>Returns the Display Timestamp value of the Logical Timestamp string <var>%val</var>.
ClassMethod LogicalToDisplay(%val As %TimeStamp) As %String [ CodeMode = generator, ServerOnly = 0 ]
{
    If %parameter("VALUELIST")'="",%parameter("DISPLAYLIST")'="" {
        do GenerateValConv^%occLibrary(%parameter("VALUELIST"),%parameter("DISPLAYLIST"))
    } Else {
        Set %codemode=$$$cMETHCODEMODEEXPRESSION
        Set %code="$E($Replace($Replace($Replace(%val,""-"",""""),"":"",""""),"" "",""""),1,14)"
    }
    QUIT $$$OK
}

/// Converts the %TimeStamp value to the canonical SOAP encoded value.
ClassMethod LogicalToXSD(%val As %TimeStamp) As %String [ CodeMode = generator, ServerOnly = 1 ]
{
    If ($$$getClassType(%class)=$$$cCLASSCLASSTYPEDATATYPE) || $$$comMemberKeyGet(%class,$$$cCLASSparameter,"XMLENABLED",$$$cPARAMdefault) || $$$comMemberKeyGet(%class,$$$cCLASSparameter,"%JSONENABLED",$$$cPARAMdefault) {
        Set %codemode=$$$cMETHCODEMODEEXPRESSION
        Set %code="$E($Replace($Replace($Replace(%val,""-"",""""),"":"",""""),"" "",""""),1,14)"

    } Else {
        Set %code=0 
    }
    Quit $$$OK
}

}
