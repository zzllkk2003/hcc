Class WS.DE.DE030003300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "开始从事有害职业日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE030003300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030003300State</State>
<StreamLocation>^WS.DE.DE030003300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
