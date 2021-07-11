Class WS.DE.DE051007400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "体弱儿童转归代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.010";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.010");

Storage Default
{
<Data name="DE051007400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051007400State</State>
<StreamLocation>^WS.DE.DE051007400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
