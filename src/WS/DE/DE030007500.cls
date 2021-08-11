Class WS.DE.DE030007500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "健康危险因素";

Parameter Description = "饮酒标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE030007500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030007500State</State>
<StreamLocation>^WS.DE.DE030007500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
