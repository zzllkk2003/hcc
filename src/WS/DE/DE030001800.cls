Class WS.DE.DE030001800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "过量照射史";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE030001800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030001800State</State>
<StreamLocation>^WS.DE.DE030001800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
