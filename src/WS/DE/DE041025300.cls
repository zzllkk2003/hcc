Class WS.DE.DE041025300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "会阴血肿标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041025300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041025300State</State>
<StreamLocation>^WS.DE.DE041025300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
