Class WS.DE.DE060004300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "婚前卫生咨询内容";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060004300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060004300State</State>
<StreamLocation>^WS.DE.DE060004300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
