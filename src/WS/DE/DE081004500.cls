Class WS.DE.DE081004500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "卫生机构";

Parameter Description = "执法考核评议标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE081004500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081004500State</State>
<StreamLocation>^WS.DE.DE081004500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
