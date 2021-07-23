Class WS.DE.DE040110400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "婴幼儿独坐月龄(月 )";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE040110400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040110400State</State>
<StreamLocation>^WS.DE.DE040110400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
