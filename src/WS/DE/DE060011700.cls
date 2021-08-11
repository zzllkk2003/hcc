Class WS.DE.DE060011700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "计划与干预";

Parameter Description = "吸氧时长(h)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE060011700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060011700State</State>
<StreamLocation>^WS.DE.DE060011700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
