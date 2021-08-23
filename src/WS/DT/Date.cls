Class WS.DT.Date Extends %Library.Date
{

/// Converts the SOAP encoded input date value into a %Date value.
ClassMethod XSDToLogical(%val As %String) As %Date [ CodeMode = generator, ServerOnly = 1 ]
{
    If ($$$getClassType(%class)=$$$cCLASSCLASSTYPEDATATYPE) || $$$comMemberKeyGet(%class,$$$cCLASSparameter,"XMLENABLED",$$$cPARAMdefault) {
        $$$GENERATE("   Set len=$length(%val)")
        $$$GENERATE("   If len'=10 {")
        $$$GENERATE("       If $extract(%val,len)=""Z"" {")
        $$$GENERATE("           Set %val=$extract(%val,1,len-1),len=len-1")
        $$$GENERATE("       } ElseIf $case($extract(%val,len-5),""+"":1,""-"":1,:0) {")
        $$$GENERATE("           Set %val=$extract(%val,1,len-6),len=len-6")
        $$$GENERATE("       }")
        $$$GENERATE("   }")
        $$$GENERATE("   If $extract(%val,11,19)=""T00:00:00"" {")
        $$$GENERATE("       If (len=19)||(($extract(%val,20,21)="".0"")&&($translate($extract(%val,22,len),""0"","""")="""")) {")
        $$$GENERATE("           Set %val=$extract(%val,1,10)")
        $$$GENERATE("       }")
        $$$GENERATE("   }")
        $$$GENERATE("   Quit $select(%val="""":"""",1:$zdateh(%val,..#FORMAT,,,,,"_$s(%parameter("MINVAL")="":-672045,1:%parameter("MINVAL"))_","_%parameter("MAXVAL")_",""""))")
    } Else {
        Set %code=0 
    }
    Quit $$$OK
}

/// Converts the %Date value to the canonical SOAP encoded value.
ClassMethod LogicalToXSD(%val As %Date) As %String [ CodeMode = generator, ServerOnly = 1 ]
{
    If ($$$getClassType(%class)=$$$cCLASSCLASSTYPEDATATYPE) || $$$comMemberKeyGet(%class,$$$cCLASSparameter,"XMLENABLED",$$$cPARAMdefault) {
        $$$GENERATE("   quit $select(%val="""":"""",1:$zdate(%val,..#FORMAT,,,,,"_$s(%parameter("MINVAL")="":-672045,1:%parameter("MINVAL"))_"))")
    }
    Quit $$$OK
}

}
