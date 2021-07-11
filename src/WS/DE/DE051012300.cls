Class WS.DE.DE051012300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "自知力评价结果代码";

Parameter Format = "N1";

Parameter ValueSet = "1:自知力完全;2:自知力不全;3:自知力缺失";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.123.00");

Storage Default
{
<Data name="DE051012300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051012300State</State>
<StreamLocation>^WS.DE.DE051012300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
