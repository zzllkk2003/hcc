Class HCC.SQL.Testme Extends %RegisteredObject
{

/// 删除文档,pDocNo为文档号
ClassMethod ClearDoc(pDocNo) As %Status
{
    //删除其它主外键引用类
    &SQL(START TRANSACTION )
    &SQL(delete from HCC_SQL_Document_Header.EncompassingEncounter where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Header where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.PastHistory where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.MenstrualHistory where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Allergy where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Hospitalization where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.HospitalCourse where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Diagnosis where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.HealthProblem where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Referral where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.HospitalDischargeDX where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.HospitalAdmissionDX where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.SurgicalOperationNotePreoperativeDX where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.SurgicalOperationNotePostoperativeDX where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.LabTest where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.ProviderOrder where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document."Procedure" where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.ProcedureNote where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.CaesareanProcedure where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.SurgicalDrains where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.MedicationUseHistory where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Administration where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.TreatmentPlan where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Payment where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.HealthcareEvent where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.ChiefComplaint where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.PresentIllnessHistory where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.RescueRecord where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Other where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.OtherProc where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.CheckReport where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.LabReport where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.BloodLoss where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.BloodTransfusion where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Anesthesia where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Infusion where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.ProcedureDisposition where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.GeneralStatus where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.PrenatalEvent where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.VaginalDelivery where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.ProcessPostDelivery where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.NewBorn where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.DeliveryAssessment where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Extremities where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Skin where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.HealthAssessment where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.HealthGuidance where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.NursingRecord where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.NursingObservation where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.NursingOperation where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.NursingSign where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.ProcedureAssessment where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.NursingIsolation where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.InstrumentVerification where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.PostoperationHandover where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.AdmissionInformation where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.HealthAssessment where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.LifeStyle where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Risk where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Suggestion where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Consent where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Referral where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.ConsultReason where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.ConsultSuggestion where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.MRSummary where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Attention where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.PreoperativeSummary where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.DeathReason where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.AutopsyOpinion where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.Discussion where DocumentNo=:pDocNo)
    &SQL(delete from HCC_SQL_Document.DiscussionSummary where DocumentNo=:pDocNo)
    &SQL(COMMIT)
       
    //删除文档体和多有父子关系子类实例
    Set tSC= ##class(HCC.SQL.Document).%DeleteId(pDocNo)

    Quit tSC
}

/// 测试SQL生成文件
/// pDocNo为文档号
/// pDocType为文档类型，是1-53的数字
ClassMethod TestDocumentGenerate(pDocNo = "Doc123456", pDocType = 1)
{
    #SQLCompile Select=ODBC 

    /// 插入文档
    &SQL(insert into HCC_SQL.Document(
    DocumentNo,
    DocumentType)
    values(
    :pDocNo/*DocumentNo*/,
    :pDocType)
    )
    W "HCC_SQL.Document:",SQLCODE,!
}

/// 测试SQL生成文件头
ClassMethod TestHeaderGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    Set tDocType=""
    &SQL(select DocumentType into :tDocType from HCC_SQL.Document where id=:pDocNo)
    
    Set tDocType="C00"_$Case($L(tDocType),1:"0"_tDocType,:tDocType)

    /// 插入文档头
    &SQL(insert into HCC_SQL_Document.Header(
    DocumentNo,
    act_code,
    act_confidentialityCode,
    act_effectiveTime,
    act_languageCode,
    act_setId,
    act_versionNumber,
    auth_asgnPers_id,
    auth_asgnPers_name_Value,
    auth_author_id,
    auth_time,
    cstn_org_id,
    cstn_org_name,
    recTgt_MRN_Value,
    recTgt_addr_city_Value,
    recTgt_addr_county_Value,
    recTgt_addr_house_Value,
    recTgt_addr_post_Value,
    recTgt_addr_state_Value,
    recTgt_addr_street_Value,
    recTgt_addr_town_Value,
    recTgt_healthCardId_Value,
    recTgt_hrId_Value,
    recTgt_ip_num_Value,
    recTgt_pat_gender_Value,
    recTgt_pat_age_month_Value,
    recTgt_pat_age_Value,
    recTgt_pat_birth_time_Value,
    recTgt_pat_bp_city_Value,
    recTgt_pat_bp_county_Value,
    recTgt_pat_bp_post_Value,
    recTgt_pat_bp_state_Value,
    recTgt_pat_emp_addr_city_Value,
    recTgt_pat_emp_addr_county_Value,
    recTgt_pat_emp_addr_house_Value,
    recTgt_pat_emp_addr_post_Value,
    recTgt_pat_emp_addr_state_Value,
    recTgt_pat_emp_addr_street_Value,
    recTgt_pat_emp_addr_town_Value,
    recTgt_pat_emp_name_Value,
    recTgt_pat_emp_tel_Value,
    recTgt_pat_ethnic_grp_code_Value,
    recTgt_pat_hh_city_Value,
    recTgt_pat_hh_county_Value,
    recTgt_pat_hh_house_Value,
    recTgt_pat_hh_post_Value,
    recTgt_pat_hh_state_Value,
    recTgt_pat_hh_street_Value,
    recTgt_pat_hh_town_Value,
    recTgt_pat_mrtl_stat_code_Value,
    recTgt_pat_ntl_Value,
    recTgt_pat_np_city_Value,
    recTgt_pat_np_state_Value,
    recTgt_pat_occp_code_Value,
    recTgt_pat_id_Value,
    recTgt_pat_name_Value,
    recTgt_prov_org_id_Value,
    recTgt_prov_org_name,
    recTgt_telcom_Value
    ) 
    values(
    :pDocNo /*DocumentNo*/,
    :tDocType/*Activity_code*/,
    'N'/*Activity_confidentialityCode*/,
    '20200928153937'/*Activity_effectiveTime*/,
    'zh-CN'/*Activity_languageCode*/,
    null/*Activity_setId*/,
    null/*Activity_versionNumber*/,
    '1003'/*Author_assignedPerson_id*/,
    '张医生'/*文档作者*/,
    ''/*Author_author_id*/,
    '2020-09-29 00:00:00'/*Author_time*/,
    '1234567890'/*Custodian_organization_id*/,
    '系联总医院'/*Custodian_organization_name*/,
    'MRN123456'/*病案号标识*/,
    '北京'/*RecordTarget_addr_city_Value*/,
    '朝阳区'/*RecordTarget_addr_county_Value*/,
    '2号银泰写字楼C座2701-2702室'/*RecordTarget_addr_houseNumber_Value*/,
    '100022'/*RecordTarget_addr_postalCode_Value*/,
    '北京'/*RecordTarget_addr_state_Value*/,
    '建国门外大街'/*RecordTarget_addr_streetName_Value*/,
    null/*RecordTarget_addr_township_Value*/,
    'HC110220198610010990'/*健康卡号标识*/,
    null/* 健康档案标识*/,
    'IP123456'/* 住院号标识*/,
    '0'/*患者性别*/,
    null/*患者月龄*/,
    '35'/*患者年龄*/,
    '1986-10-01'/*患者生日*/,
    '北京'/*RecordTarget_patient_birthplace_city_Value*/,
    '东城区'/*RecordTarget_patient_birthplace_county_Value*/,
    '100011'/*RecordTarget_patient_birthplace_postalCode_Value*/,
    '北京'/*RecordTarget_patient_birthplace_state_Value*/,
    '北京'/*RecordTarget_employer_addr_city_Value*/,
    '朝阳区'/*RecordTarget_employer_addr_county_Value*/,
    '2号银泰写字楼C座2701-2702室'/*RecordTarget_employer_addr_houseNumber_Value*/,
    '100022'/*RecordTarget_employer_addr_postalCode_Value*/,
    '北京'/*RecordTarget_employer_addr_state_Value*/,
    '建国门外大街'/*RecordTarget_employer_addr_streetName_Value*/,
    ''/*RecordTarget_employer_addr_township_Value*/,
    '系联软件'/*RecordTarget_employer_name_Value*/,
    '85249700'/*RecordTarget_employer_telcom_Value*/,
    '01'/*RecordTarget_patient_ethnicGroupCode_Value*/,
    '北京'/*RecordTarget_patient_household_city_Value*/,
    '朝阳区'/*RecordTarget_patient_household_county_Value*/,
    '2号银泰写字楼C座2701-2702室'/*RecordTarget_patient_household_houseNumber_Value*/,
    '100022'/*RecordTarget_patient_household_postalCode_Value*/,
    '北京'/*RecordTarget_patient_household_state_Value*/,
    '建国门外大街'/*RecordTarget_patient_household_streetName_Value*/,
    null/*RecordTarget_patient_household_township_Value*/,
    '20'/*RecordTarget_patient_maritalStatusCode_Value*/,
    '156'/*RecordTarget_patient_nationality_Value*/,
    '太原市'/*RecordTarget_patient_nativePlace_city_Value*/,
    '山西省'/*RecordTarget_patient_nativePlace_state_Value*/,
    '17'/*RecordTarget_patient_occupationCode_Value*/,
    '110220198610010990'/*RecordTarget_patient_id_Value*/,
    '李四'/*RecordTarget_patient_name_Value*/,
    '1234567890'/*RecordTarget_providerOrganization_id_Value*/,
    '系联总医院'/*RecordTarget_providerOrganization_name*/,
    '85249999'/*RecordTarget_telcom_Value*/
    )
    )
    W "HCC_SQL_Document.Header:",SQLCODE,!
    /// 插入医生签名信息，法定审核者
    &SQL(insert into HCC_SQL_Document_Header.LegalAuthenticator(
    DocumentNo,
    asgnEnty_code,
    asgnEnty_id,
    sig_code,
    asgnPers_name_Value,
    time_Value)
    Values(
    :pDocNo /*DocumentNo*/,
    '1001'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '科主任'/*signature_code*/,
    '王主任'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )
    W "HCC_SQL_Document_Header.LegalAuthenticator:",SQLCODE,!
    /// 插入医生签名信息，法定审核者(可以多条)
    &SQL(insert into HCC_SQL_Document_Header.Authenticator(
    DocumentNo,
    asgnEnty_code,
    asgnEnty_id,
    sig_code,
    asgnPers_name_Value,
    time_Value)
    Values(
    :pDocNo /*DocumentNo*/,
    '1002'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '主任(副主任)医师'/*signature_code*/,
    '郑副主任'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )
    W "HCC_SQL_Document_Header.Authenticator:",SQLCODE,!
    &SQL(insert into HCC_SQL_Document_Header.Authenticator(
    DocumentNo,
    asgnEnty_code,
    asgnEnty_id,
    sig_code,
    asgnPers_name_Value,
    time_Value)
    Values(
    :pDocNo /*DocumentNo*/,
    '1003'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '主治医师'/*signature_code*/,
    '张医生'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )
    W "HCC_SQL_Document_Header.Authenticator:",SQLCODE,!
    &SQL(insert into HCC_SQL_Document_Header.Authenticator(
    DocumentNo,
    asgnEnty_code,
    asgnEnty_id,
    sig_code,
    asgnPers_name_Value,
    time_Value)
    Values(
    :pDocNo /*DocumentNo*/,
    '1004'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '住院医师'/*signature_code*/,
    '周医生'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )
    W "HCC_SQL_Document_Header.Authenticator:",SQLCODE,!
    &SQL(insert into HCC_SQL_Document_Header.Authenticator(
    DocumentNo,
    asgnEnty_code,
    asgnEnty_id,
    sig_code,
    asgnPers_name_Value,
    time_Value)
    Values(
    :pDocNo /*DocumentNo*/,
    '1005'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '责任护士'/*signature_code*/,
    '赵护士'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )
    W "HCC_SQL_Document_Header.Authenticator:",SQLCODE,!
    &SQL(insert into HCC_SQL_Document_Header.Authenticator(
    DocumentNo,
    asgnEnty_code,
    asgnEnty_id,
    sig_code,
    asgnPers_name_Value,
    time_Value)
    Values(
    :pDocNo /*DocumentNo*/,
    '1006'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '进修医师'/*signature_code*/,
    '钱医生'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )
    W "HCC_SQL_Document_Header.Authenticator:",SQLCODE,!
    &SQL(insert into HCC_SQL_Document_Header.Authenticator(
    DocumentNo,
    asgnEnty_code,
    asgnEnty_id,
    sig_code,
    asgnPers_name_Value,
    time_Value)
    Values(
    :pDocNo /*DocumentNo*/,
    '1007'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '实习医师'/*signature_code*/,
    '孙医生'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )
    W "HCC_SQL_Document_Header.Authenticator:",SQLCODE,!
    &SQL(insert into HCC_SQL_Document_Header.Authenticator(
    DocumentNo,
    asgnEnty_code,
    asgnEnty_id,
    sig_code,
    asgnPers_name_Value,
    time_Value)
    Values(
    :pDocNo /*DocumentNo*/,
    '1008'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '编码员'/*signature_code*/,
    '吴编码员'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )
    W "HCC_SQL_Document_Header.Authenticator:",SQLCODE,!
    /// 插入联系人(可以多条)
    &SQL(insert into HCC_SQL_Document_Header.Participant(
    DocumentNo,
    addr_city_Value,
    addr_county_Value,
    addr_house_Value,
    addr_post_Value,
    addr_state_Value,
    addr_street_Value,
    addr_town_Value,
    assocPers_name_Value,
    assocEnty_code_Value,
    telcom_Value
    )
    Values(
    :pDocNo /*DocumentNo*/,
    '北京'/*addr_city_Value*/,
    '朝阳区'/*addr_county_Value*/,
    '2号银泰写字楼C座2701-2702室'/*addr_houseNumber_Value*/,
    '100022'/*addr_postalCode_Value*/,
    '北京'/*addr_state_Value*/,
    '建国门外大街'/*addr_streetName_Value*/,
    null/*addr_township_Value*/,
    '李五'/*asociatedPerson_name_Value*/,
    '3'/*associatedEntity_code_Value*/,
    '1300000000'/*telcom_Value*/)
    )
    W "HCC_SQL_Document_Header.Participant:",SQLCODE,!
    /// 插入关联活动(可以多条)
    &SQL(insert into HCC_SQL_Document_Header.RelatedDocument(
    DocumentNo,
    prntDoc_id,
    prntDoc_setId,
    prntDoc_versionNum)
    Values(
    :pDocNo /*DocumentNo*/,
    'D2011000000'/*parentDocument_id*/,
    null/*parentDocument_setId*/,
    null/*parentDocument_versionNumber*/)
    )
    W "HCC_SQL_Document_Header.RelatedDocument:",SQLCODE,!
    /// 插入就诊场景
    &SQL(insert into HCC_SQL_Document_Header.EncompassingEncounter(
    DocumentNo,
    admission_code_Value,
    discharge_time_Value,
    admit_time_Value)
    Values(
    :pDocNo /*DocumentNo*/,
    '2'/*admission_code_Value*/,
    '2020-09-29 09:30:00'/*discharge_time_Value*/,
    '2020-09-20 10:30:00'/*admit_time_Value*/)
    )
    W "HCC_SQL_Document_Header.EncompassingEncounter:",SQLCODE,!
    /// 插入就诊场景 - 地点 
    &SQL(insert into HCC_SQL_Document_Header_EncompassingEncounter.Location(
    DocumentNo,
    bed_num_Value,
    ward_id,
    ward_name_Value,
    area_id,
    area_name_Value,
    dept_id,
    dept_name_Value)
    Values(
    :pDocNo /*DocumentNo*/,
    '8床'/*病床号*/,
    '203'/*病房标识*/,
    '3病房'/*病房号*/,
    null/*病区标识*/,
    '神经外科1病区'/*病区号*/,
    '2'/*科室标识*/,
    '神经外科'/*科室名称*/)
    )
    W "HCC_SQL_Document_Header_EncompassingEncounter.Location:",SQLCODE,!
}

/// 测试SQL生成卫生事件章节
ClassMethod TestHealthcareEventGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC
        ///卫生事件章节
    &SQL(Insert into HCC_SQL_Document.HealthcareEvent(
    DocumentNo,
    adm_rsn_Value,
    death_rsn_Value,
    dept_name_Value,
    doc_name_Value,
    enc_time_Value,
    fee_ip_Value,
    fee_insur_type_Value,
    fee_op_Value,
    fee_pat_pay_Value,
    fee_pay_type_Value,
    ip_num_Value,
    oth_diag_Value,
    oth_treat_Value,
    op_num_Value,
    pat_type_Value,
    sick_time_Value,
    time_adm_Value,
    time_dchg_Value)
    values(
    :pDocNo,
    '就诊原因描述'/*adm_rsn_Value*/,
    'G91' /*death_rsn_Value*/,
    '科室名称'/*dept_name_Value*/,
    '张三医生'/*doc_name_Value*/,
    '2021-07-30 10:30:00'/*enc_time_Value*/,
    '2860'/*fee_ip_Value*/,
    '1'/*fee_insur_type_Value*/,
    '159'/*fee_op_Value*/,
    '1030'/*fee_pat_pay_Value*/,
    '01'/*fee_pay_type_Value*/,
    'ip123456'/*ip_num_Value*/,
    'G91'/*oth_diag_Value*/,
    '其他医学处置'/*oth_treat_Value*/,
    'op123456'/*op_num_Value*/,
    '1'/*pat_type_Value*/,
    '2021-07-29 10:30:00'/*sick_time_Value*/,
    '2021-07-30 10:30:00'/*time_adm_Value*/,
    '2021-08-02 16:30:00'/*time_dchg_Value*/)
    )
    W "HCC_SQL_Document.HealthcareEvent:",SQLCODE,!
    
    ///卫生事件章节 - 西医诊断编码条目子表(可以多条)
    &SQL(Insert into HCC_SQL_Document_HealthcareEvent.Diagnosis(
    DocumentNo,
    diag_Value,
    result_Value)
    values(
    :pDocNo,
    'G91'/*diag_Value*/,
    1/*result_Value*/)
    )
    W "HCC_SQL_Document_HealthcareEvent.Diagnosis:",SQLCODE,!
    
    ///卫生事件章节 - 中医诊断条目子表(可以多条)
    &SQL(Insert into HCC_SQL_Document_HealthcareEvent.TCMDiagnosis(
    DocumentNo,
    name_Value,
    result_Value,
    symptom_Value)
    values(
    :pDocNo,
    'BYH020'/*name_Value*/,
    1/*result_Value*/,
    'ZZFG10'/*symptom_Value*/)
    )
    W "HCC_SQL_Document_HealthcareEvent.TCMDiagnosis:",SQLCODE,!
    
    ///卫生事件章节 - 手术及操作条目子表(可以多条)
    &SQL(Insert into HCC_SQL_Document_HealthcareEvent.Operation(
    DocumentNo,
    name_Value)
    values(
    :pDocNo,
    '51.69012'/*name_Value*/)
    )
    W "HCC_SQL_Document_HealthcareEvent.Operation:",SQLCODE,!
    
    ///卫生事件章节 - 关键药物条目子表(可以多条)
    &SQL(Insert into HCC_SQL_Document_HealthcareEvent.KeyMedicine(
    DocumentNo,
    TCM_type_Value,
    adv_react_Value,
    name_Value,
    usage_Value
    )
    values(
    :pDocNo,
    '1'/*TCM_type_Value*/,
    '0'/*adv_react_Value*/,
    '关键药物名称'/*name_Value*/,
    '关键药物用法'/*usage_Value*/)
    )
    W "HCC_SQL_Document_HealthcareEvent.KeyMedicine:",SQLCODE,!
}

/// 测试SQL生成家族史章节
ClassMethod TestFamilyHistoryGenerate(pDocNo = "Doc123456")
{
    ///家族史章节条目(可以多条)
    &SQL(Insert into HCC_SQL_Document.FamilyHistory(
    DocumentNo,
    code_Value)
    values(
    :pDocNo,
    '家族史描述')
    )
    W "HCC_SQL_Document.FamilyHistory:",SQLCODE,!
}

/// 测试SQL生成月经史章节
ClassMethod TestMenstrualHistoryGenerate(pDocNo = "Doc123456")
{
   ///月经史章节
    &SQL(Insert into HCC_SQL_Document.MenstrualHistory(
    DocumentNo,
    menstrual_Value)
    values(
    :pDocNo,
    '对患者月经史的详细描述')
    )
    W "HCC_SQL_Document.MenstrualHistory:",SQLCODE,!
}

/// 测试SQL生成个人史章节
ClassMethod TestSocialHistoryGenerate(pDocNo = "Doc123456")
{

    ///个人史章节条目(可以多条)
    &SQL(Insert into HCC_SQL_Document.SocialHistory(
    DocumentNo,
    code_Value)
    values(
    :pDocNo,
    '患者个人生活习惯及有无烟、酒、药物等嗜好，职业与工作条件及有无工业毒物、粉尘、放射性物质接触史，有无冶游史的描述')
    )
}

/// 测试SQL生成预防接种史章节
ClassMethod TestVaccinationGenerate(pDocNo = "Doc123456")
{
    /// 预防接种史章节条目(可以多条)
    &SQL(Insert into HCC_SQL_Document.Vaccination(
    DocumentNo,
    name_Value)
    values(
    :pDocNo,
    '预防接种史描述')
    )
    W "HCC_SQL_Document.Vaccination:",SQLCODE,!
}

/// 测试SQL生成过敏史章节
ClassMethod TestAllergyGenerate(pDocNo = "Doc123456")
{
    /// 插入过敏史章节
    /// 如果无过敏史，active_Value设置为0
    &SQL(Insert into HCC_SQL_Document.Allergy(
    DocumentNo,
    active_Value)
    values(
    :pDocNo,
    1)
    )
    W "HCC_SQL_Document.Allergy:",SQLCODE,!
    /// 插入过敏史条目 (可以多条)
    &SQL(Insert into HCC_SQL_Document_Allergy.Item(
    DocumentNo,
    eff_time,
    allergen_Value)
    values(
    :pDocNo,
    null,
    '鸡蛋')
    )
    W "HCC_SQL_Document_Allergy.Item:",SQLCODE,!
    /// 插入过敏史条目 (可以多条)
    &SQL(Insert into HCC_SQL_Document_Allergy.Item(
    DocumentNo,
    eff_time,
    allergen_Value)
    values(
    :pDocNo,
    null,
    '花生')
    )
    W "HCC_SQL_Document_Allergy.Item:",SQLCODE,!
}

/// 测试SQL生成诊断记录章节（需要修改！）
ClassMethod TestDiagnosisGenerate(pDocNo = "Doc123456")
{
    /// 插入诊断记录章节
    &SQL(Insert into HCC_SQL_Document.Diagnosis(
    DocumentNo)
    values(:pDocNo)
    )
    W "HCC_SQL_Document.Diagnosis:",SQLCODE,!
    /// 诊断记录章节- 门急诊(可以多条)
    &SQL(Insert into HCC_SQL_Document_Diagnosis.Diagnosis(
    DocumentNo,
    diag_code_Value,
    diag_date_Value,
    diag_org_Value,
    diag_name_Value,
    diag_orders_Value)
    values(
    :pDocNo,
    null,
    null,
    null,
    '脑积水',
    null)
    )
    W "HCC_SQL_Document_Diagnosis.Diagnosis:",SQLCODE,!
    /// 诊断记录章节- 门急诊(可以多条)
    &SQL(Insert into HCC_SQL_Document_Diagnosis.Diagnosis(
    DocumentNo,
    diag_code_Value,
    diag_date_Value,
    diag_org_Value,
    diag_name_Value,
    diag_orders_Value)
    values(
    :pDocNo,
    'G91',
    null,
    null,
    null,
    null)
    )
    W "HCC_SQL_Document_Diagnosis.Diagnosis:",SQLCODE,!
    /// 诊断记录章节- 病理(可以多条)
    &SQL(Insert into HCC_SQL_Document_Diagnosis.Pathology(
    DocumentNo,
    pathology_no_Value,
    diag_code_Value,
    diag_date_Value,
    diag_org_Value,
    diag_name_Value,
    diag_orders_Value)
    values(
    :pDocNo,
    'P123456',
    'B95',
    null,
    null,
    null,
    null)
    )
    W "HCC_SQL_Document_Diagnosis.Pathology:",SQLCODE,!
}

/// 测试SQL生成既往史章节
/// pMode为6位2进制数，
/// 第一位代表疾病史条目子表，需要疾病史条目则置1，否则置0
/// 第二位代表传染病史条目子表，需要传染病史条目则置1，否则置0
/// 第三位代表手术史条目子表，需要手术史条目则置1，否则置0
/// 第四位代表孕产史条目子表，需要孕产史条目则置1，否则置0
/// 第五位代表既往史条目子表，需要既往史条目则置1，否则置0
/// 第六位代表输血史条目子表，需要输血史条目则置1，否则置0
ClassMethod TestPastHistoryGenerate(pDocNo = "Doc123456", pMode = "111100")
{
    /// 插入既往史章节
    &SQL(Insert into HCC_SQL_Document.PastHistory(
    DocumentNo)
     values(
    :pDocNo)
    )
    if $E(pMode,1,1)="1"
    {
        /// 插入既往史章节 - 疾病史条目子表(可以多条)
        &SQL(Insert into HCC_SQL_Document_PastHistory.Illness(
        DocumentNo,name_Value)
         values(
        :pDocNo,
        '疾病史（含外伤）描述')
        )
    }
    if $E(pMode,2,2)="1"
    {
        /// 插入既往史章节 - 传染病史条目子表(可以多条)
        &SQL(Insert into HCC_SQL_Document_PastHistory.Infection(
        DocumentNo,name_Value)
         values(
        :pDocNo,
        '传染病史描述')
        )
    }
    if $E(pMode,3,3)="1"
    {
        /// 插入既往史章节 - 手术史条目子表(可以多条)
        &SQL(Insert into HCC_SQL_Document_PastHistory.Surgery(
        DocumentNo,name_Value)
         values(
        :pDocNo,
        '手术史描述')
        )
    }
    if $E(pMode,4,4)="1"
    {
        /// 插入既往史章节 - 孕产史条目子表(可以多条)
        &SQL(Insert into HCC_SQL_Document_PastHistory.Obstetric(
        DocumentNo,name_Value)
         values(
        :pDocNo,
        '孕产史描述')
        )
        W "HCC_SQL_Document_PastHistory.Obstetric:",SQLCODE,!
    }
    if $E(pMode,5,5)="1"
    {
        /// 插入既往史章节 - 既往史条目子表(可以多条)
        &SQL(Insert into HCC_SQL_Document_PastHistory.Health(
        DocumentNo,
        name_Value)
         values(
        :pDocNo,
        '对患者既往健康状况和疾病的详细描述')
        )
        W "HCC_SQL_Document_PastHistory.Health:",SQLCODE,!
    }
    if $E(pMode,6,6)="1"
    {
        /// 插入既往史章节 - 输血史条目子表(可以多条)
        &SQL(Insert into HCC_SQL_Document_PastHistory.Transfusion(
        DocumentNo,name_Value)
         values(
        :pDocNo,
        '输血史描述')
        )
        W "HCC_SQL_Document_PastHistory.Transfusion:",SQLCODE,!
    }
}

/// 测试SQL生成输血章节
ClassMethod TestBloodTransfusionGenerate(pDocNo = "Doc123456")
{
    ///插入输血章节
    &SQL(Insert into HCC_SQL_Document.BloodTransfusion(
    DocumentNo,
    history_Value)
     values(
    :pDocNo,
    '输血史描述')
    )
    W "HCC_SQL_Document.BloodTransfusion:",SQLCODE,!
}

/// 测试SQL生成实验室检查章节
/// pMode为4位2进制数
/// 第一位代表检验条目子表，需要检验条目则置1，否则置0
/// 第二位代表辅助检查条目子表，需要辅助检查条目则置1，否则置0
/// 第三位代表阳性辅助检查结果条目子表，需要阳性辅助检查结果条目则置1，否则置0
/// 第四位代表《麻醉术前访视记录》，生成《麻醉术前访视记录》的实验室检查章节时置1，否则置0
ClassMethod TestLabTestGenerate(pDocNo = "Doc123456", pMode = "0000")
{
    /// 插入实验室检查章节
    if $E(pMode,4,4)=1
    {
        &SQL(Insert into HCC_SQL_Document.LabTest(
        DocumentNo,
        blood_ABO_Value,
        blood_Rh_Value,
        anes_visit_ABG_Value,
        anes_visit_CBC_Value,
        anes_visit_CT_Value,
        anes_visit_EKG_Value,
        anes_visit_MRI_Value,
        anes_visit_XRay_Value,
        anes_visit_coagulation_Value,
        anes_visit_liver_Value,
        anes_visit_lungFunc_Value,
        anes_visit_ultrasonic_Value,
        anes_visit_urine_Value)
        values(
        :pDocNo,
        '1',
        '2',
        '麻醉术前访视时，对患者血气分析检查结果的详细描述',
        '麻醉术前访视时，对患者血常规检查结果的详细描述',
        'CT检查结果的详细描述',
        '对患者心电图检查结果的详细描述',
        'MRI检查结果的详细描述',
        '对患者胸部X线检查结果的详细描述',
        '麻醉术前访视时，对患者凝血功能检查结果的详细描述',
        '对患者肝功能检查结果的详细描述',
        '患者肺功能检查结果的详细描述',
        'B超检查结果的详细描述',
        '麻醉术前访视时，对患者尿常规检查结果的详细描述'     
        )
        )
    }
    else
    {
        &SQL(Insert into HCC_SQL_Document.LabTest(
        DocumentNo,
        blood_ABO_Value,
        blood_Rh_Value)
        values(
        :pDocNo,
        '1',
        '2')
        )
    }

    W "HCC_SQL_Document.LabTest:",SQLCODE,!
    If $E(pMode,1,1)=1
    {
        /// 插入实验室检验条目(多条)
        &SQL(Insert into HCC_SQL_Document_LabTest.Item(
        DocumentNo,
        code_Value/*检验项目代码*/,
        name_Value/*检验项目名称*/,
        result_Value/*检验结果*/,
        result_code_Value/*检验结果代码*/,
        result_qty_unit_Value/*检查/检验计量单位*/,
        result_qty_value_Value/*检验定量结果*/,
        specimen_collect_time_Value/*标本采样日期时间*/,
        specimen_receive_time_Value/*接收标本日期时间*/,
        specimen_stat_Value/*标本状态*/,
        specimen_type_Value/*标本类别*/)
        values(
        :pDocNo,
        'RBCC'/*检验项目代码*/,
        '红细胞计数'/*检验项目名称*/,
        null/*检验结果*/,
        'N'/*检验结果代码*/,
        '10x12/L'/*检查/检验计量单位*/,
        '3.99'/*检验定量结果*/,
        '2021-07-01 12:10:00'/*标本采样日期时间*/,
        '2021-07-01 12:12:00'/*接收标本日期时间*/,
        '有效'/*标本状态*/,
        '血液'/*标本类别*/)
        )
        ///白细胞:计数型浓度:时间点:脑脊液:定量型:手工计数方法
        &SQL(Insert into HCC_SQL_Document_LabTest.Item(
        DocumentNo,
        code_Value/*检验项目代码*/,
        name_Value/*检验项目名称*/,
        result_Value/*检验结果*/,
        result_code_Value/*检验结果代码*/,
        result_qty_unit_Value/*检查/检验计量单位*/,
        result_qty_value_Value/*检验定量结果*/,
        specimen_collect_time_Value/*标本采样日期时间*/,
        specimen_receive_time_Value/*接收标本日期时间*/,
        specimen_stat_Value/*标本状态*/,
        specimen_type_Value/*标本类别*/)
        values(
        :pDocNo,
        'WBCC'/*检验项目代码*/,
        '白细胞计数'/*检验项目名称*/,
        null/*检验结果*/,
        'N'/*检验结果代码*/,
        '10(9)/L'/*检查/检验计量单位*/,
        '5.1'/*检验定量结果*/,
        '2021-07-01 12:10:00'/*标本采样日期时间*/,
        '2021-07-01 12:12:00'/*接收标本日期时间*/,
        '有效'/*标本状态*/,
        '脑脊液'/*标本类别*/)
        )

        W "HCC_SQL_Document_LabTest.Item:",SQLCODE,!
    }
    If $E(pMode,2,2)=1
    {
        &SQL(Insert into HCC_SQL_Document_LabTest.AuxExam(
        DocumentNo,
        name_Value,
        result_Value)
        values(
        :pDocNo,
        '辅助检查项目',
        '辅助检查结果')
        )
        W "HCC_SQL_Document_LabTest.AuxExam:",SQLCODE,!
    }
    If $E(pMode,3,3)=1
    {
        &SQL(Insert into HCC_SQL_Document_LabTest.AuxExamResult(
        DocumentNo,
        result_Value)
        values(
        :pDocNo,
        '阳性辅助检查结果')
        )
        W "HCC_SQL_Document_LabTest.AuxExamResult:",SQLCODE,!
    }
}

/// 测试SQL生成手术操作章节
ClassMethod TestProcedureGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入手术操作章节
    &SQL(Insert into HCC_SQL_Document."Procedure"(
    DocumentNo)
    values(
    :pDocNo)
    )
    W "HCC_SQL_Document.Procedure:",SQLCODE,!
    /// 插入手术操作条目(可以多条)
    &SQL(Insert into HCC_SQL_Document.ProcedureItem(
    DocumentNo,
    anesth_doc_Value,
    anesth_mthd_Value,
    code_Value,
    cut_lvl_Value,
    healing_lvl_Value,
    name_Value,
    prim_asst_Value,
    procd_class_Value,
    procd_doc_Value,
    procd_time_Value,
    sec_asst_Value
    )
    values(
    :pDocNo,
    '周七'/*anesthesia_doctor_Value*/,
    '1'/*anesthesia_method_Value*/,
    '84.51004'/*procedure_Value*/,
    '1'/*cut_level_Value*/,
    null/*healing_level_Value*/,
    '金属脊椎融合物置入术'/*procedure_name_Value*/,
    '王五'/*primary_assistant_Value*/,
    '1'/*procedure_class_Value*/,
    '张三'/*procedure_doctor_Value*/,
    '2020-09-21 09:30:00'/*procedure_time_Value*/,
    '赵六'/*second_assistant_Value*/
    )
    )
    W "HCC_SQL_Document.ProcedureItem:",SQLCODE,!
}

/// 测试SQL生成行政管理章节
ClassMethod TestAdministrationGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入行政管理章节
    &SQL(Insert into HCC_SQL_Document.Administration(
    DocumentNo,
    MR_quality_level,
    MR_quality_Value,
    QC_date_Value,
    QC_doctor_Value,
    QC_nurse_Value,
    autospy_Value)
    values(
    :pDocNo,
    '一级',
    '1',
    '2020-09-22',
    '李主任',
    '吴护士',
    '0')
    )
    W "HCC_SQL_Document.Administration:",SQLCODE,!
}

/// 测试SQL生成转科记录章节
ClassMethod TestReferralGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 

    /// 插入转科记录章节
    &SQL(Insert into HCC_SQL_Document.Referral(
    DocumentNo,
    referral_rsn_Value,
    referral_source_Value,
    referral_target_Value,
    referral_type_Value)
    values(
    :pDocNo,
    null,
    null,
    '神经外科',
    null)
    )
    W "HCC_SQL_Document.Referral:",SQLCODE,!
}

/// 测试SQL生成主要健康问题章节
ClassMethod TestHealthProblemGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 

    /// 插入主要健康问题章节
    &SQL(Insert into HCC_SQL_Document.HealthProblem(
    DocumentNo,
    CAA_days_Value,
    CAA_hours_Value,
    CAA_minutes_Value,
    CBA_days_Value,
    CBA_hours_Value,
    CBA_minutes_Value,
    damage_diag_Value,
    damage_rsn_Value,
    sick_cond_Value)
    values(
    :pDocNo,
    '2',
    '3',
    '32',
    '5',
    '6',
    '21',
    'B95',
    '无',
    '2')
    )
    W "HCC_SQL_Document.HealthProblem:",SQLCODE,!
}

/// 测试SQL生成出院诊断章节
ClassMethod TestHospitalDischargeDXGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入出院诊断章节
    &SQL(Insert into HCC_SQL_Document.HospitalDischargeDX(
    DocumentNo,
    dchg_disp_Value,
    recv_org_Value)
    values(
    :pDocNo,
    '1',
    '系联社区医院')
    )
    W "HCC_SQL_Document.HospitalDischargeDX:",SQLCODE,!
    
    /// 插入出院诊断章节 - 主要诊断(可以多条)
    &SQL(Insert into HCC_SQL_Document_HospitalDischargeDX."Primary"(
    DocumentNo,
    diag_code_Value,
    diag_date_Value,
    diag_org_Value,
    diag_name_Value,
    diag_orders_Value,
    sick_cond_Value)
    values(
    :pDocNo,
    'G91',
    '2020-09-20 10:00:00',
    null,
    null,
    null,
    '3')
    )
    W "HCC_SQL_Document_HospitalDischargeDX.Primary:",SQLCODE,!
    &SQL(Insert into HCC_SQL_Document_HospitalDischargeDX."Primary"(
    DocumentNo,
    diag_code_Value,
    diag_date_Value,
    diag_org_Value,
    diag_name_Value,
    diag_orders_Value,
    sick_cond_Value)
    values(
    :pDocNo,
    null,
    '2020-09-20 10:00:00',
    null,
    '脑积液',
    null,
    '3')
    )
    W "HCC_SQL_Document_HospitalDischargeDX.Primary:",SQLCODE,!
    /// 插入出院诊断章节 - 其它诊断 (可以多条)
    &SQL(Insert into HCC_SQL_Document_HospitalDischargeDX.Other(
    DocumentNo,
    diag_code_Value,
    diag_date_Value,
    diag_org_Value,
    diag_name_Value,
    diag_orders_Value,
    sick_cond_Value
    )
    values(
    :pDocNo,
    'B95',
    '2020-09-20 10:00:00',
    null,
    null,
    null,
    '3')
    )
    W "HCC_SQL_Document_HospitalDischargeDX.Other:",SQLCODE,!
    &SQL(Insert into HCC_SQL_Document_HospitalDischargeDX.Other(
    DocumentNo,
    diag_code_Value,
    diag_date_Value,
    diag_org_Value,
    diag_name_Value,
    diag_orders_Value,
    sick_cond_Value
    )
    values(
    :pDocNo,
    null,
    '2020-09-20 10:00:00',
    null,
    'B族链球菌感染',
    null,
    '3')
    )
    W "HCC_SQL_Document_HospitalDischargeDX.Other:",SQLCODE,!
}

/// 测试SQL生成住院史章节
ClassMethod TestHospitalizationGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入住院史章节
    &SQL(Insert into HCC_SQL_Document.Hospitalization(
    DocumentNo,
    hospt_count_Value)
    values(
    :pDocNo,
    '1')
    )
    W "HCC_SQL_Document.Hospitalization:",SQLCODE,!
}

/// 测试SQL生成住院过程章节
ClassMethod TestHospitalCourseGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入住院过程章节
    &SQL(Insert into HCC_SQL_Document.HospitalCourse(
    DocumentNo,
    dchg_dept_Value,
    dchg_ward_Value,
    staydays_Value)
    values(
    :pDocNo,
    '神经外科',
    '四病房',
    '10')
    )
    W "HCC_SQL_Document.HospitalCourse:",SQLCODE,!
}

