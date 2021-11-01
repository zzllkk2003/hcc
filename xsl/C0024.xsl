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
            <xsl:comment>护理计划</xsl:comment>
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.21"/>
            <!--文档流水号-->
            <xsl:call-template name="DocumentNo"/>
            <title>待产记录</title>
            <!--文档机器生成时间-->
            <xsl:call-template name="effectiveTime"/>
            <xsl:call-template name="Confidentiality"/>
            <languageCode code="zh-CN"/>
            <setId/>
            <versionNumber value="{Version}"/>
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <xsl:apply-templates select="Header/recordTarget/healthCardId" mode="HealthCardNumber"></xsl:apply-templates>
                    <xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/> 
                    <xsl:comment>患者基本信息</xsl:comment>                     
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者姓名，必选-->
                        <xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"></xsl:apply-templates>
                        <xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
                        <!-- 性别，必选 -->
                        <xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
                        <xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"></xsl:apply-templates>
                    </patient>
                    <!-- 提供患者服务机构 -->
                    <xsl:apply-templates select="Header/encompassingEncounter/Locations/Location"></xsl:apply-templates>
                </patientRole>
            </recordTarget>
            <xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/> 
            <xsl:apply-templates select="Header/custodian" mode="Custodian"/>
            <xsl:apply-templates select="Header/Authenticators/Authenticator"></xsl:apply-templates>
            <xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"></xsl:apply-templates>
            <component>
                <structuredBody>
                    <!-- 主要健康问题章节 -->
                    <xsl:apply-templates select="Problem/symptom"/>
                    <!-- 护理记录章节 -->
                    <xsl:apply-templates select="NursingRecord"/>
                    <!--健康指导章节-->
                    <xsl:apply-templates select="HealthGuidance"></xsl:apply-templates>
                </structuredBody>
            </component>
    </ClinicalDocument>
    </xsl:template>
    <!--健康指导章节-->
    <xsl:template match="HealthGuidance">
        <xsl:comment>健康指导章节</xsl:comment>
        <component>
            <section>
                <code code="69730-0" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Instructions"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.291.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="饮食指导代码"/>
                       <xsl:comment> HDSD00.09.078	DE06.00.291.00	饮食指导代码 </xsl:comment>
                        <value xsi:type="CD" code="{diet/Value}" displayName="{diet/displayName}" codeSystem="2.16.156.10011.2.3.1.263" codeSystemName="饮食指导代码表"/>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 护理记录章节 -->
    <xsl:template match="NursingRecord">
        <xsl:comment>护理记录章节</xsl:comment>
        <component>
            <section>
                <code code="X-NN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="护理记录"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.211.00" displayName="护理等级代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                      <xsl:comment>HDSD00.09.020	DE06.00.211.00	护理等级代码 </xsl:comment>  
                        <value xsi:type="CD" code="{nursingLevel/Value}" displayName="{nursingLevel/Display}" codeSystem="2.16.156.10011.2.3.1.259" codeSystemName="护理等级代码表"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.212.00" displayName="护理类型代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <xsl:comment>HDSD00.09.023	DE06.00.212.00	护理类型代码 </xsl:comment> 
                        <value xsi:type="CD" code="{nursingType/Value}" displayName="{nursingType/Display}" codeSystem="2.16.156.10011.2.3.1.260" codeSystemName="护理类型代码表"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.10.136.00" displayName="护理问题" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <xsl:comment>HDSD00.09.024	DE05.10.136.00	护理问题 </xsl:comment>  
                        <value xsi:type="ST"><xsl:value-of select="problem/Value"/></value>
                    </observation>
                </entry>					
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.342.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作名称"/>
                        <value xsi:type="ST"><xsl:value-of select="operation/Value"/></value>
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE06.00.210.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作项目类目名称"/>
                                <value xsi:type="ST"><xsl:value-of select="category/Value"/></value>
                                <entryRelationship typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE06.00.209.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作结果"/>
                                        <value xsi:type="ST"><xsl:value-of select="result/Value"/></value>
                                    </observation>
                                </entryRelationship>
                            </observation>
                        </entryRelationship>
                    </observation>
                </entry>				
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.209.00" displayName="导管护理" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <xsl:comment>HDSD00.09.010	DE06.00.209.00	导管护理描述 </xsl:comment> 
                        <value xsi:type="ST"><xsl:value-of select="catheterNurse/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.259.00" displayName="体位护理" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <xsl:comment>HDSD00.09.062	DE04.10.259.00	体位护理 </xsl:comment> 
                        <value xsi:type="ST"><xsl:value-of select="positionNurse/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.50.068.00" displayName="皮肤护理" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <xsl:comment>HDSD00.09.044	DE04.50.068.00	皮肤护理 </xsl:comment> 
                        <value xsi:type="ST"><xsl:value-of select="skinNurse/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.229.00" displayName="气管护理代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <xsl:comment>HDSD00.09.046	DE06.00.229.00	气管护理代码</xsl:comment>
                        <value xsi:type="CD" code="{tracheaNurse/Value}" displayName="{tracheaNurse/Display}" codeSystem="2.16.156.10011.2.3.2.50" codeSystemName="气管护理代码表"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.178.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="安全护理代码"/>
                        <xsl:comment>HDSD00.09.002	DE06.00.178.00	安全护理代码</xsl:comment> 
                        <value xsi:type="CD" code="{saftyNurse/Value}" displayName="{saftyNurse/Display}" codeSystem="2.16.156.10011.2.3.2.52" codeSystemName="安全护理代码表"/>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 主要健康问题章节 -->
    <xsl:template match="Problem/symptom">
        <xsl:comment>主要健康问题章节</xsl:comment>
        <component>
            <section>
                <code code="11450-4" displayName="PROBLEM LIST" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.01.024.00" displayName="疾病诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="CD" code="{Value}" displayName="{displayName}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <xsl:template match="Header/Authenticators/Authenticator">
        <xsl:choose>
            <xsl:when test="assignedEntityId = '2.16.156.10011.1.5'">
                <xsl:call-template name="MediAuthenticator"></xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name = "MediAuthenticator">
        <authenticator>
            <!--HDSD00.09.047	DE09.00.053.00	签名日期时间 -->
            <time value="{time/Value}"/>
            <signatureCode code="S"/> 
            <assignedEntity>              
                <!--医务人员标识 OID 表D.2　可维护对象OID分配表 -->
                <!--HDSD00.09.025	DE02.01.039.00	护士签名 -->
                <id root="2.16.156.10011.1.5" extension="护士工号"/>  
                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                    <name>
                        <xsl:value-of select="assignedPersonName/Value"/>
                    </name>
                </assignedPerson>
            </assignedEntity>
        </authenticator>
    </xsl:template>
     <!--提供患者服务机构 -->
    <xsl:template match="Header/encompassingEncounter/Locations/Location">
        <providerOrganization>
            <asOrganizationPartOf classCode="PART">
               <xsl:comment>HDSD00.09.003	DE01.00.026.00	病床号 </xsl:comment> 
                <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                    <id root="2.16.156.10011.1.22" extension="{bedNum/Value}"/>
                    <name><xsl:value-of select="bedNum/Display"/></name>
                    <xsl:comment> HDSD00.09.004	DE01.00.019.00	病房号 </xsl:comment>  
                    <asOrganizationPartOf classCode="PART">
                        <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                            <id root="2.16.156.10011.1.21" extension="{wardId}"/>
                            <name><xsl:value-of select="wardName/Display"/></name>
                            <xsl:comment> HDSD00.09.036	DE08.10.026.00	科室名称 </xsl:comment>   
                            <asOrganizationPartOf classCode="PART">
                                <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                    <name><xsl:value-of select="deptName/Display"/></name>
                                    <xsl:comment> HDSD00.09.005	DE08.10.054.00	病区名称 </xsl:comment>  
                                    <asOrganizationPartOf classCode="PART">
                                        <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                            <name><xsl:value-of select="areaName/Display"/></name>
                                            <xsl:comment>   XXX医院 </xsl:comment> 
                                            <asOrganizationPartOf classCode="PART">
                                                <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                    <xsl:comment> 医疗卫生服务机构标识 表F.2  可维护对象OID分配表</xsl:comment>  
                                                    <id root="2.16.156.10011.1.5" extension="{hosId}"/>
                                                    <name><xsl:value-of select="hosName"/></name>
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
        </providerOrganization>
    </xsl:template>
</xsl:stylesheet>