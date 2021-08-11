Class WS.DE.DE083001000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99999, MINVAL = 0);

Parameter Category = "卫生人员";

Parameter Description = "接受培训次数(人次)";

Parameter Format = "N..5";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE083001000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083001000State</State>
<StreamLocation>^WS.DE.DE083001000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
