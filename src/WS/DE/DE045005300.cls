Class WS.DE.DE045005300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "实验室检查";

Parameter Description = "尿管型检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE045005300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045005300State</State>
<StreamLocation>^WS.DE.DE045005300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
