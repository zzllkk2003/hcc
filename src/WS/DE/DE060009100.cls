Class WS.DE.DE060009100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Date(FORMAT = 8);

Parameter Category = "计划与干预";

Parameter Description = "入院日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Storage Default
{
<Data name="DE060009100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060009100State</State>
<StreamLocation>^WS.DE.DE060009100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
