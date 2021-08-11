Class WS.DE.DE060023900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "计划与干预";

Parameter Description = "使用呼吸机标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE060023900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060023900State</State>
<StreamLocation>^WS.DE.DE060023900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
