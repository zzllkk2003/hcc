Class WS.DT.Decimal Extends %Library.Decimal [ ClientDataType = DECIMAL, OdbcType = NUMERIC, SqlCategory = NUMERIC ]
{

ClassMethod LogicalToXSD(%val As %Numeric) As %String [ CodeMode = generator, ServerOnly = 0 ]
{
    Set %codemode=$$$cMETHCODEMODEEXPRESSION
    If %parameter("FORMAT")="",%parameter("SCALE")="" s %code="%val" QUIT $$$OK
    If (%parameter("FORMAT")="AUTO") s %code="%val" QUIT $$$OK
    Set temp=""""_%parameter("FORMAT")_""""
    If %parameter("SCALE")'="" s temp=temp_","_%parameter("SCALE")
    Set %code="$s(%val="""":"""",1:$fn(%val,"_temp_"))"
    QUIT $$$OK
}

}
