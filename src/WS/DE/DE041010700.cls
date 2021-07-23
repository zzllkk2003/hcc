Class WS.DE.DE041010700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "口腔检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041010700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041010700State</State>
<StreamLocation>^WS.DE.DE041010700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
