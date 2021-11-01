<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc"
    xmlns:isc="http://extension-functions.intersystems.com" xmlns:exsl="http://exslt.org/common"
    xmlns:set="http://exslt.org/sets" exclude-result-prefixes="isc sdtc exsl set"> 
    <xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
    <xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/Document">
        <ClinicalDocument xsi:schemaLocation="urn:hl7-org:v3 ../sdschemas/CDA.xsd">
            <!--文档活动类信息-->
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.21"/>
            <!--文档流水号-->
            <xsl:call-template name="DocumentNo"/>
            <title>西药处方</title>
            <!--文档机器生成时间-->
            <xsl:call-template name="effectiveTime"/>
            <xsl:call-template name="Confidentiality"/>
            <languageCode code="zh-CN"/>
            <setId/>
            <versionNumber value="{Version}"/>
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <xsl:apply-templates select="Header/recordTarget/healthRecordId" mode="healthRecordNumber"/>  
                    <xsl:apply-templates select="Header/recordTarget/outpatientNum" mode="outpatientNum"/>  
                    <xsl:comment>患者基本信息</xsl:comment>           
                    <!--患者信息-->
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>
                        <!--患者姓名，必选-->
                        <xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
                        <!-- 性别，必选 -->
                        <xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
                        <!-- 年龄 -->
                        <xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"></xsl:apply-templates>
                    </patient>            
                </patientRole>
            </recordTarget>
            <!--创建者信息-->
            <xsl:apply-templates select="Header/author" mode="AuthorNoOrganization"/>
            <xsl:apply-templates select="Header/custodian" mode="Custodian"/>
            <!-- 处方审核药剂师签名 -->
            <xsl:apply-templates select="Header/LegalAuthenticators/LegalAuthenticator"></xsl:apply-templates>   
            <xsl:apply-templates select="Header/Authenticators/Authenticator"></xsl:apply-templates>
            <xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"></xsl:apply-templates>
        <component>
            <structuredBody>
                <!--诊断记录章节-->
                <xsl:apply-templates select="Diagnosis/Westerns"/>
                <!-- 用药章节 1.。。*  -->
                <xsl:apply-templates select="MedicationUseHistory"/>
                <!--费用章节-->
                <xsl:apply-templates select="Payment"/>
            </structuredBody>
        </component>
        </ClinicalDocument>
    </xsl:template>
    <xsl:template match="Header/Authenticators/Authenticator">
        <xsl:choose>
            <xsl:when test="assignedEntityCode = '处方调配药剂师'">
                <xsl:call-template name="MediAuthenticator"></xsl:call-template>
            </xsl:when>
            <xsl:when test="assignedEntityCode = '处方核对药剂师'">
                <xsl:call-template name="MediAuthenticator"></xsl:call-template>
            </xsl:when>
            <xsl:when test="assignedEntityCode = '处方发药药剂师'">
                <xsl:call-template name="MediAuthenticator"></xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <!-- 药物authenticator 模板 -->
    <xsl:template name = "MediAuthenticator">
        <authenticator>
            <time>             
            </time>
            <signatureCode/>
            <assignedEntity>
                <id/>
                <code displayName="{assignedEntityCode}"/>
                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                    <name>
                        <xsl:value-of select="assignedPersonName/Display"/>
                    </name>
                </assignedPerson>
            </assignedEntity>
        </authenticator>
    </xsl:template>
    <xsl:template match="Header/LegalAuthenticators/LegalAuthenticator">
    <xsl:choose>
        <xsl:when test="assignedEntityCode = '处方审核药剂师'">
            <legalAuthenticator>
                <time/>
                <signatureCode/>
                <assignedEntity>
                    <id/>
                    <code displayName="{assignedEntityCode}"></code>
                    <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                        <name><xsl:value-of select="assignedPersonName/Value"/></name>
                    </assignedPerson>
                </assignedEntity>
            </legalAuthenticator>
        </xsl:when>  
    </xsl:choose>
    </xsl:template>
    <!--诊断记录章节-->
    <xsl:template match="Diagnosis/Westerns">
        <component>
            <section>
                <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <!--条目：诊断-->
                <xsl:apply-templates select="Western/diag"></xsl:apply-templates>
            </section>
        </component>   
    </xsl:template>
    <!-- 条目：诊断 -->
    <xsl:template match ="Western/diag">
        <entry>
            <observation classCode="OBS" moodCode="EVN">
                <code code="{code/Value}" displayName="诊断代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                <value xsi:type="CD" code="{name/Value}" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10)"></value>
            </observation>
        </entry>
    </xsl:template>
    <!-- 用药章节 1.。。*  -->
    <xsl:template match ="MedicationUseHistory">
        <component>
            <section>
                <code code="10160-0" codeSystem="2.16.840.1.113883.6.1" displayName="HISTORY OF MEDICATION USE" codeSystemName="LOINC"/>
                <text/>
                <!-- 处方条目 -->
                <xsl:apply-templates select ="MedicineItems/MedicineItem"></xsl:apply-templates>
                <!-- 处方有效期 -->
                <xsl:apply-templates select ="/Document/MedicationUseHistory/validDays"></xsl:apply-templates>
                <!-- 处方药品组号 -->
                <xsl:apply-templates select ="/Document/MedicationUseHistory/groupNo"></xsl:apply-templates>
                <!-- 处方备注信息 -->
                <xsl:apply-templates select ="/Document/MedicationUseHistory/notes"></xsl:apply-templates>      
            </section>
        </component>
    </xsl:template>
    <!-- 处方条目 -->
    <xsl:template match="MedicineItems/MedicineItem">
        <entry>
            <substanceAdministration classCode="SBADM" moodCode="EVN">
                <text/>
                <routeCode code="{route/Value}" codeSystem="2.16.156.10011.2.3.1.158" codeSystemName="用药途径代码表" displayName="{route/Display}"/>
                <!--用药剂量-单次 -->
                <doseQuantity value="{dose/Value}" unit="{doseUnit}"/>
                <!--用药频率 -->
                <rateQuantity value="{rate/Value}" unit="{rateUnit}"></rateQuantity>
                <!--药物剂型 -->
                <administrationUnitCode code="{form/Value}" codeSystem="2.16.156.10011.2.3.1.211" CodeSystemName="药物剂型代码表"></administrationUnitCode>
                <consumable>
                    <manufacturedProduct>
                        <manufacturedLabeledDrug>
                            <!--药品代码及名称(通用名) -->
                            <code/>
                            <name><xsl:value-of select="name/Value"/></name>
                        </manufacturedLabeledDrug>
                    </manufacturedProduct>
                </consumable>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE08.50.043.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物规格"/>
                        <value xsi:type="ST"><xsl:value-of select="spec/Value"></xsl:value-of></value>
                    </observation>
                </entryRelationship>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.135.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物使用总剂量"/>
                        <value xsi:type="PQ" value="{totalDose/Value}"></value>
                    </observation>
                </entryRelationship>
            </substanceAdministration>
        </entry>
    </xsl:template>
    <!-- 处方有效期 -->
    <xsl:template match ="/Document/MedicationUseHistory/validDays">
        <entry>
            <observation classCode="OBS" moodCode="EVN">
                <code code="DE06.00.294.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="处方有效天数"/>
                <value xsi:type="PQ" value="{Value}" unit="天"></value> 
            </observation>
        </entry>
    </xsl:template>
    <!-- 处方药品组号 -->
    <xsl:template match ="/Document/MedicationUseHistory/groupNo">
        <entry>
            <observation classCode="OBS" moodCode="EVN">
                <code code="DE08.50.056.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="处方药品组号"/>
                <value xsi:type="INT" value="{Value}"></value> 
            </observation>
        </entry>
    </xsl:template>
    <!-- 处方备注信息 -->
    <xsl:template match ="/Document/MedicationUseHistory/notes">
        <entry>
            <observation classCode="OBS" moodCode="EVN">
                <code code="DE06.00.179.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="处方备注信息"/>
                <value xsi:type="ST"><xsl:value-of select="Value"/></value> 
            </observation>
        </entry>
    </xsl:template>
    <!--费用章节-->
    <xsl:template match="Payment">
        <component>
            <section>
                <code code="48768-6" displayName="PAYMENT SOURCES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <!-- 处方备注信息 -->         
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE07.00.004.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="处方药品金额"/>
                        <value xsi:type="MO" value="4" currency="元"></value> 
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
</xsl:stylesheet>