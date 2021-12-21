Class WS.DE.DE045003300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "甲状腺素检测值(nmol/L)";

Parameter Format = "N5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 999.9, MINVAL = 100, SCALE = 1);

Storage Default
{
<Data name="DE045003300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045003300State</State>
<StreamLocation>^WS.DE.DE045003300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
