Class WS.DE.DE021005100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "末次月经日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE021005100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021005100State</State>
<StreamLocation>^WS.DE.DE021005100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
