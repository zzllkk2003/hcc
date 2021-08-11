Class WS.DE.DE060002300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 10, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "发病到死亡的时长";

Parameter Format = "AN..10";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060002300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060002300State</State>
<StreamLocation>^WS.DE.DE060002300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
