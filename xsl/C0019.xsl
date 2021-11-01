<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc"
    xmlns:isc="http://extension-functions.intersystems.com" xmlns:exsl="http://exslt.org/common"
    xmlns:set="http://exslt.org/sets" exclude-result-prefixes="isc sdtc exsl set">
    <xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
    <xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
    <xsl:include href="CDA-Support-Files/Location.xsl"/>
    <xsl:include href="common_1_6_11_16_21_26_31.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/Document">
        <ClinicalDocument xsi:schemaLocation="urn:hl7-org:v3 ../sdschemas/CDA.xsd">
            <!-- 术后交接章节 -->
            <!--文档活动类信息-->
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.21"/>
            <!--文档流水号-->
            <xsl:call-template name="DocumentNo"/>
            <title>手术护理记录</title>
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
                        mode="healthRecordNumber"/>
                    <xsl:comment>患者基本信息</xsl:comment>
                    <!--患者信息-->
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者姓名，必选-->
                        <xsl:apply-templates select="Header/recordTarget/patient/patientName"
                            mode="Name"/>
                        <!-- 性别，必选 -->
                        <xsl:apply-templates
                            select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
                        <!-- 年龄 -->
                        <xsl:apply-templates select="Header/recordTarget/patient/ageInYear"
                            mode="Age"/>
                    </patient>
                    <xsl:apply-templates select="Header/recordTarget/providerOrganization"/>
                </patientRole>
            </recordTarget>
            <!--创建者信息-->
            <xsl:apply-templates select="Header/author" mode="AuthorNoOrganization"/>
            <xsl:apply-templates select="Header/custodian" mode="Custodian"/>
            <xsl:apply-templates select="Header/Authenticators/Authenticator"/>
            <xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument"
                mode="relatedDocument"/>
            <componentOf>
                <xsl:apply-templates select="Header/encompassingEncounter/Locations/Location"
                mode="EncompassingEncounter"/>
            </componentOf>
            <component>
                <structuredBody>
                    <!-- 术前诊断章节 -->
                    <xsl:apply-templates select="PreOpDiag/Items"/>
                    <!-- 生命体征章节 -->
                    <xsl:apply-templates select ="VitalSigns"></xsl:apply-templates>
                    <!-- 实验室检查章节 -->
                    <xsl:apply-templates select ="LabTest"></xsl:apply-templates>   
                    <!-- 皮肤章节 -->
                    <xsl:apply-templates select="Skin/skinCheck"></xsl:apply-templates>
                    <!-- 过敏史章节 -->
                    <xsl:apply-templates select="Allergy"></xsl:apply-templates>
                    <!-- 护理记录章节 -->
                    <xsl:apply-templates select="NursingRecord"></xsl:apply-templates>
                    <!-- 护理观察章节 -->
                    <xsl:apply-templates select="NursingObservations"></xsl:apply-templates>
                    <!-- 护理操作章节 -->
                    <xsl:apply-templates select ="NursingOperations"></xsl:apply-templates>
                    <!--器械物品核对章节-->
                    <xsl:apply-templates select ="InstrumentVerification"></xsl:apply-templates>
                    <!-- 手术操作章节 -->
                    <xsl:apply-templates select ="Procedure"></xsl:apply-templates>
                    <!-- 术后交接章节 -->
                    <xsl:apply-templates select="PostoperationHandover"/>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
    <!-- 手术操作章节 -->
    <xsl:template match="Procedure">
        <xsl:comment>手术操作章节</xsl:comment>
        <component>
            <section>
                <code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <xsl:apply-templates select="Items/ProcedureItem"></xsl:apply-templates>
            </section>
        </component>
    </xsl:template>
    <!-- 手术操作条目 -->
    <xsl:template match="Items/ProcedureItem">
        <entry>
            <xsl:comment>1..1 手术记录 </xsl:comment> 
            <procedure classCode="PROC" moodCode="EVN">
                <xsl:comment></xsl:comment>
                <xsl:comment>手术及操作编码:DE06.00.093.00</xsl:comment>  
                <code code="{code/Value}" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表（ICD-9-CM）"/>
                <statusCode/>
                <xsl:comment>手术时间：开始日期时间DE06.00.218.00、结束日期时间DE06.00.221.00</xsl:comment>  
                <effectiveTime>
                    <low value="{beginTime/Value}"/>
                    <high value="{endTime/Value}"/>
                </effectiveTime>
                <xsl:comment> 手术目标部位名称：DE06.00.187.00</xsl:comment>
                <targetSiteCode code="{bodyPart/Value}" displayName="{bodyPart/displayName}" codeSystem="2.16.156.10011.2.3.1.266" codeSystemName="手术目标部位编码"/>
                <xsl:comment>手术操作者：DE02.01.039.00</xsl:comment> 
                <performer>
                    <assignedEntity>
                        <id/>
                        <code displayName="手术操作者"/>
                        <assignedPerson>
                            <name><xsl:value-of select="procedureDoctor/Value"/><prefix>术者</prefix>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </performer>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.093.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术目标部位名称"/>
                        <value xsi:type="ST"><xsl:value-of select="bodyPartName/Value"/></value>
                    </observation>
                </entryRelationship>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.30.060.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术中病理标志"/>
                        <value xsi:type="BL" value="{pathology/Value}"/>
                    </observation>
                </entryRelationship>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.317.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="准备事项"/>
                        <value xsi:type="ST"><xsl:value-of select="preparation/Value"/></value>
                    </observation>
                </entryRelationship>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.256.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术间编号"/>
                        <value xsi:type="ST"><xsl:value-of select="room/Value"/></value>
                    </observation>
                </entryRelationship>
                <xsl:comment> 出入手术室时间  </xsl:comment>  
                <entryRelationship typeCode="COMP">
                    <organizer classCode="BATTERY" moodCode="EVN">
                        <statusCode></statusCode>
                        <xsl:comment>DE06.00.236.00	入手术室日期时间 DE06.00.191.00	出手术室日期时间 </xsl:comment> 
                        <effectiveTime>
                            <low value="{enterRoomTime/Value}"/>
                            <high value="{leaveRoomTime/Value}"/>
                        </effectiveTime>
                    </organizer>
                </entryRelationship>															
            </procedure>
        </entry>
    </xsl:template>
    <!--器械物品核对章节-->
    <xsl:template match="InstrumentVerification">
        <xsl:comment>器械物品核对章节</xsl:comment>
        <component>
            <section>
                <code displayName="术前器械物品核对"/>
                <text/>
                <title>器械物品核对章节</title>
                <xsl:comment>术前</xsl:comment>
                <entry>
                    <organizer classCode="CLUSTER" moodCode="EVN">
                        <code/>
                        <statusCode code="completed"/>
                        <xsl:comment>巡台护士</xsl:comment>  
                        <participant typeCode="ATND">
                            <xsl:comment>签名日期时间：DE09.00.053.00</xsl:comment>   
                            <time value="{preoperation/patrolNurse/signTime/Value}"/>
                            <participantRole classCode="ASSIGNED">
                                <xsl:comment>角色</xsl:comment>  
                                <code code="PP" displayName="巡台护士" codeSystem="2.16.840.1.113883.12.443" codeSystemName="Provider Role"/>
                                <xsl:comment>巡台护士签名：DE02.01.039.00</xsl:comment>    
                                <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                    <name><xsl:value-of select="preoperation/patrolNurse/name/Value"/><prefix>巡台护士</prefix>
                                    </name>
                                </playingEntity>
                            </participantRole>
                        </participant>
                        <xsl:comment>器械护士</xsl:comment>       
                        <participant typeCode="ATND">
                            <xsl:comment>   签名日期时间：DE09.00.053.00</xsl:comment>  
                            <time value="{preoperation/equipmentNurse/signTime/Value}"/>
                            <participantRole classCode="ASSIGNED">
                                <xsl:comment>角色</xsl:comment>          
                                <code code="PP" displayName="器械护士" codeSystem="2.16.840.1.113883.12.443" codeSystemName="Provider Role"/>
                                <xsl:comment> 器械护士签名：DE02.01.039.00</xsl:comment>      
                                <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                    <name><xsl:value-of select="preoperation/equipmentNurse/name/Value"/><prefix>器械护士</prefix>
                                    </name>
                                </playingEntity>
                            </participantRole>
                        </participant>
                        <component>
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE08.50.042.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术中所用物品名称"/>
                                <value xsi:type="ST"><xsl:value-of select="preoperation/instrument/Value"/></value>
                                <entryRelationship typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE09.00.111.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术前清点标志"/>
                                        <value xsi:type="BL" value="{preoperation/verified/Value}"/>
                                    </observation>
                                </entryRelationship>
                            </observation>
                        </component>
                    </organizer>
                </entry>
                <xsl:comment>关前核对</xsl:comment>      
                <entry>
                    <organizer classCode="CLUSTER" moodCode="EVN">
                        <code/>
                        <statusCode code="completed"/>
                        <xsl:comment>巡台护士</xsl:comment>      
                        <participant typeCode="ATND">
                            <xsl:comment>签名日期时间：DE09.00.053.00</xsl:comment>   
                            <time value="{beforeClose/patrolNurse/signTime/Value}"/>
                            <participantRole classCode="ASSIGNED">
                                <xsl:comment>角色</xsl:comment>     
                                <code code="PP" displayName="巡台护士" codeSystem="2.16.840.1.113883.12.443" codeSystemName="Provider Role"/>
                                <xsl:comment>巡台护士签名：DE02.01.039.00</xsl:comment>       
                                <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                    <name><xsl:value-of select="beforeClose/patrolNurse/name/Value"/><prefix>巡台护士</prefix>
                                    </name>
                                </playingEntity>
                            </participantRole>
                        </participant>
                        <xsl:comment>器械护士</xsl:comment>      
                        <participant typeCode="ATND">
                            <xsl:comment>签名日期时间：DE09.00.053.00</xsl:comment>       
                            <time value="{beforeClose/equipmentNurse/signTime/Value}"/>
                            <participantRole classCode="ASSIGNED">
                                <xsl:comment>角色</xsl:comment>       
                                <code code="PP" displayName="器械护士" codeSystem="2.16.840.1.113883.12.443" codeSystemName="Provider Role"/>
                                <xsl:comment>器械护士签名：DE02.01.039.00</xsl:comment>      
                                <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                    <name><xsl:value-of select="beforeClose/equipmentNurse/name/Value"/><prefix>器械护士</prefix>
                                    </name>
                                </playingEntity>
                            </participantRole>
                        </participant>
                        <component>
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE08.50.042.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术中所用物品名称"/>
                                <value xsi:type="ST"><xsl:value-of select="beforeClose/instrument/Value"/></value>
                                <entryRelationship typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE06.00.204.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="关前核对标志"/>
                                        <value xsi:type="BL" value="{beforeClose/verified/Value}"/>
                                    </observation>
                                </entryRelationship>
                            </observation>
                        </component>
                    </organizer>
                </entry>
                <xsl:comment>关后核对</xsl:comment>       
                <entry>
                    <organizer classCode="CLUSTER" moodCode="EVN">
                        <code/>
                        <statusCode code="completed"/>
                        <xsl:comment>巡台护士</xsl:comment>     
                        <participant typeCode="ATND">
                            <xsl:comment>签名日期时间：DE09.00.053.00</xsl:comment>         
                            <time value="{afterClose/patrolNurse/signTime/Value}"/>
                            <participantRole classCode="ASSIGNED">
                                <xsl:comment>角色</xsl:comment>         
                                <code code="PP" displayName="巡台护士" codeSystem="2.16.840.1.113883.12.443" codeSystemName="Provider Role"/>
                                <xsl:comment>巡台护士签名：DE02.01.039.00</xsl:comment>       
                                <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                    <name><xsl:value-of select="afterClose/patrolNurse/name/Value"/><prefix>巡台护士</prefix>
                                    </name>
                                </playingEntity>
                            </participantRole>
                        </participant>
                        <xsl:comment>器械护士</xsl:comment>     
                        <participant typeCode="ATND">
                            <xsl:comment>签名日期时间：DE09.00.053.00</xsl:comment>    
                            <time value="{afterClose/equipmentNurse/signTime/Value}"/>
                            <participantRole classCode="ASSIGNED">
                                <xsl:comment>角色</xsl:comment> 
                                <code code="PP" displayName="器械护士" codeSystem="2.16.840.1.113883.12.443" codeSystemName="Provider Role"/>
                                <xsl:comment>器械护士签名：DE02.01.039.00</xsl:comment>      
                                <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                    <name><xsl:value-of select="afterClose/equipmentNurse/name/Value"/><prefix>器械护士</prefix>
                                    </name>
                                </playingEntity>
                            </participantRole>
                        </participant>
                        <component>
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE08.50.042.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术中所用物品名称"/>
                                <value xsi:type="ST"><xsl:value-of select="afterClose/instrument/Value"/></value>
                                <entryRelationship typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE06.00.204.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="关后核对标志"/>
                                        <value xsi:type="BL" value="{afterClose/verified/Value}"/>
                                    </observation>
                                </entryRelationship>
                            </observation>
                        </component>
                    </organizer>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 护理操作章节 -->
    <xsl:template match="NursingOperations">
        <xsl:comment>护理操作章节</xsl:comment>
        <component>
            <section>
                <code nullFlavor="UNK" displayName="护理操作"/>
                <title>护理操作章节</title>
                <xsl:apply-templates select="NursingOperation"></xsl:apply-templates>
            </section>
        </component>
    </xsl:template>
    <!-- 护理操作条目 -->
    <xsl:template match="NursingOperation">
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
    </xsl:template>
    <!-- 护理观察章节 -->    
    <xsl:template match ="NursingObservations">     
       <xsl:comment>护理观察章节</xsl:comment>   
        <component>
            <section>
                <code displayName="护理观察章节"/>
                <title>护理观察章节</title>
                <!--多个观察写多个entry即可，每个观察对应着观察结果描述-->
                <xsl:apply-templates select="NursingObservation"></xsl:apply-templates>
            </section>
        </component>
    </xsl:template>
    <!-- 护理观察条目 -->
    <xsl:template match="NursingObservation">
        <xsl:comment>护理观察条目</xsl:comment>
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
    </xsl:template>
    <!-- 护理记录章节 -->
    <xsl:template match="NursingRecord">
       <xsl:comment>护理记录章节</xsl:comment> 
        <component>
            <section>
                <code code="X-NN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Nursing Note"/>
                <title>护理记录章节</title>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.211.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理等级代码"/>
                        <value xsi:type="CD" code="{nursingLevel/Value}" displayName="{nursingLevel/displayName}" codeSystem="2.16.156.10011.2.3.1.259" codeSystemName="护理等级代码"/>
                    </observation>
                </entry>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.212.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理类型代码"/>
                        <value xsi:type="CD" code="{nursingType/Value}" displayName="{nursingType/displayName}" codeSystem="2.16.156.10011.2.3.1.260" codeSystemName="护理类型代码"/>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 过敏史章节 -->
    <xsl:template match="Allergy">
        <xsl:comment>过敏史章节</xsl:comment>
        <component>
            <section>
                <code code="48765-2" displayName="Allergies, adverse reactions, alerts" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <title>过敏史章节</title>
                <text/>
                <!-- 过敏史条目 -->
                <xsl:apply-templates select="Allergies/Item"></xsl:apply-templates>
            </section>
        </component>
    </xsl:template>
    <!-- 过敏史条目 -->
    <xsl:template match="Allergies/Item">
        <xsl:comment>过敏史条目</xsl:comment>
    <entry typeCode="DRIV">
        <act classCode="ACT" moodCode="EVN">
            <code nullFlavor="NA"/>
            <entryRelationship typeCode="SUBJ">
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE02.10.023.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史标志"/>
                    <value xsi:type="BL" value="true"/>
                    <participant typeCode="CSM">
                        <participantRole classCode="MANU">
                            <playingEntity classCode="MMAT">
                                <xsl:comment>过敏史描述</xsl:comment> 
                                <code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史"/>
                                <desc xsi:type="ST"><xsl:value-of select="allergen/Value"/></desc>
                            </playingEntity>
                        </participantRole>
                    </participant>
                </observation>
            </entryRelationship>
        </act>
    </entry>
    </xsl:template>
    <!-- 皮肤章节 -->
    <xsl:template match="Skin/skinCheck">
        <xsl:comment>皮肤章节</xsl:comment>
        <component>
            <section>
                <code code="29302-7" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="INTEGUMENTARY SYSTEM"/>
                <title>皮肤章节</title>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.126.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="皮肤检查描述"/>
                        <value xsi:type="ST"><xsl:value-of select="Value"/></value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 实验室检查章节 -->
    <xsl:template match="LabTest">
        <xsl:comment>实验室检查章节</xsl:comment>
        <component>
            <section classCode="DOCSECT" moodCode="EVN">
                <code code="30954-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="STUDIES SUMMARY"/>
                <title>实验室检查章节</title>
                <text/>
                <entry typeCode="COMP" contextConductionInd="true">
                    <xsl:comment>血型</xsl:comment> 
                    <organizer classCode="BATTERY" moodCode="EVN">
                        <statusCode nullFlavor="UNK"/>
                        <component typeCode="COMP" contextConductionInd="true">
                            <xsl:comment>ABO血型</xsl:comment>      
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                <value xsi:type="CD" code="{bloodABO/Value}" displayName="{bloodABO/Display}" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表"/>
                            </observation>
                        </component>
                        <component typeCode="COMP" contextConductionInd="true">
                            <xsl:comment>Rh血型</xsl:comment>      
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE04.50.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                <value xsi:type="CD" code="{bloodRh/Value}" displayName="{bloodRh/Display}" codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="Rh血型代码表"/>
                            </observation>
                        </component>
                    </organizer>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 生命体征章节 -->
    <xsl:template match="VitalSigns">
        <xsl:comment>生命体征章节</xsl:comment>
        <component>
            <section>
                <code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="VITAL SIGNS"/>
                <title>生命体征章节</title>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体重（kg）"/>
                        <value xsi:type="PQ" value="{VitalSign/value}" unit="kg"/>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!-- 术前诊断章节 -->
    <xsl:template match="PreOpDiag/Items">
        <xsl:comment>术前诊断章节</xsl:comment>
        <component>
            <section>
                <code code="10219-4" displayName="Surgical operation note preoperative Dx"
                    codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <title>术前诊断章节</title>
                <text/>
                <xsl:apply-templates select="Item"/>
            </section>
        </component>
    </xsl:template>
    <!-- 术前诊断条目 -->
    <xsl:template match="Item">
        <xsl:choose>
            <xsl:when test="diagnosisCode/Value">
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1"
                            codeSystemName="卫生信息数据元目录" displayName="术前诊断编码"/>
                        <value xsi:type="ST">
                            <xsl:value-of select="diagnosisCode/displayName"/>
                        </value>
                    </observation>
                </entry>
            </xsl:when>
            <xsl:otherwise>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1"
                            codeSystemName="卫生信息数据元目录" displayName="术前诊断编码"/>
                        <value xsi:type="CD" code="{diagnosisCode/Value}"
                            codeSystem="2.16.156.10011.2.3.3.11.5" codeSystemName="疾病代码表（ICD-10）"/>
                    </observation>
                </entry>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- 手术authenticator 模板 -->
    <xsl:template match="Header/Authenticators/Authenticator">
        <xsl:choose>
            <xsl:when test="assignedEntityCode = '器械护士'">
                <xsl:call-template name="MediAuthenticator"/>
            </xsl:when>
            <xsl:when test="assignedEntityCode = '交接护士'">
                <xsl:call-template name="MediAuthenticator"/>
            </xsl:when>
            <xsl:when test="assignedEntityCode = '巡台护士'">
                <xsl:call-template name="MediAuthenticator"/>
            </xsl:when>
            <xsl:when test="assignedEntityCode = '转运者'">
                <xsl:call-template name="MediAuthenticator"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <!-- 手术authenticator 模板 -->
    <xsl:template name="MediAuthenticator">
        <authenticator>
            <time> </time>
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
    <xsl:template match="Header/recordTarget/providerOrganization">
        <providerOrganization>
            <id root="2.16.156.10011.1.5" extension="{providerOrganizationId/Value}"/>
            <name>
                <xsl:value-of select="providerOrganizationId/displayName"/>
            </name>
        </providerOrganization>
    </xsl:template>
</xsl:stylesheet>