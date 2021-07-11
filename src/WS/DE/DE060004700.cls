Class WS.DE.DE060004700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "家庭病床建立原因";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE060004700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060004700State</State>
<StreamLocation>^WS.DE.DE060004700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
