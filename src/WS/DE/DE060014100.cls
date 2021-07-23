Class WS.DE.DE060014100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "乙肝免疫球蛋白注射史标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060014100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060014100State</State>
<StreamLocation>^WS.DE.DE060014100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
