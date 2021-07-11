Class WS.DE.DE041010400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "颈部包块标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041010400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041010400State</State>
<StreamLocation>^WS.DE.DE041010400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
