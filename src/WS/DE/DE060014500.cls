Class WS.DE.DE060014500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Date(FORMAT = 8);

Parameter Category = "计划与干预";

Parameter Description = "疫苗接种日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Storage Default
{
<Data name="DE060014500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060014500State</State>
<StreamLocation>^WS.DE.DE060014500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
