Class WS.DE.DE010002100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "居民健康卡号";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE010002100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010002100State</State>
<StreamLocation>^WS.DE.DE010002100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
