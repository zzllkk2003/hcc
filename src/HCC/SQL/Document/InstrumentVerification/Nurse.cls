/// 护士
Class HCC.SQL.Document.InstrumentVerification.Nurse Extends (%SerialObject, %XML.Adaptor)
{

/// 签名日期时间
Property signTime As WS.DE.DE090005300 [ Required, SqlFieldName = sign_time ];

/// 护士姓名
Property name As WS.DE.DE020103900 [ Required, SqlFieldName = name ];

Storage Default
{
<Data name="NurseState">
<Value name="1">
<Value>signTime</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<State>NurseState</State>
<StreamLocation>^HCC.SQL.Document.Ins854E.NurseS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
