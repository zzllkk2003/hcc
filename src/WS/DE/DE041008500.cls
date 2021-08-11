Class WS.DE.DE041008500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "黄疸标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041008500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041008500State</State>
<StreamLocation>^WS.DE.DE041008500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
