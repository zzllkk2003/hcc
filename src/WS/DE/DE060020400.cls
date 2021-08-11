Class WS.DE.DE060020400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "发出手术安全核对表";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060020400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060020400State</State>
<StreamLocation>^WS.DE.DE060020400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
