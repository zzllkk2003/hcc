Class WS.DE.DE041022300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "阴道异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041022300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041022300State</State>
<StreamLocation>^WS.DE.DE041022300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
