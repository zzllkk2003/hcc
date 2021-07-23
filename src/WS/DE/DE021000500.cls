Class WS.DE.DE021000500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "出生缺陷儿例数";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE021000500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021000500State</State>
<StreamLocation>^WS.DE.DE021000500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
