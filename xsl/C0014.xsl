<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc"
    xmlns:isc="http://extension-functions.intersystems.com" xmlns:exsl="http://exslt.org/common"
    xmlns:set="http://exslt.org/sets" exclude-result-prefixes="isc sdtc exsl set"> 
    <xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
    <xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
    <xsl:include href="CDA-Support-Files/Location.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/Document">       
        <ClinicalDocument xsi:schemaLocation="urn:hl7-org:v3 ../sdschemas/CDA.xsd">
            <xsl:comment>文档活动类信息</xsl:comment>
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
            <versionNumber/>
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <xsl:apply-templates select="Header/recordTarget/healthRecordId" mode="healthRecordNumber"/> 
                    <xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/> 
                    <xsl:apply-templates select ="Header/recordTarget/addr" mode="Address"/>
                    <xsl:comment>患者基本信息</xsl:comment>                     
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者姓名，必选-->
                        <xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
                        <xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
                       
                        <xsl:apply-templates select="Header/recordTarget/patient/birthTime" mode="BirthTime"></xsl:apply-templates>
                        <xsl:comment> 婚姻状况</xsl:comment>
                        <xsl:apply-templates select="Header/recordTarget/patient/maritalStatusCode" mode="MaritalStatus"></xsl:apply-templates>
                        <xsl:comment> 民族</xsl:comment>
                        <xsl:apply-templates select="Header/recordTarget/patient/ethnicGroupCode" mode="EthnicGroup"/>
                        <xsl:comment>出生地</xsl:comment>
                        <xsl:apply-templates select="Header/recordTarget/patient/birthplace" mode="BirthPlace"/>
                        <xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"/>
                        <xsl:comment>工作单位</xsl:comment>
                        <xsl:apply-templates select="Header/recordTarget/patient" mode="Employer"/>
                        <xsl:comment>常住</xsl:comment>
                    </patient>
                </patientRole>
            </recordTarget>
            <!--创建者信息-->
            <xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/> 
            <xsl:apply-templates select="Header/custodian" mode="Custodian"/>
            <xsl:apply-templates select="Header/Authenticators/Authenticator"></xsl:apply-templates>
            <xsl:apply-templates select="Header/Participants/Participant"></xsl:apply-templates>
            <xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"></xsl:apply-templates>
            <componentOf>
                <xsl:apply-templates select="Header/encompassingEncounter/Locations/Location"
                    mode="EncompassingEncounter"/>
            </componentOf>
            <component>
                <structuredBody>
                    <!-- 主要健康问题章节 -->
                    <xsl:apply-templates select="Problem/inlabor"/>
                    <!--  生命体征章节 -->
                    <xsl:apply-templates select="VitalSigns"/>
                    <!-- 产前检查章节 -->
                    <xsl:apply-templates select="PrenatalEvent"></xsl:apply-templates>
                    <!-- 处置计划章节 -->
                    <xsl:apply-templates select ="TreatmentPlan/InLabor"></xsl:apply-templates>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
    <!-- 主要健康问题 -->
    <xsl:template match="Problem/inlabor">
        <component>
            <section>
                <code code="11450-4" displayName="Problem list" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.197.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{laborTime/displayName}"/>
                        <value xsi:type="TS" value="{laborTime/Value}"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.01.108.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{pregTimes/displayName}"/>
                        <value xsi:type="INT" value="{pregTimes/Value}"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE02.10.002.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{deliverTimes/displayName}"/>
                        <value xsi:type="INT" value="{deliverTimes/Value}"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE02.10.051.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{LMP/displayName}"/>
                        <value xsi:type="TS" value="{LMP/Value}"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.261.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{conceptionForm/displayName}"/>
                        <value xsi:type="CD" code="{conceptionForm/Value}" displayName="自然" codeSystem="2.16.156.10011.2.3.2.44" codeSystemName="受孕形式代码表"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.10.098.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{EDC/displayName}"/>
                        <value xsi:type="TS" value="{EDC/Value}"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.013.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{prenatalExam/displayName}"/>
                        <value xsi:type="BL" value="{prenatalExam/Value}"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.10.161.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{abnormal/displayName}"/>
                        <value xsi:type="ST"><xsl:value-of select="abnormal/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.10.070.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{specialCase/displayName}"/>
                        <value xsi:type="ST"><xsl:value-of select="specialCase/Value"/></value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 生命体征章节 -->
    <xsl:template match ="VitalSigns">
        <xsl:comment> 生命体征章节 </xsl:comment>
        <component>
            <section>
                <code code="8716-3" displayName="VITAL SIGNS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
        <xsl:apply-templates select="VitalSign"></xsl:apply-templates>
        </section>
        </component>
    </xsl:template>
    <!-- 生命体征条目模板 -->
    <xsl:template match="VitalSign">
        <xsl:choose>
            <xsl:when test=" type='DE04.10.174.00'">
                <entry>
                    <organizer classCode="BATTERY" moodCode="EVN">
                        <statusCode/>
                        <component>
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE04.10.174.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="收缩压"/>
                                <value xsi:type="PQ" value="{value}" unit="mmHg"/>
                            </observation>
                        </component>
                        <component>
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE04.10.176.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="舒张压"/>
                                <value xsi:type="PQ" value="{/Document/VitalSigns/VitalSign[type='DE04.10.176.00']/value}" unit="mmHg"/>
                            </observation>
                        </component>
                    </organizer>
                </entry>
            </xsl:when>
            <xsl:when test="type='DE04.10.176.00'">             
            </xsl:when>
            <xsl:when test="(substring-after(display,'（') != '')or(substring-after(display,'(') != '')">
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="{type}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{display}"/>
                        <xsl:if test="substring-after(display,'（') != ''">
                            <value xsi:type="PQ" value="{value}" unit="{substring-before(substring-after(display,'（'),'）')}"/>
                        </xsl:if>
                        <xsl:if test="substring-after(display,'(') != ''">
                            <value xsi:type="PQ" value="{value}" unit="{substring-before(substring-after(display,'('),')')}"/>
                        </xsl:if>   
                    </observation>
                </entry>
            </xsl:when>
            <xsl:otherwise>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="{type}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{display}"/>
                        <value xsi:type="ST"><xsl:value-of select="value"/></value>
                    </observation>
                </entry>
            </xsl:otherwise>
        </xsl:choose>
     </xsl:template>
    <!-- 产前检查章节 模板 -->
    <xsl:template match="PrenatalEvent">
        <xsl:comment>产前检查章节 </xsl:comment>
        <component>
            <section>
                <code code="57073-9" displayName="Prenatal events" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.067.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{uterusFundusHeight/displayName}"/>
                        <value xsi:type="PQ" value="{uterusFundusHeight/Value}" unit="cm"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.052.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{abdominalCircum/displayName}"/>
                        <value xsi:type="PQ" value="{abdominalCircum/Value}" unit="cm"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.01.044.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="胎方位代码"/>
                        <value xsi:type="CD" code="{fetalOrientation/Value}" displayName="{fetalOrientation/Display}" codeSystem="2.16.156.10011.2.3.1.106" codeSystemName="胎方位代码表"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.183.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="胎心率（次/min）"/>
                        <value xsi:type="PQ" value="{fetalHeartRate/Value}" unit="次/min"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.10.135.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="头位难产情况的评估"/>
                        <value xsi:type="ST"><xsl:value-of select="cephalicDystocia/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.247.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出口横径（cm）"/>
                        <value xsi:type="PQ" value="{outletTransverseDiameter/Value}" unit="cm"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.175.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="骶耻外径（cm）"/>
                        <value xsi:type="PQ" value="{sacralExternalDiameter/Value}" unit="cm"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.239.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="坐骨结节间径（cm）"/>
                        <value xsi:type="PQ" value="{ischialTubercleDiameter/Value}" unit="cm"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.245.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="宫缩情况"/>
                        <value xsi:type="ST"><xsl:value-of select="uterineContraction/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.248.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="宫颈厚度"/>
                        <value xsi:type="ST"><xsl:value-of select="cervicalThickness/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.265.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="宫口情况"/>
                        <value xsi:type="ST"><xsl:value-of select="uterineOrifice/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.10.155.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="胎膜情况代码"/>
                        <value xsi:type="CD" code="{fetalMembrane/Value}" displayName="{fetalMembrane/Display}" codeSystem="2.16.156.10011.2.3.2.45" codeSystemName="胎膜情况代码表"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.256.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="破膜方式代码"/>
                        <value xsi:type="CD" code="{fetalMembraneBreaking/Value}" displayName="{fetalMembraneBreaking/Display}" codeSystem="2.16.156.10011.2.3.2.46" codeSystemName="破膜方式代码表"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.262.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="先露位置"/>
                        <value xsi:type="ST"><xsl:value-of select="firstExposedPosition/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.30.062.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="羊水情况"/>
                        <value xsi:type="ST"><xsl:value-of select="amnioticFluid/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.257.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="膀胱充盈标志"/>
                        <value xsi:type="BL" value="{bladderFilling/Value}"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.01.123.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="肠胀气标志"/>
                        <value xsi:type="BL" value="{flatulence/Value}"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.50.139.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检查方式代码"/>
                        <value xsi:type="CD" code="{inspectionMethod/Value}" displayName="{inspectionMethod/Display}" codeSystem="2.16.156.10011.2.3.2.46" codeSystemName="检查方式代码表"/>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 处置计划章节模板 -->
    <xsl:template match="TreatmentPlan/InLabor">
        <component>
            <section>
                <code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.10.014.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="处置计划"/>
                        <value xsi:type="ST"><xsl:value-of select="plan/Value"/></value>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE02.10.011.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="计划选取的分娩方式"/>
                        <value xsi:type="CD" code="{plannedDeliverWay/Value}" displayName="{plannedDeliverWay/Display}" codeSystem="2.16.156.10011.2.3.1.10" codeSystemName="分娩方式代码表"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE09.00.053.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="产程记录日期时间"/>
                        <value xsi:type="TS" value="{laborProcessRecTime/Value}"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.190.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="产程经过"/>
                        <value xsi:type="ST"><xsl:value-of select="laborProcess/Value"/></value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 联系人模板 -->
    <xsl:template match="Header/Participants/Participant">
        <xsl:choose>
            <xsl:when test="typeCode = 'NOT'">
                <participant typeCode="NOT">
                <associatedEntity classCode="ECON">
                  <xsl:comment>联系人电话</xsl:comment>  
                    <telecom value="{telcom/Value}"/>
                    <xsl:comment> 联系人</xsl:comment>
                    <associatedPerson>
                         <xsl:comment>姓名</xsl:comment>
                        <name><xsl:value-of select="associatedPersonName/Value"/></name>
                    </associatedPerson>
                </associatedEntity>
                </participant>
            </xsl:when>
        </xsl:choose>
        
    </xsl:template>
    <!-- 产检 authenticator 判断  -->
    <xsl:template match="Header/Authenticators/Authenticator">
        <xsl:choose>
            <xsl:when test="assignedEntityCode = '产程检查者'">
                <xsl:call-template name="MediAuthenticator"></xsl:call-template>
            </xsl:when>
            <xsl:when test="assignedEntityCode = '记录人'">
                <xsl:call-template name="MediAuthenticator"></xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name = "MediAuthenticator">
        <authenticator>
            <time>             
            </time>
            <signatureCode/>
            <assignedEntity>
                <id root="2.16.156.10011.1.5" extension="医务人员编号"/>
                <code displayName="{assignedEntityCode}"/>
                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                    <name>
                        <xsl:value-of select="assignedPersonName/Value"/>
                    </name>
                </assignedPerson>
            </assignedEntity>
        </authenticator>
    </xsl:template>
</xsl:stylesheet>