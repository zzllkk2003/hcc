Class WS.DE.DE081001500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "卫生机构";

Parameter Description = "机构有无检验室标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

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
