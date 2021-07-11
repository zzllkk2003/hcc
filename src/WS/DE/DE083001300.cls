Class WS.DE.DE083001300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "人员流动类别";

Parameter Format = "AN..40";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 40, MINLEN = 0);

Storage Default
{
<Data name="DE083001300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083001300State</State>
<StreamLocation>^WS.DE.DE083001300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
