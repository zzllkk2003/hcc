Class WS.DE.DE051000200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "HBsAg携带者分类";

Parameter Format = "N1";

Parameter ValueSet = "1:慢性HBV携带者;2:非活动性HBsAg携带者";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.002.00");

Storage Default
{
<Data name="DE051000200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051000200State</State>
<StreamLocation>^WS.DE.DE051000200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
