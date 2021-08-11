Class WS.DE.DE060024100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99999, MINVAL = 0);

Parameter Category = "计划与干预";

Parameter Description = "数量";

Parameter Format = "N..5";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE060024100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060024100State</State>
<StreamLocation>^WS.DE.DE060024100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
