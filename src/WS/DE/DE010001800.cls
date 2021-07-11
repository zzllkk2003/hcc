Class WS.DE.DE010001800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "检查报告单编号";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE010001800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010001800State</State>
<StreamLocation>^WS.DE.DE010001800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
