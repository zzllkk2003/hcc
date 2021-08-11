Class WS.DE.DE030002900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Parameter Category = "健康危险因素";

Parameter Description = "接触有害因素情况";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE030002900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030002900State</State>
<StreamLocation>^WS.DE.DE030002900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
