Class WS.DE.DE041010300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "体格检查";

Parameter Description = "颈部包块检查结果描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE041010300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041010300State</State>
<StreamLocation>^WS.DE.DE041010300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
