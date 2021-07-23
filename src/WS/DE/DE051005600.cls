Class WS.DE.DE051005600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "社会功能情况分类代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.003";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.003");

Storage Default
{
<Data name="DE051005600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051005600State</State>
<StreamLocation>^WS.DE.DE051005600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
