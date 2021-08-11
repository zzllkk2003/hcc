Class WS.DE.DE021000400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "出生缺陷儿结局代码";

Parameter Format = "N1";

Parameter ValueSet = "CV02.10.004";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV02.10.004");

Storage Default
{
<Data name="DE021000400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021000400State</State>
<StreamLocation>^WS.DE.DE021000400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
