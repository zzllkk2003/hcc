Class WS.DE.DE050106300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "职业病种类代码";

Parameter Format = "N2";

Parameter ValueSet = "卫监发[2002]108号《职业病目录》";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "卫监发[2002]108号《职业病目录》");

Storage Default
{
<Data name="DE050106300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050106300State</State>
<StreamLocation>^WS.DE.DE050106300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
