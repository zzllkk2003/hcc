Class WS.DE.DE045005900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "实验室检查";

Parameter Description = "尿色变黄标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

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
