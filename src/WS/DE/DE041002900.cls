Class WS.DE.DE041002900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "耳外观检查异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041002900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041002900State</State>
<StreamLocation>^WS.DE.DE041002900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
