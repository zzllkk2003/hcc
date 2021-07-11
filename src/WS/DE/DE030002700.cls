Class WS.DE.DE030002700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "接触放射线情况";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE030002700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030002700State</State>
<StreamLocation>^WS.DE.DE030002700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
