Class WS.DE.DE050104300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.037");

Parameter Category = "医学诊断";

Parameter Description = "死亡最高诊断依据类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.037";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050104300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050104300State</State>
<StreamLocation>^WS.DE.DE050104300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
