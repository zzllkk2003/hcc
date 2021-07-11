Class WS.DE.DE045006700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "凝血时间(s)";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE045006700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045006700State</State>
<StreamLocation>^WS.DE.DE045006700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
