Class WS.DE.DE045009600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Parameter Category = "实验室检查";

Parameter Description = "血铅检测值(nmol/L)";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE045009600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045009600State</State>
<StreamLocation>^WS.DE.DE045009600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
