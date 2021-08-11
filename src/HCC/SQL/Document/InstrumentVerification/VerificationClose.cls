/// 器械物品核对
Class HCC.SQL.Document.InstrumentVerification.VerificationClose Extends (%SerialObject, %XML.Adaptor)
{

/// 器械护士
Property equipmentNurse As HCC.SQL.Document.InstrumentVerification.Nurse [ SqlFieldName = equip_nurse ];

/// 巡台护士
Property patrolNurse As HCC.SQL.Document.InstrumentVerification.Nurse [ SqlFieldName = patrol_nurse ];

/// 术中所用物品名称                                                  
Property instrument As WS.DE.DE085004200 [ Required, SqlFieldName = instrument ];

/// 清点标志                                                  
Property verified As WS.DE.DE060020400 [ Required, SqlFieldName = verified ];

Storage Default
{
<Data name="VerificationCloseState">
<Value name="1">
<Value>equipmentNurse</Value>
</Value>
<Value name="2">
<Value>patrolNurse</Value>
</Value>
<Value name="3">
<Value>instrument</Value>
</Value>
<Value name="4">
<Value>verified</Value>
</Value>
</Data>
<State>VerificationCloseState</State>
<StreamLocation>^HCC.SQL.Do854E.Verificatio1293S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
