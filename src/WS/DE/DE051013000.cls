Class WS.DE.DE051013000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "辨证分型代码";

Parameter Format;

Parameter ValueSet = "GBT.15657.1995";

Parameter WSDT;

Property Value As WS.DT.CodedString(ValueSet = "GBT.15657.1995");

Storage Default
{
<Data name="DE051013000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051013000State</State>
<StreamLocation>^WS.DE.DE051013000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
