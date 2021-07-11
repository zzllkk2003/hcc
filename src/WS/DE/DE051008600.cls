Class WS.DE.DE051008600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "新生儿大便状况记录";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE051008600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051008600State</State>
<StreamLocation>^WS.DE.DE051008600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
