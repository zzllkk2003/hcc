Class WS.DE.DE041010000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "精索静脉曲张标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041010000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041010000State</State>
<StreamLocation>^WS.DE.DE041010000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
