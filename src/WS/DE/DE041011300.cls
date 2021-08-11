Class WS.DE.DE041011300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.011");

Parameter Category = "体格检查";

Parameter Description = "淋巴结检查结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.011";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE041011300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041011300State</State>
<StreamLocation>^WS.DE.DE041011300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
