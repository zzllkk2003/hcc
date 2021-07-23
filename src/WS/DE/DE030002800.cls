Class WS.DE.DE030002800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "接触有害因素类别";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.403";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.403");

Storage Default
{
<Data name="DE030002800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030002800State</State>
<StreamLocation>^WS.DE.DE030002800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
