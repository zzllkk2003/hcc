Class WS.DE.DE045005400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "尿红细胞计数值(个/H)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE045005400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045005400State</State>
<StreamLocation>^WS.DE.DE045005400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
