Class WS.DE.DE041016500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "伤害部位代码";

Parameter Format = "N2";

Parameter ValueSet = "CV04.10.016";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.016");

Storage Default
{
<Data name="DE041016500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041016500State</State>
<StreamLocation>^WS.DE.DE041016500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
