Class WS.DE.DE030008300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "有危害因素接触职业描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE030008300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030008300State</State>
<StreamLocation>^WS.DE.DE030008300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
