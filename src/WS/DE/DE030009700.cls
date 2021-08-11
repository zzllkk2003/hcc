Class WS.DE.DE030009700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "健康危险因素";

Parameter Description = "周运动次数(次/周)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE030009700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030009700State</State>
<StreamLocation>^WS.DE.DE030009700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
