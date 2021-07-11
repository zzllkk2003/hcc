Class WS.DE.DE045013300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "检查报告日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE045013300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045013300State</State>
<StreamLocation>^WS.DE.DE045013300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
