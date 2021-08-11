Class WS.DE.DE083002900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "卫生人员";

Parameter Description = "资格考试合格标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE083002900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083002900State</State>
<StreamLocation>^WS.DE.DE083002900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
