Class WS.DE.DE045014700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "输血性质";

Parameter Format = "N1";

Parameter ValueSet = "1:备血;2:常规;3:紧急;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.147.00");

Storage Default
{
<Data name="DE045014700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045014700State</State>
<StreamLocation>^WS.DE.DE045014700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
