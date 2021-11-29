<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc"
    xmlns:isc="http://extension-functions.intersystems.com" xmlns:exsl="http://exslt.org/common"
    xmlns:set="http://exslt.org/sets" exclude-result-prefixes="isc sdtc exsl set">
    <xsl:import href="common_4_9_14_19_24_29.xsl"></xsl:import>
    <xsl:import href="common_1_6_11_16_21_26_31.xsl"></xsl:import>
    <xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
    <xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
    <xsl:include href="CDA-Support-Files/Location.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/Document"> 
        <ClinicalDocument xsi:schemaLocation="urn:hl7-org:v3 ../sdschemas/CDA.xsd">
            <!--文档活动类信息-->
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.21"/>
            <!--文档流水号-->
            <xsl:call-template name="DocumentNo"/>
            <title>一般手术记录</title>
            <xsl:call-template name="effectiveTime"/>
            <xsl:call-template name="Confidentiality"/>
            <languageCode code="zh-CN"/>
            <setId/>
            <versionNumber value="{Version}"/>
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">                  
                    <xsl:apply-templates select="Header/recordTarget/outpatientNum" mode="outpatientNum"/>
                    <xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
                    <xsl:comment>患者基本信息</xsl:comment>
                    <!--患者信息-->
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>
                        <!--患者姓名，必选-->
                        <xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
                        <!-- 性别，必选 -->
                        <xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
                    </patient>
                </patientRole>
            </recordTarget>
            <!-- 文档创作者 -->
            <xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
            <!-- 保管机构-数据录入者信息 -->
            <xsl:apply-templates select="Header/custodian" mode="Custodian"/>
            <xsl:comment>手术者签名</xsl:comment>
            <xsl:apply-templates select ="Header/Authenticators/Authenticator"></xsl:apply-templates>
            <xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
            <componentOf>
                <xsl:apply-templates select="Header/encompassingEncounter"></xsl:apply-templates>
            </componentOf>
            <component>
                <structuredBody>
                    <!--既往史章节 0..1-->
                    <xsl:apply-templates select="PastHistory/surgeryStatus"></xsl:apply-templates>
                    <!-- 术前诊断章节 1..1  -->
                    <xsl:apply-templates select="PreOpDiag"/>
                    <!-- 手术操作章节 1..1-->
                    <xsl:apply-templates select="Procedure/Items"/>
                    <!--失血章节 0..1-->
                    <xsl:apply-templates select="BloodLoss"></xsl:apply-templates>
                    <!-- 输血章节 0..1  -->
                    <xsl:apply-templates select="BloodTransfusion"/>
                    <!-- 麻醉章节 0..1-->
                    <xsl:apply-templates select="Procedure/Items/ProcedureItem/anesthesiaMethod"/>
                    <!--用药章节 0..1-->
                    <xsl:apply-templates select="MedicationUseHistory"></xsl:apply-templates>
                    <!-- 输液章节 0..1  -->
                    <xsl:apply-templates select="Infusion"/>
                    <!-- 术后诊断章节 1..1-->
                    <xsl:apply-templates select="PostOpDiags"/>
                    <!--手术过程描述章节 1..1 引用common_1_6_11_16_21_26_31.xsl-->  
                    <xsl:apply-templates select="ProcedureNote"/>
                    <!-- 引流章节 0..1  引用common_4_9_14_19_24_29.xsl-->
                    <xsl:apply-templates select="SurgicalDrains"/>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
    <xsl:template match ="Header/encompassingEncounter">
        <encompassingEncounter>
           <xsl:comment>入院日期时间</xsl:comment> 
            <effectiveTime value="{effectiveTimeLow/Value}"/>
            <location>
                <healthCareFacility>
                    <serviceProviderOrganization>
                        <asOrganizationPartOf classCode="PART">
                            <xsl:comment> DE01.00.026.00	病床号 </xsl:comment>
                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                <id root="2.16.156.10011.1.22" extension="{Locations/Location/bedNum/Value}"/>
                                <name><xsl:value-of select="Locations/Location/bedNum/Display"/></name>
                               <xsl:comment> DE01.00.019.00 病房号 </xsl:comment> 
                                <asOrganizationPartOf classCode="PART">
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.21" extension="{Locations/Location/wardName/Display}"/>
                                        <name><xsl:value-of select="Locations/Location/wardName/Value"/></name>
                                       <xsl:comment>DE08.10.026.00	科室名称 </xsl:comment>  
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.26" extension="{Locations/Location/deptId}"/>
                                                <name><xsl:value-of select="Locations/Location/deptName/Display"/></name>
                                               <xsl:comment> DE08.10.054.00	病区名称 </xsl:comment> 
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <id root="2.16.156.10011.1.27" extension="{Locations/Location/areaName/Value}"/>
                                                            <name><xsl:value-of select="Locations/Location/areaName/Display"/></name>
                                                      <xsl:comment> XXX医院 </xsl:comment> 
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
    <xsl:template match="Header/Authenticators/Authenticator">
        <xsl:choose>
            <xsl:when test="assignedEntityCode = '手术者'">
                <authenticator>
                    <!--签名日期时间-->
                    <time value="{time/Value}"/>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="医务人员编号"/>
                        <code displayName="{assignedEntityCode}"/>
                        <assignedPerson>
                            <name><xsl:value-of select="assignedPersonName/Value"/></name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator> 
            </xsl:when>        
        </xsl:choose>
    </xsl:template>
    <xsl:template match="PastHistory/surgeryStatus">          
        <xsl:comment>既往史章节 0..1</xsl:comment> 
                <component>
                    <section>
                        <code code="11348-0" displayName="HISTORY OF PAST ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                        <text/>                     
                        <xsl:comment>手术史</xsl:comment>
                        <entry>
                            <observation classCode="OBS" moodCode="EVN">
                                <xsl:comment>手术史标志</xsl:comment>
                                <code code="DE02.10.062.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术史标志"/>
                                <value xsi:type="BL" value="false"/>
                            </observation>
                        </entry>
                    </section>
                </component>
    </xsl:template>    
    <xsl:template match="PreOpDiag">        
        <xsl:comment>  术前诊断章节 1..1  </xsl:comment>
        <component>
            <section>
                <code code="10219-4" displayName="Surgical operation note preoperative Dx" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <xsl:apply-templates select="Items/Item"></xsl:apply-templates>
            </section>
        </component>    
    </xsl:template>   
    <!-- 术前诊断条目 -->
    <xsl:template match="Items/Item">
        <xsl:choose>
            <xsl:when test="diagnosisCode/Value">
               <entry>
            <observation classCode="OBS" moodCode="EVN">
                <xsl:comment>术前诊断编码</xsl:comment>
                <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术前诊断编码"/>
                <value xsi:type="CD" code="{diagnosisCode/Value}" displayName="{diagnosisCode/Display}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
            </observation>
        </entry>   
            </xsl:when>
        </xsl:choose>
        <xsl:comment>术前诊断</xsl:comment> 
    </xsl:template>
    <xsl:template match="Procedure/Items">        
        <xsl:comment> 手术操作章节 1..1 </xsl:comment>
        <component>
            <section>
                <code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>           
                <text/>
                <xsl:apply-templates select="ProcedureItem"></xsl:apply-templates>
            </section>
        </component>
    </xsl:template>
    <xsl:template match="ProcedureItem">
        <entry>           
            <xsl:comment> 1..1 手术记录 </xsl:comment>
            <procedure classCode="PROC" moodCode="EVN">
                <code code="{code/Value}" displayName="{code/Display}" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表(ICD-9-CM)"/>
                
                <xsl:comment>操作日期/时间</xsl:comment>
                <effectiveTime>
                    
                    <xsl:comment>手术开始日期时间</xsl:comment>
                    <low value="{beginTime/Value}"/>
                    
                    <xsl:comment>手术结束日期时间</xsl:comment>
                    <high value="{endTime/Value}"/>
                </effectiveTime>
                
                <xsl:comment>手术者</xsl:comment>
                <performer typeCode="PRF">
                    <assignedEntity>
                        <id/>
                        <assignedPerson>
                            <name><xsl:value-of select="procedureDoctor/Value"/><prefix>术者</prefix>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </performer>              
                <xsl:comment>第一助手</xsl:comment>
                <participant typeCode="ATND">
                    <participantRole classCode="ASSIGNED">
                        <code displayName="Ⅰ助"/>
                        <playingEntity classCode="PSN" determinerCode="INSTANCE">
                            <name><xsl:value-of select="primaryAssistant/Value"/></name>
                        </playingEntity>
                    </participantRole>
                </participant>            
                <xsl:comment>第二助手</xsl:comment>
                <participant typeCode="ATND">
                    <participantRole classCode="ASSIGNED">
                        <code displayName="Ⅱ助"/>
                        <playingEntity classCode="PSN" determinerCode="INSTANCE">
                            <name><xsl:value-of select="secondAssistant/Value"/></name>
                        </playingEntity>
                    </participantRole>
                </participant>          
                <xsl:comment>器械护士姓名</xsl:comment>
                <participant typeCode="ATND">
                    <participantRole classCode="ASSIGNED">
                        <code displayName="器械护士"/>
                        <playingEntity classCode="PSN" determinerCode="INSTANCE">
                            <name><xsl:value-of select="equipmentNurse/Value"/></name>
                        </playingEntity>
                    </participantRole>
                </participant>
                <xsl:comment>巡台护士姓名</xsl:comment>
                <participant typeCode="ATND">
                    <participantRole classCode="ASSIGNED">
                        <code displayName="巡台护士"/>
                        <playingEntity classCode="PSN" determinerCode="INSTANCE">
                            <name><xsl:value-of select="patrolNurse/Value"/></name>
                        </playingEntity>
                    </participantRole>
                </participant>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.094.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术（操作）名称"/>
                        <value xsi:type="ST">胃大部切除术</value>
                    </observation>
                </entryRelationship>
              <xsl:comment>手术间编号</xsl:comment>  
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.256.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者实施手术所在的手术室编号"/>
                        <value xsi:type="ST"><xsl:value-of select="room/Value"/></value>
                    </observation>
                </entryRelationship>
                <xsl:comment>手术级别 </xsl:comment> 
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.255.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术级别"/>                  
                        <value xsi:type="CD" code="{procedureClass/Value}" displayName="{procedureClass/Display}" codeSystem="2.16.156.10011.2.3.1.258" codeSystemName="手术级别代码表"/>
                    </observation>
                </entryRelationship>
            </procedure>
        </entry>
    </xsl:template>
    <xsl:template match="PostOpDiags">
        <component>
            <section>
                <code code="10218-6" displayName="Surgical operation note postoperative Dx" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <!-- 术后诊断条目-->
                <xsl:apply-templates select="SurgicalOperationNotePostoperativeDX"></xsl:apply-templates>        
            </section>
        </component>
    </xsl:template>
    <xsl:template match="SurgicalOperationNotePostoperativeDX">
        <xsl:comment>术后诊断</xsl:comment>
        <xsl:choose>
            <xsl:when test="code/Value">
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <xsl:comment>术后诊断编码</xsl:comment>
                        <code code="DE05.01.024.00" displayName="诊断代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="CD" code="{code/Value}" displayName="{code/Display}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"></value>
                    </observation>
                </entry>
            </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
        </xsl:choose>   
    </xsl:template>
    <xsl:template match="BloodLoss">
        <xsl:comment>失血章节 0..1</xsl:comment>
        <component>
            <section>
                <code code="55103-6" displayName="Surgical operation note estimated blood loss" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <xsl:comment>出血量（mL）</xsl:comment>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.097.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出血量（mL）"/>
                        <value xsi:type="PQ" unit="mL" value="{volume/Value}"/>
                    </observation>
                </entry>
            </section>
        </component> 
    </xsl:template>
    
    <xsl:template match ="BloodTransfusion">
        <xsl:comment> 输血章节 0..1  </xsl:comment>
        <component>
            <section>
                <code code="56836-0" displayName="History of blood transfusion" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <xsl:comment>输血量（mL）</xsl:comment>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <xsl:comment>输血量（mL）</xsl:comment>
                        <code code="DE06.00.267.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血量（mL）"/>
                        <value xsi:type="PQ" unit="{unit/Value}" value="{volume/Value}"/>
                    </observation>
                </entry>
                
                <xsl:comment>输血反应标志</xsl:comment>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <xsl:comment>输血反应标志</xsl:comment>
                        <code code="DE06.00.264.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血反应标志"/>
                        <value xsi:type="BL" value="{reaction/Value}"/>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <xsl:template match="Procedure/Items/ProcedureItem/anesthesiaMethod">
     <xsl:comment> 麻醉章节 0..1 </xsl:comment> 
    <component>
        <section>
            <code code="10213-7" displayName="Surgical operation note anesthesia" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <entry>
                <xsl:comment> 麻醉方式代码 </xsl:comment>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉方式代码"/>
                    <value code="{Value}" displayName="{Display}" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表" xsi:type="CD"/>
                   <xsl:comment> 麻醉医师姓名 </xsl:comment> 
                    <performer>
                        <assignedEntity>
                            <id/>
                            <assignedPerson>
                                <name><xsl:value-of select="/Document/Procedure/Items/ProcedureItem/anesthesiaDoctor/Display"/></name>
                            </assignedPerson>
                        </assignedEntity>
                    </performer>
                </observation>
            </entry>
        </section>
    </component>
    </xsl:template>
    <xsl:template match="MedicationUseHistory">
        <xsl:comment>用药章节 0..1</xsl:comment>
        <component>
            <section>
                <code code="10160-0" displayName="History of medication use" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <!--术前用药-->
                <xsl:apply-templates select ="PreSurMeds/PreSurMed"/>     
                <!--术中用药-->             
                <xsl:apply-templates select ="InSurMeds/InSurMed"/>              
            </section>
        </component>
    </xsl:template>
    <xsl:template match ="PreSurMeds/PreSurMed">
        <xsl:comment>术前用药</xsl:comment>
        <entry>
            <observation classCode="OBS" moodCode="EVN">
                <xsl:comment>术前用药</xsl:comment>
                <code code="DE06.00.136.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术前用药"/>
                <value xsi:type="ST"><xsl:value-of select="item/Value"/></value>
            </observation>
        </entry>
    </xsl:template>
    <xsl:template match ="InSurMeds/InSurMed">
        <entry>
            <observation classCode="OBS" moodCode="EVN">
                <xsl:comment>术中用药</xsl:comment>
                <code code="DE06.00.136.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术中用药"/>
                <value xsi:type="ST"><xsl:value-of select="item/Value"/></value>
            </observation>
        </entry>
    </xsl:template>
    <xsl:template match="Infusion">
        <xsl:comment>输液章节 0..1</xsl:comment>
        <component>
            <section>
                <code code="10216-0" displayName="Surgical operation note fluids" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <xsl:comment>输液量（mL）</xsl:comment>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <xsl:comment>输液量（mL）</xsl:comment>
                        <code code="DE06.00.268.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输液量（mL）"/>
                        <value xsi:type="PQ" unit="mL" value="{volume/Value}"/>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
</xsl:stylesheet>