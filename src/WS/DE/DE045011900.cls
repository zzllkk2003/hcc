Class WS.DE.DE045011900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "实验室检查";

Parameter Description = "阴道分泌物性状描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE045011900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045011900State</State>
<StreamLocation>^WS.DE.DE045011900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
