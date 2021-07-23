Class WS.DE.DE020101200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "电子邮件地址";

Parameter Format = "AN..70";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 70, MINLEN = 0);

Storage Default
{
<Data name="DE020101200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020101200State</State>
<StreamLocation>^WS.DE.DE020101200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
