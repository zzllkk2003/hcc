Class WS.DE.DE060009600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "计划与干预";

Parameter Description = "手术并发症标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE060009600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060009600State</State>
<StreamLocation>^WS.DE.DE060009600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
