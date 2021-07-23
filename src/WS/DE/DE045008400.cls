Class WS.DE.DE045008400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "天冬氨酸氨基转移酶检测值(U/L)";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE045008400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045008400State</State>
<StreamLocation>^WS.DE.DE045008400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
