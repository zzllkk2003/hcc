Class WS.DE.DE041007500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.006");

Parameter Category = "体格检查";

Parameter Description = "巩膜检查结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.006";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE041007500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041007500State</State>
<StreamLocation>^WS.DE.DE041007500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
