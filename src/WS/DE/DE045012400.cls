Class WS.DE.DE045012400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 2);

Parameter Category = "实验室检查";

Parameter Description = "中性粒细胞百分率(%)";

Parameter Format = "N..5,2";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045012400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045012400State</State>
<StreamLocation>^WS.DE.DE045012400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
