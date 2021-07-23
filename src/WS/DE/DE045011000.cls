Class WS.DE.DE045011000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "眼底检查结果异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE045011000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045011000State</State>
<StreamLocation>^WS.DE.DE045011000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
