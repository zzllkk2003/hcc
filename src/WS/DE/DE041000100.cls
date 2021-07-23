Class WS.DE.DE041000100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "凹陷性水肿标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041000100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041000100State</State>
<StreamLocation>^WS.DE.DE041000100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
