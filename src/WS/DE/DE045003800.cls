Class WS.DE.DE045003800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "淋巴细胞百分率(%)";

Parameter Format = "N..5,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 99.99, MINVAL = 0, SCALE = 2);

Storage Default
{
<Data name="DE045003800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045003800State</State>
<StreamLocation>^WS.DE.DE045003800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