/// 测试SQL生成费用章节
ClassMethod TestPaymentGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
   /// 插入费用章节
    &SQL(Insert into HCC_SQL_Document.Payment(
    DocumentNo,
    tcm_herb_Value,
    tcm_patent_Value,
    TCM_treat_Value,
    blood_albumin_Value,
    blood_blood_Value,
    blood_cellfactor_Value,
    blood_clotfactor_Value,
    blood_globulin_Value,
    cons_exam_Value,
    cons_surg_Value,
    cons_treat_Value,
    diag_diag_Value,
    diag_image_Value,
    diag_lab_Value,
    diag_pathology_Value,
    gen_nurse_Value,
    gen_other_Value,
    gen_serv_Value,
    gen_treat_Value,
    med_antibac_Value,
    med_med_Value,
    other_Value,
    payment_way_Value,
    rehab_Value,
    total_pp_amount_Value,
    total_total_Value,
    treat_surg_detail_anes_Value,
    treat_surg_detail_surg_Value,
    treat_surg_surg_Value,
    treat_nonsurg_nonsurg_Value,
    treat_nonsurg_phy_amount_Value)
    values(
    :pDocNo,
    '1003'  /*  TCM_herb_Value  */,
    '1004'  /*  TCM_patent_Value    */,
    '1005'  /*  TCM_treatment_Value */,
    '1006'  /*  albumin_Value   */,
    '1000'  /*  blood_Value */,
    '1007'  /*  cellfactor_Value    */,
    '1008'  /*  clotfactor_Value    */,
    '1020'  /*  globulin_Value  */,
    '1009'  /*  consumable_exam_Value   */,
    '1010'  /*  consumable_surgery_Value    */,
    '1011'  /*  consumable_treamtment_Value */,
    '1012'  /*  diag_diagnosis_Value    */,
    '1013'  /*  diag_image_Value    */,
    '1014'  /*  diag_lab_Value  */,
    '1015'  /*  diag_pathology_Value    */,
    '1016'  /*  general_nurse_Value */,
    '1017'  /*  general_other_Value */,
    '1018'  /*  general_service_Value   */,
    '1019'  /*  general_treatment_Value */,
    '1002'  /*  antibacterial_Value */,
    '1001'  /*  medicine_Value  */,
    '1021'  /*  other_Value */,
    '99'    /*  payment_way_Value   */,
    '1023'  /*  rehabilitation_Value    */,
    '1022'  /*  patient_pay_Value   */,
    '1024'  /*  total_Value */,
    '1025'  /*  treatment_anesthesia_Value  */,
    '1029'  /*  treatment_surgery_operation_Value   */,
    '1028'  /*  treatment_surgery_Value */,
    '1026'  /*  treatment_nonSurgery_Value  */,
    '1027'  /*  treatment_physical_Value    */)
     )
     W "HCC_SQL_Document.Payment:",SQLCODE,!
}

