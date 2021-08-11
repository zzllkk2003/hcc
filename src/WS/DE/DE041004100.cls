Class WS.DE.DE041004100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "附件异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041004100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041004100State</State>
<StreamLocation>^WS.DE.DE041004100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
