Class WS.DE.DE060009000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "妊娠终止日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE060009000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060009000State</State>
<StreamLocation>^WS.DE.DE060009000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
