Class WS.DE.DE081001400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "卫生机构";

Parameter Description = "机构所在地民族自治地方标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE081001400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081001400State</State>
<StreamLocation>^WS.DE.DE081001400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
