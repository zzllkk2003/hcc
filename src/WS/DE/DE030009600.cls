Class WS.DE.DE030009600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "中毒农药名称代码";

Parameter Format = "N2";

Parameter ValueSet = "CV03.00.204";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.204");

Storage Default
{
<Data name="DE030009600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030009600State</State>
<StreamLocation>^WS.DE.DE030009600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
