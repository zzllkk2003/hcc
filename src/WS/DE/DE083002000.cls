Class WS.DE.DE083002000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999999, MINVAL = 0);

Parameter Category = "卫生人员";

Parameter Description = "新聘任卫生监督员人数";

Parameter Format = "N..6";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE083002000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083002000State</State>
<StreamLocation>^WS.DE.DE083002000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
