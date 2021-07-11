Class WS.DE.DE060001900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "第二产程时长(min)";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Storage Default
{
<Data name="DE060001900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060001900State</State>
<StreamLocation>^WS.DE.DE060001900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