/// 测试SQL生成治疗计划章节
ClassMethod TestTreatmentPlanGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入治疗计划章节
    &SQL(Insert into HCC_SQL_Document.TreatmentPlan(
    DocumentNo,
    rdm_Value,
    rdm_rsn_Value)
    values(
    :pDocNo,
    '1',
    '回院复查')
    )
    W "HCC_SQL_Document.TreatmentPlan:",SQLCODE,!
}

/// 测试SQL生成主诉章节
ClassMethod TestChiefComplaintGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入主诉章节
    &SQL(Insert into HCC_SQL_Document.ChiefComplaint(
    DocumentNo,
    cc_Value)
    Values(
    :pDocNo,
    '对患者本次疾病相关的主要症状及其持续时间的描述，一般由患者本人或监护人描述')
    )
    W "HCC_SQL_Document.ChiefComplaint:",SQLCODE,!
}

/// 测试SQL生成现病史章节
ClassMethod TestPresentIllnessHistoryGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入现病史章节
    &SQL(Insert into HCC_SQL_Document.PresentIllnessHistory(
    DocumentNo,
    brief_ill_Value,
    present_ill_Value)
    Values(
    :pDocNo,
    null,
    '对患者当前所患疾病情况的详细描述')
    )
    W "HCC_SQL_Document.PresentIllnessHistory:",SQLCODE,!
}

/// 测试SQL生成术后去向章节
ClassMethod TestProcedureDispositionGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入现病史章节
    &SQL(Insert into HCC_SQL_Document.ProcedureDisposition(
    DocumentNo,
    disposition_Value,
    leave_time_Value)
    Values(
    :pDocNo,
    '患者当前诊疗过程结束后的去向在特定编码体系中的代码，这里指手术结束后的去向',
    '2021-07-21 09:30:00')
    )
    W "HCC_SQL_Document.ProcedureDisposition:",SQLCODE,!
}

/// 测试SQL生成一般状况检查章节
ClassMethod TestGeneralStatusGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入一般状况检查章节
    &SQL(Insert into HCC_SQL_Document.GeneralStatus(
    DocumentNo,
    result_Value)
    Values(
    :pDocNo,
    '对患者一般状况检查结果的详细描述，包括其发育状况、营养状况、体味、步态、面容与表情、意识，检查能否合作等等')
    )
    W "HCC_SQL_Document.GeneralStatus:",SQLCODE,!
}

/// 测试SQL生成产前检查章节
ClassMethod TestPrenatalEventGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入产前检查章节
    &SQL(Insert into HCC_SQL_Document.PrenatalEvent(
    DocumentNo,
    abdominal_circum_Value,
    amniotic_fluid_Value,
    bladder_filling_Value,
    cephalic_dystocia_Value,
    cervical_thk_Value,
    fetal_heart_rate_Value,
    fetal_membrane_Value,
    fetal_membrane_breaking_Value,
    fetal_ori_Value,
    first_exposed_pos_Value,
    flatulence_Value,
    inspection_method_Value,
    ischial_tubercle_diam_Value,
    outlet_transverse_diam_Value,
    sacral_external_diam_Value,
    uterine_ctr_Value,
    uterine_orifice_Value,
    uterus_fundus_hgt_Value)
    Values(
    :pDocNo,
    '60'/*abdominal_circum_Value*/,
    '羊水情况'/*amniotic_fluid_Value*/,
    '0'/*bladder_filling_Value*/,
    '头位难产情况的评估'/*cephalic_dystocia_Value*/,
    '20'/*cervical_thk_Value*/,
    '59'/*fetal_heart_rate_Value*/,
    '1'/*fetal_membrane_Value*/,
    '1'/*fetal_membrane_breaking_Value*/,
    '01'/*fetal_ori_Value*/,
    '先露位置'/*first_exposed_pos_Value*/,
    '0'/*flatulence_Value*/,
    '1'/*inspection_method_Value*/,
    '55'/*ischial_tubercle_diam_Value*/,
    '40'/*outlet_transverse_diam_Value*/,
    '50'/*sacral_external_diam_Value*/,
    '宫缩情况'/*uterine_ctr_Value*/,
    '宫口情况'/*uterine_orifice_Value*/,
    '61'/*uterus_fundus_hgt_Value*/)
    )
    W "HCC_SQL_Document.PrenatalEvent:",SQLCODE,!
}

/// 测试SQL生成体格检查章节
ClassMethod TestPhysicalExamGenerate(pDocNo = "Doc123456", pMode = "100001")
{
    #SQLCompile Select=ODBC 
    if $E(pMode,1,1)=1
    {
        /// 插入体格检查章节条目 - 一般状况检查
        &SQL(Insert into HCC_SQL_Document.PhysicalExam(
        DocumentNo,
        type,
        value)
        Values(
        :pDocNo,
        'DE04.10.258.00',
        '体格检查结果等等')
        )
    }
    W "HCC_SQL_Document.PhysicalExam:",SQLCODE,!
}

/// 测试SQL生成阴道分娩章节
ClassMethod TestVaginalDeliveryGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入阴道分娩章节
    &SQL(Insert into HCC_SQL_Document.VaginalDelivery(
    DocumentNo,
    Postpartum_med_Value/*产后用药*/,
    amniotic_fluid_Value/*羊水性状*/,
    amniotic_fluid_vol_Value/*羊水量（mL）*/,
    anesth_Value/*麻醉药物名称*/,
    anesth_method_Value/*麻醉方法代码*/,
    around_neck_Value/*绕颈身（周）*/,
    cervical_laceration_Value/*宫颈裂伤标志*/,
    cervical_suture_Value/*宫颈缝合情况*/,
    cord_blood_pres_Value/*存脐带血情况标志*/,
    delvr_proc_sum_Value/*分娩过程摘要*/,
    due_date_Value/*预产期*/,
    fetal_delvr_time_Value/*胎儿娩出日期时间*/,
    fetal_membrane_intg_Value/*胎膜完整情况标志*/,
    fetal_membrane_rupture_Value/*胎膜破裂日期时间*/,
    fetal_ori_Value/*胎方位代码*/,
    fst_stage_drtn_Value/*第1产程时长（min）*/,
    full_opening_time_Value/*宫口开全日期时间*/,
    intrapartum_med_Value/*产时用药*/,
    labor_time_Value/*临产日期时间*/,
    lochia_cond_Value/*恶露状况*/,
    midwifery_Value/*胎儿娩出助产标志*/,
    midwifery_mode_Value/*助产方式*/,
    perineal_cond_Value/*会阴情况*/,
    perineal_hematoma_Value/*会阴血肿标志*/,
    perineal_hematoma_size_Value/*会阴血肿大小*/,
    perineal_hematoma_treat_Value/*会阴血肿处理*/,
    perineal_incision_Value/*产妇会阴切开标志*/,
    perineal_incision_pos_Value/*会阴切开位置*/,
    perineal_laceration_deg_Value/*产妇会阴裂伤程度代码*/,
    perineal_suture_num_Value/*产妇会阴缝合针数*/,
    placenta_delvr_time_Value/*胎盘娩出日期时间*/,
    placental_delvr_Value/*胎盘娩出情况*/,
    pr_amniotic_fluid_traits_Value/*前羊水性状*/,
    pr_amniotic_fluid_vol_Value/*前羊水量（mL）*/,
    prvnt_measure_Value/*预防措施*/,
    repair_procd_Value/*修补手术过程*/,
    sec_stage_drtn_Value/*第2产程时长（min）*/,
    thrd_stage_drtn_Value/*第3产程时长（min）*/,
    tot_labor_drtn_Value/*总产程时长（min）*/,
    umbilical_cord_abn_Value/*脐带异常情况标志*/,
    umbilical_cord_len_Value/*脐带长度（cm）*/,
    uterine_cond_Value/*子宫情况*/,
    uterine_contraction_time_Value/*宫缩开始日期时间*/,
    uterine_ctr_Value/*宫缩情况*/,
    vaginal_hematoma_Value/*阴道血肿标志*/,
    vaginal_laceration_Value/*阴道裂伤标志*/)
    Values(
    :pDocNo,
    '产后用药'/*产后用药*/,
    '羊水性状'/*羊水性状*/,
    '30'/*羊水量（mL）*/,
    '麻醉药物名称'/*麻醉药物名称*/,
    '01'/*麻醉方法代码*/,
    '31'/*绕颈身（周）*/,
    '0'/*宫颈裂伤标志*/,
    '3'/*宫颈缝合情况*/,
    '1'/*存脐带血情况标志*/,
    '分娩过程摘要'/*分娩过程摘要*/,
    '2021-06-01'/*预产期*/,
    '2021-06-01 11:40:00'/*胎儿娩出日期时间*/,
    '1'/*胎膜完整情况标志*/,
    '2021-06-01 11:30:00'/*胎膜破裂日期时间*/,
    '01'/*胎方位代码*/,
    '21'/*第1产程时长（min）*/,
    '2021-06-01 11:20:00'/*宫口开全日期时间*/,
    '产时用药'/*产时用药*/,
    '2021-06-01'/*临产日期时间*/,
    '恶露状况'/*恶露状况*/,
    '0'/*胎儿娩出助产标志*/,
    '助产方式'/*助产方式*/,
    '会阴情况'/*会阴情况*/,
    '0'/*会阴血肿标志*/,
    '5'/*会阴血肿大小*/,
    '会阴血肿处理'/*会阴血肿处理*/,
    '0'/*产妇会阴切开标志*/,
    '会阴切开位置'/*会阴切开位置*/,
    '01'/*产妇会阴裂伤程度代码*/,
    '3'/*产妇会阴缝合针数*/,
    '2021-06-01 11:45:00'/*胎盘娩出日期时间*/,
    '胎盘娩出情况'/*胎盘娩出情况*/,
    '前羊水性状'/*前羊水性状*/,
    '20'/*前羊水量（mL）*/,
    '预防措施'/*预防措施*/,
    '修补手术过程'/*修补手术过程*/,
    '22'/*第2产程时长（min）*/,
    '23'/*第3产程时长（min）*/,
    '66'/*总产程时长（min）*/,
    '0'/*脐带异常情况标志*/,
    '30'/*脐带长度（cm）*/,
    '子宫情况'/*子宫情况*/,
    '2021-06-01 06:30:00'/*宫缩开始日期时间*/,
    '宫缩情况'/*宫缩情况*/,
    '0'/*阴道血肿标志*/,
    '0'/*阴道裂伤标志*/)
    )
    W "HCC_SQL_Document.VaginalDelivery:",SQLCODE,!
}

