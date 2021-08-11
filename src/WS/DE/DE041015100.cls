Class WS.DE.DE041015100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "前囟闭合标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041015100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041015100State</State>
<StreamLocation>^WS.DE.DE041015100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
