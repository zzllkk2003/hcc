Class WS.DE.DE060014600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "婴幼儿辅食种类代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.216";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.216");

Storage Default
{
<Data name="DE060014600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060014600State</State>
<StreamLocation>^WS.DE.DE060014600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
