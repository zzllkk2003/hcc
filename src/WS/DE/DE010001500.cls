Class WS.DE.DE010001500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "会诊单编号";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE010001500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010001500State</State>
<StreamLocation>^WS.DE.DE010001500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
