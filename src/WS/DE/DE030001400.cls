Class WS.DE.DE030001400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "健康危险因素";

Parameter Description = "非放射工作职业史";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE030001400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030001400State</State>
<StreamLocation>^WS.DE.DE030001400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
