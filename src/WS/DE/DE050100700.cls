Class WS.DE.DE050100700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "尘肺类别代码";

Parameter Format = "N1";

Parameter ValueSet = "卫监发[2002]108号《职业病目录》";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "卫监发[2002]108号《职业病目录》");

Storage Default
{
<Data name="DE050100700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050100700State</State>
<StreamLocation>^WS.DE.DE050100700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
