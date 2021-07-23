Class WS.DE.DE060003500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "规律服药标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060003500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060003500State</State>
<StreamLocation>^WS.DE.DE060003500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
