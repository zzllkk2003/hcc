Class WS.DE.DE041017400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Parameter Category = "体格检查";

Parameter Description = "收缩压（mmHg）";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE041017400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041017400State</State>
<StreamLocation>^WS.DE.DE041017400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
