Class WS.DE.DE051006500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "睡眠状况";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051006500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051006500State</State>
<StreamLocation>^WS.DE.DE051006500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
