Class WS.DE.DE041019800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "外阴异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041019800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041019800State</State>
<StreamLocation>^WS.DE.DE041019800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
