Class WS.DE.DE045007800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "嗜酸性粒细胞百分率(%)";

Parameter Format = "N..5,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 2);

Storage Default
{
<Data name="DE045007800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045007800State</State>
<StreamLocation>^WS.DE.DE045007800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
