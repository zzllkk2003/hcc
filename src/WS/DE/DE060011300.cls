Class WS.DE.DE060011300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "计划与干预";

Parameter Description = "外用药物防止感染标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE060011300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060011300State</State>
<StreamLocation>^WS.DE.DE060011300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
