/// 器械物品核对
Class HCC.SQL.Document.InstrumentVerification.Verification Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 器械护士
Property equipmentNurse As HCC.SQL.Document.InstrumentVerification.Nurse [ SqlFieldName = equip_nurse ];

/// 巡台护士
Property patrolNurse As HCC.SQL.Document.InstrumentVerification.Nurse [ SqlFieldName = patrol_nurse ];

/// 术中所用物品名称                                                  
Property instrument As WS.DE.DE085004200 [ Required, SqlFieldName = instrument ];

/// 术前清点标志                                                  
Property verified As WS.DE.DE090011100 [ Required, SqlFieldName = verified ];

Storage Default
{
<Data name="VerificationState">
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
<State>VerificationState</State>
<StreamLocation>^HCC.SQL.Docum854E.VerificationS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
