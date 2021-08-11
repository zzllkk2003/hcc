Class WS.DE.DE060000100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999999999999, MINVAL = 100000000000);

Parameter Category = "计划与干预";

Parameter Description = "艾滋病抗病毒治疗编号";

Parameter Format = "N12";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE060000100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060000100State</State>
<StreamLocation>^WS.DE.DE060000100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
