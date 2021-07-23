Class WS.DE.DE041024400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "恶露异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041024400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041024400State</State>
<StreamLocation>^WS.DE.DE041024400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
