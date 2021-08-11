Class WS.DE.DE060030000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "治则治法";

Parameter Format = "N2";

Parameter ValueSet = "GBT.16751.31997";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.16751.3.1997");

Storage Default
{
<Data name="DE060030000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060030000State</State>
<StreamLocation>^WS.DE.DE060030000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
