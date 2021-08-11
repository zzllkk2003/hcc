Class WS.DE.DE081003800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 40, MINLEN = 0);

Parameter Category = "卫生机构";

Parameter Description = "许可证号码";

Parameter Format = "AN..40";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE081003800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081003800State</State>
<StreamLocation>^WS.DE.DE081003800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
