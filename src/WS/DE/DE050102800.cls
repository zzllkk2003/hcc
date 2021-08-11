Class WS.DE.DE050102800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "淋巴管或淋巴结炎发作代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:离心性;2:向心性;";

Parameter ValueSet = "DE05.01.028.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.01.028.00");

Storage Default
{
<Data name="DE050102800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050102800State</State>
<StreamLocation>^WS.DE.DE050102800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
