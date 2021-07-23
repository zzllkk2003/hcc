Class WS.DE.DE045005900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "尿色变黄标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE045005900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045005900State</State>
<StreamLocation>^WS.DE.DE045005900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
