Class WS.DE.DE030008600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "健康危险因素";

Parameter Description = "运动方式说明";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE030008600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030008600State</State>
<StreamLocation>^WS.DE.DE030008600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
