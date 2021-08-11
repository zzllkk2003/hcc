Class WS.DE.DE021000700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "初潮年龄(岁)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE021000700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021000700State</State>
<StreamLocation>^WS.DE.DE021000700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
