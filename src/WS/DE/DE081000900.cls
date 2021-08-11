Class WS.DE.DE081000900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Date(FORMAT = 8);

Parameter Category = "卫生机构";

Parameter Description = "机构成立日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Storage Default
{
<Data name="DE081000900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081000900State</State>
<StreamLocation>^WS.DE.DE081000900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
