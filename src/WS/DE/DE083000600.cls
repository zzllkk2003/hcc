Class WS.DE.DE083000600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "管理相对人编号";

Parameter Format = "N18";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 18, MINLEN = 18);

Storage Default
{
<Data name="DE083000600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083000600State</State>
<StreamLocation>^WS.DE.DE083000600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
