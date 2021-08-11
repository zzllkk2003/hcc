Class WS.DE.DE083002100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "卫生人员";

Parameter Description = "新聘卫生监督员标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE083002100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083002100State</State>
<StreamLocation>^WS.DE.DE083002100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
