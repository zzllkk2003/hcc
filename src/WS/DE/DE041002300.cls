Class WS.DE.DE041002300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "低热标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041002300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041002300State</State>
<StreamLocation>^WS.DE.DE041002300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
