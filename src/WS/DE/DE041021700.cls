Class WS.DE.DE041021700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "眼外观检查异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041021700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041021700State</State>
<StreamLocation>^WS.DE.DE041021700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
