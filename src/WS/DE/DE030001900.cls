Class WS.DE.DE030001900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "健康危险因素";

Parameter Description = "户外活动标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE030001900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030001900State</State>
<StreamLocation>^WS.DE.DE030001900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
