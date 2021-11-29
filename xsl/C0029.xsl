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
            <title>特殊检查及特殊治疗同意书</title>
            <!--文档机器生成时间-->
            <xsl:call-template name="effectiveTime"/>
            <xsl:call-template name="Confidentiality"/>
            <languageCode code="zh-CN"/>
            <setId/>
            <versionNumber value="{Version}"/>
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <xsl:apply-templates select="Header/recordTarget/outpatientNum" mode="outpatientNum"></xsl:apply-templates>
                    <xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/> 
                    <xsl:comment>患者基本信息</xsl:comment>                     
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者姓名，必选-->
                        <xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"></xsl:apply-templates>
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
                    <!--诊断章节-->
                    <xsl:apply-templates select="Diagnosis/Westerns"/>
                    <!--治疗计划章节-->
                    <xsl:apply-templates select="TreatmentPlan"/>
                    <!--风险章节-->
                    <xsl:apply-templates select="Risk"></xsl:apply-templates>
                    <!--意见章节-->
                    <xsl:apply-templates select="Suggestion"/>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
    <!-- 意见章节 -->
    <xsl:template match="Suggestion">
        <xsl:comment>意见章节</xsl:comment>
        <component>
            <section>
                <code displayName="意见章节"/>
                <text/>
                <xsl:comment>医疗机构意见</xsl:comment>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="医疗机构的意见"/>
                        <value xsi:type="ST"><xsl:value-of select="hospital/Value"/></value>
                    </observation>
                </entry>
                <xsl:comment>患者意见</xsl:comment>  
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST"><xsl:value-of select="patient/Value"/></value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 风险章节 -->
    <xsl:template match="Risk">
        <xsl:comment>风险章节</xsl:comment>
        <component>
            <section>
                <code displayName="操作风险"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="DEF">
                        <code code="DE05.01.075.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="特殊检查及特殊治疗可能引起的并发症及风险"/>
                        <value xsi:type="ST"><xsl:value-of select="postOperationRisk/Value"/></value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 治疗计划章节 -->
    <xsl:template match="TreatmentPlan">
        <xsl:comment>治疗计划章节</xsl:comment>
        <component>
            <section>
                <code code="59772-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Planned procedure"/>
                <text/>
                <entry>
                  <xsl:comment>特殊检查及特殊治疗项目名称</xsl:comment>  
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.306.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="特殊检查及特殊治疗项目名称"/>
                        <value xsi:type="ST"><xsl:value-of select="specialTreatment/name/Value"/></value>
                        <xsl:comment>特殊检查及特殊治疗目的</xsl:comment>    
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE06.00.305.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="特殊检查及特殊治疗目的"/>
                                <value xsi:type="ST"><xsl:value-of select="specialTreatment/reason/Value"/></value>
                            </observation>
                        </entryRelationship>
                    </observation>
                </entry>
                <xsl:comment> 替代方案</xsl:comment>    
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.301.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="替代方案"/>
                        <value xsi:type="ST"><xsl:value-of select="procedureSubtitude/Value"/></value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--诊断章节-->
    <xsl:template match="Diagnosis/Westerns">
        <xsl:comment>诊断章节</xsl:comment>
        <component>
            <section>
                <code code="29548-5" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Diagnosis"/>
                <text/>
                <xsl:apply-templates select="Western"></xsl:apply-templates>      
            </section>
        </component>
    </xsl:template>
    <!-- 诊断章节条目 -->
    <xsl:template match="Western">
        <xsl:choose>
            <xsl:when test="diag/code/Value">
                <entry typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="疾病诊断编码"/>
                        <value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10" displayName="{diag/code/Display}"/>
                    </observation>
                </entry>
            </xsl:when>
            <xsl:otherwise>               
            </xsl:otherwise>
        </xsl:choose>    
    </xsl:template>
    <!-- 法律签名 -->
    <xsl:template match="Header/LegalAuthenticators/LegalAuthenticator">  
        <xsl:choose>
            <xsl:when test="assignedEntityCode='医师签名'">
                <xsl:comment>医师签名</xsl:comment>
                <legalAuthenticator typeCode="LA">
                    <time value="{time/Value}"/>
                    <signatureCode code="s"/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.5" extension="医师签名"/>
                        <assignedPerson>
                            <name><xsl:value-of select="assignedPersonName/Value"/></name>
                        </assignedPerson>
                    </assignedEntity>
                </legalAuthenticator>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
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
    <!-- 患者 代理人签名 -->
    <xsl:template match="Header/Authenticators/Authenticator">
        <xsl:choose>
            <xsl:when test="assignedEntityCode = '患者'">
                <xsl:call-template name="MediAuthenticator"></xsl:call-template>
            </xsl:when>
            <xsl:when test="assignedEntityCode = '代理人'">
                <xsl:call-template name="MediAuthenticator"></xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name = "MediAuthenticator">
        <authenticator>
            <time value="{time/Value}"/>
            <signatureCode code="S"/> 
            <assignedEntity>              
                <id root="2.16.156.10011.1.5" extension="{assignedEntityId}"/>  
                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                    <name>
                        <xsl:value-of select="assignedPersonName/Value"/>
                    </name>
                </assignedPerson>
            </assignedEntity>
        </authenticator>
    </xsl:template>
</xsl:stylesheet>