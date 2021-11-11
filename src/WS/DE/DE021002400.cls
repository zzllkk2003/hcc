Class WS.DE.DE021002400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "患者与本人关系代码";

Parameter Format = "N2";

Parameter ValueSet = "GBT.4761.2008";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.4761.2008");

Storage Default
{
<Data name="DE021002400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021002400State</State>
<StreamLocation>^WS.DE.DE021002400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
