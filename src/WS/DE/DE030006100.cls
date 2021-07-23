Class WS.DE.DE030006100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "受照日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE030006100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030006100State</State>
<StreamLocation>^WS.DE.DE030006100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
