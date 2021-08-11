Class WS.DE.DE030009900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "健康危险因素";

Parameter Description = "家庭厨房排风设施标识";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE030009900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030009900State</State>
<StreamLocation>^WS.DE.DE030009900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
