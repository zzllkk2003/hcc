Class WS.DE.DE030001200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "儿童户外活动标记";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE030001200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030001200State</State>
<StreamLocation>^WS.DE.DE030001200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
