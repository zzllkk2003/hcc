Class WS.DE.DE040102100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "腹痛程度代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:轻度;2:中度;3:重度";

Parameter ValueSet = "DE04.01.021.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.01.021.00");

Storage Default
{
<Data name="DE040102100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040102100State</State>
<StreamLocation>^WS.DE.DE040102100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
