Class WS.DE.DE085000600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "设备名称";

Parameter Format = "A..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE085000600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085000600State</State>
<StreamLocation>^WS.DE.DE085000600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
