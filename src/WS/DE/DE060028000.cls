Class WS.DE.DE060028000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "计划与干预";

Parameter Description = "通知医生标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE060028000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060028000State</State>
<StreamLocation>^WS.DE.DE060028000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
