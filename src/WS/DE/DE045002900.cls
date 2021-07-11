Class WS.DE.DE045002900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "宫颈涂片异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE045002900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045002900State</State>
<StreamLocation>^WS.DE.DE045002900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
