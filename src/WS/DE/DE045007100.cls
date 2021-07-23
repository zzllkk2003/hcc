Class WS.DE.DE045007100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "染色体畸变类型";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE045007100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045007100State</State>
<StreamLocation>^WS.DE.DE045007100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
