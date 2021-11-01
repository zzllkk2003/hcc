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
            <title>抢救记录</title>
            <!--文档机器生成时间-->
            <xsl:call-template name="effectiveTime"/>
            <xsl:call-template name="Confidentiality"/>
            <languageCode code="zh-CN"/>
            <setId/>
            <versionNumber value="{Version}"/>
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/> 
                    <xsl:comment>出院记录</xsl:comment>                     
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
            <xsl:apply-templates select="Header/Authenticators/Authenticator"></xsl:apply-templates>
            <xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"></xsl:apply-templates>
            <componentOf>
                <xsl:apply-templates select="Header/encompassingEncounter"/>
            </componentOf>
            <component>
                <structuredBody>
                    <!-- 主要健康问题章节 -->
                    <xsl:apply-templates select="Problem/admitCondition"/>
                    <!--入院诊断章节 -->
                    <xsl:apply-templates select="AdmDiag"></xsl:apply-templates>
                    <!-- 住院过程章节 -->
                    <xsl:apply-templates select="HospitalCourse"/>
                    <!-- 医嘱（用药）章节 -->
                    <xsl:apply-templates select="ProviderOrder"/>
                    <!-- 出院诊断章节 -->
                    <xsl:apply-templates select="DisDiag"/>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
    <!-- 出院诊断章节 -->
    <xsl:template match="DisDiag">
        <!-- 出院诊断章节 -->
        <component>
            <section>
                <code code="11535-2" displayName="Discharge Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.193.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院情况"/>
                        <value xsi:type="ST"><xsl:value-of select="dischargeCondition/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.017.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院日期时间"/>
                        <value xsi:type="TS" value="{dischargeTime/Value}"/>
                    </observation>
                </entry>
                <xsl:apply-templates select="Primarys/Primary"></xsl:apply-templates>
                <xsl:apply-templates select="TCM/TCM"></xsl:apply-templates>
                <xsl:apply-templates select="TCMSyndrome/TCMSyndrome"></xsl:apply-templates>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.01.117.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院时症状与体征"/>
                        <value xsi:type="ST"><xsl:value-of select="dischargeSymptom/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.287.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院医嘱"/>
                        <value xsi:type="ST"><xsl:value-of select="dischargeOrder/Value"/></value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 西医诊断条目 -->
    <xsl:template match="Primarys/Primary"> 
        <xsl:choose>
            <xsl:when test="diag/code/Value">
                <xsl:comment>西医诊断条目</xsl:comment> 
                <entry>
                    <observation classCode="OBS" moodCode="EVN ">
                        <code code="DE05.01.025.00" displayName="出院诊断-西医诊断名称" 
                            codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST"><xsl:value-of select="diag/code/Display"/></value>
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE05.01.024.00" displayName="疾病诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                <value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="诊断代码表（ICD-10）"/>
                            </observation>
                        </entryRelationship>
                    </observation>
                </entry>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>西医诊断条目</xsl:comment> 
                <entry>
                    <observation classCode="OBS" moodCode="EVN ">
                        <code code="DE05.01.025.00" displayName="出院诊断-西医诊断名称" 
                            codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST"><xsl:value-of select="diag/name/Value"/></value>
                    </observation>
                </entry>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- 中医诊断条目 -->
    <xsl:template match="TCM/TCM">
        <xsl:comment>中医诊断条目</xsl:comment>
        <entry>
            <observation classCode="OBS" moodCode="EVN ">
                <code code="DE05.10.025.00" displayName="疾病诊断名称" 
                    codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                <value xsi:type="ST"><xsl:value-of select="TCMdiag/name/Value"/></value>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.01.024.00" displayName="疾病诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="CD" code="{TCMdiag/code/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="出院诊断-中医病名代码表"/>
                    </observation>
                </entryRelationship>
            </observation>
        </entry>
    </xsl:template>
    <!-- 中医症候条目 -->
    <xsl:template match="TCMSyndrome/TCMSyndrome">
        <xsl:choose>
            <xsl:when test="syndrome/code/Value">
                <xsl:comment>中医症候条目</xsl:comment>
                <entry>
                    <observation classCode="OBS" moodCode="EVN ">
                        <code code="DE05.10.172.00" displayName="辩证分型名称" 
                            codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST"><xsl:value-of select="syndrome/name/Value"/></value>
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE05.01.024.00" displayName="疾病诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                <value xsi:type="CD" code="{syndrome/code/Value}" displayName="{syndrome/code/Display}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="出院诊断-中医证候代码表"/>
                            </observation>
                        </entryRelationship>
                    </observation>
                </entry>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>中医症候条目</xsl:comment>
                <entry>
                    <observation classCode="OBS" moodCode="EVN ">
                        <code code="DE05.10.172.00" displayName="辩证分型名称" 
                            codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST"><xsl:value-of select="syndrome/name/Value"/></value>
                    </observation>
                </entry>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    <!-- 医嘱（用药）章节 -->
    <xsl:template match="ProviderOrder">
       <xsl:comment>医嘱（用药）章节 </xsl:comment>  
        <component>
            <section>
                <code code="46209-3" codeSystem="2.16.840.1.113883.6.1" displayName="Provider Orders" codeSystemName="LOINC"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE08.50.047.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中药煎煮方法"/>
                        <value xsi:type="ST"><xsl:value-of select="decoctMethod/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.136.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中药用药方法"/>
                        <value xsi:type="ST"><xsl:value-of select="useMethod/Value"/></value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 住院过程章节 -->
    <xsl:template match="HospitalCourse">
        <xsl:comment>住院过程章节</xsl:comment>  
        <component>
            <section>
                <code code="8648-8" displayName="Hospital Course" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.296.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="诊疗过程描述"/>
                        <value xsi:type="ST"><xsl:value-of select="treatmentCourse/Value"/></value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--入院诊断章节 -->
    <xsl:template match="AdmDiag">
        <xsl:comment> 入院诊断章节 </xsl:comment> 
        <component>
            <section>
                <code code="11535-2" displayName="HOSPITAL DISCHARGE DX" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <xsl:apply-templates select="Diagnoses/Diagnosis"></xsl:apply-templates>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.092.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院日期时间"/>
                        <value xsi:type="TS" value="{admitTime/Value}"/>
                    </observation>
                </entry>
                <xsl:apply-templates select="AuxExamResults/AuxExamResult"></xsl:apply-templates>
          
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中医“四诊”观察结果"/>
                        <value xsi:type="ST"><xsl:value-of select="TCMObservation/Value"/></value>
                    </observation>
                </entry>
                
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.300.00" displayName="治则治法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST"><xsl:value-of select="treatmentPrinciple/Value"/></value>	
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 阳性辅助检查条目 -->
    <xsl:template match="AuxExamResults/AuxExamResult">
        <xsl:comment> 阳性辅助检查条目</xsl:comment>
        <entry>
            <observation classCode="OBS" moodCode="EVN">
                <code code="DE04.50.128.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="阳性辅助检查结果"/>
                <value xsi:type="ST"><xsl:value-of select="result/Value"/></value>
            </observation>
        </entry>
    </xsl:template>
    <!-- 入院诊断条目 -->
    <xsl:template match="Diagnoses/Diagnosis">
        <xsl:choose>
            <xsl:when test="diag/code/Value">
              <xsl:comment>入院诊断条目</xsl:comment>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断编码"/>
                        <value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11.3" displayName="{diag/code/Display}" codeSystemName="诊断编码表（ICD-10）"/>
                    </observation>
                </entry>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>入院诊断条目</xsl:comment>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断编码"/>
                        <value xsi:type="ST"><xsl:value-of select="diag/name/Value"/></value>
                    </observation>
                </entry>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    <!-- 主要健康问题章节 -->
    <xsl:template match="Problem/admitCondition">
      <component>
        <section>
            <code code="11450-4" displayName="Problem list" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.148.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院情况"/>
                    <value xsi:type="ST"><xsl:value-of select="Value"/></value>
                </observation>
            </entry>
        </section>
    </component>  
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
            <xsl:when test="assignedEntityCode = '主任医师'">
                <xsl:call-template name="MediAuthenticator"></xsl:call-template>
            </xsl:when>
            <xsl:when test="assignedEntityCode = '主治医师'">
                <xsl:call-template name="MediAuthenticator"></xsl:call-template>
            </xsl:when>
            <xsl:when test="assignedEntityCode = '住院医师'">
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
                <id root="2.16.156.10011.1.4"/>
                <code displayName="{assignedEntityCode}签名"></code>
                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                    <name>
                        <xsl:value-of select="assignedPersonName/Value"/>
                    </name>
                </assignedPerson>
            </assignedEntity>
        </authenticator>
    </xsl:template>
</xsl:stylesheet>