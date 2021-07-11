/// Author: QP
/// Version: 1.0
/// Date: 2021/07/04
/// tools for HCC SQL schema
Class HCC.SQL.Tools Extends %RegisteredObject
{

ClassMethod Test1()
{
    
    Set tDocType = 53
    &SQL(SELECT DocumentSection,Cardinality INTO :DocSec(),:Card() FROM HCC_SQL.DocumentConfig WHERE DocumentType=:tDocType)
    zw DocSec
}

/// 产生互联互通文档
/// pDocNo: 文档号
/// pDoc：产生的XML文档，以字符串保存
/// 返回值为%Status，标识是否产生成功
ClassMethod GenerateHCCDocument(pDocNo, Output pDoc) As %Status
{
    Set tErrlog="", tSC = $$$OK
    
    Set tSec("生命体征章节")=$lb("VitalSigns","HCC.SQL.Document.VitalSign")
    Set tSec("诊断记录章节")=$lb("Diagnosis","HCC.SQL.Document.Diagnosis")
    Set tSec("主要健康问题章节")=$lb("Problem","HCC.SQL.Document.HealthProblem")
    Set tSec("转科记录章节")=$lb("Referral","HCC.SQL.Document.Referral")
    Set tSec("出院诊断章节")=$lb("DisDiag","HCC.SQL.Document.HospitalDischargeDX")
    Set tSec("过敏史章节")=$lb("Allergies","HCC.SQL.Document.Allergy")
    Set tSec("实验室检查章节")=$lb("LabTests","HCC.SQL.Document.LabTest")
    Set tSec("手术操作章节")=$lb("Procedure","HCC.SQL.Document.Procedure")
    Set tSec("住院史章节")=$lb("Hospitalization","HCC.SQL.Document.Hospitalization")
    Set tSec("住院过程章节")=$lb("HospitalizationProcess","HCC.SQL.Document.HospitalizationProcess")
    Set tSec("行政管理章节")=$lb("Administration","HCC.SQL.Document.Administration")
    Set tSec("治疗计划章节")=$lb("CarePlan","HCC.SQL.Document.TreatmentPlan")
    Set tSec("费用章节")=$lb("Payment","HCC.SQL.Document.Payment")


    Set tDoc = ##class(HCC.SQL.Document).%OpenId(pDocNo)
    Quit:(tDoc="") $$$ERROR(-100001,"文档不存在:"_pDocNo)
    
    Set tDocHeader = ##class(HCC.SQL.Document.Header).%OpenId(pDocNo)
    Quit:(tDocHeader="") $$$ERROR(-100001,"文档不存在:"_pDocNo)
    // 关联就诊场景
    Set tDocHeader.EncompassingEncounter = ##class(HCC.SQL.Document.Header.EncompassingEncounter).%OpenId(pDocNo)
    Do tDocHeader.%Save()
    // 管理文档头
    Set tDoc.Header = tDocHeader
    
    Set tDocType = tDoc.DocumentType
    Set tSQL="SELECT DocumentSection,Cardinality FROM WS_DOC.DocumentConfig WHERE DocumentType="_tDocType
    set tStatement=##class(%SQL.Statement).%New()
    set tSC=tStatement.%Prepare(tSQL)
    if $$$ISERR(tSC) { do $system.OBJ.DisplayError(tSC) }
    set tRS=tStatement.%Execute()
    while tRS.%Next() 
    {
        Set tSecName = tRS.%Get("DocumentSection"), tCard = tRS.%Get("Cardinality")
        Set tPropName = $lg(tSec(tSecName),1),tPropclass = $lg(tSec(tSecName),2)
        
        // relationships
        If (tSecName="生命体征章节")||(tSecName="过敏史章节")||(tSecName="实验室检查章节")
        {
            Set x=$PROPERTY(tDoc,tPropName)
            If ((tCard="1..1") && (x.Count()=0))
            {
                Set tErrlog = tErrlog_" 缺失"_tSecName_";"
            }
            
        }
        Else // properties
        {
            //Set $PROPERTY(tDoc,tPropName)=pDocNo
            Set $PROPERTY(tDoc,tPropName)=$CLASSMETHOD(tPropclass,"%OpenId",pDocNo)
            If ((tCard="1..1") && ($PROPERTY(tDoc,tPropName)=""))
            {
                Set tErrlog = tErrlog_" 缺失"_tSecName_";"
            }
        }
        
    }
    Set tSC = tDoc.%Save()
    Quit:(tErrlog '="") $$$ERROR(-100001,tErrlog)
    
    S tSC = tDoc.XMLExportToString(.pDoc)
    Quit tSC
}

/// 保存转换好的互联互通文档
Method StoreHCCDoc() As %Status
{
}

ClassMethod TestDocGenerate()
{
    /// 插入文档
    &SQL(insert into HCC_SQL.Document(
    DocumentNo,
    DocumentType)
    values(
    'Doc123456'/*DocumentNo*/,
    '32')
    )
        
    /// 先插入文档头
    &SQL(insert into HCC_SQL_Document.Header(
    DocumentNo,
    Activity_code,
    Activity_confidentialityCode,
    Activity_effectiveTime,
    Activity_languageCode,
    Activity_setId,
    Activity_versionNumber,
    Author_assignedPerson_id,
    Author_assignedPerson_name,
    Author_author_id,
    Author_time,
    Custodian_organization_id,
    Custodian_organization_name,
    RecordTarget_MRN_Value,
    RecordTarget_addr_city_Value,
    RecordTarget_addr_county_Value,
    RecordTarget_addr_houseNumber_Value,
    RecordTarget_addr_postalCode_Value,
    RecordTarget_addr_state_Value,
    RecordTarget_addr_streetName_Value,
    RecordTarget_addr_township_Value,
    RecordTarget_patient_administrativeGender_Value,
    RecordTarget_patient_age_Value,
    RecordTarget_patient_birthTime_Value,
    RecordTarget_patient_birthplace_city_Value,
    RecordTarget_patient_birthplace_county_Value,
    RecordTarget_patient_birthplace_postalCode_Value,
    RecordTarget_patient_birthplace_state_Value,
    RecordTarget_employer_addr_city_Value,
    RecordTarget_employer_addr_county_Value,
    RecordTarget_employer_addr_houseNumber_Value,
    RecordTarget_employer_addr_postalCode_Value,
    RecordTarget_employer_addr_state_Value,
    RecordTarget_employer_addr_streetName_Value,
    RecordTarget_employer_addr_township_Value,
    RecordTarget_employer_name_Value,
    RecordTarget_employer_telcom_Value,
    RecordTarget_patient_ethnicGroupCode_Value,
    RecordTarget_healthCardId_Value,
    RecordTarget_patient_household_city_Value,
    RecordTarget_patient_household_county_Value,
    RecordTarget_patient_household_houseNumber_Value,
    RecordTarget_patient_household_postalCode_Value,
    RecordTarget_patient_household_state_Value,
    RecordTarget_patient_household_streetName_Value,
    RecordTarget_patient_household_township_Value,
    RecordTarget_patient_maritalStatusCode_Value,
    RecordTarget_patient_nationality_Value,
    RecordTarget_patient_nativePlace_city_Value,
    RecordTarget_patient_nativePlace_state_Value,
    RecordTarget_patient_occupationCode_Value,
    RecordTarget_patient_id_Value,
    RecordTarget_patient_name_Value,
    RecordTarget_providerOrganization_id_Value,
    RecordTarget_providerOrganization_name,
    RecordTarget_telcom_Value) 
    values(
    'Doc123456'/*DocumentNo*/,
    'C0032'/*Activity_code*/,
    'N'/*Activity_confidentialityCode*/,
    '20200928153937'/*Activity_effectiveTime*/,
    'zh-CN'/*Activity_languageCode*/,
    ''/*Activity_setId*/,
    ''/*Activity_versionNumber*/,
    '1003'/*Author_assignedPerson_id*/,
    '张医生'/*Author_assignedPerson_name*/,
    ''/*Author_author_id*/,
    '2020-09-29 00:00:00'/*Author_time*/,
    '1234567890'/*Custodian_organization_id*/,
    '系联总医院'/*Custodian_organization_name*/,
    'MRN123456'/*RecordTarget_MRN_Value*/,
    '北京'/*RecordTarget_addr_city_Value*/,
    '朝阳区'/*RecordTarget_addr_county_Value*/,
    '2号银泰写字楼C座2701-2702室'/*RecordTarget_addr_houseNumber_Value*/,
    '100022'/*RecordTarget_addr_postalCode_Value*/,
    '北京'/*RecordTarget_addr_state_Value*/,
    '建国门外大街'/*RecordTarget_addr_streetName_Value*/,
    ''/*RecordTarget_addr_township_Value*/,
    '0'/*RecordTarget_patient_administrativeGender_Value*/,
    '35'/*RecordTarget_patient_age_Value*/,
    '19861001'/*RecordTarget_patient_birthTime_Value*/,
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
    'HC110220198610010990'/*RecordTarget_healthCardId_Value*/,
    '北京'/*RecordTarget_patient_household_city_Value*/,
    '朝阳区'/*RecordTarget_patient_household_county_Value*/,
    '2号银泰写字楼C座2701-2702室'/*RecordTarget_patient_household_houseNumber_Value*/,
    '100022'/*RecordTarget_patient_household_postalCode_Value*/,
    '北京'/*RecordTarget_patient_household_state_Value*/,
    '建国门外大街'/*RecordTarget_patient_household_streetName_Value*/,
    ''/*RecordTarget_patient_household_township_Value*/,
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
    
    /// 插入医生签名信息，法定审核者
    &SQL(insert into HCC_SQL_Document_Header.LegalAuthenticator(
    DocumentNo,
    assignedEntity_code,
    assignedEntity_id,
    signature_code,
    assignedPerson_name_Value,
    time_Value)
    Values(
    'Doc123456'/*DocumentNo*/,
    '1001'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '科主任'/*signature_code*/,
    '王主任'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )

    /// 插入医生签名信息，法定审核者(可以多条)
    &SQL(insert into HCC_SQL_Document_Header.Authenticator(
    DocumentNo,
    assignedEntity_code,
    assignedEntity_id,
    signature_code,
    assignedPerson_name_Value,
    time_Value)
    Values(
    'Doc123456'/*DocumentNo*/,
    '1002'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '主任(副主任)医师'/*signature_code*/,
    '郑副主任'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )
    
    &SQL(insert into HCC_SQL_Document_Header.Authenticator(
    DocumentNo,
    assignedEntity_code,
    assignedEntity_id,
    signature_code,
    assignedPerson_name_Value,
    time_Value)
    Values(
    'Doc123456'/*DocumentNo*/,
    '1003'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '主治医师'/*signature_code*/,
    '张医生'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )
    
    &SQL(insert into HCC_SQL_Document_Header.Authenticator(
    DocumentNo,
    assignedEntity_code,
    assignedEntity_id,
    signature_code,
    assignedPerson_name_Value,
    time_Value)
    Values(
    'Doc123456'/*DocumentNo*/,
    '1004'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '住院医师'/*signature_code*/,
    '周医生'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )
    
    &SQL(insert into HCC_SQL_Document_Header.Authenticator(
    DocumentNo,
    assignedEntity_code,
    assignedEntity_id,
    signature_code,
    assignedPerson_name_Value,
    time_Value)
    Values(
    'Doc123456'/*DocumentNo*/,
    '1005'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '责任护士'/*signature_code*/,
    '赵护士'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )
    
    &SQL(insert into HCC_SQL_Document_Header.Authenticator(
    DocumentNo,
    assignedEntity_code,
    assignedEntity_id,
    signature_code,
    assignedPerson_name_Value,
    time_Value)
    Values(
    'Doc123456'/*DocumentNo*/,
    '1006'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '进修医师'/*signature_code*/,
    '钱医生'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )
    
    &SQL(insert into HCC_SQL_Document_Header.Authenticator(
    DocumentNo,
    assignedEntity_code,
    assignedEntity_id,
    signature_code,
    assignedPerson_name_Value,
    time_Value)
    Values(
    'Doc123456'/*DocumentNo*/,
    '1007'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '实习医师'/*signature_code*/,
    '孙医生'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )
    
    &SQL(insert into HCC_SQL_Document_Header.Authenticator(
    DocumentNo,
    assignedEntity_code,
    assignedEntity_id,
    signature_code,
    assignedPerson_name_Value,
    time_Value)
    Values(
    'Doc123456'/*DocumentNo*/,
    '1008'/*assignedEntity_code*/,
    '2.16.156.10011.1.4'/*assignedEntity_id*/,
    '编码员'/*signature_code*/,
    '吴编码员'/*assignedPerson_name_Value*/,
    '2020-09-29 10:30:00'/*time_Value*/
    )
    )

    /// 插入联系人(可以多条)
    &SQL(insert into HCC_SQL_Document_Header.Participant(
    DocumentNo,
    addr_city_Value,
    addr_county_Value,
    addr_houseNumber_Value,
    addr_postalCode_Value,
    addr_state_Value,
    addr_streetName_Value,
    addr_township_Value,
    asociatedPerson_name_Value,
    associatedEntity_code_Value,
    telcom_Value)
    Values(
    'Doc123456'/*DocumentNo*/,
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
    
    /// 插入关联活动(可以多条)
    &SQL(insert into HCC_SQL_Document_Header.RelatedDocument(
    DocumentNo,
    parentDocument_id,
    parentDocument_setId,
    parentDocument_versionNumber)
    Values(
    'Doc123456'/*DocumentNo*/,
    null/*parentDocument_id*/,
    null/*parentDocument_setId*/,
    null/*parentDocument_versionNumber*/)
    )
    
    /// 插入就诊场景
    &SQL(insert into HCC_SQL_Document_Header.EncompassingEncounter(
    DocumentNo,
    admission_code_Value,
    effectiveTime_high_Value,
    effectiveTime_low_Value)
    Values(
    'Doc123456'/*DocumentNo*/,
    '2'/*admission_code_Value*/,
    '2020-09-20 10:30:00'/*effectiveTime_high_Value*/,
    '2020-09-29 09:30:00'/*effectiveTime_low_Value*/)
    )
    /// 插入就诊场景 - 
    &SQL(insert into HCC_SQL_Document_Header_EncompassingEncounter.Location(
    Encounter,
    asOrganizationPartOf_id,
    wholeOrganization_id,
    asOrganizationPartOf_name_Value,
    wholeOrganization_name_Value)
    Values(
    'Doc123456'/*Encounter*/,
    '2'/*asOrganizationPartOf_id*/,
    '203'/*wholeOrganization_id*/,
    '神经外科'/*asOrganizationPartOf_name_Value*/,
    '3病房'/*wholeOrganization_name_Value*/)
    )


    /// 插入生命体征章节(可以多条)
    &SQL(Insert into HCC_SQL_Document.VitalSign(
    DocumentNo,
    type,
    display,
    value)
    Values(
    'Doc123456',
    'DE04.10.019.00',
    '新生儿入院体重',
    '3500')
    )
    /// 插入生命体征章节(可以多条)
    &SQL(Insert into HCC_SQL_Document.VitalSign(
    DocumentNo,
    type,
    display,
    value)
    Values(
    'Doc123456',
    'DE04.10.019.00',
    '新生儿出生体重',
    '3300')
    )

    /// 插入诊断记录章节
    &SQL(Insert into HCC_SQL_Document.Diagnosis(DocumentNo)
    values('Doc123456')
    )
    /// 诊断记录章节- 门急诊(可以多条)
    &SQL(Insert into HCC_SQL_Document_Diagnosis.Outpatient(
    DocumentNo,
    diagnosis_code_Value,
    diagnosis_name_Value)
    values(
    'Doc123456',
    '',
    '脑积水')
    )
    /// 诊断记录章节- 门急诊(可以多条)
    &SQL(Insert into HCC_SQL_Document_Diagnosis.Outpatient(
    DocumentNo,
    diagnosis_code_Value,
    diagnosis_name_Value)
    values(
    'Doc123456',
    'G91',
    '')
    )
    /// 诊断记录章节- 病理(可以多条)
    &SQL(Insert into HCC_SQL_Document_Diagnosis.Pathology(
    DocumentNo,
    pathology_no_Value,
    diagnosis_code_Value,
    diagnosis_name_Value)
    values(
    'Doc123456',
    'P123456',
    'B95',
    '')
    )
    
    /// 插入主要健康问题章节
    &SQL(Insert into HCC_SQL_Document.HealthProblem(
    DocumentNo,
    comaAfterAdmit_comaAfterAdmit_days_Value,
    comaAfterAdmit_comaAfterAdmit_hours_Value,
    comaAfterAdmit_comaAfterAdmit_minutes_Value,
    comaBeforeAdmit_comaBeforeAdmit_days_Value,
    comaBeforeAdmit_comaBeforeAdmit_hours_Value,
    comaBeforeAdmit_comaBeforeAdmit_minutes_Value,
    damage_diag_Value,
    damage_reason_Value,
    sick_condition_Value)
    values(
    'Doc123456',
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

    /// 插入转科记录章节
    &SQL(Insert into HCC_SQL_Document.Referral(
    DocumentNo,
    /*referral_type_Value,*/
    referral_reason_Value,
    referral_source_Value,
    referral_target_Value)
    values(
    'Doc123456',
    '',
    '',
    '神经外科')
    )

    /// 插入出院诊断章节
    &SQL(Insert into HCC_SQL_Document.HospitalDischargeDX(
    DocumentNo,
    dischargeDisposition_Value,
    receivingOrganization_Value)
    values(
    'Doc123456',
    '1',
    '系联社区医院')
    )
    /// 插入出院诊断章节 - 主要诊断(可以多条)
    &SQL(Insert into HCC_SQL_Document_HospitalDischargeDX."Primary"(
    DocumentNo,
    effectiveTime,
    diagnosis_code_Value,
    diagnosis_name_Value,
    sickCondition_Value)
    values(
    'Doc123456',
    '2020-09-20 10:00:00',
    'G91',
    '脑积液',
    '3')
    )
    /// 插入出院诊断章节 - 其它诊断 (可以多条)
    &SQL(Insert into HCC_SQL_Document_HospitalDischargeDX.Other(
    DocumentNo,
    effectiveTime,
    diagnosis_code_Value,
    diagnosis_name_Value,
    sickCondition_Value)
    values(
    'Doc123456',
    '2020-09-20 10:00:00',
    'B95',
    'B族链球菌感染',
    '3')
    )

    /// 插入过敏史章节- 过敏 (可以多条)
    &SQL(Insert into HCC_SQL_Document.Allergy(
    DocumentNo,
    effective_time,
    value_Value)
    values(
    'Doc123456',
    null,
    '无')
    )

    /// 插入实验室检查章节(可以多条)
    &SQL(Insert into HCC_SQL_Document.LabTest(
    DocumentNo,
    type,
    value)
    values(
    'Doc123456',
    'DE04.50.001.00',
    '1')
    )
    &SQL(Insert into HCC_SQL_Document.LabTest(
    DocumentNo,
    type,
    value)
    values(
    'Doc123456',
    'DE04.50.010.00',
    '2')
    )
    

    /// 插入手术操作章节
    &SQL(Insert into HCC_SQL_Document."Procedure"(
    DocumentNo,
    anesthesia_doctor_Value,
    anesthesia_method_Value,
    cut_level_Value,
    healing_level_Value,
    primary_assistant_Value,
    procedure_Value,
    procedure_class_Value,
    procedure_doctor_Value,
    procedure_name_Value,
    procedure_time_Value,
    second_assistant_Value)
    values(
    'Doc123456',
    '周七'/*anesthesia_doctor_Value*/,
    '1'/*anesthesia_method_Value*/,
    '1'/*cut_level_Value*/,
    null/*healing_level_Value*/,
    '王五'/*primary_assistant_Value*/,
    '84.51004'/*procedure_Value*/,
    '1'/*procedure_class_Value*/,
    '张三'/*procedure_doctor_Value*/,
    '金属脊椎融合物置入术'/*procedure_name_Value*/,
    '2020-09-21 09:30:00'/*procedure_time_Value*/,
    '赵六'/*second_assistant_Value*/)
    )

    /// 插入住院史章节
    &SQL(Insert into HCC_SQL_Document.Hospitalization(
    DocumentNo,
    hospitalization_count_value)
    values(
    'Doc123456',
    '1')
    )

    /// 插入住院过程节
    &SQL(Insert into HCC_SQL_Document.HospitalizationProcess(
    DocumentNo,
    discharge_department_Value,
    discharge_ward_Value,
    staydays_Value)
    values(
    'Doc123456',
    '神经外科',
    '四病房',
    '10')
    )

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
    'Doc123456',
    '一级',
    '1',
    '2020-09-22',
    '李主任',
    '吴护士',
    '0')
    )

    /// 插入治疗计划章节
    &SQL(Insert into HCC_SQL_Document.TreatmentPlan(
    DocumentNo,
    readmission_Value,
    readmission_reason_Value)
    values(
    'Doc123456',
    '1',
    '回院复查')
    )

    /// 插入费用章节
    /*
    &SQL(Insert into HCC_SQL_Document.Payment(
    DocumentNo,
    payment_way_Value,
    blood_Value,
    medicine_Value,
    antibacterial_Value,
    TCM_herb_Value,
    TCM_patent_Value,
    TCM_treatment_Value,
    albumin_Value,
    cellfactor_Value,
    clotfactor_Value,
    consumable_exam_Value,
    consumable_surgery_Value,
    consumable_treamtment_Value,
    diag_diagnosis_Value,
    diag_image_Value,
    diag_lab_Value,
    diag_pathology_Value,
    general_nurse_Value,
    general_other_Value,
    general_service_Value,
    general_treatment_Value,
    globulin_Value,
    other_Value,
    patient_pay_Value,
    rehabilitation_Value,
    total_Value,
    treatment_anesthesia_Value,
    treatment_nonSurgery_Value,
    treatment_physical_Value,
    treatment_surgery_Value,
    treatment_surgery_operation_Value)
    values(
    'Doc123456',)
     )
     */
    &SQL(Insert into HCC_SQL_Document.Payment(
    DocumentNo,
    payment_way_Value,
    TCMFee_herb_Value,
    TCMFee_patent_Value,
    TCM_treatment_Value,
    bloodFee_albumin_Value,
    bloodFee_blood_Value,
    bloodFee_cellfactor_Value,
    bloodFee_clotfactor_Value,
    bloodFee_globulin_Value,
    consumableFee_exam_Value,
    consumableFee_surgery_Value,
    consumableFee_treamtment_Value,
    diagFee_diagnosis_Value,
    diagFee_image_Value,
    diagFee_lab_Value,
    diagFee_pathology_Value,
    generalFee_nurse_Value,
    generalFee_other_Value,
    generalFee_service_Value,
    generalFee_treatment_Value,
    medicineFee_antibacterialFee_antibacterial_Value,
    medicineFee_medicine_Value,
    other_Value,
    rehabilitation_Value,
    totalFee_patientPay_patient_Value,
    totalFee_total_Value,
    treatmentFee_SurgeryFee_detail_anesthesia_Value,
    treatmentFee_SurgeryFee_detail_surgery_Value,
    treatmentFee_SurgeryFee_surgery_Value,
    treatmentFee_nonSurgeryFee_nonSurgery_Value,
    treatmentFee_nonSurgeryFee_physical_physical_Value)
    values(
    'Doc123456',
    '99'    /*  payment_way_Value   */,
    '1000'  /*  blood_Value */,
    '1001'  /*  medicine_Value  */,
    '1002'  /*  antibacterial_Value */,
    '1003'  /*  TCM_herb_Value  */,
    '1004'  /*  TCM_patent_Value    */,
    '1005'  /*  TCM_treatment_Value */,
    '1006'  /*  albumin_Value   */,
    '1007'  /*  cellfactor_Value    */,
    '1008'  /*  clotfactor_Value    */,
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
    '1020'  /*  globulin_Value  */,
    '1021'  /*  other_Value */,
    '1022'  /*  patient_pay_Value   */,
    '1023'  /*  rehabilitation_Value    */,
    '1024'  /*  total_Value */,
    '1025'  /*  treatment_anesthesia_Value  */,
    '1026'  /*  treatment_nonSurgery_Value  */,
    '1027'  /*  treatment_physical_Value    */,
    '1028'  /*  treatment_surgery_Value */,
    '1029'  /*  treatment_surgery_operation_Value   */)
     )
}

ClassMethod Test()
{
    w ##class(WS.DE.Tools).GetValueSetDisplay("WS.DE.DE045004100",1)
}

ClassMethod Run()
{
    Set tSQL = "SELECT id FROM %Dictionary.classDefinition where id %startswith 'WS.DE.DE'"
    set tStatement=##class(%SQL.Statement).%New()
    set tSC=tStatement.%Prepare(tSQL)
    if $$$ISERR(tSC) { do $system.OBJ.DisplayError(tSC) }
    set tRS=tStatement.%Execute()
    while tRS.%Next() 
    {
        Set tClassName = tRS.%Get("id")
        Set tClass=##class(%Dictionary.ClassDefinition).%OpenId(tClassName)
        Set tClass.Super ="WS.DE.Base"
        w tClass.%Save(),!
        Do $System.OBJ.Compile(tClassName,"cukfvo1")
    }
    k tRS
}

/// 修改数据元
/// pDataElementName
/// 
ClassMethod ModifyDataElement() As %Status
{
}

/// 查询数据元
/// 投射为视图HCC_SQL.DataElements
Query DataElements() As %SQLQuery(CONTAINID = 1) [ SqlView ]
{
SELECT category.parent as name,category._Default as category,descr._Default as description,format._Default as format,valueset._Default as valueset,dt._Default as datatype
from 
(SELECT parent, _Default
FROM %Dictionary.ParameterDefinition where parent %Startswith 'WS.DE.DE'
and name='Category') category,
(SELECT parent, _Default
FROM %Dictionary.ParameterDefinition where parent %Startswith 'WS.DE.DE'
and name='Description') descr,
(SELECT parent, _Default
FROM %Dictionary.ParameterDefinition where parent %Startswith 'WS.DE.DE'
and name='Format') format,
(SELECT parent, _Default
FROM %Dictionary.ParameterDefinition where parent %Startswith 'WS.DE.DE'
and name='ValueSet') valueset,
(SELECT parent, _Default
FROM %Dictionary.ParameterDefinition where parent %Startswith 'WS.DE.DE'
and name='WSDT') dt
where category.parent=valueset.parent
  and category.parent=descr.parent
  and category.parent=format.parent
  and category.parent=dt.parent
}

}
