Class WS.DE.DE045009200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "血肌酐值(μmol/L）";

Parameter Format = "N3,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 9.9, MINVAL = 0, SCALE = 1);

Storage Default
{
<Data name="DE045009200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045009200State</State>
<StreamLocation>^WS.DE.DE045009200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
