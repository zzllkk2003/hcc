Class WS.DE.DE030000900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "登高和剧烈运动标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE030000900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030000900State</State>
<StreamLocation>^WS.DE.DE030000900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
