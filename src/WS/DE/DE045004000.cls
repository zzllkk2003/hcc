Class WS.DE.DE045004000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "淋球菌检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE045004000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045004000State</State>
<StreamLocation>^WS.DE.DE045004000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
