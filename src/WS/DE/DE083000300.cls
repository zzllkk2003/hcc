Class WS.DE.DE083000300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "返聘人员标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE083000300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083000300State</State>
<StreamLocation>^WS.DE.DE083000300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
