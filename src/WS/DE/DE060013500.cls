Class WS.DE.DE060013500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 2);

Parameter Category = "计划与干预";

Parameter Description = "药物使用总剂量";

Parameter Format = "N..12,2";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE060013500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060013500State</State>
<StreamLocation>^WS.DE.DE060013500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
