Class WS.DE.DE051012800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.016");

Parameter Category = "医学评估";

Parameter Description = "影响孕产妇死亡的主要因素代码";

Parameter Format = "N2";

Parameter ValueSet = "CV05.10.016";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE051012800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051012800State</State>
<StreamLocation>^WS.DE.DE051012800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