/// 测试SQL生成四肢章节
ClassMethod TestExtremitiesGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入四肢章节
    &SQL(Insert into HCC_SQL_Document.Extremities(
    DocumentNo,
    adpp_Value)
    Values(
    :pDocNo,
    '1')
    )
    W "HCC_SQL_Document.Extremities:",SQLCODE,!
}

/// 测试SQL生成手术评估标志章节
ClassMethod TestProcedureAssessmentGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入手术评估标志章节
    &SQL(Insert into HCC_SQL_Document.ProcedureAssessment(
    DocumentNo,
    collect_risk_form_Value,
    collect_safty_form_Value,
    send_risk_form_Value,
    send_safty_form_Value)
    Values(
    :pDocNo,
    '1',
    '1',
    '1',
    '1')
    )
    W "HCC_SQL_Document.ProcedureAssessment:",SQLCODE,!
}

/// 测试SQL生成护理隔离章节
ClassMethod TestNursingIsolationGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入护理隔离章节
    &SQL(Insert into HCC_SQL_Document.NursingIsolation(
    DocumentNo,
    isolation_Value,
    isolation_type_Value)
    Values(
    :pDocNo,
    '1',
    '1')
    )
    W "HCC_SQL_Document.NursingIsolation:",SQLCODE,!
}

/// 测试SQL生成皮肤章节
ClassMethod TestSkinGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入皮肤章节
    &SQL(Insert into HCC_SQL_Document.Skin(
    DocumentNo,
    skin_check_Value)
    Values(
    :pDocNo,
    '皮肤检查描述')
    )
    W "HCC_SQL_Document.Skin:",SQLCODE,!
}

/// 测试SQL生成器械物品核对章节
ClassMethod TestInstrumentVerificationGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入器械物品核对章节
    &SQL(Insert into HCC_SQL_Document.InstrumentVerification(
    DocumentNo,
    aft_clse_equip_nurse_name_Value /*关后器械护士姓名*/,
    aft_clse_equip_nurse_sign_time_Value    /*关后器械护士签名日期时间*/,
    aft_clse_instrument_Value   /*关后术中所用物品名称*/,
    aft_clse_patrol_nurse_name_Value    /*关后巡台护士姓名*/,
    aft_clse_patrol_nurse_sign_time_Value   /*关后巡台护士签名日期时间*/,
    aft_clse_verified_Value /*关后清点标志*/,
    bef_clse_equip_nurse_name_Value /*关前器械护士姓名*/,
    bef_clse_equip_nurse_sign_time_Value    /*关前器械护士签名日期时间*/,
    bef_clse_instrument_Value   /*关前术中所用物品名称*/,
    bef_clse_patrol_nurse_name_Value    /*关前巡台护士姓名*/,
    bef_clse_patrol_nurse_sign_time_Value   /*关前巡台护士签名日期时间*/,
    bef_clse_verified_Value /*关前清点标志*/,
    preop_equip_nurse_name_Value    /*术前器械护士姓名*/,
    preop_equip_nurse_sign_time_Value   /*术前器械护士签名日期时间*/,
    preop_instrument_Value  /*术前术中所用物品名称*/,
    preop_patrol_nurse_name_Value   /*术前巡台护士姓名*/,
    preop_patrol_nurse_sign_time_Value  /*术前巡台护士签名日期时间*/,
    preop_verified_Value    /*术前清点标志*/)
    Values(
    :pDocNo,
    '杨丽'/*关后器械护士姓名*/,
    '2021-06-01 12:34:00'/*关后器械护士签名日期时间*/,
    '术中所用物品名称'/*关后术中所用物品名称*/,
    '郑芳'/*关后巡台护士姓名*/,
    '2021-06-01 12:39:00'/*关后巡台护士签名日期时间*/,
    '1'/*关后清点标志*/,
    '李丽芳'/*关前器械护士姓名*/,
    '2021-06-01 12:04:00'/*关前器械护士签名日期时间*/,
    '术中所用物品名称'/*关前术中所用物品名称*/,
    '关杰'/*关前巡台护士姓名*/,
    '2021-06-01 12:22:00'/*关前巡台护士签名日期时间*/,
    '1'/*关前清点标志*/,
    '张凯丽'/*术前器械护士姓名*/,
    '2021-06-01 12:05:00'/*术前器械护士签名日期时间*/,
    '术中所用物品名称'/*术前术中所用物品名称*/,
    '王馥荔'/*术前巡台护士姓名*/,
    '2021-06-01 12:04:00'/*术前巡台护士签名日期时间*/,
    '1'/*术前清点标志*/)
    )
    W "HCC_SQL_Document.InstrumentVerification:",SQLCODE,!
}

/// 测试SQL生成术后交接章节
ClassMethod TestPostoperationHandoverGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入术后交接章节
    &SQL(Insert into HCC_SQL_Document.PostoperationHandover(
    DocumentNo,
    nurse_name_Value,
    time_Value,
    transporter_Value,
    verified_Value)
    Values(
    :pDocNo,
    '王丽',
    '2021-06-01 15:28:00',
    '李建国',
    '1')
    )
    W "HCC_SQL_Document.PostoperationHandover:",SQLCODE,!
}

/// 测试SQL生成护理标志章节
ClassMethod TestNursingSignGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入护理标志章节
    &SQL(Insert into HCC_SQL_Document.NursingSign(
    DocumentNo,
    dysuria_Value,
    vomit_Value)
    Values(
    :pDocNo,
    '1',
    '1')
    )
    W "HCC_SQL_Document.NursingSign:",SQLCODE,!
}

/// 测试SQL生成高值耗材章节
ClassMethod TestHighValueConsumableGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入高值耗材章节
    &SQL(Insert into HCC_SQL_Document.HighValueConsumable(
    DocumentNo,
    implantable_Value,
    manufacturer_Value,
    name_Value,
    product_no_Value,
    provider_Value,
    quantity_Value,
    route_Value,
    unit_Value)
    Values(
    :pDocNo,
    '1',
    '产品生产厂家',
    '植入性心脏支架',
    '12345678',
    '产品供应商',
    '1',
    '心脏植入',
    '个')
    )
    W "HCC_SQL_Document.HighValueConsumable:",SQLCODE,!
}

/// 测试SQL生成入院信息章节
ClassMethod TestAdmissionInformationGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入入院信息章节
    &SQL(Insert into HCC_SQL_Document.AdmissionInformation(
    DocumentNo,
    admit_mode_Value,
    admit_rsn_Value,
    route_Value)
    Values(
    :pDocNo,
    '入病房方式描述',
    '入院原因描述',
    1)
    )
    W "HCC_SQL_Document.AdmissionInformation:",SQLCODE,!
}

/// 测试SQL生成生活方式章节
ClassMethod TestLifeStyleGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入生活方式章节
    &SQL(Insert into HCC_SQL_Document.LifeStyle(
    DocumentNo,
    diet_Value,
    liquor_Value,
    liquor_frequency_Value,
    liquor_volume_Value,
    smoke_Value,
    smoke_quantity_Value,
    smoke_status_Value,
    stop_smoke_days_Value)
    Values(
    :pDocNo,
    '1',
    '1',
    '3',
    '300',
    '1',
    '10',
    '3',
    200)
    )
    W "HCC_SQL_Document.LifeStyle:",SQLCODE,!
}

/// 测试SQL生成抢救记录章节
ClassMethod TestRescueRecordGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入抢救记录章节
    &SQL(Insert into HCC_SQL_Document.RescueRecord(
    DocumentNo,
    end_time_Value,
    rescue_record_Value,
    start_time_Value)
    Values(
    :pDocNo,
    '2021-07-01 10:28:00',
    '急诊抢救记录描述',
    '2021-07-01 09:46:00')
    )
    W "HCC_SQL_Document.RescueRecord:",SQLCODE,!
    
    /// 插入抢救记录章节 - 参加抢救人员子表(可插入多条)
    &SQL(Insert into HCC_SQL_Document_RescueRecord.Attendee(
    DocumentNo,
    attendee_Value,
    specialty_level_Value)
    Values(
    :pDocNo,
    '李岚',
    '1')
    )
    W "HCC_SQL_Document_RescueRecord.Attendee:",SQLCODE,!
}

/// 测试SQL生成其他相关信息章节
ClassMethod TestOtherGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入其他相关信息章节
    &SQL(Insert into HCC_SQL_Document.Other(
    DocumentNo,
    dchg_tgt_Value,
    notes_Value)
    Values(
    :pDocNo,
    '患者去向',
    '注意事项详细描述')
    )
    W "HCC_SQL_Document.Other:",SQLCODE,!
}

/// 测试SQL生成会诊原因章节
ClassMethod TestConsultReasonGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入会诊原因章节
    &SQL(Insert into HCC_SQL_Document.ConsultReason(
    DocumentNo,
    reason_Value,
    type_Value)
    Values(
    :pDocNo,
    '由会诊医师填写患者需会诊的主要情况的详细描述',
    '申请会诊的类型描述，如：院内会诊、院外会诊、多学科会诊等')
    )
    W "HCC_SQL_Document.ConsultReason:",SQLCODE,!
}

/// 测试SQL生成会诊意见章节
ClassMethod TestConsultSuggestionGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入会诊意见章节
    &SQL(Insert into HCC_SQL_Document.ConsultSuggestion(
    DocumentNo,
    suggestion_Value)
    Values(
    :pDocNo,
    '会诊意见')
    )
    W "HCC_SQL_Document.ConsultSuggestion:",SQLCODE,!
}

/// 测试SQL生成病历摘要章节
ClassMethod TestMRSummaryGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入病历摘要章节
    &SQL(Insert into HCC_SQL_Document.MRSummary(
    DocumentNo,
    content_Value)
    Values(
    :pDocNo,
    '病历摘要')
    )
    W "HCC_SQL_Document.MRSummary:",SQLCODE,!
}

/// 测试SQL生成术前总结章节
ClassMethod TestPreoperativeSummaryGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入术前总结章节
    &SQL(Insert into HCC_SQL_Document.PreoperativeSummary(
    DocumentNo,
    conclusion_Value,
    suggestion_Value)
    Values(
    :pDocNo,
    '讨论结论',
    '讨论意见')
    )
    W "HCC_SQL_Document.PreoperativeSummary:",SQLCODE,!
}

/// 测试SQL生成尸检意见章节
ClassMethod TestAutopsyOpinionGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入尸检意见章节
    &SQL(Insert into HCC_SQL_Document.AutopsyOpinion(
    DocumentNo,
    agree_Value)
    Values(
    :pDocNo,
    1)
    )
    W "HCC_SQL_Document.AutopsyOpinion:",SQLCODE,!
}

/// 测试SQL生成讨论内容章节
ClassMethod TestDiscussionGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入讨论内容章节
    &SQL(Insert into HCC_SQL_Document.Discussion(
    DocumentNo,
    content_Value)
    Values(
    :pDocNo,
    '讨论内容')
    )
    W "HCC_SQL_Document.Discussion:",SQLCODE,!
}

/// 测试SQL生成讨论总结章节
ClassMethod TestDiscussionSummaryGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入讨论总结章节
    &SQL(Insert into HCC_SQL_Document.DiscussionSummary(
    DocumentNo,
    content_Value)
    Values(
    :pDocNo,
    '讨论总结')
    )
    W "HCC_SQL_Document.DiscussionSummary:",SQLCODE,!
}

/// 测试SQL生成其他处置章节
ClassMethod TestOtherProcGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入其他处置章节
    &SQL(Insert into HCC_SQL_Document.OtherProc(
    DocumentNo,
    treat_proc_Value)
    Values(
    :pDocNo,
    '诊疗过程描述')
    )
    W "HCC_SQL_Document.OtherProc:",SQLCODE,!
}

/// 测试SQL生成检查报告章节
ClassMethod TestCheckReportGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入检查报告章节
    &SQL(Insert into HCC_SQL_Document.CheckReport(
    DocumentNo,
    dept_Value,
    notes_Value,
    obj_Value,
    org_Value,
    sub_Value)
    Values(
    :pDocNo,
    '检查报告科室',
    '检查报告备注信息',
    '检查报告结果-客观所见',
    '检查报告机构名称',
    '检查报告结果-主观提示')
    )
    W "HCC_SQL_Document.CheckReport:",SQLCODE,!
}

/// 测试SQL生成检验报告章节
ClassMethod TestLabReportGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入检验报告章节
    &SQL(Insert into HCC_SQL_Document.LabReport(
    DocumentNo,
    dept_Value,
    notes_Value,
    org_Value,
    result_Value)
    Values(
    :pDocNo,
    '检验报告科室',
    '检验报告备注信息',
    '检验报告机构名称',
    '检验报告结果')
    )
    W "HCC_SQL_Document.LabReport:",SQLCODE,!
}

/// 测试SQL生成手术过程描述章节
ClassMethod TestProcedureNoteGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入手术过程描述章节
    &SQL(Insert into HCC_SQL_Document.ProcedureNote(
    DocumentNo,
    body_part_name_Value,
    body_pos_Value,
    cut_notes_Value,
    drainage_Value,
    intervention_Value,
    notes_Value,
    skin_disinfection_Value)
    Values(
    :pDocNo,
    '实施手术的人体部位名称',
    1,
    '对手术中皮肤切口情况的具体描述',
    1,
    '实施手术操作时使用/放置的材料/药物的名称',
    '手术过程的详细描述',
    '对手术中皮肤消毒情况的具体描述')
    )
    W "HCC_SQL_Document.ProcedureNote:",SQLCODE,!
}

/// 测试SQL生成引流章节
ClassMethod TestSurgicalDrainsGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入引流章节
    &SQL(Insert into HCC_SQL_Document.SurgicalDrains(
    DocumentNo,
    body_pos_Value,
    count_Value,
    drains_Value,
    material_Value)
    Values(
    :pDocNo,
    '引流管放置在病人体内的具体位置的描述',
    '对手术中引流材料数目的具体描述',
    1,
    '对手术中引流材料名称的具体描述')
    )
    W "HCC_SQL_Document.SurgicalDrains:",SQLCODE,!
}

