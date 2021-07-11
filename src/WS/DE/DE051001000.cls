Class WS.DE.DE051001000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "前筛查项目";

Parameter Format = "AN..30";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 30, MINLEN = 0);

Storage Default
{
<Data name="DE051001000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051001000State</State>
<StreamLocation>^WS.DE.DE051001000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
