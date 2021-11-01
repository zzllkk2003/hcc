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
            <xsl:comment>文档活动类信息</xsl:comment>
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.21"/>
            <!--文档流水号-->
            <xsl:call-template name="DocumentNo"/>
            <title>上级医师查房记录</title>
            <!--文档机器生成时间-->
            <xsl:call-template name="effectiveTime"/>
            <xsl:call-template name="Confidentiality"/>
            <languageCode code="zh-CN"/>
            <setId/>
            <versionNumber value="{Version}"/>
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/> 
                    <xsl:comment>患者基本信息</xsl:comment>                     
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者姓名，必选-->
                        <xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
                        <!-- 性别，必选 -->
                        <xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
                        <xsl:apply-templates select="Header/recordTarget/patient/birthTime" mode="BirthTime"/>
                        <xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"></xsl:apply-templates>  
                    </patient>
                </patientRole>
            </recordTarget>
            <xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/> 
            <xsl:apply-templates select="Header/custodian" mode="Custodian"/>
            <xsl:apply-templates select="Header/LegalAuthenticators/LegalAuthenticator"></xsl:apply-templates>
            <xsl:apply-templates select="Header/Authenticators/Authenticator"></xsl:apply-templates>
            <xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"></xsl:apply-templates>
            <componentOf>
                <xsl:apply-templates select="Header/encompassingEncounter"/>
            </componentOf>
            <component>
                <structuredBody>
                    <!--健康评估章节-->
                    <xsl:apply-templates select="HealthAssessment/wardRoundRec"/>
                    <!--诊断章节-->
                    <xsl:apply-templates select="Diagnosis/TCMFourDiags"/>
                    <!--用药章节-->
                    <xsl:apply-templates select="ProviderOrder"></xsl:apply-templates>
                    <!--治疗计划章节-->
                    <xsl:apply-templates select="TreatmentPlan"/>
                    <!--医嘱章节-->
                    <xsl:apply-templates select="ProviderOrder"/>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
    <!--医嘱章节-->
    <xsl:template match="ProviderOrder">
        <xsl:comment>医嘱章节</xsl:comment>
        <component>
            <section>
                <code code="46209-3"  codeSystem="2.16.840.1.113883.6.1" displayName="Provider Orders"  codeSystemName="LOINC"></code>
                <text/>
                <!--医嘱内容-->
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.287.00" displayName="医嘱内容" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST">医嘱内容的详细描述</value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--治疗计划章节-->
    <xsl:template match="TreatmentPlan">
        <xsl:comment>治疗计划章节</xsl:comment>
        <component>
            <section>
                <code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <xsl:comment>诊疗计划</xsl:comment>
                <entry>
                    <observation classCode="OBS" moodCode="INT ">
                        <code code="DE05.01.025.00" displayName="诊疗计划"/>
                        <value xsi:type="ST"><xsl:value-of select="carePlan/Value"/></value>
                    </observation>
                </entry>             
                <xsl:comment>辩证论治详细描述</xsl:comment> 
                <entry>
                    <observation classCode="OBS" moodCode="INT">
                        <code code="DE05.10.131.00" displayName="辩证论治"/>
                        <value xsi:type="ST"><xsl:value-of select="differentiationNotes/Value"/></value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--用药章节-->
    <xsl:template match="ProviderOrder">
        <xsl:comment>用药章节</xsl:comment>
        <component>
            <section>
                <code code="10160-0" displayName="HISTORY OF MEDICATION USE" codeSystem="2.16.840.1.113883.6.1"  codeSystemName="LOINC"/>
                <text/>
            <xsl:comment>中药煎煮法</xsl:comment>    
                <entry>
                    <observation classCode="OBS" moodCode="EVN ">
                        <code code="DE08.50.047.00" displayName="中药煎煮方法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST"><xsl:value-of select="decoctMethod/Value"/></value>
                    </observation>
                </entry>
                
                <xsl:comment>中药用药方法</xsl:comment>   
                <entry>
                    <observation classCode="OBS" moodCode="EVN " >
                        <code code="DE06.00.136.00" displayName="中药用药方法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST"><xsl:value-of select="useMethod/Value"/></value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--诊断章节-->
    <xsl:template match="Diagnosis/TCMFourDiags">
        <xsl:comment>诊断章节</xsl:comment>
        <component>
            <section>
                <code code="29548-5" displayName="Diagnosis"  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <xsl:apply-templates select="TCMFourDiagnostic"></xsl:apply-templates>
            </section>
        </component>
    </xsl:template>
    <!--诊断条目-->
    <xsl:template match="TCMFourDiagnostic">
        <xsl:comment>诊断条目</xsl:comment>
        <entry>
            <observation classCode="OBS" moodCode="EVN">
                <code code="DE02.10.28.00"  displayName="中医“四诊”结果" codeSystem="2.9999" codeSystemName="卫生信息数据元目录"/>
                <value xsi:type="ST"><xsl:value-of select="TCMFourDiagnostic/Value"/></value>
            </observation>
        </entry>
    </xsl:template>
    <!--健康评估章节-->
    <xsl:template match="HealthAssessment/wardRoundRec">
        <xsl:comment>健康评估章节</xsl:comment>
        <component>
            <section>
                <code code="51848-0" displayName="Assessment note" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
              <xsl:comment>条目：查房记录</xsl:comment>  
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.181.00" displayName="查房记录" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST"><xsl:value-of select="Value"/></value>
                    </observation>
                </entry>  
            </section>
        </component>
    </xsl:template>
    <!-- 法律签名 -->
    <xsl:template match="Header/LegalAuthenticators/LegalAuthenticator">  
        <xsl:choose>
            <xsl:when test="assignedEntityCode='主任医师'">
                <xsl:comment>主任医师签名</xsl:comment>
                <legalAuthenticator typeCode="LA">
                    <time value="{time/Value}"/>
                    <signatureCode code="s"/>
                    <assignedEntity>
                        <code displayName="{assignedEntityCode}签名"></code>
                        <assignedPerson>
                            <name><xsl:value-of select="assignedPersonName/Value"/></name>
                        </assignedPerson>
                    </assignedEntity>
                </legalAuthenticator>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <!-- encompassing -->
    <xsl:template match ="Header/encompassingEncounter" >
        <xsl:comment>住院信息</xsl:comment>
        <encompassingEncounter>
            <xsl:comment> 入院日期时间 </xsl:comment> 
            <effectiveTime value="{effectiveTimeLow/Value}"/>
            <location>
                <healthCareFacility>
                    <serviceProviderOrganization>
                        <asOrganizationPartOf classCode="PART">
                            <xsl:comment> DE01.00.026.00	病床号 </xsl:comment>   
                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                <id root="2.16.156.10011.1.22" extension="{Locations/Location/bedNum/Value}"/>
                                <name><xsl:value-of select="Locations/Location/bedNum/Display"/></name>
                                <xsl:comment> DE01.00.019.00	病房号 </xsl:comment>  
                                <asOrganizationPartOf classCode="PART">
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.21" extension="{Locations/Location/wardName/Value}"/>
                                        <name><xsl:value-of select="Locations/Location/wardName/Display"/></name>
                                        <xsl:comment> DE08.10.026.00	科室名称 </xsl:comment>    
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.26" extension="{Locations/Location/deptName/Value}"/>
                                                <name><xsl:value-of select="Locations/Location/deptName/Display"/></name>
                                                <xsl:comment> DE08.10.054.00	病区名称 </xsl:comment>  
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <id root="2.16.156.10011.1.27" extension="{Locations/Location/areaName/Value}"/>
                                                        <name><xsl:value-of select="Locations/Location/areaName/Display"/></name>
                                                        <xsl:comment>XXX医院</xsl:comment> 
                                                        <asOrganizationPartOf classCode="PART">
                                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                <id root="2.16.156.10011.1.5" extension="{Locations/Location/hosId}"/>
                                                                <name><xsl:value-of select="Locations/Location/hosName"/></name>
                                                            </wholeOrganization>
                                                        </asOrganizationPartOf>
                                                    </wholeOrganization>
                                                </asOrganizationPartOf>
                                            </wholeOrganization>
                                        </asOrganizationPartOf>
                                    </wholeOrganization>
                                </asOrganizationPartOf>
                            </wholeOrganization>
                        </asOrganizationPartOf>
                    </serviceProviderOrganization>
                </healthCareFacility>
            </location>
        </encompassingEncounter>
    </xsl:template>
    <!-- 签名 -->
    <xsl:template match="Header/Authenticators/Authenticator">
        <xsl:choose>
            <xsl:when test="assignedEntityCode = '记录人'">
                <xsl:call-template name="MediAuthenticator"></xsl:call-template>
            </xsl:when>
            <xsl:when test="assignedEntityCode = '主治医师'">
                <xsl:call-template name="MediAuthenticator"></xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name = "MediAuthenticator">
        <xsl:comment> <xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
        <authenticator>
            <time value="{time/Value}"/>
            <signatureCode code="S"/> 
            <assignedEntity>   
                <id root="{assignedEntityId}"/>
                <code displayName="记录人签名"></code>
                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                    <name>
                        <xsl:value-of select="assignedPersonName/Value"/>
                    </name>
                </assignedPerson>
            </assignedEntity>
        </authenticator>
    </xsl:template>
</xsl:stylesheet>