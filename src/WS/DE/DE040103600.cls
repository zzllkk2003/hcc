Class WS.DE.DE040103600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "老年人健康状态自我评估代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.01.013";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.01.013");

Storage Default
{
<Data name="DE040103600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040103600State</State>
<StreamLocation>^WS.DE.DE040103600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
