Class WS.DE.DE060005700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "结核患者发现方式代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.116";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.116");

Storage Default
{
<Data name="DE060005700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060005700State</State>
<StreamLocation>^WS.DE.DE060005700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
