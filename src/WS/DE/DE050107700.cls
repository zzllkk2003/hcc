Class WS.DE.DE050107700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "麻醉合并症标志";

Parameter Format = "N1";

Parameter ValueSet = "1:否;2:是;3:不确定;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.01.077.00");

Storage Default
{
<Data name="DE050107700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050107700State</State>
<StreamLocation>^WS.DE.DE050107700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
