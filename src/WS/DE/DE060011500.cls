Class WS.DE.DE060011500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "维生素D/钙剂添加标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060011500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060011500State</State>
<StreamLocation>^WS.DE.DE060011500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
