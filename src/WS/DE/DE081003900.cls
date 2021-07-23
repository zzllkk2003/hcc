Class WS.DE.DE081003900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "许可证有效期开始日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE081003900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081003900State</State>
<StreamLocation>^WS.DE.DE081003900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
