Class WS.DE.DE045007200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "染色体畸变数量";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE045007200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045007200State</State>
<StreamLocation>^WS.DE.DE045007200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
