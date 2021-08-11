Class WS.DE.DE041000500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "鼻堵标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041000500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041000500State</State>
<StreamLocation>^WS.DE.DE041000500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