/// 测试SQL生成麻醉章节
ClassMethod TestAnesthesiaGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入麻醉章节
    &SQL(Insert into HCC_SQL_Document.Anesthesia(
    DocumentNo,
    ASA_Value/*美国麻醉医师协会分级标准代码(ASA)*/,
    anesthetic_Value/*麻醉药物名称*/,
    anesthetist_Value/*麻醉医师姓名*/,
    begin_time_Value/*麻醉开始日期时间*/,
    breath_type_Value/*呼吸类型代码*/,
    complication_Value/*麻醉合并症标志*/,
    effect_Value/*麻醉效果*/,
    intubation_Value/*气管插管分类*/,
    method_Value/*麻醉方式代码*/,
    notes_Value/*麻醉描述*/,
    pos_Value/*麻醉体位*/,
    premedication_Value/*麻醉前用药*/,
    puncture_Value/*穿刺过程描述*/)
    Values(
    :pDocNo,
    '1'/*美国麻醉医师协会分级标准代码(ASA)*/,
    '药物通用名称'/*麻醉药物名称*/,
    '张医生'/*麻醉医师姓名*/,
    '2021-07-01 13:36:00'/*麻醉开始日期时间*/,
    '1'/*呼吸类型代码*/,
    '1'/*麻醉合并症标志*/,
    '实施麻醉效果的描述'/*麻醉效果*/,
    '标识全身麻醉时气管插管分类的描述'/*气管插管分类*/,
    '1'/*麻醉方式代码*/,
    '麻醉过程的详细描述'/*麻醉描述*/,
    '麻醉体位的详细描述'/*麻醉体位*/,
    '在患者进行麻醉前给予的药品的具体描述'/*麻醉前用药*/,
    '局部麻醉中穿刺过程的详细描述'/*穿刺过程描述*/)
    )
    W "HCC_SQL_Document.Anesthesia:",SQLCODE,!
}

/// 测试SQL生成注意事项章节
ClassMethod TestAttentionGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入注意事项章节
    &SQL(Insert into HCC_SQL_Document.Attention(
    DocumentNo,
    attention_Value,
    preoperative_prep_Value,
    surgery_keypoint_Value)
    Values(
    :pDocNo,
    '注意事项',
    '术前准备',
    '手术要点')
    )
    W "HCC_SQL_Document.Attention:",SQLCODE,!
}

/// 测试SQL生成失血章节
ClassMethod TestBloodLossGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入失血章节
    &SQL(Insert into HCC_SQL_Document.BloodLoss(
    DocumentNo,
    vol_Value)
    Values(
    :pDocNo,
    '500')
    )
    W "HCC_SQL_Document.BloodLoss:",SQLCODE,!
}

/// 测试SQL生成宫剖产记录-手术操作章节
ClassMethod TestCaesareanProcedureGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入宫剖产记录-手术操作章节
    &SQL(Insert into HCC_SQL_Document.CaesareanProcedure(
    DocumentNo,
    abnormal_Value/*宫腔探查异常情况标志*/,
    adnexal_check_Value/*腹腔探查附件*/,
    anes_effect_Value/*麻醉效果*/,
    anes_method_Value/*麻醉方法代码*/,
    anes_pos_Value/*麻醉体位*/,
    begin_time_Value/*手术开始日期时间*/,
    bleeding_vol_Value/*出血量（mL）*/,
    blood_trans_comp_Value/*输血成分*/,
    blood_trans_vol_Value/*输血量（mL）*/,
    circles_Value/*绕颈身（周）*/,
    cord_entangle_Value/*脐带缠绕情况*/,
    cord_len_Value/*脐带长度（cm）*/,
    cord_torsion_Value/*脐带扭转（周）*/,
    delivery_mode_Value/*胎儿娩出方式*/,
    diag_Value/*产前诊断*/,
    due_date_Value/*待产日期时间*/,
    embryolemma_cmplt_Value/*胎膜完整情况标志*/,
    embryolemma_yellow_Value/*胎膜黄染*/,
    end_time_Value/*手术结束日期时间*/,
    fetal_pos_Value/*胎方位代码*/,
    infusion_vol_Value/*输液量（mL）*/,
    len_Value/*手术全程时间（min）*/,
    med_Value/*手术用药*/,
    med_dose_Value/*手术用药量*/,
    myoma_check_Value/*宫腔探查肌瘤标志*/,
    other_med_Value/*其他用药*/,
    other_situ_Value/*其他情况*/,
    oxygen_len_Value/*供氧时间（min）*/,
    oxytocin_Value/*宫缩剂名称*/,
    oxytocin_usage_Value/*宫缩剂使用方法*/,
    placenta_yellow_Value/*胎盘黄染*/,
    procd_Value/*手术/操作代码*/,
    procd_name_Value/*手术名称*/,
    process_Value/*剖宫产手术过程*/,
    puerpera_situ_Value/*手术时产妇情况*/,
    store_cord_blood_Value/*存脐带血情况标志*/,
    surgical_indic_Value/*手术指征*/,
    suture_uterine_wall_Value/*子宫壁缝合情况*/,
    treatment_Value/*宫腔探查处理情况*/,
    uterus_Value/*子宫情况*/,
    uterus_check_Value/*腹腔探查子宫*/)
    Values(
    :pDocNo,
    '0'/*宫腔探查异常情况标志*/,
    '腹腔探查附件'/*腹腔探查附件*/,
    '麻醉效果'/*麻醉效果*/,
    '01'/*麻醉方法代码*/,
    '麻醉体位'/*麻醉体位*/,
    '2021-07-02 14:20:00'/*手术开始日期时间*/,
    '300'/*出血量（mL）*/,
    '输血成分'/*输血成分*/,
    '350'/*输血量（mL）*/,
    '1'/*绕颈身（周）*/,
    '脐带缠绕情况'/*脐带缠绕情况*/,
    '25'/*脐带长度（cm）*/,
    '1'/*脐带扭转（周）*/,
    '胎儿娩出方式'/*胎儿娩出方式*/,
    '产前诊断'/*产前诊断*/,
    '2021-07-02 13:00:00'/*待产日期时间*/,
    '1'/*胎膜完整情况标志*/,
    '胎膜黄染'/*胎膜黄染*/,
    '2021-07-02 15:10:00'/*手术结束日期时间*/,
    '01'/*胎方位代码*/,
    '500'/*输液量（mL）*/,
    '90'/*手术全程时间（min）*/,
    '手术用药'/*手术用药*/,
    '36'/*手术用药量*/,
    '1'/*宫腔探查肌瘤标志*/,
    '其他用药'/*其他用药*/,
    '其他情况'/*其他情况*/,
    '70'/*供氧时间（min）*/,
    '宫缩剂名称'/*宫缩剂名称*/,
    '宫缩剂使用方法'/*宫缩剂使用方法*/,
    '胎盘黄染'/*胎盘黄染*/,
    '02.34002'/*手术/操作代码*/,
    null/*手术名称*/,
    '剖宫产手术过程'/*剖宫产手术过程*/,
    ''/*手术时产妇情况*/,
    '1'/*存脐带血情况标志*/,
    '手术指征'/*手术指征*/,
    '3'/*子宫壁缝合情况*/,
    '宫腔探查处理情况'/*宫腔探查处理情况*/,
    '子宫情况'/*子宫情况*/,
    '腹腔探查子宫'/*腹腔探查子宫*/)
    )
    W "HCC_SQL_Document.CaesareanProcedure:",SQLCODE,!
}

/// 测试SQL生成知情同意章节
ClassMethod TestConsentGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入知情同意章节
    &SQL(Insert into HCC_SQL_Document.Consent(
    DocumentNo,
    content_Value,
    crisis_content_Value,
    notes_Value,
    time_Value,
    title_Value)
    Values(
    :pDocNo,
    '通知内容',
    '病危（重）通知内容',
    '病情概况以及主要抢救措施',
    '2021-07-08 13:20:00',
    '病危（重）通知')
    )
    W "HCC_SQL_Document.Consent:",SQLCODE,!
}

/// 测试SQL生成死亡原因章节
ClassMethod TestDeathReasonGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入死亡原因章节
    &SQL(Insert into HCC_SQL_Document.DeathReason(
    DocumentNo,
    death_time_Value,
    diag_code_Value,
    reason_code_Value,
    reason_name_Value)
    Values(
    :pDocNo,
    '2021-07-08 13:20:00',
    'G91',
    'G91',
    '左上肺癌术后复发，食管气管瘘，肺部感染')
    )
    W "HCC_SQL_Document.DeathReason:",SQLCODE,!
}

/// 测试SQL生成分娩评估章节
ClassMethod TestDeliveryAssessmentGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入分娩评估章节
    &SQL(Insert into HCC_SQL_Document.DeliveryAssessment(
    DocumentNo,
    Apgar_Value,
    Apgar_interval_Value,
    abnormal_Value,
    result_Value)
    Values(
    :pDocNo,
    3,
    '01',
    1,
    1)
    )
    W "HCC_SQL_Document.DeliveryAssessment:",SQLCODE,!
}

/// 测试SQL生成健康评估章节
ClassMethod TestHealthAssessmentGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入健康评估章节
    &SQL(Insert into HCC_SQL_Document.HealthAssessment(
    DocumentNo,
    Apgar_Value/*Apgar评分值*/,
    MR_summary_Value/*病历摘要。用于《会诊记录》*/,
    Nutritional_Value/*营养状态代码*/,
    diet_Value/*饮食情况代码*/,
    growth_Value/*发育程度代码*/,
    mental_Value/*精神状态正常标志 */,
    psychology_Value/*心理状态代码*/,
    selfcare_Value/*自理能力代码*/,
    sleep_Value/*睡眠状况*/,
    special_Value/*特殊情况*/,
    suggestion_Value/*讨论意见。用于《疑难病例讨论记录》*/,
    summary_Value/*主持人总结意见。用于《疑难病例讨论记录》*/,
    ward_round_rec_Value/*查房记录。用于《上级医师查房记录》*/)
    Values(
    :pDocNo,
    '68'/*Apgar评分值*/,
    '病历摘要'/*病历摘要。用于《会诊记录》*/,
    '1'/*营养状态代码*/,
    '1'/*饮食情况代码*/,
    '1'/*发育程度代码*/,
    '1'/*精神状态正常标志*/,
    '2'/*心理状态代码*/,
    ''/*自理能力代码*/,
    '11'/*睡眠状况*/,
    '特殊情况'/*特殊情况*/,
    '讨论意见'/*讨论意见。用于《疑难病例讨论记录》*/,
    '主持人总结意见'/*主持人总结意见。用于《疑难病例讨论记录》*/,
    '查房记录'/*查房记录。用于《上级医师查房记录》*/)
    )
    W "HCC_SQL_Document.HealthAssessment:",SQLCODE,!
}

/// 测试SQL生成健康指导章节
ClassMethod TestHealthGuidanceGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入健康指导章节
    &SQL(Insert into HCC_SQL_Document.HealthGuidance(
    DocumentNo,
    diet_Value,
    education_Value,
    followup_Value,
    lifestyle_Value,
    medication_Value)
    Values(
    :pDocNo,
    '01',
    '宣教内容',
    '复诊指导',
    '生活方式指导',
    '用药指导')
    )
    W "HCC_SQL_Document.HealthGuidance:",SQLCODE,!
}

/// 测试SQL生成入院诊断章节
ClassMethod TestHospitalAdmissionDXGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    
    /// 插入入院诊断章节
    &SQL(Insert into HCC_SQL_Document.HospitalAdmissionDX(
    DocumentNo,
    TCM_obs_Value,
    admit_cond_Value,
    admit_time_Value,
    diag_basis_Value,
    treat_prin_Value)
    Values(
    :pDocNo,
    '01',
    '(简要病史、阳性体征、有关实验室及器械检查结果):患者因“腹痛、腹胀7天伴肛门停止排气排便”入院。患者7天前无明显诱因出现腹痛、腹胀，以上腹部明显，向后背部放射，伴恶心，无呕吐，腹痛、腹胀呈阵发性加重，尚能忍受，2天前腹痛腹胀明显加重，无畏寒发热，曾于无锡第四人民医院灌肠后排出少许粪便，给予抗炎补液等治疗后，仍腹痛腹胀恶心，不能平卧，胸闷气急，进食量少，平时大便尚正常，无明显黑便。查体:神志清楚，体温37.6℃，腹部饱满，膨隆，腹部胀气，下腹部正中见手术切口疤痕长约12CM，愈合好，未见明显肠型、蠕动波，左上腹部压痛，无反跳痛及肌卫，未及明显异常包块，肝、脾肋下未及，全腹扣诊呈鼓音，肝、肾区无叩击痛，移动性浊音阴性，肠鸣音减弱、约1-2次/分，可闻及气过水声。盆腹腔CT示:结肠梗阻并扭转可能大，肠麻痹',
    '2021-07-02 10:30:00',
    '01',
    '01')
    )
    W "HCC_SQL_Document.HospitalAdmissionDX:",SQLCODE,!
    
    /// 插入入院诊断章节 - 西医诊断子表 (多条)
    &SQL(Insert into HCC_SQL_Document_HospitalAdmissionDX.Diagnosis(
    DocumentNo,
    diag_code_Value,
    diag_date_Value,
    diag_org_Value,
    diag_name_Value,
    diag_orders_Value)
    Values(
    :pDocNo,
    'Y53.6',
    '2021-07-02 10:30:00',
    null,
    null,
    '1')
    )
    &SQL(Insert into HCC_SQL_Document_HospitalAdmissionDX.Diagnosis(
    DocumentNo,
    diag_code_Value,
    diag_date_Value,
    diag_org_Value,
    diag_name_Value,
    diag_orders_Value)
    Values(
    :pDocNo,
    null,
    '2021-07-02 10:30:00',
    null,
    '酒精中毒',
    '2')
    )
    W "HCC_SQL_Document_HospitalAdmissionDX.Diagnosis:",SQLCODE,!
    
    /// 插入入院诊断章节 - 中医条目子表 (多条)
    &SQL(Insert into HCC_SQL_Document_HospitalAdmissionDX.TCM(
    DocumentNo,
    diag_code_Value,
    diag_date_Value,
    diag_name_Value,
    diag_orders_Value,
    syndrome_code_Value,
    syndrome_date_Value,
    syndrome_name_Value,
    syndrome_orders_Value)
    Values(
    :pDocNo,
    'BWC230',
    '2021-07-02 10:30:00',
    null,
    1,
    'ZBF001',
    '2021-07-02 10:30:00',
    null,
    1)
    )
    
    &SQL(Insert into HCC_SQL_Document_HospitalAdmissionDX.TCM(
    DocumentNo,
    diag_code_Value,
    diag_date_Value,
    diag_name_Value,
    diag_orders_Value,
    syndrome_code_Value,
    syndrome_date_Value,
    syndrome_name_Value,
    syndrome_orders_Value)
    Values(
    :pDocNo,
    null,
    '2021-07-02 10:30:00',
    '内科病',
    1,
    null,
    '2021-07-02 10:30:00',
    '火毒上攻证',
    2)
    )
    W "HCC_SQL_Document_HospitalAdmissionDX.TCM:",SQLCODE,!
    
    /// 插入入院诊断章节 - 阳性辅助检查结果子表 (多条)
    &SQL(Insert into HCC_SQL_Document_HospitalAdmissionDX.AuxExamResult(
    DocumentNo,
    result_Value)
    Values(
    :pDocNo,
    '阳性辅助检查结果')
    )
    W "HCC_SQL_Document_HospitalAdmissionDX.AuxExamResult:",SQLCODE,!
}

/// 测试SQL生成输液章节
ClassMethod TestInfusionGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入输液章节
    &SQL(Insert into HCC_SQL_Document.Infusion(
    DocumentNo,
    item_Value,
    vol_Value)
    Values(
    :pDocNo,
    '手术过程中输入液体的描述',
    '500')
    )
    W "HCC_SQL_Document.Infusion:",SQLCODE,!
}

/// 测试SQL生成用药管理章节
ClassMethod TestMedicationAdministeredGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入用药管理章节(多条)
    &SQL(Insert into HCC_SQL_Document.MedicationAdministered(
    DocumentNo,
    TCM_usage_Value,
    dose_Value,
    form_Value,
    name_Value,
    rate_Value,
    route_Value,
    total_dose_Value,
    unit_Value,
    usage_Value)
    Values(
    :pDocNo,
    null,
    '01',
    '20',
    '氢氯噻嗪',
    '01',
    '1',
    '300',
    'mg',
    '药物（含中药）治疗疾病具体用法的描述')
    )
    
    &SQL(Insert into HCC_SQL_Document.MedicationAdministered(
    DocumentNo,
    TCM_usage_Value,
    dose_Value,
    form_Value,
    name_Value,
    rate_Value,
    route_Value,
    total_dose_Value,
    unit_Value,
    usage_Value)
    Values(
    :pDocNo,
    null,
    '01',
    '50',
    '甲硝锉',
    '01',
    '1',
    '500',
    'mg',
    '药物（含中药）治疗疾病具体用法的描述')
    )

    W "HCC_SQL_Document.MedicationAdministered:",SQLCODE,!
}

