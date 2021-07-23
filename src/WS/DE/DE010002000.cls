Class WS.DE.DE010002000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "处方编号";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE010002000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010002000State</State>
<StreamLocation>^WS.DE.DE010002000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
