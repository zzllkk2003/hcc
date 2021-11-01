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
            <templateId root="2.16.156.10011.2.1.1.27"/>
            <!--文档流水号-->
            <xsl:call-template name="DocumentNo"/>
            <title>检验记录</title>
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

                    <!--检验报告单号标识-->
                    <xsl:comment>检验报告单号标识</xsl:comment>
                    <id root="2.16.156.10011.1.33" extension="{Header/recordTarget/labReportNum/Value}"/>

                    <!--电子申请单编号-->
                    <xsl:comment>电子申请单编号</xsl:comment>
                    <id root="2.16.156.10011.1.24" extension="{Header/recordTarget/labOrderNum/Value}"/>

                    <!-- 检验标本编号标识 -->
                    <xsl:comment>检验标本编号标识</xsl:comment>
                    <id root="2.16.156.10011.1.14" extension="{Header/recordTarget/specimenNum/Value}"/>

                    <!-- 患者类别代码 -->
                    <xsl:comment>患者类别代码</xsl:comment>
                    <patientType>
                        <patienttypeCode code="1" codeSystem="2.16.156.10011.2.3.1.271" codeSystemName="患者类型代码表" displayName="门诊">
                            <xsl:if test="Header/recordTarget/patientType/Value">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="Header/recordTarget/patientType/Value" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="Header/recordTarget/patientType/Display">
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="Header/recordTarget/patientType/Display" />
                                </xsl:attribute>
                            </xsl:if>
                        </patienttypeCode>
                    </patientType>
                    <xsl:if test="Header/recordTarget/telcom/Value">
                        <telecom value="{Header/recordTarget/telcom/Value}"/>
                    </xsl:if>
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
            <xsl:apply-templates select="Header/author" mode="AuthorNoOrganization"/>
            <!-- 保管机构-数据录入者信息 -->
            <xsl:apply-templates select="Header/custodian" mode="Custodian"/>

            <xsl:for-each select="Header/LegalAuthenticators/LegalAuthenticator">
                <xsl:if test="assignedEntityCode = '审核医师'">
                    <xsl:comment><xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
                    <legalAuthenticator>
                        <time/>
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
                </xsl:if>
            </xsl:for-each>

            <xsl:for-each select="Header/Authenticators/Authenticator">
                <xsl:if test="assignedEntityCode = '检验技师' or assignedEntityCode = '检验医师'">
                    <xsl:comment><xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
                    <authenticator>
                        <time/>
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
                    </authenticator>
                </xsl:if>
            </xsl:for-each>

            <!-- 检验申请机构及科室 -->
            <xsl:for-each select="Header/Participants/Participant">
                <xsl:if test="typeCode = 'PRF'">
                    <xsl:comment>检验申请机构及科室</xsl:comment>
                    <participant typeCode="PRF">
                        <associatedEntity classCode="ASSIGNED">
                            <scopingOrganization>
                                <id root="2.16.156.10011.1.26" extension="{scopingOrganization/Value}"/>
                                <name><xsl:value-of select="scopingOrganization/Display"/></name>
                                <asOrganizationPartOf>
                                    <wholeOrganization>
                                        <id root="2.16.156.10011.1.5" extension="{wholeOrganization/Value}"/>
                                        <name><xsl:value-of select="wholeOrganization/Display"/></name>
                                    </wholeOrganization>
                                </asOrganizationPartOf>
                            </scopingOrganization>
                        </associatedEntity>
                    </participant>
                </xsl:if>
            </xsl:for-each>

            <!--关联活动信息-->
            <xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>

            <!--病床号、病房、病区、科室和医院的关联-->
            <xsl:comment>病床号、病房、病区、科室和医院的关联</xsl:comment>
            <componentOf>
                <encompassingEncounter>
                    <effectiveTime/>
                    <location>
                        <healthCareFacility>
                            <serviceProviderOrganization>
                                <asOrganizationPartOf classCode="PART">
                                    <!-- DE01.00.026.00	病床号 -->
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedNum/Value}"/>
                                        <!-- DE01.00.019.00	病房号 -->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardName/Value}"/>
                                                <!-- DE08.10.026.00	科室名称 -->
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <id root="2.16.156.10011.1.26"/>
                                                        <name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptName/Value"/></name>
                                                        <!-- DE08.10.054.00	病区名称 -->
                                                        <asOrganizationPartOf classCode="PART">
                                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                <id root="2.16.156.10011.1.27"/>
                                                                <name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
                                                                <!--XXX医院 -->
                                                                <asOrganizationPartOf classCode="PART">
                                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                        <id root="2.16.156.10011.1.5" extension="001"/>
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
                    <!-- 诊断记录章节 -->
                    <xsl:comment>诊断记录章节</xsl:comment>
                    <xsl:apply-templates select="Diagnosis/Westerns/Western"/>
                    <!-- 实验室检查章节 -->
                    <xsl:comment>实验室检查章节</xsl:comment>
                    <xsl:apply-templates select="LabTest"/>
                    <!-- 检验报告章节 -->
                    <xsl:comment>检验报告章节</xsl:comment>
                    <xsl:apply-templates select="LabReport"/>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
    <!--诊断记录章节模板-->
    <xsl:template match="Diagnosis/Westerns/Western">
        <component>
            <section>
                <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.01.024.00" displayName="诊断代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <!--effectiveTime为时间戳类型，不能出现value=""的情况，因此取不到值时整个数据结点都不能输出-->
                        <xsl:if test="diag/code/Value">
                            <effectiveTime value="{diag/date/Value}"/>
                        </xsl:if>
                        <!--value为编码类型（CD），不能出现属性=""的情况，因此某属性取不到值时该属性不能输出-->
                        <value xsi:type="CD" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）">
                            <xsl:if test="diag/code/Value">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="diag/code/Value" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="diag/name/Value">
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="diag/name/Value" />
                                </xsl:attribute>
                            </xsl:if>
                        </value>
                        <xsl:if test="diag/diagnosisOrg/Value">
                            <performer>
                                <assignedEntity>
                                    <id/>
                                    <representedOrganization>
                                        <name><xsl:value-of select="diag/diagnosisOrg/Value"/></name>
                                    </representedOrganization>
                                </assignedEntity>
                            </performer>
                        </xsl:if>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--实验室检查章节模板-->
    <xsl:template match="LabTest">
        <component>
            <section>
                <code code="30954-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="STUDIES SUMMARY"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE02.10.027.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验方法名称"></code>
                        <xsl:if test="testMethod/Value">
                            <value xsi:type="ST"><xsl:value-of select="testMethod/Value"/></value>
                        </xsl:if>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.30.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验类别"></code>
                        <xsl:if test="testCategory/Value">
                            <value xsi:type="ST"><xsl:value-of select="testCategory/Value"/></value>
                        </xsl:if>
                    </observation>
                </entry>
                <!--检验项目模版-->
                <xsl:comment>检验项目</xsl:comment>
                <xsl:apply-templates select="Items/Item"/>
            </section>
        </component>
    </xsl:template>
    <!--检验项目模板-->
    <xsl:template match="Items/Item">
        <entry>
            <observation classCode="OBS" moodCode="EVN">
                <code code="DE04.50.019.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验项目代码"></code>
                <effectiveTime>
                    <xsl:if test="date/Value">
                        <xsl:attribute name="value">
                            <xsl:value-of select="date/Value" />
                        </xsl:attribute>
                    </xsl:if>
                </effectiveTime>
                <value xsi:type="ST"><xsl:value-of select="code/Value"/></value>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.50.134.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="标本类别"></code>
                        <effectiveTime>
                            <xsl:if test="specimen/collectTime/Value">
                                <low value="{specimen/collectTime/Value}"/>
                            </xsl:if>
                            <xsl:if test="specimen/receiveTime/Value">
                                <high value="{specimen/receiveTime/Value}"/>
                            </xsl:if>
                        </effectiveTime>
                        <xsl:if test="specimen/type/Value">
                            <value xsi:type="ST"><xsl:value-of select="specimen/type/Value"/></value>
                        </xsl:if>
                    </observation>
                </entryRelationship>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.50.135.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="标本状态"></code>
                        <xsl:if test="specimenStatus/Value">
                            <value xsi:type="ST"><xsl:value-of select="specimenStatus/Value"/></value>
                        </xsl:if>
                    </observation>
                </entryRelationship>
            </observation>
        </entry>
        <entry>
            <observation classCode="OBS" moodCode="EVN">
                <code code="DE04.30.017.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验结果代码"></code>
                <value xsi:type="CD" codeSystem="2.16.156.10011.2.3.2.38" codeSystemName="检查（检验）结果代码表">
                    <xsl:if test="resultCode/Value">
                        <xsl:attribute name="code">
                            <xsl:value-of select="resultCode/Value" />
                        </xsl:attribute>
                    </xsl:if>
                </value>
            </observation>
        </entry>
        <entry>
            <observation classCode="OBS" moodCode="EVN">
                <code code="DE04.30.015.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验定量结果"></code>
                <value xsi:type="REAL">
                    <xsl:if test="resultQuantity/value/Value">
                        <xsl:attribute name="value">
                            <xsl:value-of select="resultQuantity/value/Value" />
                        </xsl:attribute>
                    </xsl:if>
                </value>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.30.016.00" displayName="检查定量结果计量单位" codeSystemName="卫生信息数据元目录" codeSystem="2.16.156.10011.2.2.1" />
                        <value xsi:type="ST"><xsl:value-of select="resultQuantity/unit/Value"/></value>
                    </observation>
                </entryRelationship>
            </observation>
        </entry>
    </xsl:template>
    <!-- 检验报告章节模板-->
    <xsl:template match="LabReport">
        <component>
            <section>
                <code displayName="检验报告" />
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.50.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验报告结果"/>
                        <value xsi:type="ST"><xsl:value-of select="result/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE08.10.026.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验报告科室"/>
                        <value xsi:type="ST"><xsl:value-of select="dept/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE08.10.013.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验报告机构名称"/>
                        <value xsi:type="ST"><xsl:value-of select="org/Value"/></value>
                    </observation>
                </entry>
                <xsl:if test="notes/Value">
                    <entry>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.179.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验报告备注"/>
                            <value xsi:type="ST"><xsl:value-of select="notes/Value"/></value>
                        </observation>
                    </entry>
                </xsl:if>
            </section>
        </component>
    </xsl:template>


</xsl:stylesheet>
