Class WS.DE.DE045002000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "促甲状腺激素检测值(mu/L)";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE045002000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045002000State</State>
<StreamLocation>^WS.DE.DE045002000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
