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
            <templateId root="2.16.156.10011.2.1.1.37"/>
            <!--文档流水号-->
            <xsl:call-template name="DocumentNo"/>
            <title>一般护理记录</title>
            <xsl:call-template name="effectiveTime"/>
            <xsl:call-template name="Confidentiality"/>
            <xsl:call-template name="languageCode"/>
            <setId/>
            <versionNumber/>
            <!--文档记录对象（患者）-->
            <xsl:comment>文档记录对象（患者）</xsl:comment>
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <!--住院号标识-->
                    <xsl:comment>住院号</xsl:comment>
                    <id root="2.16.156.10011.1.12" extension="{Header/recordTarget/inpatientNum/Value}"/>
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
                    <providerOrganization classCode="ORG" determinerCode="INSTANCE">
                        <id root="2.16.156.10011.1.5" extension="{Header/recordTarget/providerOrganization/providerOrganizationId/Value}"/>
                        <name><xsl:value-of select="Header/recordTarget/providerOrganization/providerOrganizationName"/></name>
                    </providerOrganization>
                </patientRole>
            </recordTarget>
            <!--文档创作者 -->
            <xsl:for-each select="Header/author">
                <xsl:comment>文档作者</xsl:comment>
                <author typeCode="AUT" contextControlCode="OP">
                    <time value="{time}"/>
                    <assignedAuthor classCode="ASSIGNED">
                        <id root="2.16.156.10011.1.7" extension="{assignedPersonId}"/>
                        <code displayName="护士"/>
                        <assignedPerson>
                            <name>
                                <xsl:value-of select="assignedPersonName/Value"/>
                            </name>
                        </assignedPerson>
                    </assignedAuthor>
                </author>
            </xsl:for-each>
            <!-- 保管机构-数据录入者信息 --><xsl:comment>保管机构</xsl:comment>
            <custodian typeCode="CST">
                <assignedCustodian classCode="ASSIGNED">
                    <representedCustodianOrganization classCode="ORG" determinerCode="INSTANCE">
                        <id root="2.16.156.10011.1.5" extension="{Header/custodian/organizationId}"/>
                        <name>
                            <xsl:value-of select="Header/custodian/organizationName"/>
                        </name>
                    </representedCustodianOrganization>
                </assignedCustodian>
            </custodian>
            <!-- 签名 -->
            <authenticator>
                <xsl:for-each select="Header/Authenticators/Authenticator[1]">
                    <!--签名日期时间：DE09.00.053.00 -->
                    <time>
                        <xsl:if test="time/Value">
                            <xsl:attribute name="value">
                                <xsl:value-of select="time/Value" />
                            </xsl:attribute>
                        </xsl:if>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.5" extension="医务人员编号"/>
                        <code displayName="护士"/>
                        <assignedPerson>
                            <!--姓名-->
                            <name><xsl:value-of select="assignedPersonName/Value"/></name>
                        </assignedPerson>
                    </assignedEntity>
                </xsl:for-each>
            </authenticator>
            <!--关联活动信息-->
            <xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
            
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
                                        <id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedNum/Value}"/>
                                        <name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/bedNum/Display"/></name>
                                        <!-- DE01.00.019.00	病房号 -->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardName/Value}"/>
                                                <name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/wardName/Display"/></name>
                                                <!-- DE08.10.026.00	科室名称 -->
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/deptName/Value}"/>
                                                        <name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptName/Display"/></name>
                                                        <!-- DE08.10.054.00	病区名称 -->
                                                        <asOrganizationPartOf classCode="PART">
                                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                <id root="2.16.156.10011.1.27" extension="{Header/encompassingEncounter/Locations/Location/areaName/Value}"/>
                                                                <name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Display"/></name>
                                                                <!--XXX医院 -->
                                                                <asOrganizationPartOf classCode="PART">
                                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                        <id root="2.16.156.10011.1.5" extension="{Header/encompassingEncounter/Locations/Location/hosId}"/>
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
            <!--文档体-->
            <xsl:comment>文档体</xsl:comment>
            <component>
                <structuredBody>
                    <!--疾病诊断章节-->
                    <xsl:comment>疾病诊断章节</xsl:comment>
                    <xsl:apply-templates select="Diagnosis/Westerns/Western"/>
                    <!--过敏史章节-->
                    <xsl:comment>过敏史章节</xsl:comment>
                    <xsl:apply-templates select="Allergy/Allergies/Item"/>
                    <!--生命体征章节-->
                    <xsl:comment>生命体征章节</xsl:comment>
                    <xsl:apply-templates select="VitalSigns"/>
                    <!--四肢章节-->
                    <xsl:comment>四肢章节</xsl:comment>
                    <xsl:apply-templates select="Extremities"/>
                    <!--健康评估章节-->
                    <xsl:comment>健康评估章节</xsl:comment>
                    <xsl:apply-templates select="HealthAssessment/diet"/>
                    <!--健康指导章节-->
                    <xsl:comment>健康指导章节</xsl:comment>
                    <xsl:apply-templates select="HealthGuidance/diet"/>
                    <!--护理记录章节-->
                    <xsl:comment>护理记录章节</xsl:comment>
                    <xsl:apply-templates select="NursingRecord"/>
                    <!--护理观察章节-->
                    <xsl:comment>护理观察章节</xsl:comment>
                    <xsl:apply-templates select="NursingObservations"/>
                    <!--护理操作章节-->
                    <xsl:comment>护理操作章节</xsl:comment>
                    <xsl:apply-templates select="NursingOperations"/>
                    <!--手术评估记录标志章节-->
                    <xsl:comment>手术评估记录标志章节</xsl:comment>
                    <xsl:apply-templates select="ProcedureAssessment"/>
                    <!--护理隔离章节-->
                    <xsl:comment>护理隔离章节</xsl:comment>
                    <xsl:apply-templates select="NursingIsolation"/>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
    <!--疾病诊断章节-->
    <xsl:template match="Diagnosis/Westerns/Western">
        <component>
            <section>
                <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.01.024.00" displayName="诊断代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <!--value为编码类型（CD），不能出现属性=""的情况，因此某属性取不到值时该属性不能输出-->
                        <value xsi:type="CD" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
                            <xsl:if test="diag/code/Value">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="diag/code/Value" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="diag/code/Display">
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="diag/code/Display" />
                                </xsl:attribute>
                            </xsl:if>
                        </value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--过敏史章节-->
    <xsl:template match="Allergy/Allergies/Item">
        <component>
            <section>
                <code code="48765-2" displayName="Allergies, adverse reactions, alerts" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史描述"/>
                        <value xsi:type="ST"><xsl:value-of select="allergen/Value" /></value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--生命体征章节-->
    <xsl:template match="VitalSigns">
        <component>
            <section>
                <code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="VITAL SIGNS"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体重（kg）"/>
                        <value xsi:type="PQ" unit="kg">
                            <xsl:for-each select="VitalSign">
                                <xsl:if test="type = 'DE04.10.188.00'">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="value" />
                                    </xsl:attribute>
                                </xsl:if>
                            </xsl:for-each>
                        </value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.186.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体温（℃）"/>
                        <value xsi:type="PQ" unit="℃">
                            <xsl:for-each select="VitalSign">
                                <xsl:if test="type = 'DE04.10.186.00'">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="value" />
                                    </xsl:attribute>
                                </xsl:if>
                            </xsl:for-each>
                        </value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.081.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="呼吸频率（次/min）"/>
                        <value xsi:type="PQ" unit="次/min">
                            <xsl:for-each select="VitalSign">
                                <xsl:if test="type = 'DE04.10.081.00'">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="value" />
                                    </xsl:attribute>
                                </xsl:if>
                            </xsl:for-each>
                        </value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.118.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="脉率（次/min）"/>
                        <value xsi:type="PQ" unit="次/min">
                            <xsl:for-each select="VitalSign">
                                <xsl:if test="type = 'DE04.10.118.00'">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="value" />
                                    </xsl:attribute>
                                </xsl:if>
                            </xsl:for-each>
                        </value>
                    </observation>
                </entry>
                <entry>
                    <organizer classCode="BATTERY" moodCode="EVN">
                        <statusCode/>
                        <component>
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE04.10.174.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="收缩压"/>
                                <value xsi:type="PQ" unit="mmHg">
                                    <xsl:for-each select="VitalSign">
                                        <xsl:if test="type = 'DE04.10.174.00'">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="value" />
                                            </xsl:attribute>
                                        </xsl:if>
                                    </xsl:for-each>
                                </value>
                            </observation>
                        </component>
                        <component>
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE04.10.176.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="舒张压"/>
                                <value xsi:type="PQ" unit="mmHg">
                                    <xsl:for-each select="VitalSign">
                                        <xsl:if test="type = 'DE04.10.176.00'">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="value" />
                                            </xsl:attribute>
                                        </xsl:if>
                                    </xsl:for-each>
                                </value>
                            </observation>
                        </component>
                    </organizer>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.50.149.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="血氧饱和度（%）"/>
                        <value xsi:type="PQ" unit="%">
                            <xsl:for-each select="VitalSign">
                                <xsl:if test="type = 'DE04.50.149.00'">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="value" />
                                    </xsl:attribute>
                                </xsl:if>
                            </xsl:for-each>
                        </value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--四肢章节-->
    <xsl:template match="Extremities">
        <component>
            <section>
                <code code="10196-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="EXTREMITIES"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.237.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="足背动脉搏动标志"/>
                        <value xsi:type="BL">
                            <xsl:if test="arteriaDorsalPedisPulse/Value">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="arteriaDorsalPedisPulse/Value" />
                                </xsl:attribute>
                            </xsl:if>
                        </value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--健康评估章节-->
    <xsl:template match="HealthAssessment/diet">
        <component>
            <section>
                <code code="51848-0" displayName="Assessment note" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE03.00.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="饮食情况代码"/>
                        <value xsi:type="CD" codeSystem="2.16.156.10011.2.3.2.34" codeSystemName="饮食情况代码表">
                            <xsl:if test="Value">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="Value" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="Display">
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="Display" />
                                </xsl:attribute>
                            </xsl:if>
                        </value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--健康指导章节-->
    <xsl:template match="HealthGuidance/diet">
        <component>
            <section>
                <code code="69730-0" codeSystem="2.16.840.1.113883.6.1" displayName="Instructions" codeSystemName="LOINC"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.291.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="饮食指导代码"/>
                        <value xsi:type="CD" codeSystem="2.16.156.10011.2.3.1.263" codeSystemName="饮食指导代码表">
                            <xsl:if test="Value">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="Value" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="Display">
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="Display" />
                                </xsl:attribute>
                            </xsl:if>
                        </value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--护理记录章节-->
    <xsl:template match="NursingRecord">
        <component>
            <section>
                <code displayName="护理记录"/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.211.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理等级代码"/>
                        <value xsi:type="CD" codeSystem="2.16.156.10011.2.3.1.259" codeSystemName="护理等级代码表">
                            <xsl:if test="nursingLevel/Value">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="nursingLevel/Value" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="nursingLevel/Display">
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="nursingLevel/Display" />
                                </xsl:attribute>
                            </xsl:if>
                        </value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.212.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理类型代码"/>
                        <value xsi:type="CD" codeSystem="2.16.156.10011.2.3.1.260" codeSystemName="护理类型代码表">
                            <xsl:if test="nursingType/Value">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="nursingType/Value" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="nursingType/Display">
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="nursingType/Display" />
                                </xsl:attribute>
                            </xsl:if>
                        </value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.209.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="导管护理描述"/>
                        <value xsi:type="ST"><xsl:value-of select="catheterNurse/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.229.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="气管护理代码"/>
                        <value xsi:type="CD" codeSystem="2.16.156.10011.2.3.2.50" codeSystemName="气管护理代码表">
                            <xsl:if test="tracheaNurse/Value">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="tracheaNurse/Value" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="tracheaNurse/Display">
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="tracheaNurse/Display" />
                                </xsl:attribute>
                            </xsl:if>
                        </value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.259.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体位护理"/>
                        <value xsi:type="ST"><xsl:value-of select="positionNurse/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.50.068.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="皮肤护理"/>
                        <value xsi:type="ST"><xsl:value-of select="skinNurse/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.292.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="营养护理"/>
                        <value xsi:type="ST"><xsl:value-of select="nutritionNurse/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.283.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="心理护理代码"/>
                        <value xsi:type="CD" codeSystem="2.16.156.10011.2.3.2.51" codeSystemName="心理护理代码表">
                            <xsl:if test="psychologyNurse/Value">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="psychologyNurse/Value" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="psychologyNurse/Display">
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="psychologyNurse/Display" />
                                </xsl:attribute>
                            </xsl:if>
                        </value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.178.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="安全护理代码"/>
                        <value xsi:type="CD" codeSystem="2.16.156.10011.2.3.2.52" codeSystemName="安全护理代码表">
                            <xsl:if test="saftyNurse/Value">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="saftyNurse/Value" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="saftyNurse/Display">
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="saftyNurse/Display" />
                                </xsl:attribute>
                            </xsl:if>
                        </value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--护理观察章节-->
    <xsl:template match="NursingObservations">
        <component>
            <section>
                <code displayName="护理观察"/>
                <xsl:for-each select="NursingObservation[1]">  
                    <!--简要病情-->
                    <entry>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.181.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="简要病情"/>
                            <value xsi:type="ST"><xsl:value-of select="briefCondition/Value"/></value>
                        </observation>
                    </entry>
                    <!--护理观察结果条目-->
                    <entry>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE02.10.031.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理观察项目名称"/>
                            <value xsi:type="ST"><xsl:value-of select="item/Value"/></value>
                            <entryRelationship typeCode="COMP">
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理观察结果"/>
                                    <value xsi:type="ST"><xsl:value-of select="result/Value"/></value>
                                </observation>
                            </entryRelationship>
                        </observation>
                    </entry>
                </xsl:for-each>  
            </section>
        </component>
    </xsl:template>
    <!--护理操作章节-->
    <xsl:template match="NursingOperations">
        <xsl:for-each select="NursingOperation">
            <component>
                <section>
                    <code displayName="护理操作"/>
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
                </section>
            </component>
        </xsl:for-each>
    </xsl:template>
    <!--手术评估记录标志章节-->
    <xsl:template match="ProcedureAssessment">
        <component>
            <section>
                <code displayName="手术评估标志"/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.204.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="发出手术安全核对表标志"></code>
                        <value xsi:type="BL">
                            <xsl:if test="sendSaftyForm/Value">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="sendSaftyForm/Value" />
                                </xsl:attribute>
                            </xsl:if>
                        </value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.338.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="收回手术安全核对表标志"/>
                        <value xsi:type="BL">
                            <xsl:if test="collectSaftyForm/Value">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="collectSaftyForm/Value" />
                                </xsl:attribute>
                            </xsl:if>
                        </value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.204.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="发出手术风险评估表标志"/>
                        <value xsi:type="BL">
                            <xsl:if test="sendRiskForm/Value">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="sendRiskForm/Value" />
                                </xsl:attribute>
                            </xsl:if>
                        </value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.338.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="收回手术风险评估表标志"/>
                        <value xsi:type="BL">
                            <xsl:if test="collectRiskForm/Value">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="collectRiskForm/Value" />
                                </xsl:attribute>
                            </xsl:if>
                        </value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--护理隔离章节-->
    <xsl:template match="NursingIsolation">
        <component>
            <section>
                <code displayName="护理隔离"/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.201.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="隔离标志"/>
                        <value xsi:type="BL">
                            <xsl:if test="isolation/Value">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="isolation/Value" />
                                </xsl:attribute>
                            </xsl:if>
                        </value>
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE06.00.202.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="隔离种类代码"/>
                                <value xsi:type="CD" codeSystem="2.16.156.10011.2.3.1.261" codeSystemName="隔离种类代码表">
                                    <xsl:if test="isolationType/Value">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="isolationType/Value" />
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:if test="isolationType/Display">
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="isolationType/Display" />
                                        </xsl:attribute>
                                    </xsl:if>
                                </value>
                            </observation>
                        </entryRelationship>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
</xsl:stylesheet>