/// 测试SQL生成用药章节
ClassMethod TestMedicationUseHistoryGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入用药章节
    &SQL(Insert into HCC_SQL_Document.MedicationUseHistory(
    DocumentNo,
    group_no_Value,
    notes_Value,
    pres_type_Value,
    valid_days_Value)
    Values(
    :pDocNo,
    '5',
    '备注信息描述',
    null,
    '3')
    )
    W "HCC_SQL_Document.MedicationUseHistory:",SQLCODE,!
    
    /// 用药章节 - 处方条目子表 (多条)
    &SQL(Insert into HCC_SQL_Document_MedicationUseHistory.MedicineItem(
    DocumentNo,
    reason,
    dose_Value,
    form_Value,
    name_Value,
    rate_Value,
    route_Value,
    spec_Value,
    total_dose_Value)
    Values(
    :pDocNo,
    '处方',
    '20',
    '01',
    '氢氯噻臻',
    '3次/日',
    '1',
    '规格描述',
    '400')
    )
    
    &SQL(Insert into HCC_SQL_Document_MedicationUseHistory.MedicineItem(
    DocumentNo,
    reason,
    dose_Value,
    form_Value,
    name_Value,
    rate_Value,
    route_Value,
    spec_Value,
    total_dose_Value)
    Values(
    :pDocNo,
    '术前',
    '10',
    '01',
    '葡萄糖酸钠',
    '2次/日',
    '404',
    '规格描述',
    '40')
    )
    W "HCC_SQL_Document_MedicationUseHistory.MedicineItem:",SQLCODE,!
    
    
    /// 用药章节 - 中药饮片条目子表 (多条)
    &SQL(Insert into HCC_SQL_Document_MedicationUseHistory.HerbalPiece(
    DocumentNo,
    content_Value,
    decocting_Value,
    dose_Value,
    name_Value,
    usage_Value)
    Values(
    :pDocNo,
    '对中药处方医嘱内容的详细描述',
    '中药饮片煎煮方法描述',
    '4',
    '中药饮片处方的详细描述',
    '中药用药方法的描述')
    )
    &SQL(Insert into HCC_SQL_Document_MedicationUseHistory.HerbalPiece(
    DocumentNo,
    content_Value,
    decocting_Value,
    dose_Value,
    name_Value,
    usage_Value)
    Values(
    :pDocNo,
    '对中药处方医嘱内容的详细描述',
    '中药饮片煎煮方法描述',
    '3',
    '中药饮片处方的详细描述',
    '中药用药方法的描述')
    )

    W "HCC_SQL_Document_MedicationUseHistory.HerbalPiece:",SQLCODE,!
}

/// 测试SQL生成新生儿章节
ClassMethod TestNewBornGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入新生儿章节
    &SQL(Insert into HCC_SQL_Document.NewBorn(
    DocumentNo,
    gender_Value,
    height_Value,
    position_Value,
    size_Value,
    weight_Value)
    Values(
    :pDocNo,
    '2',
    '60',
    '产瘤部位',
    '产瘤大小',
    '3000')
    )
    W "HCC_SQL_Document.NewBorn:",SQLCODE,!
}

/// 测试SQL生成护理观察章节
ClassMethod TestNursingObservationGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入护理观察章节 (多条)
    &SQL(Insert into HCC_SQL_Document.NursingObservation(
    DocumentNo,
    brief_condition_Value,
    item_Value,
    result_Value)
    Values(
    :pDocNo,
    '简要病情',
    '护理观察项目名称1',
    '护理观察结果描述')
    )
    &SQL(Insert into HCC_SQL_Document.NursingObservation(
    DocumentNo,
    brief_condition_Value,
    item_Value,
    result_Value)
    Values(
    :pDocNo,
    '简要病情',
    '护理观察项目名称2',
    '护理观察结果描述')
    )
    W "HCC_SQL_Document.NursingObservation:",SQLCODE,!
}

/// 测试SQL生成护理操作章节
ClassMethod TestNursingOperationGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入护理操作章节 (多条)
    &SQL(Insert into HCC_SQL_Document.NursingOperation(
    DocumentNo,
    Ventilator_Value,
    category_Value,
    operation_Value,
    result_Value)
    Values(
    :pDocNo,
    null,
    '护理操作项目类目名称描述',
    '进行护理操作的具体名称1',
    '护理操作结果描述')
    )
    &SQL(Insert into HCC_SQL_Document.NursingOperation(
    DocumentNo,
    Ventilator_Value,
    category_Value,
    operation_Value,
    result_Value)
    Values(
    :pDocNo,
    null,
    '护理操作项目类目名称描述',
    '进行护理操作的具体名称2',
    '护理操作结果描述')
    )
    W "HCC_SQL_Document.NursingOperation:",SQLCODE,!
}

/// 测试SQL生成护理记录章节
ClassMethod TestNursingRecordGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入护理记录章节
    &SQL(Insert into HCC_SQL_Document.NursingRecord(
    DocumentNo,
    category_Value/*护理操作项目类目名称。用于《护理计划》需要*/,
    catheter_nurse_Value/*导管护理描述*/,
    nursing_level_Value/*护理等级代码*/,
    nursing_type_Value/*护理类型代码*/,
    nutrition_nurse_Value/*营养护理*/,
    operation_Value/*护理操作名称。用于《护理计划》需要*/,
    position_nurse_Value/*体位护理*/,
    problem_Value/*护理问题*/,
    psychology_nurse_Value/*心理护理代码*/,
    result_Value/*护理操作结果。用于《护理计划》需要*/,
    safty_nurse_Value/*安全护理代码*/,
    skin_nurse_Value/*皮肤护理*/,
    trachea_nurse_Value/*气管护理代码*/)
    Values(
    :pDocNo,
    '护理操作项目类目名称描述'/*护理操作项目类目名称。用于《护理计划》需要*/,
    '导管护理描述'/*导管护理描述*/,
    '1'/*护理等级代码*/,
    '1'/*护理类型代码*/,
    '营养护理'/*营养护理*/,
    '进行护理操作的具体名称'/*护理操作名称。用于《护理计划》需要*/,
    '体位护理描述'/*体位护理*/,
    '护理问题描述'/*护理问题*/,
    '2'/*心理护理代码*/,
    '护理操作结果描述'/*护理操作结果。用于《护理计划》需要*/,
    '1'/*安全护理代码*/,
    '皮肤护理描述'/*皮肤护理*/,
    '1'/*气管护理代码*/)
    )
    W "HCC_SQL_Document.NursingRecord:",SQLCODE,!
}

/// 测试SQL生成产后处置章节
ClassMethod TestProcessPostDeliveryGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入产后处置章节
    &SQL(Insert into HCC_SQL_Document.ProcessPostDelivery(
    DocumentNo,
    anal_exam_Value/*肛查*/,
    check_time_Value/*产后检查时间(min)*/,
    diag_Value/*产后诊断*/,
    diastolic_Value/*舒张压*/,
    heart_rate_Value/*产后心率(次/min)*/,
    obs_time_Value/*产后观察日期时间*/,
    pph_Value/*产后出血量(mL)*/,
    pulse_Value/*产后脉搏(次/min)*/,
    systolic_Value/*收缩压*/,
    uterine_contraction_Value/*产后宫缩*/,
    uterus_fundus_height_Value/*产后宫底高度(cm)*/)
    Values(
    :pDocNo,
    '肛查'/*肛查*/,
    '30'/*产后检查时间(min)*/,
    '产后诊断'/*产后诊断*/,
    '80'/*舒张压*/,
    '86'/*产后心率(次/min)*/,
    '2021-07-02 13:55:00'/*产后观察日期时间*/,
    '20'/*产后出血量(mL)*/,
    '78'/*产后脉搏(次/min)*/,
    '120'/*收缩压*/,
    '产后宫缩'/*产后宫缩*/,
    60/*产后宫底高度(cm)*/)
    )
    W "HCC_SQL_Document.ProcessPostDelivery:",SQLCODE,!
}

/// 测试SQL生成医嘱章节
ClassMethod TestProviderOrderGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入医嘱章节
    &SQL(Insert into HCC_SQL_Document.ProviderOrder(
    DocumentNo,
    decoct_method_Value,
    dchg_order_Value,
    type_Value,
    use_method_Value)
    Values(
    :pDocNo,
    '中药煎煮方法'/*中药煎煮方法*/,
    '医嘱内容'/*医嘱内容*/,
    '1'/*医嘱类别*/,
    '中药用药方法'/*中药用药方法*/)
    )
    W "HCC_SQL_Document.ProviderOrder:",SQLCODE,!
    
    
    /// 插入医嘱章节 - 条目(多条)
    &SQL(Insert into HCC_SQL_Document_ProviderOrder.Item(
    DocumentNo,
    cancel_provider_Value/*医嘱取消者签名*/,
    cancel_time_Value/*医嘱取消日期时间*/,
    eApplyNo_Value/*电子申请单编号*/,
    exec_dept_Value/*医嘱执行科室*/,
    exec_provider_Value/*医嘱执行者签名*/,
    exec_stat_Value/*医嘱执行状态*/,
    exec_time_Value/*医嘱执行日期时间*/,
    groupNo_Value/*处方药品组号*/,
    notes_Value/*医嘱备注信息*/,
    order_item_Value/*医嘱项目*/,
    order_type_Value/*医嘱项目类型*/,
    place_dept_Value/*医嘱开立科室*/,
    place_provider_Value/*医嘱开立者签名*/,
    place_time_Value/*医嘱开立日期时间*/,
    planned_begin_Value/*医嘱计划开始时间*/,
    planned_end_Value/*医嘱计划结束时间*/,
    review_provider_Value/*医嘱审核者签名*/,
    review_time_Value/*医嘱审核日期时间*/,
    terminate_provider_Value/*医嘱停止者签名*/,
    terminate_time_Value/*医嘱停止日期时间*/,
    verify_provider_Value/*医嘱核对者签名*/,
    verify_time_Value/*医嘱核对日期时间*/)
    Values(
    :pDocNo,
    ''/*医嘱取消者签名*/,
    '2021-07-05 10:27:00'/*医嘱取消日期时间*/,
    'eRx786555'/*电子申请单编号*/,
    '内科'/*医嘱执行科室*/,
    '李护士'/*医嘱执行者签名*/,
    '医嘱执行状态'/*医嘱执行状态*/,
    '2021-07-01 11:20:00'/*医嘱执行日期时间*/,
    '2'/*处方药品组号*/,
    '医嘱备注信息'/*医嘱备注信息*/,
    '阿莫西林'/*医嘱项目*/,
    '01'/*医嘱项目类型*/,
    '内科'/*医嘱开立科室*/,
    '张一山'/*医嘱开立者签名*/,
    '2021-07-01 10:26:00'/*医嘱开立日期时间*/,
    '2021-07-01'/*医嘱计划开始时间*/,
    '2021-07-05'/*医嘱计划结束时间*/,
    '郑主任'/*医嘱审核者签名*/,
    '2021-07-01 10:28:00'/*医嘱审核日期时间*/,
    '张一山'/*医嘱停止者签名*/,
    '2021-07-05 13:10:00'/*医嘱停止日期时间*/,
    '王耀使'/*医嘱核对者签名*/,
    '2021-07-01 10:27:00'/*医嘱核对日期时间*/)
    )
    W "HCC_SQL_Document_ProviderOrder.Item:",SQLCODE,!
    
    &SQL(Insert into HCC_SQL_Document_ProviderOrder.Item(
    DocumentNo,
    cancel_provider_Value/*医嘱取消者签名*/,
    cancel_time_Value/*医嘱取消日期时间*/,
    eApplyNo_Value/*电子申请单编号*/,
    exec_dept_Value/*医嘱执行科室*/,
    exec_provider_Value/*医嘱执行者签名*/,
    exec_stat_Value/*医嘱执行状态*/,
    exec_time_Value/*医嘱执行日期时间*/,
    groupNo_Value/*处方药品组号*/,
    notes_Value/*医嘱备注信息*/,
    order_item_Value/*医嘱项目*/,
    order_type_Value/*医嘱项目类型*/,
    place_dept_Value/*医嘱开立科室*/,
    place_provider_Value/*医嘱开立者签名*/,
    place_time_Value/*医嘱开立日期时间*/,
    planned_begin_Value/*医嘱计划开始时间*/,
    planned_end_Value/*医嘱计划结束时间*/,
    review_provider_Value/*医嘱审核者签名*/,
    review_time_Value/*医嘱审核日期时间*/,
    terminate_provider_Value/*医嘱停止者签名*/,
    terminate_time_Value/*医嘱停止日期时间*/,
    verify_provider_Value/*医嘱核对者签名*/,
    verify_time_Value/*医嘱核对日期时间*/)
    Values(
    :pDocNo,
    ''/*医嘱取消者签名*/,
    '2021-07-05 10:27:00'/*医嘱取消日期时间*/,
    'eRx786555'/*电子申请单编号*/,
    '内科'/*医嘱执行科室*/,
    '李护士'/*医嘱执行者签名*/,
    '医嘱执行状态'/*医嘱执行状态*/,
    '2021-07-01 11:20:00'/*医嘱执行日期时间*/,
    '2'/*处方药品组号*/,
    '医嘱备注信息'/*医嘱备注信息*/,
    '头孢克污'/*医嘱项目*/,
    '01'/*医嘱项目类型*/,
    '内科'/*医嘱开立科室*/,
    '张一山'/*医嘱开立者签名*/,
    '2021-07-01 10:26:00'/*医嘱开立日期时间*/,
    '2021-07-01'/*医嘱计划开始时间*/,
    '2021-07-05'/*医嘱计划结束时间*/,
    '郑主任'/*医嘱审核者签名*/,
    '2021-07-01 10:28:00'/*医嘱审核日期时间*/,
    '张一山'/*医嘱停止者签名*/,
    '2021-07-05 13:10:00'/*医嘱停止日期时间*/,
    '王耀使'/*医嘱核对者签名*/,
    '2021-07-01 10:27:00'/*医嘱核对日期时间*/)
    )
    W "HCC_SQL_Document_ProviderOrder.Item:",SQLCODE,!
}

/// 测试SQL生成风险章节
ClassMethod TestRiskGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入风险章节
    &SQL(Insert into HCC_SQL_Document.Risk(
    DocumentNo,
    operation_risk_Value,
    post_operation_risk_Value)
    Values(
    :pDocNo,
    '手术中可能出现的意外及风险',
    '手术后可能出现的意外')
    )
    W "HCC_SQL_Document.Risk:",SQLCODE,!
}

/// 测试SQL生成意见章节
ClassMethod TestSuggestionGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入意见章节
    &SQL(Insert into HCC_SQL_Document.Suggestion(
    DocumentNo,
    hospital_Value,
    patient_Value)
    Values(
    :pDocNo,
    '医疗机构意见',
    '患者意见')
    )
    W "HCC_SQL_Document.Suggestion:",SQLCODE,!
}

/// 测试SQL生成辅助检查章节
ClassMethod TestSupplementaryExamGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入辅助检查章节 (多条)
    &SQL(Insert into HCC_SQL_Document.SupplementaryExam(
    DocumentNo,
    result)
    Values(
    :pDocNo,
    '患者辅助检查结果的详细描述1')
    )
    /// 插入辅助检查章节 (多条)
    &SQL(Insert into HCC_SQL_Document.SupplementaryExam(
    DocumentNo,
    result)
    Values(
    :pDocNo,
    '患者辅助检查结果的详细描述2')
    )
    W "HCC_SQL_Document.SupplementaryExam:",SQLCODE,!
}

/// 测试SQL生成术后诊断章节
ClassMethod TestSurgicalOperationNotePostoperativeDXGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入术后诊断章节
    &SQL(Insert into HCC_SQL_Document.SurgicalOperationNotePostoperativeDX(
    DocumentNo,
    basis_Value,
    code_Value,
    name_Value)
    Values(
    :pDocNo,
    '诊断依据',
    'G51',
    '诊断名称')
    )
    W "HCC_SQL_Document.SurgicalOperationNotePostoperativeDX:",SQLCODE,!
}

/// 测试SQL生成术前诊断章节
ClassMethod TestSurgicalOperationNotePreoperativeDXGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入术前诊断章节
    &SQL(Insert into HCC_SQL_Document.SurgicalOperationNotePreoperativeDX(
    DocumentNo,
    admit_time_Value,
    diag_code_Value)
    Values(
    :pDocNo,
    '2021-07-01 10:10:00',
    'G51')
    )
    W "HCC_SQL_Document.SurgicalOperationNotePreoperativeDX:",SQLCODE,!
}

