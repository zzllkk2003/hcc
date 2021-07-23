Class WS.DE.DE040106300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "伤害严重程度代码";

Parameter Format = "N1";

Parameter ValueSet = "1:轻度;2:中度;3:重度";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.01.063.00");

Storage Default
{
<Data name="DE040106300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040106300State</State>
<StreamLocation>^WS.DE.DE040106300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
