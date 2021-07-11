Class WS.DE.DE051007100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "体格发育评价代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.006";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.006");

Storage Default
{
<Data name="DE051007100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051007100State</State>
<StreamLocation>^WS.DE.DE051007100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
