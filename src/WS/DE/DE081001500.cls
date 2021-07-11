Class WS.DE.DE081001500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "机构有无检验室标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE081001500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081001500State</State>
<StreamLocation>^WS.DE.DE081001500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
