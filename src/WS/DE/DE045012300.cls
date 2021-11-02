Class WS.DE.DE045012300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "中性杆状核粒细胞百分率(%)";

Parameter Format = "N..5,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 2);

Storage Default
{
<Data name="DE045012300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045012300State</State>
<StreamLocation>^WS.DE.DE045012300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
