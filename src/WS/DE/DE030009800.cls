Class WS.DE.DE030009800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "醉酒标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE030009800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030009800State</State>
<StreamLocation>^WS.DE.DE030009800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
