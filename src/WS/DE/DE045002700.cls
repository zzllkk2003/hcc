Class WS.DE.DE045002700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "肝脏病理学检查结果";

Parameter Format = "AN..500";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 500, MINLEN = 0);

Storage Default
{
<Data name="DE045002700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045002700State</State>
<StreamLocation>^WS.DE.DE045002700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
