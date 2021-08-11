Class WS.DE.DE045003600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "实验室检查";

Parameter Description = "精液检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE045003600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045003600State</State>
<StreamLocation>^WS.DE.DE045003600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
