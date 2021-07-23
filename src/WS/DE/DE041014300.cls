Class WS.DE.DE041014300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "其他阳性体征";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041014300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041014300State</State>
<StreamLocation>^WS.DE.DE041014300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
