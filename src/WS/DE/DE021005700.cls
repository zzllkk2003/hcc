Class WS.DE.DE021005700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "上消化道出血日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE021005700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021005700State</State>
<StreamLocation>^WS.DE.DE021005700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
