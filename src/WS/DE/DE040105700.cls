Class WS.DE.DE040105700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "乳糜尿发作规律代码";

Parameter Format = "N1";

Parameter ValueSet = "1:有一定规律间歇发作;2:不定期发作";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.01.057.00");

Storage Default
{
<Data name="DE040105700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040105700State</State>
<StreamLocation>^WS.DE.DE040105700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
