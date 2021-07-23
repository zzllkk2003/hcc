Class WS.DE.DE081004700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "职业卫生技术服务资质证号码";

Parameter Format = "AN..40";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 40, MINLEN = 0);

Storage Default
{
<Data name="DE081004700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081004700State</State>
<StreamLocation>^WS.DE.DE081004700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
