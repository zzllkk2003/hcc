Class WS.DE.DE060026700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "输血量";

Parameter Format = "N..5";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99999, MINVAL = 0);

Storage Default
{
<Data name="DE060026700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060026700State</State>
<StreamLocation>^WS.DE.DE060026700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
