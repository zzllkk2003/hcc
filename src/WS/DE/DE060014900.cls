Class WS.DE.DE060014900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "育龄妇女预防母婴传播干预措施代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.213";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.213");

Storage Default
{
<Data name="DE060014900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060014900State</State>
<StreamLocation>^WS.DE.DE060014900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
