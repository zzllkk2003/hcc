<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:isc="http://extension-functions.intersystems.com" xmlns:exsl="http://exslt.org/common" xmlns:set="http://exslt.org/sets" exclude-result-prefixes="isc sdtc exsl set">
    <xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
    <xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
    <xsl:include href="CDA-Support-Files/Location.xsl"/>
    <!-- 不输出空标签，如果需要空标签则删除strip-space -->
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/Document">
        <ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 ../sdschemas/CDA.xsd">
            <!--CDA Header-->
            <xsl:comment>CDA Header</xsl:comment>
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.47"/>
            <!--知情同意书编号-->
            <id root="2.16.156.10011.1.10" extension="D2011000001"/>
            <code code="C0027" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>麻醉知情同意书</title>
            <xsl:call-template name="effectiveTime"/>
            <xsl:call-template name="Confidentiality"/>
            <xsl:call-template name="languageCode"/>
            <setId/>
            <versionNumber/>
            
            <!--文档记录对象（患者）-->
            <xsl:comment>文档记录对象（患者）</xsl:comment>
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <!--门（急）诊号标识 -->
                    <xsl:comment>门（急）诊号标识</xsl:comment>
                    <id root="2.16.156.10011.1.11" extension="{Header/recordTarget/outpatientNum/Value}"/>
                    
                    <!--住院号标识-->
                    <xsl:comment>住院号标识</xsl:comment>
                    <id root="2.16.156.10011.1.12" extension="{Header/recordTarget/inpatientNum/Value}"/>
                    
                    <!--知情同意书编号标识-->
                    <xsl:comment>知情同意书编号标识</xsl:comment>
                    <xsl:if test="Header/recordTarget/consentFormNum/Value">
                        <id root="2.16.156.10011.1.34" extension="{Header/recordTarget/consentFormNum/Value}"/> 
                    </xsl:if>
                    <!--健康档案标识号-->
                    <xsl:comment>健康档案标识号</xsl:comment>
                    <id root="2.16.156.10011.1.24" extension="{Header/recordTarget/healthRecordId/Value}"/>
                    
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者身份证号码，必选-->
                        <xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>
                        <!--患者姓名，必选-->
                        <xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
                        <!-- 性别，必选 -->
                        <xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
                        <!-- 年龄 -->
                        <xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"/>
                    </patient>
                </patientRole>
            </recordTarget>
            <!-- 文档创作者 -->
            <xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
            <!-- 保管机构-数据录入者信息 -->
            <xsl:apply-templates select="Header/custodian" mode="Custodian"/>
           
            <!-- 责任医生 -->
            <xsl:for-each select="Header/LegalAuthenticators/LegalAuthenticator[1]">               
                    <xsl:comment><xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
                    <legalAuthenticator>
                        <time>
                            <xsl:if test="time/Value">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="time/Value" />
                                </xsl:attribute>
                            </xsl:if>
                        </time>
                        <signatureCode/>
                        <assignedEntity>
                            <id root="2.16.156.10011.1.4" extension="{assignedEntityId}"/>
                            <code displayName="{assignedEntityCode}"/>
                            <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                                <name>
                                    <xsl:value-of select="assignedPersonName/Display"/>
                                </name>
                            </assignedPerson>
                        </assignedEntity>
                    </legalAuthenticator>
                
            </xsl:for-each>
           
            <!--病床号、病房、病区、科室和医院的关联-->
            <xsl:comment>病床号、病房、病区、科室和医院的关联</xsl:comment>
            <componentOf>
                <encompassingEncounter>
                    <effectiveTime/>
                    <location>
                        <healthCareFacility classCode="SDLOC">
                            <serviceProviderOrganization classCode="ORG" determinerCode="INSTANCE">
                                <asOrganizationPartOf classCode="PART">
                                    <!-- DE01.00.026.00	病床号 -->
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.22">
                                            <xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="Header/encompassingEncounter/Locations/Location/bedId" />
                                                </xsl:attribute>
                                            </xsl:if>
                                        </id>
                                        <name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/bedNum/Display"/></name>
                                        <!-- DE01.00.019.00	病房号 -->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.21">
                                                    <xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
                                                        <xsl:attribute name="extension">
                                                            <xsl:value-of select="Header/encompassingEncounter/Locations/Location/wardId" />
                                                        </xsl:attribute>
                                                    </xsl:if>
                                                </id>
                                                <name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/wardName/Display"/></name>
                                                <!-- DE08.10.026.00	科室名称 -->
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <id root="2.16.156.10011.1.26">
                                                            <xsl:if test="Header/encompassingEncounter/Locations/Location/deptId">
                                                                <xsl:attribute name="extension">
                                                                    <xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptId" />
                                                                </xsl:attribute>
                                                            </xsl:if>
                                                        </id>
                                                        <name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptName/Display"/></name>
                                                        <!-- DE08.10.054.00	病区名称 -->
                                                        <asOrganizationPartOf classCode="PART">
                                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                <id root="2.16.156.10011.1.27">
                                                                    <xsl:if test="Header/encompassingEncounter/Locations/Location/areaId">
                                                                        <xsl:attribute name="extension">
                                                                            <xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaId" />
                                                                        </xsl:attribute>
                                                                    </xsl:if>
                                                                </id>
                                                                <name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Display"/></name>
                                                                <!--XXX医院 -->
                                                                <asOrganizationPartOf classCode="PART">
                                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                        <id root="2.16.156.10011.1.5">
                                                                            <xsl:if test="Header/encompassingEncounter/Locations/Location/hosId">
                                                                                <xsl:attribute name="extension">
                                                                                    <xsl:value-of select="Header/encompassingEncounter/Locations/Location/hosId" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                        </id>
                                                                        <name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/hosName"/></name>
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
            </componentOf>
           
            <xsl:comment>文档体</xsl:comment>
            <component>
                <structuredBody>
                    <!-- 术前诊断章节 -->
                    <xsl:comment>术前诊断章节</xsl:comment>
                    <xsl:apply-templates select="PreOpDiag"/>
                    <!-- 治疗计划章节 -->
                    <xsl:comment>治疗计划章节</xsl:comment>
                    <xsl:apply-templates select="TreatmentPlan"/>
                    <!-- 意见章节 -->
                    <xsl:comment>意见章节</xsl:comment>
                    <xsl:apply-templates select="Suggestion"/>
                    
                    <!-- 风险章节 -->
                    <xsl:comment>风险章节</xsl:comment>
                    <xsl:apply-templates select="Risk"/>
                    
                </structuredBody>
            </component>
            
        </ClinicalDocument>
    </xsl:template>
    <!--术前诊断章节模板-->
    <xsl:template match="PreOpDiag">
        <component>
            <section>
                <code code="10219-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Surgical operation note preoperative Dx"/>
                <text/>
                <!--术前诊断编码-->
                <xsl:for-each select="Items/Item">
                    <entry>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术前诊断编码"/>
                            <value xsi:type="CD" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
                                <xsl:if test="diagnosisCode/Value">
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="diagnosisCode/Value" />
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:if test="diagnosisCode/Display">
                                    <xsl:attribute name="displayName">
                                        <xsl:value-of select="diagnosisCode/Display" />
                                    </xsl:attribute>
                                </xsl:if>
                            </value>
                        </observation>
                    </entry>
                </xsl:for-each>
            </section>
        </component>
    </xsl:template>

    <!--治疗计划章节模板-->
    <xsl:template match="TreatmentPlan">
        <component>
            <section>
                <code code="10219-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="TREATMENT PLAN"/>
                <text/>
                <entry>
                    <!--拟实施麻醉-->
                    <xsl:comment>拟实施麻醉</xsl:comment>
                    <procedure classCode="PROC" moodCode="EVN">
                        <code code="1" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表" displayName="全身麻醉">
                            <xsl:if test="anesthesia/code/Value">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="anesthesia/code/Value" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="anesthesia/code/Display">
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="anesthesia/code/Display" />
                                </xsl:attribute>
                            </xsl:if>
                        </code>
                        <statusCode code="new"/>
                        <!--拟实施时间-->
                        <effectiveTime >
                            <xsl:if test="anesthesia/time/Value">
                                <xsl:attribute name="value">
                                    <xsl:variable name="lTime" select="anesthesia/time/Value" />
                                    <xsl:value-of select="substring($lTime,1,8)" />
                                </xsl:attribute>
                            </xsl:if>
                        </effectiveTime>
                        <!--拟实施手术-->
                        <entryRelationship typeCode="COMP">
                            <procedure classCode="PROC" moodCode="EVN">
                                <code codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表（ICD-9-CM)">
                                    <xsl:if test="anesthesia/procedure/Value">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="anesthesia/procedure/Value" />
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:if test="anesthesia/procedure/Display">
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="anesthesia/procedure/Display" />
                                        </xsl:attribute>
                                    </xsl:if>
                                </code>
                            </procedure>
                        </entryRelationship>
                        <!--拟行有创操作和检测方法-->
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="拟行有创操作和检测方法"/>
                                <value xsi:type="ST"><xsl:value-of select="anesthesia/test"/></value>
                            </observation>
                        </entryRelationship>
                        <!--基础疾病可能对麻醉产生的影像-->
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE05.01.146.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="基础疾病可能对麻醉产生的影响"/>
                                <value xsi:type="ST"><xsl:value-of select="anesthesia/effectFromBasicDisease/Value"/></value>
                                <!--基础疾病-->
                                <entryRelationship typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE04.01.121.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者基础疾病"/>
                                        <value xsi:type="ST"><xsl:value-of select="anesthesia/basicDisease/Value"/></value>
                                    </observation>
                                </entryRelationship>
                            </observation>
                        </entryRelationship>
                        <!--使用麻醉镇痛汞标志-->
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE06.00.240.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="使用麻醉镇痛汞标志"/>
                                <value xsi:type="ST"><xsl:value-of select="anesthesia/analgesicPump/Value"/></value>
                            </observation>
                        </entryRelationship>
                        <!--参加麻醉安全保险标志-->
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE01.00.016.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="参加麻醉安全保险标志"/>
                                <value xsi:type="ST"><xsl:value-of select="anesthesia/insurance/Value"/></value>
                            </observation>
                        </entryRelationship>
                    </procedure>
                </entry>
            </section>
        </component>    
    </xsl:template>
    
    <!-- 意见章节 -->
    <xsl:template match="Suggestion">
        <component>
            <section>
                <code displayName="意见章节"/>
                <text/>
                <!--医疗机构意见-->
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="医疗机构的意见"/>
                        <value xsi:type="ST"><xsl:value-of select="hospital/Value"/></value>
                    </observation>
                </entry>
                <!--患者意见-->
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者的意见"/>
                        <value xsi:type="ST"><xsl:value-of select="patient/Value"/></value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    
    <!-- 风险章节 -->
    <xsl:template match="Risk">
        <component>
            <section>
                <code displayName="操作风险"/>
                <text/>
                <!--麻醉中可能出现的意外-->
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.01.075.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉中，麻醉后可能产发生的意外及并发症"/>
                        <value xsi:type="ST"><xsl:value-of select="operationRisk/Value"/></value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
  
</xsl:stylesheet>