Class WS.DE.DE041004300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "腹壁静脉显露标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041004300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041004300State</State>
<StreamLocation>^WS.DE.DE041004300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}