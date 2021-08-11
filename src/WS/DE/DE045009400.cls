Class WS.DE.DE045009400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 9999, MINVAL = 1000);

Parameter Category = "实验室检查";

Parameter Description = "血钠浓度(mmol/L)";

Parameter Format = "N4";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE045009400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045009400State</State>
<StreamLocation>^WS.DE.DE045009400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
