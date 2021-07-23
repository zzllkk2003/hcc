Class WS.DT.TimeStamp [ ClassType = datatype, ClientDataType = TIMESTAMP, OdbcType = TIMESTAMP, SqlCategory = TIMESTAMP ]
{

/// Converts <var>%val</var>, which represents either a Timestamp in ODBC format, or a Date in ODBC format, into a logical <class>%PosixTime</class> value.
/// <p>Returns the logical <class>%PosixTime</class> value of the ODBC Timestamp string <var>%val</var>.
ClassMethod OdbcToLogical(%val As %RawString) As %Library.PosixTime [ CodeMode = generator, ServerOnly = 1 ]
{
        // Encoding function comes from expansion of $$$sqlxPosixTimeEncode in %sqlx.INC == $ZU(1073741924,%val)
    $$$GENERATE("   RETURN:%val="""" """"")
    $$$GENERATE("   RETURN:$isvalidnum(%val) %val")         // Already in Logical format, maybe.  Doesn't have to be valid.  That will be checked in IsValid.  This does allow or something like PSTime > 1 in a where condition
    $$$GENERATE("   set precision=$l($p(%val,""."",2)),val=$zdatetimeh(%val,3,1,precision,4,,,-672045,,"""")")                      // val is now in $h/$zts format
    $$$GENERATE("   if val="""" { set val=$zdatetimeh(%val,-1,1,precision,,,,-672045,,"""") }") // try with default date format, if successful, val is now in $h/$zts format
    $$$GENERATE("   if val="""" { set val=$$ConvertDATETIMEToTIMESTAMP^%qarfunc(%val,,,,1) RETURN:$isvalidnum(val) val set val="""" }") // attempt to convert it from datetime to posixtime
    $$$GENERATE("   if val="""" { set %msg=""Unable to convert ""_%val_"" to a logical %PosixTime value"" ZTRAP ""ODAT"" }")
            // Now convert from $h/$zts to posix time, then to encoded %PosixTime
    $$$GENERATE("   RETURN $zu(1073741924,(val-47117)*86400+$p(val,"","",2))")
    Quit $$$OK
}

/// Converts <var>%val</var>, which represents a logical <class>%PosixTime</class> value into an ODBC format TIMESTAMP value
ClassMethod LogicalToOdbc(%val As %PosixTime) As %TimeStamp [ CodeMode = generator, ServerOnly = 1 ]
{
        // Decoding function comes from expansion of $$$sqlxPosixTimeDecode in %sqlx.INC == $ZU(1073741925,%val)
    $$$GENERATE("   Quit $s(%val="""":"""",1:$zdatetime(($zu(1073741925,+%val)\86400+47117-(($zu(1073741925,+%val)<0)&&($zu(1073741925,+%val)#86400)))_"",""_($zu(1073741925,+%val)#86400),3,1,$l($p($zu(1073741925,+%val),""."",2)),,,,,-672045))")
    Quit $$$OK
}

/// Converts the input value <var>%val</var>, which represents a display timestamp value, in a logical <class>%PosixTime</class> value.
ClassMethod DisplayToLogical(%val As %RawString) As %PosixTime [ CodeMode = generator, ServerOnly = 0 ]
{
        // Encoding function comes from expansion of $$$sqlxPosixTimeEncode in %sqlx.INC == $ZU(1073741924,%val)
    set %code=0
    if %parameter("DATEFORMAT")="" { set dformat=-1 } else { set dformat=%parameter("DATEFORMAT") }
    //if 1=1 { set dformat=-1 } else { set dformat=%parameter("DATEFORMAT") }
    if %parameter("TIMEFORMAT")="" { set tformat=-1 } else { set tformat=%parameter("TIMEFORMAT") }
        // First convert from DisplayFormat to $H style logical format
        
    $$$GENERATE("   RETURN:%val="""" """"")
    $$$GENERATE("   set val=$zdatetimeh(%val,"_dformat_","_tformat_",,,,,-672045,,"""")")
    $$$GENERATE("   if val="""" { set val=$$ConvertDATETIMEToTIMESTAMP^%qarfunc(%val,,,,1) RETURN:$isvalidnum(val) val set val="""" }") // attempt to convert it from datetime to posixtime
    $$$GENERATE("   if val="""" { set %msg=""Error: '""_%val_""' is an invalid DISPLAY %PosixTime value"" ZTRAP ""ODAT"" }")
        // val is now a valid $H-style value, convert to Posix time, then encoded %PosixTime
    $$$GENERATE("   QUIT $zu(1073741924,(val-47117)*86400+$p(val,"","",2))")
}

/// Converts the value of <var>%val</var>, which is in logical format as the encoded number of seconds since Jan 01, 1970 00:00:00, into a display timestamp string.
ClassMethod LogicalToDisplay(%val As %PosixTime) As %String [ CodeMode = generator, ServerOnly = 0 ]
{
        // Decoding function comes from expansion of $$$sqlxPosixTimeDecode in %sqlx.INC == $ZU(1073741925,%val)
    set %code=0
    if %parameter("DATEFORMAT")="" { set dformat=-1 } else { set dformat=%parameter("DATEFORMAT") }
    if %parameter("TIMEFORMAT")="" { set tformat=-1 } else { set tformat=%parameter("TIMEFORMAT") }
    $$$GENERATE("   Quit $s(%val="""":"""",1:$zdatetime(($zu(1073741925,+%val)\86400+47117-(($zu(1073741925,+%val)<0)&&($zu(1073741925,+%val)#86400)))_"",""_($zu(1073741925,+%val)#86400),"_dformat_","_tformat_",$l($p($zu(1073741925,+%val),""."",2)),,4,,,-672045))")
    QUIT $$$OK
}

/// Tests if the logical value <var>%val</var>, which represents a <class>%PosixTime</class> value, is valid.
/// Input value of a valid <class>%TimeStamp</class> logical value or <class>%Date</class> ODBC value is also allowed.  If <class>%TimeStamp</class> logical value or <class>%Date</class> ODBC value is given, it will first be converted to a <class>%PosixTime</class> value
/// The validation is based on the class parameter settings used for the class attribute this data type is associated with.
/// In this case, <a href="#MAXVAL">MAXVAL</a> and <a href="#MINVAL">MINVAL</a>.
ClassMethod IsValid(%val As %RawString) As %Status [ CodeMode = generator, ServerOnly = 0 ]
{
        // Validation function comes from expansion of $$$sqlxPosixTimeIsValid in %sqlx.INC == $ZU(1073741926,val)
        // If subclass has a IsValidDT then call this
    If %property'="",$$$comSubMemberDefined(%class,$$$cCLASSproperty,%property,$$$cPROPmethod,"IsValidDT") {
        Set %codemode=$$$cMETHCODEMODEEXPRESSION
        Set %code="$select(##class("_%class_")."_$$$QN(%property_"IsValidDT")_"(%val):1,1:$$$ERROR($$$DTFailure,%val))"
        Quit $$$OK
    }
    $$$GENERATE("   QUIT:%val=""""||($zu(115,13)&&(%val=$c(0))) 1")
        // If a %TimeStamp value was passed in, convert it to %PosixTime to validate.  We will also convert %TimeStamp to %PosixTime in Normalize
        // If a %Date ODBC value was passed in, convert it to %PosixTime to validate.  We will also convert %Date ODBC value to %PosixTime in Normalize
    $$$GENERATE("   if $e(%val,2,*)[""-"" {")
    $$$GENERATE("       if %val?0.1""-""4N1""-""2N1""-""2N1"" ""2N1"":""2N1"":""2N.e { set precision=$l($p(%val,""."",2)),val=$zdatetimeh(%val,3,1,precision,4,,,-672045,,""Error"") if val=""Error"" { QUIT $$$ERROR($$$DTNotPosix,%val) } set %val=$zu(1073741924,(val-47117)*86400+$p(val,"","",2)) }")
    $$$GENERATE("       elseif %val?0.1""-""4N1""-""2N1""-""2N { set val=$zdatetimeh(%val_"" 00:00:00"",3,1,0,4,,,-672045,,""Error"") if val=""Error"" { QUIT $$$ERROR($$$DTNotPosix,%val) } set %val=$zu(1073741924,(val-47117)*86400+$p(val,"","",2)) }")
    $$$GENERATE("   }")
        // At this point, %val should be a long integer %PosixTime value
    if %parameter("MINVAL")'="" { $$$GENERATE(" QUIT:(%val<"_%parameter("MINVAL")_") $$$ERROR($$$DTMinVal,%val,"_%parameter("MINVAL")_")") }
    if %parameter("MAXVAL")'="" { $$$GENERATE(" QUIT:(%val>"_%parameter("MAXVAL")_") $$$ERROR($$$DTMaxVal,%val,"_%parameter("MAXVAL")_")") }
    $$$GENERATE("   QUIT $s($ZU(1073741926,%val):1,1:$$$ERROR($$$DTNotPosix,%val))")
    QUIT $$$OK
}

}
