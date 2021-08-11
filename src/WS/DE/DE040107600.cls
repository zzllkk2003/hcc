Class WS.DE.DE040107600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "痛经程度代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:轻度;2:中度;3:重度";

Parameter ValueSet = "DE04.01.076.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.01.076.00");

Storage Default
{
<Data name="DE040107600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040107600State</State>
<StreamLocation>^WS.DE.DE040107600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
