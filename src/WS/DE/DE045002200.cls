Class WS.DE.DE045002200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "实验室检查";

Parameter Description = "大便潜血标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE045002200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045002200State</State>
<StreamLocation>^WS.DE.DE045002200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
