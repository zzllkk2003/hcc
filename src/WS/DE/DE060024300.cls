Class WS.DE.DE060024300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "使用医疗机构中药制剂标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060024300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060024300State</State>
<StreamLocation>^WS.DE.DE060024300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
