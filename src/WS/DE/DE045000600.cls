Class WS.DE.DE045000600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "HBV耐药突变检测阳性项目";

Parameter Format = "N2";

Parameter ValueSet = "CV04.50.004";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.004");

Storage Default
{
<Data name="DE045000600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045000600State</State>
<StreamLocation>^WS.DE.DE045000600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
