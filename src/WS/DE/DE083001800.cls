Class WS.DE.DE083001800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "卫生监督员胸牌号码";

Parameter Format = "N6";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(PATTERN = "6N");

Storage Default
{
<Data name="DE083001800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083001800State</State>
<StreamLocation>^WS.DE.DE083001800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
