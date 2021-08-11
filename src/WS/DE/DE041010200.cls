Class WS.DE.DE041010200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "精索静脉曲张程度代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:轻度;2:中度;3:重度";

Parameter ValueSet = "DE04.10.102.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.10.102.00");

Storage Default
{
<Data name="DE041010200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041010200State</State>
<StreamLocation>^WS.DE.DE041010200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
