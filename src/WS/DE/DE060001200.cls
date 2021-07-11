Class WS.DE.DE060001200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "产妇会阴切开标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060001200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060001200State</State>
<StreamLocation>^WS.DE.DE060001200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