/// 测试SQL生成症状章节
ClassMethod TestSymptomGenerate(pDocNo = "Doc123456")
{
    #SQLCompile Select=ODBC 
    /// 插入症状章节(多条)
    &SQL(Insert into HCC_SQL_Document.Symptom(
    DocumentNo,
    begin_time_Value,
    end_time_Value,
    symptom_desc_Value,
    symptom_name_Value)
    Values(
    :pDocNo,
    '2021-07-01 10:10:00',
    null,
    '头痛持续2天',
    '头痛')
    )
    &SQL(Insert into HCC_SQL_Document.Symptom(
    DocumentNo,
    begin_time_Value,
    end_time_Value,
    symptom_desc_Value,
    symptom_name_Value)
    Values(
    :pDocNo,
    '2021-07-01 10:10:00',
    null,
    '走路不稳，不能走直线',
    '走路不稳')
    )
    W "HCC_SQL_Document.Symptom:",SQLCODE,!
}

/// 测试SQL生成生命体征章节
/// pMode为文档类型号1-53
ClassMethod TestVitalSignGenerate(pDocNo = "Doc123456", pMode = 20)
{
    #SQLCompile Select=ODBC 
    if ((pMode = 11)||(pMode = 14)||(pMode = 17)||(pMode = 18)||(pMode = 20)||(pMode = 23)||(pMode = 34))
    {
        /// 插入生命体征章节(可以多条)
        &SQL(Insert into HCC_SQL_Document.VitalSign(
        DocumentNo,
        type,
        display,
        value)
        Values(
        :pDocNo,
        'DE04.10.081.00',
        '呼吸频率（次/min）',
        '83')
        )
        &SQL(Insert into HCC_SQL_Document.VitalSign(
        DocumentNo,
        type,
        display,
        value)
        Values(
        :pDocNo,
        'DE04.10.118.00',
        '脉率（次/min）',
        '70')
        )
        &SQL(Insert into HCC_SQL_Document.VitalSign(
        DocumentNo,
        type,
        display,
        value)
        Values(
        :pDocNo,
        'DE04.10.206.00',
        '起搏器心率（次/min）',
        '70')
        )
        &SQL(Insert into HCC_SQL_Document.VitalSign(
        DocumentNo,
        type,
        display,
        value)
        Values(
        :pDocNo,
        'DE04.10.186.00',
        '体温（℃）',
        '37.1')
        )
        &SQL(Insert into HCC_SQL_Document.VitalSign(
        DocumentNo,
        type,
        display,
        value)
        Values(
        :pDocNo,
        'DE04.10.174.00',
        '收缩压',
        '120')
        )
        &SQL(Insert into HCC_SQL_Document.VitalSign(
        DocumentNo,
        type,
        display,
        value)
        Values(
        :pDocNo,
        'DE04.10.176.00',
        '舒张压',
        '75')
        )
        &SQL(Insert into HCC_SQL_Document.VitalSign(
        DocumentNo,
        type,
        display,
        value)
        Values(
        :pDocNo,
        'DE04.10.188.00',
        '体重（kg）',
        '71')
        )
        &SQL(Insert into HCC_SQL_Document.VitalSign(
        DocumentNo,
        type,
        display,
        value)
        Values(
        :pDocNo,
        'DE04.10.052.00',
        '腹围（cm）',
        '82')
        )
        if (pMode=17)
        {
            &SQL(Insert into HCC_SQL_Document.VitalSign(
            DocumentNo,
            type,
            display,
            value)
            Values(
            :pDocNo,
            'DE04.50.149.00',
            '血氧饱和度（%）',
            '98')
            )
        }
        if (pMode=18)
        {
            &SQL(Insert into HCC_SQL_Document.VitalSign(
            DocumentNo,
            type,
            display,
            value)
            Values(
            :pDocNo,
            'DE04.50.102.00',
            '血糖检测值（mmol/L）',
            '8')
            )
        }

        W "HCC_SQL_Document.VitalSign:",SQLCODE,!
    }
    elseif ((pMode = 8)||(pMode = 12)||(pMode = 19)||(pMode = 21)||(pMode = 52))
    {
        &SQL(Insert into HCC_SQL_Document.VitalSign(
        DocumentNo,
        type,
        display,
        value)
        Values(
        :pDocNo,
        'DE04.10.188.00',
        '体重（kg）',
        '71')
        )
        W "HCC_SQL_Document.VitalSign:",SQLCODE,!
    }
    else
    {
        /// 插入生命体征章节(可以多条)
        &SQL(Insert into HCC_SQL_Document.VitalSign(
        DocumentNo,
        type,
        display,
        value)
        Values(
        :pDocNo,
        'DE04.10.019.00',
        '新生儿入院体重',
        '3500')
        )
        W "HCC_SQL_Document.VitalSign:",SQLCODE,!
        /// 插入生命体征章节(可以多条)
        &SQL(Insert into HCC_SQL_Document.VitalSign(
        DocumentNo,
        type,
        display,
        value)
        Values(
        :pDocNo,
        'DE04.10.019.00',
        '新生儿出生体重',
        '3300')
        )
        W "HCC_SQL_Document.VitalSign:",SQLCODE,!
    }
}

ClassMethod GenSampleFor1(pDocNo As %String = "Doc1") [ Language = objectscript ]
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,1)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入实验室检查章节
   Do ..TestLabTestGenerate(pDocNo)
   ///插入既往史章节
   Do ..TestPastHistoryGenerate(pDocNo)
   ///插入输血章节
   Do ..TestBloodTransfusionGenerate(pDocNo)
   ///插入过敏史章节
   Do ..TestAllergyGenerate(pDocNo)
   ///插入预防接种史章节
   Do ..TestVaccinationGenerate(pDocNo)
   ///插入月经史章节
   Do ..TestMenstrualHistoryGenerate(pDocNo)
   ///插入家族史章节
   Do ..TestFamilyHistoryGenerate(pDocNo)
   ///插入卫生事件章节
   Do ..TestHealthcareEventGenerate(pDocNo)
}

ClassMethod GenSampleFor10(pDocNo As %String = "Doc10")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,10)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入术前诊断章节
   Do ..TestSurgicalOperationNotePreoperativeDXGenerate(pDocNo)
   ///插入现病史章节
   Do ..TestPresentIllnessHistoryGenerate(pDocNo)   
   ///插入过敏史章节 (其既往史章节，其实是过敏史)
   Do ..TestAllergyGenerate(pDocNo)
   ///插入体格检查章节
   Do ..TestPhysicalExamGenerate(pDocNo)
   ///插入实验室检查章节
   Do ..TestLabTestGenerate(pDocNo,"0001")
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
}

ClassMethod GenSampleFor11(pDocNo As %String = "Doc11")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,11)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入实验室检查章节
   Do ..TestLabTestGenerate(pDocNo)
   ///插入生命体征章节
   Do ..TestVitalSignGenerate(pDocNo,11)
   ///插入用药管理章节
   Do ..TestMedicationAdministeredGenerate(pDocNo)
   ///插入术前诊断章节
   Do ..TestSurgicalOperationNotePreoperativeDXGenerate(pDocNo)
   ///插入术后诊断章节
   Do ..TestSurgicalOperationNotePostoperativeDXGenerate(pDocNo)
   ///插入手术操作章节
   Do ..TestProcedureGenerate(pDocNo)
   ///插入输液章节
   Do ..TestInfusionGenerate(pDocNo)
   ///插入输血章节
   Do ..TestBloodTransfusionGenerate(pDocNo)
   ///插入麻醉章节
   Do ..TestAnesthesiaGenerate(pDocNo)
   ///插入主要健康问题章节
   Do ..TestHealthProblemGenerate(pDocNo)
   ///插入失血章节
   Do ..TestBloodLossGenerate(pDocNo)
   ///插入术后去向章节
   Do ..TestProcedureDispositionGenerate(pDocNo)
}

ClassMethod GenSampleFor12(pDocNo As %String = "Doc12")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,12)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入生命体征章节
   Do ..TestVitalSignGenerate(pDocNo,12)
   ///插入一般状况检查章节
   Do ..TestGeneralStatusGenerate(pDocNo)
   ///插入实验室检查章节
   Do ..TestLabTestGenerate(pDocNo)
   ///插入术前诊断章节
   Do ..TestSurgicalOperationNotePreoperativeDXGenerate(pDocNo)
   ///插入术后诊断章节
   Do ..TestSurgicalOperationNotePostoperativeDXGenerate(pDocNo)
   ///插入手术操作章节
   Do ..TestProcedureGenerate(pDocNo)
   ///插入麻醉章节
   Do ..TestAnesthesiaGenerate(pDocNo)
   ///插入主要健康问题章节
   Do ..TestHealthProblemGenerate(pDocNo)
}

ClassMethod GenSampleFor13(pDocNo As %String = "Doc13")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,13)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入实验室检查章节
   Do ..TestLabTestGenerate(pDocNo)
   ///插入主要健康问题章节
   Do ..TestHealthProblemGenerate(pDocNo)
   ///插入输血章节
   Do ..TestBloodTransfusionGenerate(pDocNo)
}

ClassMethod GenSampleFor14(pDocNo As %String = "Doc14")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,14)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入主要健康问题章节
   Do ..TestHealthProblemGenerate(pDocNo)
   ///插入生命体征章节
   Do ..TestVitalSignGenerate(pDocNo,14)
   ///插入既往史章节
   Do ..TestPastHistoryGenerate(pDocNo)
   ///插入产前检查章节
   Do ..TestPrenatalEventGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
}

ClassMethod GenSampleFor15(pDocNo As %String = "Doc15")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,15)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入既往史章节
   Do ..TestPastHistoryGenerate(pDocNo)
   ///插入阴道分娩章节
   Do ..TestVaginalDeliveryGenerate(pDocNo)
   ///插入产后处置章节
   Do ..TestProcessPostDeliveryGenerate(pDocNo)
   ///插入新生儿章节
   Do ..TestNewBornGenerate(pDocNo)
   ///插入分娩评估章节
   Do ..TestDeliveryAssessmentGenerate(pDocNo)
}

ClassMethod GenSampleFor16(pDocNo As %String = "Doc16")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,16)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入手术操作章节
   Do ..TestCaesareanProcedureGenerate(pDocNo)
   ///插入产后处置章节
   Do ..TestProcessPostDeliveryGenerate(pDocNo)
   ///插入新生儿章节
   Do ..TestNewBornGenerate(pDocNo)
   ///插入分娩评估章节
   Do ..TestDeliveryAssessmentGenerate(pDocNo)
}

ClassMethod GenSampleFor17(pDocNo As %String = "Doc17")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,17)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入过敏史章节
   Do ..TestAllergyGenerate(pDocNo)
   ///插入生命体征章节
   Do ..TestVitalSignGenerate(pDocNo,17)
   ///插入四肢章节
   Do ..TestExtremitiesGenerate(pDocNo)
   ///插入健康评估章节
   Do ..TestHealthAssessmentGenerate(pDocNo)
   ///插入健康指导章节
   Do ..TestHealthGuidanceGenerate(pDocNo)
   ///插入护理记录章节
   Do ..TestNursingRecordGenerate(pDocNo)
   ///插入护理观察章节
   Do ..TestNursingObservationGenerate(pDocNo)
   ///插入护理操作章节
   Do ..TestNursingOperationGenerate(pDocNo)
   ///插入手术评估记录标志章节
   Do ..TestProcedureAssessmentGenerate(pDocNo)
   ///插入护理隔离章节
   Do ..TestNursingIsolationGenerate(pDocNo)
}

ClassMethod GenSampleFor18(pDocNo As %String = "Doc18")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,18)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入过敏史章节
   Do ..TestAllergyGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入生命体征章节
   Do ..TestVitalSignGenerate(pDocNo,18)
   ///插入健康评估章节
   Do ..TestHealthAssessmentGenerate(pDocNo)
   ///插入护理记录章节
   Do ..TestNursingRecordGenerate(pDocNo)
   ///插入护理观察章节
   Do ..TestNursingObservationGenerate(pDocNo)
   ///插入护理操作章节
   Do ..TestNursingOperationGenerate(pDocNo)
}

ClassMethod GenSampleFor19(pDocNo As %String = "Doc19")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,19)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入术前诊断章节
   Do ..TestSurgicalOperationNotePreoperativeDXGenerate(pDocNo)
   ///插入生命体征章节
   Do ..TestVitalSignGenerate(pDocNo,19)
   ///插入实验室检查章节
   Do ..TestLabTestGenerate(pDocNo)
   ///插入皮肤章节
   Do ..TestSkinGenerate(pDocNo)
   ///插入过敏史章节
   Do ..TestAllergyGenerate(pDocNo)
   ///插入护理记录章节
   Do ..TestNursingRecordGenerate(pDocNo)
   ///插入护理观察章节
   Do ..TestNursingObservationGenerate(pDocNo)
   ///插入护理操作章节
   Do ..TestNursingOperationGenerate(pDocNo)
   ///插入器械物品核对章节
   Do ..TestInstrumentVerificationGenerate(pDocNo)
   ///插入手术操作章节
   Do ..TestProcedureGenerate(pDocNo)
   ///插入术后交接章节
   Do ..TestPostoperationHandoverGenerate(pDocNo)
}

ClassMethod GenSampleFor2(pDocNo As %String = "Doc2")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,2)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入过敏史章节
   Do ..TestAllergyGenerate(pDocNo)
   ///插入主诉章节
   Do ..TestChiefComplaintGenerate(pDocNo)
   ///插入现病史章节
   Do ..TestPresentIllnessHistoryGenerate(pDocNo)
   ///插入既往史章节
   Do ..TestPastHistoryGenerate(pDocNo)
   ///插入体格检查章节
   Do ..TestPhysicalExamGenerate(pDocNo)
   ///插入实验室检查章节
   Do ..TestLabTestGenerate(pDocNo,"0100")
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入医嘱章节
   Do ..TestProviderOrderGenerate(pDocNo)
}

ClassMethod GenSampleFor20(pDocNo As %String = "Doc20")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,20)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入生命体征章节
   Do ..TestVitalSignGenerate(pDocNo,20)
   ///插入护理观察章节
   Do ..TestNursingObservationGenerate(pDocNo)
}

ClassMethod GenSampleFor21(pDocNo As %String = "Doc21")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,21)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入生命体征章节
   Do ..TestVitalSignGenerate(pDocNo,21)
   ///插入护理记录章节
   Do ..TestNursingRecordGenerate(pDocNo)
   ///插入护理观察章节
   Do ..TestNursingObservationGenerate(pDocNo)
   ///插入护理操作章节
   Do ..TestNursingOperationGenerate(pDocNo)
   ///插入用药章节
   Do ..TestMedicationUseHistoryGenerate(pDocNo)
   ///插入护理标志章节
   Do ..TestNursingSignGenerate(pDocNo)
}

ClassMethod GenSampleFor22(pDocNo As %String = "Doc22")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,22)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入高值耗材章节
   Do ..TestHighValueConsumableGenerate(pDocNo)
}

ClassMethod GenSampleFor23(pDocNo As %String = "Doc23")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,23)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入入院信息章节
   Do ..TestAdmissionInformationGenerate(pDocNo)
   ///插入症状章节
   Do ..TestSymptomGenerate(pDocNo)
   ///插入生命体征章节
   Do ..TestVitalSignGenerate(pDocNo,23)
   ///插入既往史章节
   Do ..TestPastHistoryGenerate(pDocNo)
   ///插入过敏史章节
   Do ..TestAllergyGenerate(pDocNo)
   ///插入家族史章节
   Do ..TestFamilyHistoryGenerate(pDocNo)
   ///插入健康评估章节
   Do ..TestHealthAssessmentGenerate(pDocNo)
   ///插入生活方式章节
   Do ..TestLifeStyleGenerate(pDocNo)
   ///插入入院诊断章节
   Do ..TestHospitalAdmissionDXGenerate(pDocNo)
   ///插入护理观察章节
   Do ..TestNursingObservationGenerate(pDocNo)
}

ClassMethod GenSampleFor24(pDocNo As %String = "Doc24")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,24)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入主要健康问题章节
   Do ..TestHealthProblemGenerate(pDocNo)
   ///插入护理记录章节
   Do ..TestNursingRecordGenerate(pDocNo)
   ///插入健康指导章节
   Do ..TestHealthGuidanceGenerate(pDocNo)
}

ClassMethod GenSampleFor25(pDocNo As %String = "Doc25")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,25)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入出院诊断章节
   Do ..TestHospitalDischargeDXGenerate(pDocNo)
   ///插入健康指导章节
   Do ..TestHealthGuidanceGenerate(pDocNo)
   ///插入健康评估章节
   Do ..TestHealthAssessmentGenerate(pDocNo)
}

ClassMethod GenSampleFor26(pDocNo As %String = "Doc26")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,26)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入术前诊断章节
   Do ..TestSurgicalOperationNotePreoperativeDXGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入意见章节
   Do ..TestSuggestionGenerate(pDocNo)
   ///插入风险章节
   Do ..TestRiskGenerate(pDocNo)
}

ClassMethod GenSampleFor27(pDocNo As %String = "Doc27")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,27)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入术前诊断章节
   Do ..TestSurgicalOperationNotePreoperativeDXGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入意见章节
   Do ..TestSuggestionGenerate(pDocNo)
   ///插入风险章节
   Do ..TestRiskGenerate(pDocNo)
}

