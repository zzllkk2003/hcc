Class WS.DE.DE041009000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Parameter Category = "体格检查";

Parameter Description = "基础收缩压(mmHg)";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE041009000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041009000State</State>
<StreamLocation>^WS.DE.DE041009000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
