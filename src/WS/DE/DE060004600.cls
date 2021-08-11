Class WS.DE.DE060004600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Date(FORMAT = 8);

Parameter Category = "计划与干预";

Parameter Description = "家庭病床建床日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Storage Default
{
<Data name="DE060004600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060004600State</State>
<StreamLocation>^WS.DE.DE060004600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}