Class WS.DE.DE045006500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "实验室检查";

Parameter Description = "尿血标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

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
