Class WS.DE.DE041020200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "斜颈代码";

Parameter Format = "N1";

Parameter ValueSet = "1:无;2:有;3:需观察";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.10.202.00");

Storage Default
{
<Data name="DE041020200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041020200State</State>
<StreamLocation>^WS.DE.DE041020200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
