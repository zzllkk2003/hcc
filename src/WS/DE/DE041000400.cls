Class WS.DE.DE041000400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "鼻部检查异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041000400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041000400State</State>
<StreamLocation>^WS.DE.DE041000400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
