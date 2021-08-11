Class WS.DE.DE041024300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "皮肤检查异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041024300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041024300State</State>
<StreamLocation>^WS.DE.DE041024300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
