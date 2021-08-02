Class WS.DE.DE041015500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "浅表淋巴结检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041015500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041015500State</State>
<StreamLocation>^WS.DE.DE041015500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}