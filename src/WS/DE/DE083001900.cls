Class WS.DE.DE083001900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 40, MINLEN = 0);

Parameter Category = "卫生人员";

Parameter Description = "卫生监督证/卡号码";

Parameter Format = "AN..40";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE083001900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083001900State</State>
<StreamLocation>^WS.DE.DE083001900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
