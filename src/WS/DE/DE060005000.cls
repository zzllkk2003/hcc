Class WS.DE.DE060005000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "建档日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE060005000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060005000State</State>
<StreamLocation>^WS.DE.DE060005000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
