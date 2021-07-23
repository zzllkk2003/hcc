Class WS.DE.DE045000300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "HBVDNA定量检测结果";

Parameter Format = "N..30";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 1000000000000000000000000000000, MINVAL = 0);

Storage Default
{
<Data name="DE045000300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045000300State</State>
<StreamLocation>^WS.DE.DE045000300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
