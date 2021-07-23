Class WS.DE.DE041005100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "腹部移动性浊音描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041005100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041005100State</State>
<StreamLocation>^WS.DE.DE041005100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
