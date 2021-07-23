Class WS.DE.DE083002700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "助产人员类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV08.30.004";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV08.30.004");

Storage Default
{
<Data name="DE083002700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083002700State</State>
<StreamLocation>^WS.DE.DE083002700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