ClassMethod GenSampleFor28(pDocNo As %String = "Doc28")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,28)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入输血章节
   Do ..TestBloodTransfusionGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入意见章节
   Do ..TestSuggestionGenerate(pDocNo)
   ///插入风险章节
   Do ..TestRiskGenerate(pDocNo)
}

ClassMethod GenSampleFor29(pDocNo As %String = "Doc29")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,29)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入意见章节
   Do ..TestSuggestionGenerate(pDocNo)
   ///插入风险章节
   Do ..TestRiskGenerate(pDocNo)
}

ClassMethod GenSampleFor3(pDocNo As %String = "Doc3")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,3)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入过敏史章节
   Do ..TestAllergyGenerate(pDocNo)
   ///插入主诉章节
   Do ..TestChiefComplaintGenerate(pDocNo)
   ///插入现病史章节
   Do ..TestPresentIllnessHistoryGenerate(pDocNo)
   ///插入既往史章节
   Do ..TestPastHistoryGenerate(pDocNo)
   ///插入体格检查章节
   Do ..TestPhysicalExamGenerate(pDocNo)
   ///插入实验室检查章节
   Do ..TestLabTestGenerate(pDocNo,"0100")
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入医嘱章节
   Do ..TestProviderOrderGenerate(pDocNo)
   ///插入手术操作章节
   Do ..TestProcedureGenerate(pDocNo)
   ///插入抢救记录章节
   Do ..TestRescueRecordGenerate(pDocNo)
   ///插入住院过程章节
   Do ..TestHospitalCourseGenerate(pDocNo)
   ///插入其他相关信息章节
   Do ..TestOtherGenerate(pDocNo)
}

ClassMethod GenSampleFor30(pDocNo As %String = "Doc30")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,30)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入知情同意章节
   Do ..TestConsentGenerate(pDocNo)
}

ClassMethod GenSampleFor31(pDocNo As %String = "Doc31")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,31)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入知情同意章节
   Do ..TestConsentGenerate(pDocNo)
   ///插入意见章节
   Do ..TestSuggestionGenerate(pDocNo)
}

ClassMethod GenSampleFor32(pDocNo As %String = "Doc32")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,32)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入生命体征章节
   Do ..TestVitalSignGenerate(pDocNo,32)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入主要健康问题章节
   Do ..TestHealthProblemGenerate(pDocNo)
   ///插入转科记录章节
   Do ..TestReferralGenerate(pDocNo)
   ///插入出院诊断章节
   Do ..TestHospitalDischargeDXGenerate(pDocNo)
   ///插入过敏史章节
   Do ..TestAllergyGenerate(pDocNo)
   ///插入实验室检查章节
   Do ..TestLabTestGenerate(pDocNo)
   ///插入手术操作章节
   Do ..TestProcedureGenerate(pDocNo)
   ///插入住院史章节
   Do ..TestHospitalizationGenerate(pDocNo)
   ///插入行政管理章节
   Do ..TestAdministrationGenerate(pDocNo)
   ///插入住院过程章节
   Do ..TestHospitalCourseGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入费用章节
   Do ..TestPaymentGenerate(pDocNo)
}

ClassMethod GenSampleFor33(pDocNo As %String = "Doc33")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,33)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入生命体征章节
   Do ..TestVitalSignGenerate(pDocNo,33)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入主要健康问题章节
   Do ..TestHealthProblemGenerate(pDocNo)
   ///插入转科记录章节
   Do ..TestReferralGenerate(pDocNo)
   ///插入出院诊断章节
   Do ..TestHospitalDischargeDXGenerate(pDocNo)
   ///插入过敏史章节
   Do ..TestAllergyGenerate(pDocNo)
   ///插入实验室检查章节
   Do ..TestLabTestGenerate(pDocNo)
   ///插入手术操作章节
   Do ..TestProcedureGenerate(pDocNo)
   ///插入住院史章节
   Do ..TestHospitalizationGenerate(pDocNo)
   ///插入行政管理章节
   Do ..TestAdministrationGenerate(pDocNo)
   ///插入住院过程章节
   Do ..TestHospitalCourseGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入费用章节
   Do ..TestPaymentGenerate(pDocNo)
}

ClassMethod GenSampleFor34(pDocNo As %String = "Doc34")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,34)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入主诉章节
   Do ..TestChiefComplaintGenerate(pDocNo)
   ///插入现病史章节
   Do ..TestPresentIllnessHistoryGenerate(pDocNo)
   ///插入既往史章节
   Do ..TestPastHistoryGenerate(pDocNo)
   ///插入过敏史章节 (其既有既往史章节，也有过敏史)
   Do ..TestAllergyGenerate(pDocNo)

   ///插入预防接种史章节
   Do ..TestVaccinationGenerate(pDocNo)
   ///插入输血章节
   Do ..TestBloodTransfusionGenerate(pDocNo)
   ///插入月经史章节
   Do ..TestMenstrualHistoryGenerate(pDocNo)
   ///插入家族史章节
   Do ..TestFamilyHistoryGenerate(pDocNo)
   ///插入生命体征章节
   Do ..TestVitalSignGenerate(pDocNo,34)
   ///插入体格检查章节
   Do ..TestPhysicalExamGenerate(pDocNo)
   ///插入辅助检查章节
   Do ..TestSupplementaryExamGenerate(pDocNo)
   ///插入主要健康问题章节
   Do ..TestHealthProblemGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
}

ClassMethod GenSampleFor35(pDocNo As %String = "Doc35")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,35)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入主诉章节
   Do ..TestChiefComplaintGenerate(pDocNo)
   ///插入现病史章节
   Do ..TestPresentIllnessHistoryGenerate(pDocNo)
   ///插入主要健康问题章节
   Do ..TestHealthProblemGenerate(pDocNo)
   ///插入入院诊断章节
   Do ..TestHospitalAdmissionDXGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入住院过程章节
   Do ..TestHospitalCourseGenerate(pDocNo)
   ///插入出院诊断章节
   Do ..TestHospitalDischargeDXGenerate(pDocNo)
   ///插入医嘱章节
   Do ..TestProviderOrderGenerate(pDocNo)
}

ClassMethod GenSampleFor36(pDocNo As %String = "Doc36")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,36)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入主诉章节
   Do ..TestChiefComplaintGenerate(pDocNo)
   ///插入主要健康问题章节
   Do ..TestHealthProblemGenerate(pDocNo)
   ///插入入院诊断章节
   Do ..TestHospitalAdmissionDXGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入住院过程章节
   Do ..TestHospitalCourseGenerate(pDocNo)
}

ClassMethod GenSampleFor37(pDocNo As %String = "Doc37")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,37)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入主诉章节
   Do ..TestChiefComplaintGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
}

ClassMethod GenSampleFor38(pDocNo As %String = "Doc38")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,38)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入主要健康问题章节
   Do ..TestHealthProblemGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入用药章节
   Do ..TestMedicationUseHistoryGenerate(pDocNo)
   ///插入医嘱章节
   Do ..TestProviderOrderGenerate(pDocNo)
}

ClassMethod GenSampleFor39(pDocNo As %String = "Doc39")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,39)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入健康评估章节
   Do ..TestHealthAssessmentGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入用药章节
   Do ..TestMedicationUseHistoryGenerate(pDocNo)
   ///插入医嘱章节
   Do ..TestProviderOrderGenerate(pDocNo)
}

ClassMethod GenSampleFor4(pDocNo As %String = "Doc4")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,4)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入用药章节
   Do ..TestMedicationUseHistoryGenerate(pDocNo)
   ///插入费用章节
   Do ..TestPaymentGenerate(pDocNo)
}

ClassMethod GenSampleFor40(pDocNo As %String = "Doc40")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,40)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入健康评估章节
   Do ..TestHealthAssessmentGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入用药章节
   Do ..TestMedicationUseHistoryGenerate(pDocNo)
}

ClassMethod GenSampleFor41(pDocNo As %String = "Doc41")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,41)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入主诉章节
   Do ..TestChiefComplaintGenerate(pDocNo)
   ///插入入院诊断章节
   Do ..TestHospitalAdmissionDXGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入住院过程章节
   Do ..TestHospitalCourseGenerate(pDocNo)
}

ClassMethod GenSampleFor42(pDocNo As %String = "Doc42")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,42)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入主诉章节
   Do ..TestChiefComplaintGenerate(pDocNo)
   ///插入入院诊断章节
   Do ..TestHospitalAdmissionDXGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入转科记录章节
   Do ..TestReferralGenerate(pDocNo)
   ///插入用药章节
   Do ..TestMedicationUseHistoryGenerate(pDocNo)
   ///插入住院过程章节
   Do ..TestHospitalCourseGenerate(pDocNo)
}

ClassMethod GenSampleFor43(pDocNo As %String = "Doc43")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,43)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入主诉章节
   Do ..TestChiefComplaintGenerate(pDocNo)
   ///插入入院诊断章节
   Do ..TestHospitalAdmissionDXGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入用药章节
   Do ..TestMedicationUseHistoryGenerate(pDocNo)
   ///插入住院过程章节
   Do ..TestHospitalCourseGenerate(pDocNo)
}

ClassMethod GenSampleFor44(pDocNo As %String = "Doc44")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,44)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入手术操作章节
   Do ..TestProcedureGenerate(pDocNo)
   ///插入实验室检查章节
   Do ..TestLabTestGenerate(pDocNo,"1000")
}

ClassMethod GenSampleFor45(pDocNo As %String = "Doc45")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,45)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入健康评估章节
   Do ..TestHealthAssessmentGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入辅助检查章节
   Do ..TestSupplementaryExamGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入会诊原因章节
   Do ..TestConsultReasonGenerate(pDocNo)
   ///插入会诊意见章节
   Do ..TestConsultSuggestionGenerate(pDocNo)
   ///插入住院过程章节
   Do ..TestHospitalCourseGenerate(pDocNo)
}

ClassMethod GenSampleFor46(pDocNo As %String = "Doc46")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,46)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入病历摘要章节
   Do ..TestMRSummaryGenerate(pDocNo)
   ///插入术前诊断章节
   Do ..TestSurgicalOperationNotePreoperativeDXGenerate(pDocNo)
   ///插入过敏史章节 (其既往史章节，其实是过敏史)
   Do ..TestAllergyGenerate(pDocNo)

   ///插入辅助检查章节
   Do ..TestSupplementaryExamGenerate(pDocNo)
   ///插入手术操作章节
   Do ..TestProcedureGenerate(pDocNo)
   ///插入会诊意见章节
   Do ..TestConsultSuggestionGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入注意事项章节
   Do ..TestAttentionGenerate(pDocNo)
}

ClassMethod GenSampleFor47(pDocNo As %String = "Doc47")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,47)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入术前诊断章节
   Do ..TestSurgicalOperationNotePreoperativeDXGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入手术操作章节
   Do ..TestProcedureGenerate(pDocNo)
   ///插入术前总结章节
   Do ..TestPreoperativeSummaryGenerate(pDocNo)
}

ClassMethod GenSampleFor48(pDocNo As %String = "Doc48")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,48)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入手术操作章节
   Do ..TestProcedureGenerate(pDocNo)
   ///插入术后诊断章节
   Do ..TestSurgicalOperationNotePostoperativeDXGenerate(pDocNo)
   ///插入注意事项章节
   Do ..TestAttentionGenerate(pDocNo)
}

ClassMethod GenSampleFor49(pDocNo As %String = "Doc49")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,49)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入主要健康问题章节
   Do ..TestHealthProblemGenerate(pDocNo)
   ///插入入院诊断章节
   Do ..TestHospitalAdmissionDXGenerate(pDocNo)
   ///插入住院过程章节
   Do ..TestHospitalCourseGenerate(pDocNo)
   ///插入医嘱章节
   Do ..TestProviderOrderGenerate(pDocNo)
   ///插入出院诊断章节
   Do ..TestHospitalDischargeDXGenerate(pDocNo)
}

ClassMethod GenSampleFor5(pDocNo As %String = "Doc5")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,5)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入用药章节
   Do ..TestMedicationUseHistoryGenerate(pDocNo)
   ///插入费用章节
   Do ..TestPaymentGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
}

ClassMethod GenSampleFor50(pDocNo As %String = "Doc50")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,50)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入入院诊断章节
   Do ..TestHospitalAdmissionDXGenerate(pDocNo)
   ///插入住院过程章节
   Do ..TestHospitalCourseGenerate(pDocNo)
   ///插入死亡原因章节
   Do ..TestDeathReasonGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入尸检意见章节
   Do ..TestAutopsyOpinionGenerate(pDocNo)
}

ClassMethod GenSampleFor51(pDocNo As %String = "Doc51")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,51)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入死亡原因章节
   Do ..TestDeathReasonGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入讨论内容章节
   Do ..TestDiscussionGenerate(pDocNo)
   ///插入讨论总结章节
   Do ..TestDiscussionSummaryGenerate(pDocNo)
}

ClassMethod GenSampleFor52(pDocNo As %String = "Doc52")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,52)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入生命体征章节
   Do ..TestVitalSignGenerate(pDocNo,52)
   ///插入医嘱章节
   Do ..TestProviderOrderGenerate(pDocNo)
}

ClassMethod GenSampleFor53(pDocNo As %String = "Doc53")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,53)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入主要健康问题章节
   Do ..TestHealthProblemGenerate(pDocNo)
   ///插入入院诊断章节
   Do ..TestHospitalAdmissionDXGenerate(pDocNo)
   ///插入出院诊断章节
   Do ..TestHospitalDischargeDXGenerate(pDocNo)
   ///插入手术操作章节
   Do ..TestProcedureGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入住院过程章节
   Do ..TestHospitalCourseGenerate(pDocNo)
   ///插入医嘱章节
   Do ..TestProviderOrderGenerate(pDocNo)
   ///插入实验室检查章节
   Do ..TestLabTestGenerate(pDocNo,"0010")
}

ClassMethod GenSampleFor6(pDocNo As %String = "Doc6")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,6)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入主诉章节
   Do ..TestChiefComplaintGenerate(pDocNo)
   ///插入症状章节
   Do ..TestSymptomGenerate(pDocNo)
   ///插入手术操作章节
   Do ..TestProcedureGenerate(pDocNo)
   ///插入体格检查章节
   Do ..TestPhysicalExamGenerate(pDocNo)
   ///插入其他处置章节
   Do ..TestOtherProcGenerate(pDocNo)
   ///插入检查报告章节
   Do ..TestCheckReportGenerate(pDocNo)
}

ClassMethod GenSampleFor7(pDocNo As %String = "Doc7")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,7)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入诊断记录章节
   Do ..TestDiagnosisGenerate(pDocNo)
   ///插入实验室检查章节
   Do ..TestLabTestGenerate(pDocNo,"100")
   ///插入检验报告章节
   Do ..TestLabReportGenerate(pDocNo)
}

ClassMethod GenSampleFor8(pDocNo As %String = "Doc8")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,8)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入既往史章节
   Do ..TestPastHistoryGenerate(pDocNo)
   ///插入生命体征章节
   Do ..TestVitalSignGenerate(pDocNo,8)
   ///插入入院诊断章节
   Do ..TestHospitalAdmissionDXGenerate(pDocNo)
   ///插入治疗计划章节
   Do ..TestTreatmentPlanGenerate(pDocNo)
   ///插入手术操作章节
   Do ..TestProcedureGenerate(pDocNo)
   ///插入用药管理章节
   Do ..TestMedicationAdministeredGenerate(pDocNo)
}

ClassMethod GenSampleFor9(pDocNo As %String = "Doc9")
{
   #SQLCompile Select=ODBC 
   /// 插入文档
   Do ..TestDocumentGenerate(pDocNo,9)
   /// 插入文档头
   Do ..TestHeaderGenerate(pDocNo)
   ///插入既往史章节
   Do ..TestPastHistoryGenerate(pDocNo)
   ///插入术前诊断章节
   Do ..TestSurgicalOperationNotePreoperativeDXGenerate(pDocNo)
   ///插入手术操作章节
   Do ..TestProcedureGenerate(pDocNo)
   ///插入失血章节
   Do ..TestBloodLossGenerate(pDocNo)
   ///插入输血章节
   Do ..TestBloodTransfusionGenerate(pDocNo)
   ///插入用药章节
   Do ..TestMedicationUseHistoryGenerate(pDocNo)
   ///插入输液章节
   Do ..TestInfusionGenerate(pDocNo)
   ///插入术后诊断章节
   Do ..TestSurgicalOperationNotePostoperativeDXGenerate(pDocNo)
   ///插入手术过程描述章节
   Do ..TestProcedureNoteGenerate(pDocNo)
   ///插入引流章节
   Do ..TestSurgicalDrainsGenerate(pDocNo)
}

}
