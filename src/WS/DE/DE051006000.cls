Class WS.DE.DE051006000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "身体活动强度分类代码";

Parameter Format = "N1";

Parameter ValueSet = "1: 高强度身体活动;2:中等强度身体活动;3:低强度身体活动";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.060.00");

Storage Default
{
<Data name="DE051006000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051006000State</State>
<StreamLocation>^WS.DE.DE051006000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
