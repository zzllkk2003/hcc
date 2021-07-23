Class WS.DE.DE041004800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "腹部压痛标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041004800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041004800State</State>
<StreamLocation>^WS.DE.DE041004800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
