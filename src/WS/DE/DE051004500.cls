Class WS.DE.DE051004500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "慢性乙型肝炎的血清学分类";

Parameter Format = "N1";

Parameter ValueSet = "1:HBeAg阳性慢性乙型肝炎;2:HBeAg阴性慢性乙型肝炎";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.045.00");

Storage Default
{
<Data name="DE051004500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051004500State</State>
<StreamLocation>^WS.DE.DE051004500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
