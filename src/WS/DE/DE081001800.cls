Class WS.DE.DE081001800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "卫生机构";

Parameter Description = "集中空调通风系统安装标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE081001800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081001800State</State>
<StreamLocation>^WS.DE.DE081001800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
