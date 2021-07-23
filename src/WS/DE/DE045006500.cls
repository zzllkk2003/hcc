Class WS.DE.DE045006500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "尿血标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE045006500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045006500State</State>
<StreamLocation>^WS.DE.DE045006500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
