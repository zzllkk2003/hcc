Class WS.DE.DE051013100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "辨证论治详细描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE051013100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051013100State</State>
<StreamLocation>^WS.DE.DE051013100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
