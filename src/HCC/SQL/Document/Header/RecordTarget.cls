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

/// 患者地址
Property addr As HCC.SQL.Addr;

/// 患者电话号码
Property telcom As WS.DE.DE020101000 [ SqlFieldName = telcom ];

/// 患者
Property patient As HCC.SQL.Document.Header.RecordTarget.Patient [ SqlFieldName = pat ];

/*

/// 患者身份证号标识
Property patientId As WS.DE.DE020103000 [ SqlFieldName = patient_id ];

/// 患者姓名
Property patientName As WS.DE.DE020103900 [ Required, SqlFieldName = patient_name ];

/// 患者性别代码
Property administrativeGender As WS.DE.DE020104000 [ Required, SqlFieldName = patient_administrativeGender ];

/// 患者出生日期
Property birthTime As WS.DE.DE020100501 [ Required, SqlFieldName = patient_birthTime ];

/// 婚姻状况代码
Property maritalStatusCode As WS.DE.DE020101800 [ SqlFieldName = patient_maritalStatusCode ];

/// 民族
Property ethnicGroupCode As WS.DE.DE020102500 [ SqlFieldName = patient_ethnicGroupCode ];

/// 出生地 - 地址-县
Property birthplaceCounty As WS.DE.DE020100903 [ SqlFieldName = patient_birthplace_county ];

/// 出生地 - 地址-市
Property birthplaceCity As WS.DE.DE020100902 [ SqlFieldName = patient_birthplace_city ];

/// 出生地 - 地址-省
Property birthplaceState As WS.DE.DE020100901 [ SqlFieldName = patient_birthplace_state ];

/// 出生地 - 地址-邮政编码
Property birthplacePostalCode As WS.DE.DE020104700 [ SqlFieldName = patient_birthplace_postalCode ];

/// 国籍
Property nationality As WS.DE.DE020101500 [ SqlFieldName = patient_nationality ];

/// 年龄
Property ageInYear As WS.DE.DE020102600 [ SqlFieldName = patient_age ];

/// 工作单位名称
Property employerName As WS.DE.DE081000700 [ Required, SqlFieldName = employer_name ];

/// 工作单位电话号码
Property employerTelcom As WS.DE.DE020101000 [ SqlFieldName = employer_telcom ];

/// 工作单位地址-门牌号
Property employerAddrHouseNumber As WS.DE.DE020100906 [ Required, SqlFieldName = employer_addr_houseNumber ];

/// 工作单位地址-村（街、路、弄等）
Property employerAddrStreetName As WS.DE.DE020100905 [ Required, SqlFieldName = employer_addr_streetName ];

/// 工作单位地址-乡（镇、街道办事处）
Property employerAddrTownship As WS.DE.DE020100904 [ Required, SqlFieldName = employer_addr_township ];

/// 工作单位地址-县（区）
Property employerAddrCounty As WS.DE.DE020100903 [ Required, SqlFieldName = employer_addr_county ];

/// 工作单位地址-市（地区、州）
Property employerAddrCity As WS.DE.DE020100902 [ Required, SqlFieldName = employer_addr_city ];

/// 工作单位地址-省（自治区、直辖市）
Property employerAddrState As WS.DE.DE020100901 [ Required, SqlFieldName = employer_addr_state ];

/// 工作单位地址-邮政编码
Property employerAddrPostalCode As WS.DE.DE020104700 [ Required, SqlFieldName = employer_addr_postalCode ];

/// 户口信息 - 地址-门牌号码
Property householdHouseNumber As WS.DE.DE020100906 [ SqlFieldName = patient_household_houseNumber ];

/// 户口信息 - 地址-村/街/路/弄
Property householdStreetName As WS.DE.DE020100905 [ SqlFieldName = patient_household_streetName ];

/// 户口信息 - 地址-乡/镇/街道
Property householdTownship As WS.DE.DE020100905 [ SqlFieldName = patient_household_township ];

/// 户口信息 - 地址-县
Property householdCounty As WS.DE.DE020100903 [ SqlFieldName = patient_household_county ];

/// 户口信息 - 地址-市
Property householdCity As WS.DE.DE020100902 [ SqlFieldName = patient_household_city ];

/// 户口信息 - 地址-省
Property householdState As WS.DE.DE020100901 [ SqlFieldName = patient_household_state ];

/// 户口信息 - 地址-邮政编码
Property householdPostalCode As WS.DE.DE020104700 [ SqlFieldName = patient_household_postalCode ];

/// 籍贯信息 - 地址-市
Property nativePlaceCity As WS.DE.DE020100902 [ SqlFieldName = patient_nativePlace_city ];

/// 籍贯信息 - 地址-省
Property nativePlaceState As WS.DE.DE020100901 [ SqlFieldName = patient_nativePlace_state ];

/// 实足月龄
Property ageInMonth As WS.DE.DE020103200 [ SqlFieldName = patient_ageMonth ];

/// 职业类别代码
Property occupationCode As WS.DE.DE020105200 [ Required, SqlFieldName = patient_occupationCode ];
*/
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
</Data>
<State>RecordTargetState</State>
<StreamLocation>^HCC.SQL.DocumEBE5.RecordTargetS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
