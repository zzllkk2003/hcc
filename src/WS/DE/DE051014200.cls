Class WS.DE.DE051014200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "医学评估";

Parameter Description = "精神状态正常标识";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE051014200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051014200State</State>
<StreamLocation>^WS.DE.DE051014200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
