Class WS.DE.DE045013400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "标本类别";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE045013400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045013400State</State>
<StreamLocation>^WS.DE.DE045013400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
