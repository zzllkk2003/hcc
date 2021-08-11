Class WS.DE.DE060016800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "计划与干预";

Parameter Description = "肿瘤化疗疗程次数(次)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE060016800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060016800State</State>
<StreamLocation>^WS.DE.DE060016800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
