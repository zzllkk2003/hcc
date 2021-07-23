Class WS.DE.DE060006700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "抗病毒治疗标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060006700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060006700State</State>
<StreamLocation>^WS.DE.DE060006700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
