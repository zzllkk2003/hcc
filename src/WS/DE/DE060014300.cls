Class WS.DE.DE060014300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Date(FORMAT = 8);

Parameter Category = "计划与干预";

Parameter Description = "乙肝疫苗接种日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Storage Default
{
<Data name="DE060014300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060014300State</State>
<StreamLocation>^WS.DE.DE060014300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
