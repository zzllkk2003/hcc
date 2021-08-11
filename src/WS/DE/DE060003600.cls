Class WS.DE.DE060003600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "计划与干预";

Parameter Description = "患肢清洗标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE060003600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060003600State</State>
<StreamLocation>^WS.DE.DE060003600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
