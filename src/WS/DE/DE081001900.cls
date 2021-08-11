Class WS.DE.DE081001900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "卫生机构";

Parameter Description = "集中空调通风系统定期清洗标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE081001900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081001900State</State>
<StreamLocation>^WS.DE.DE081001900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
