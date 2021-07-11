Class WS.DE.DE060009700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "手术出血量(ml)";

Parameter Format = "N..5";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99999, MINVAL = 0);

Storage Default
{
<Data name="DE060009700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060009700State</State>
<StreamLocation>^WS.DE.DE060009700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
