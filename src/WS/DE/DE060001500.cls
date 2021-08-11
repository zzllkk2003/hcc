Class WS.DE.DE060001500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Date(FORMAT = 8);

Parameter Category = "计划与干预";

Parameter Description = "出具证明日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Storage Default
{
<Data name="DE060001500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060001500State</State>
<StreamLocation>^WS.DE.DE060001500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
