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
            <xsl:apply-templates select="Header/Authenticators/Authenticator"></xsl:apply-templates>
            <xsl:apply-templates select="Header/Participants"></xsl:apply-templates>
            <xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"></xsl:apply-templates>
            <componentOf>
                <xsl:apply-templates select="Header/encompassingEncounter"/>
            </componentOf>
            <component>
                <structuredBody>
                    <!--诊断章节-->
                    <xsl:apply-templates select="Diagnosis/Westerns"/>
                    <!--治疗计划章节-->
                    <xsl:apply-templates select="TreatmentPlan/caution"></xsl:apply-templates>
                    <!--手术操作章节-->
                    <xsl:apply-templates select="Procedure"/>
                    <!--实验室检查章节-->
                    <xsl:apply-templates select="LabTest"/>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
    <!--实验室检查章节-->
    <xsl:template match="LabTest">
        <component>
            <section >
                <code code="30954-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="STUDIES SUMMARY"/>
                <text/>
                <xsl:apply-templates select="Items/Item"></xsl:apply-templates>
            </section>
        </component>
    </xsl:template>
    <!-- 实验室检查条目 -->
    <xsl:template match="Items/Item">
        <xsl:comment>检查/检验项目</xsl:comment>
        <entry>
            <observation classCode="OBS " moodCode="EVN ">
                <code code="DE04.30.020.00" displayName="检查/检验项目名称" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="卫生信息数据元目录"/>
                <value xsi:type="ST"><xsl:value-of select="name/Value"/></value>              
                    <xsl:if test="result/Value">
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS " moodCode="EVN ">
                                <code code="DE04.30.009.00" displayName="检查/检验结果" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                <value xsi:type="ST"><xsl:value-of select="result/Value"/></value>
                            </observation>
                        </entryRelationship>	
                    </xsl:if>
                    <xsl:if test="resultQuantity/value/Value">
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS " moodCode="EVN ">
                                <code code="DE04.30.015.00" displayName="检查/检验定量结果" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="卫生信息数据元目录"/>
                                <value xsi:type="PQ" value="{resultQuantity/value/Value}" unit="{resultQuantity/unit/Value}"/>
                            </observation>
                        </entryRelationship>
                    </xsl:if>
                    <xsl:if test="resultCode/Value">      
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS " moodCode="EVN ">
                                <code code="DE04.30.017.00" displayName="检查/检验结果代码" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="卫生信息数据元目录"/>
                                <value xsi:type="CD" code="{resultCode/Value}" codeSystem="2.16.156.10011.2.3.2.38" codeSystemName="检查（检验）结果代码表"></value>
                                <xsl:comment> 1.正常 2.异常 3.不确定</xsl:comment> 
                            </observation>
                        </entryRelationship>
                    </xsl:if>
            </observation>     
        </entry>
    </xsl:template>
    <!--手术操作章节-->
    <xsl:template match="Procedure">
        <xsl:comment>手术操作章节</xsl:comment>
        <component>
            <section>
                <code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>             
               <xsl:comment>抢救措施</xsl:comment>
                <entry>
                    <procedure classCode="ACT" moodCode="EVN ">
                        <code code="DE06.00.094.00" displayName="抢救措施" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <text xsi:type="ST"><xsl:value-of select="rescue/name/Value"/></text>
                    </procedure>
                </entry>
                <xsl:apply-templates select="Items/ProcedureItem"></xsl:apply-templates>
                <xsl:comment>抢救开始日期时间</xsl:comment>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.221.00" displayName="抢救开始日期时间" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="TS" value="{rescue/begin/Value}"/>
                    </observation>
                </entry>
                <xsl:comment>抢救结束日期时间</xsl:comment>        
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.218.00" displayName="抢救结束日期时间" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="TS" value="{rescue/end/Value}"/>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 手术操作条目 -->
    <xsl:template match="Items/ProcedureItem">
        <entry>
            <xsl:comment>手术及操作编码</xsl:comment>
            
            <procedure classCode="PROC" moodCode="EVN">
                <code code="{code/Value}" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表（ICD-9-CM）"/>
                <statusCode/>
                <xsl:comment>手术操作目标部位名称DE06.00.187.00-</xsl:comment>
               
                <targetSiteCode code="{bodyPart/Value}" codeSystem="2.16.156.10011.2.3.1.266"  codeSystemName="操作部位代码表"></targetSiteCode>
                <xsl:comment>手术及操作名称</xsl:comment>
           
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN ">
                        <code code="DE06.00.094.00" displayName="手术及操作名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST"><xsl:value-of select="name/Value"/></value>
                    </observation>
                </entryRelationship>						
                <xsl:comment>介入物名称</xsl:comment>
                
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS " moodCode="EVN ">
                        <code code="DE08.50.037.00" displayName="介入物名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST"><xsl:value-of select="intervention/Value"/></value>
                    </observation>
                </entryRelationship>
                <xsl:comment>操作方法</xsl:comment>
                
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN ">
                        <code code="DE06.00.251.00" displayName="操作方法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST"><xsl:value-of select="operationWay/Value"/></value>
                    </observation>
                </entryRelationship>
                <xsl:comment>操作次数</xsl:comment>
                
                <entryRelationship typeCode="COMP ">
                    <observation classCode="OBS" moodCode="EVN ">
                        <code code="DE06.00.250.00" displayName="操作次数" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="PQ" value="{operationTimes/Value}" unit="次"/>
                    </observation>
                </entryRelationship>
            </procedure>
        </entry>
    </xsl:template>
    <!--治疗计划章节-->
    <xsl:template match="TreatmentPlan/caution">
       <xsl:comment>治疗计划章节</xsl:comment> 
        <component>
            <section>
                <code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <xsl:comment>注意事项</xsl:comment> 
                <entry>
                    <observation classCode="OBS" moodCode="EVN ">
                        <code code="DE09.00.119.00" displayName="注意事项" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST"><xsl:value-of select="Value"/></value>
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
                <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <xsl:apply-templates select="Western"></xsl:apply-templates>   	
                <xsl:comment>病情变换情况</xsl:comment>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.10.134.00" displayName="病情变化情况" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST"><xsl:value-of select="/Document/Diagnosis/situationChange/Value"/></value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 诊断条目 -->
    <xsl:template match="Western">
        <xsl:comment>条目:疾病诊断名称</xsl:comment> 
        <entry>
            <observation classCode="OBS" moodCode="EVN ">
                <code code="DE05.01.025.00" displayName="疾病诊断名称" 
                    codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                <value xsi:type="ST"><xsl:value-of select="diag/name/Value"/></value>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.01.024.00" displayName="疾病诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="CD" code="{diag/code/Value}" displayName="{diag/code/Display}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="诊断代码表（ICD-10）"/>
                    </observation>
                </entryRelationship>
            </observation>
        </entry>	
    </xsl:template>
    <!-- 讨论参与者 -->
    <xsl:template match="Header/Participants">
      <xsl:comment>讨论成员信息</xsl:comment>  
        <participant typeCode="CON">
            <associatedEntity classCode="ECON">
                <xsl:comment>参加讨论人员名单</xsl:comment>   
                <associatedPerson>
                    <xsl:apply-templates select="Participant"></xsl:apply-templates>
                </associatedPerson>
            </associatedEntity>
        </participant>	
    </xsl:template>
    <xsl:template match="Participant">
        <name><xsl:value-of select="associatedPersonName/Value"/></name>
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
            <xsl:when test="assignedEntityCode = '医师'">
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