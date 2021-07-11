Class WS.DE.DE045001400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "白细胞分类结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE045001400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045001400State</State>
<StreamLocation>^WS.DE.DE045001400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
