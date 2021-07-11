Class WS.DE.DE041003500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "肺部异常呼吸音标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041003500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041003500State</State>
<StreamLocation>^WS.DE.DE041003500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
