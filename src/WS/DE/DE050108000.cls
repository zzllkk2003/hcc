/// 定义在WS445-12
/// 该值应为'01','12'之类的二位数字
Class WS.DE.DE050108000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "入院诊断顺位（从属关系）";

Parameter Format = "N2";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(PATTERN = "2N");

Storage Default
{
<Data name="DE050108000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050108000State</State>
<StreamLocation>^WS.DE.DE050108000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
