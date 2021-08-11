Class WS.DE.DE045004600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 3);

Parameter Category = "实验室检查";

Parameter Description = "尿比重";

Parameter Format = "N5,3";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045004600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045004600State</State>
<StreamLocation>^WS.DE.DE045004600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
