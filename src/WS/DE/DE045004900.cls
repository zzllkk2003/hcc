Class WS.DE.DE045004900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "尿蛋白定量检测值(mg/24h）";

Parameter Format = "N5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 999.9, MINVAL = 100, SCALE = 1);

Storage Default
{
<Data name="DE045004900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045004900State</State>
<StreamLocation>^WS.DE.DE045004900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
