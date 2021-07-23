Class WS.DE.DE041010900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "口腔溃疡标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041010900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041010900State</State>
<StreamLocation>^WS.DE.DE041010900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
