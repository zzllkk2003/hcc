Class WS.DE.DE010000500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "病理号";

Parameter Format = "AN..18";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 18, MINLEN = 0);

Storage Default
{
<Data name="DE010000500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010000500State</State>
<StreamLocation>^WS.DE.DE010000500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
