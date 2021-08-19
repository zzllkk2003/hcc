/// 文档记录对象或健康保健对象 (患者信息)
Class HCC.SQL.Document.Header.RecordTarget Extends (%SerialObject, %XML.Adaptor)
{

/// 健康档案标识号。用于《病历概要》
Property healthRecordId As WS.DE.DE010000900 [ SqlFieldName = hrId ];

/// 健康卡号标识。以下文档需要：《住院病案首页》、《病历概要》
Property healthCardId As WS.DE.DE010002100 [ Required, SqlFieldName = healthCardId ];

/// 病案号标识
Property MRN As WS.DE.DE010000400 [ Required, SqlFieldName = MRN ];

/// 住院号标识。以下文档需要：《住院病案首页》
Property inpatientNum As WS.DE.DE010001400 [ Required, SqlFieldName = ip_num ];

/// 门（急）诊号标识 
Property outpatientNum As WS.DE.DE010001000 [ SqlFieldName = op_num ];

/// 患者地址
Property addr As HCC.SQL.Addr;

/// 患者电话号码
Property telcom As WS.DE.DE020101000 [ SqlFieldName = telcom ];

/// 患者类别代码
Property patientType As WS.DE.DE020106000 [ SqlFieldName = pat_Type ];

/// 患者
Property patient As HCC.SQL.Document.Header.RecordTarget.Patient [ SqlFieldName = pat ];

/// 检验报告单号标识
Property labReportNum As WS.DE.DE010001800 [ SqlFieldName = labrep_num ];

/// 电子申请单编号
Property labOrderNum As WS.DE.DE010000800 [ SqlFieldName = labord_num ];

/// 检验标本编号标识
Property specimenNum As WS.DE.DE010000300 [ SqlFieldName = spec_num ];

Property providerOrganization As HCC.SQL.Document.Header.RecordTarget.ProviderOrganization [ SqlFieldName = prov_org ];

Storage Default
{
<Data name="RecordTargetState">
<Value name="1">
<Value>healthCardId</Value>
</Value>
<Value name="2">
<Value>MRN</Value>
</Value>
<Value name="3">
<Value>addrHouseNumber</Value>
</Value>
<Value name="4">
<Value>addrStreetName</Value>
</Value>
<Value name="5">
<Value>addrTownship</Value>
</Value>
<Value name="6">
<Value>addrCounty</Value>
</Value>
<Value name="7">
<Value>addrCity</Value>
</Value>
<Value name="8">
<Value>addrState</Value>
</Value>
<Value name="9">
<Value>addrPostalCode</Value>
</Value>
<Value name="10">
<Value>telcom</Value>
</Value>
<Value name="11">
<Value>patientId</Value>
</Value>
<Value name="12">
<Value>patientName</Value>
</Value>
<Value name="13">
<Value>administrativeGender</Value>
</Value>
<Value name="14">
<Value>maritalStatusCode</Value>
</Value>
<Value name="15">
<Value>ageInYear</Value>
</Value>
<Value name="16">
<Value>ageInMonth</Value>
</Value>
<Value name="17">
<Value>occupationCode</Value>
</Value>
<Value name="18">
<Value>providerOrganizationId</Value>
</Value>
<Value name="19">
<Value>providerOrganizationName</Value>
</Value>
<Value name="20">
<Value>birthTime</Value>
</Value>
<Value name="21">
<Value>ethnicGroupCode</Value>
</Value>
<Value name="22">
<Value>birthplaceCounty</Value>
</Value>
<Value name="23">
<Value>birthplaceCity</Value>
</Value>
<Value name="24">
<Value>birthplaceState</Value>
</Value>
<Value name="25">
<Value>birthplacePostalCode</Value>
</Value>
<Value name="26">
<Value>nationality</Value>
</Value>
<Value name="27">
<Value>householdHouseNumber</Value>
</Value>
<Value name="28">
<Value>householdStreetName</Value>
</Value>
<Value name="29">
<Value>householdTownship</Value>
</Value>
<Value name="30">
<Value>householdCounty</Value>
</Value>
<Value name="31">
<Value>householdCity</Value>
</Value>
<Value name="32">
<Value>householdState</Value>
</Value>
<Value name="33">
<Value>householdPostalCode</Value>
</Value>
<Value name="34">
<Value>nativePlaceCity</Value>
</Value>
<Value name="35">
<Value>nativePlaceState</Value>
</Value>
<Value name="36">
<Value>employerName</Value>
</Value>
<Value name="37">
<Value>employerAddrHouseNumber</Value>
</Value>
<Value name="38">
<Value>employerAddrStreetName</Value>
</Value>
<Value name="39">
<Value>employerAddrTownship</Value>
</Value>
<Value name="40">
<Value>employerAddrCounty</Value>
</Value>
<Value name="41">
<Value>employerAddrCity</Value>
</Value>
<Value name="42">
<Value>employerAddrState</Value>
</Value>
<Value name="43">
<Value>employerAddrPostalCode</Value>
</Value>
<Value name="44">
<Value>employerTelcom</Value>
</Value>
<Value name="45">
<Value>medicalRecordId</Value>
</Value>
<Value name="46">
<Value>addr</Value>
</Value>
<Value name="47">
<Value>patient</Value>
</Value>
<Value name="48">
<Value>providerOrganization</Value>
</Value>
<Value name="49">
<Value>healthRecordId</Value>
</Value>
<Value name="50">
<Value>inpatientNum</Value>
</Value>
<Value name="51">
<Value>outpatientNum</Value>
</Value>
<Value name="52">
<Value>labReportNum</Value>
</Value>
<Value name="53">
<Value>labOrderNum</Value>
</Value>
<Value name="54">
<Value>specimenNum</Value>
</Value>
<Value name="55">
<Value>patientType</Value>
</Value>
</Data>
<State>RecordTargetState</State>
<StreamLocation>^HCC.SQL.DocumEBE5.RecordTargetS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
