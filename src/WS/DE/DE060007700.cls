Class WS.DE.DE060007700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 9999999999999, MINVAL = 1000000000000);

Parameter Category = "计划与干预";

Parameter Description = "美沙酮维持治疗编号";

Parameter Format = "N13";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE060007700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060007700State</State>
<StreamLocation>^WS.DE.DE060007700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
