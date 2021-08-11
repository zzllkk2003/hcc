Class WS.DE.DE060003100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "计划与干预";

Parameter Description = "宫内节育器放置年限";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE060003100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060003100State</State>
<StreamLocation>^WS.DE.DE060003100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
