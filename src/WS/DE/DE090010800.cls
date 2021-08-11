Class WS.DE.DE090010800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生管理";

Parameter Description = "死亡患者尸检标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE090010800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE090010800State</State>
<StreamLocation>^WS.DE.DE090010800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
