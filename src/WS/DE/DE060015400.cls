Class WS.DE.DE060015400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "知情同意标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060015400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060015400State</State>
<StreamLocation>^WS.DE.DE060015400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
