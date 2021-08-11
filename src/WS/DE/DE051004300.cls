Class WS.DE.DE051004300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.01.014");

Parameter Category = "医学评估";

Parameter Description = "老年人生活自理能力自我评估代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.01.014";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE051004300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051004300State</State>
<StreamLocation>^WS.DE.DE051004300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
