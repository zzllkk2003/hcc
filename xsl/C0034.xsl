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
            <title>入院记录</title>
            <!--文档机器生成时间-->
            <xsl:call-template name="effectiveTime"/>
            <xsl:call-template name="Confidentiality"/>
            <languageCode code="zh-CN"/>
            <setId/>
            <versionNumber value="{Version}"/>
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <xsl:apply-templates select="Header/recordTarget/inpatientNum"
                        mode="inpatientNum"/>
                    <xsl:apply-templates select="Header/recordTarget/addr" mode="Address"/>
                    <xsl:comment>患者基本信息</xsl:comment>
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者姓名，必选-->
                        <xsl:apply-templates select="Header/recordTarget/patient/patientId"
                            mode="nationalIdNumber"/>
                        <xsl:apply-templates select="Header/recordTarget/patient/patientName"
                            mode="Name"/>
                        <!-- 性别，必选 -->
                        <xsl:apply-templates
                            select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
                        <xsl:apply-templates select="Header/recordTarget/patient/maritalStatusCode"
                            mode="MaritalStatus"/>
                        <xsl:apply-templates select="Header/recordTarget/patient/ethnicGroupCode"
                            mode="EthnicGroup"/>
                        <xsl:apply-templates select="Header/recordTarget/patient/ageInYear"
                            mode="Age"/>
                        <xsl:apply-templates select="Header/recordTarget/patient/occupationCode"
                            mode="Occupation"/>
                    </patient>
                </patientRole>
            </recordTarget>
            <xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
            <xsl:apply-templates select="Header/Informants/Informant"/>
            <xsl:apply-templates select="Header/custodian" mode="Custodian"/>
            <xsl:apply-templates select="Header/LegalAuthenticators/LegalAuthenticator"/>
            <xsl:apply-templates select="Header/Authenticators/Authenticator"/>
            <xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument"
                mode="relatedDocument"/>
            <componentOf>
                <xsl:apply-templates select="Header/encompassingEncounter"/>
            </componentOf>
            <component>
                <structuredBody>
                    <!--主诉章节-->
                    <xsl:apply-templates select="ChiefComplaint"/>
                    <!--现病史章节-->  
                    <xsl:apply-templates select="PresentIllnessHistory"/>
                    <!--既往史章节-->  
                    <xsl:apply-templates select="PastHistory"/>
                    <!--预防免疫史章节-->  
                    <xsl:apply-templates select="Vaccinations"/>
                    <!--输血章节-->  
                    <xsl:apply-templates select="BloodTransfusion"/>
                    <!--个人史章节-->  
                    <xsl:apply-templates select="SocialHistory"/>
                    <!--月经史章节--> 
                    <xsl:apply-templates select="Menstrual"/>
                    <!--家族史章节--> 
                    <xsl:apply-templates select="FamilyHistories"/>
                    <!--生命体征章节-->  
                    <xsl:apply-templates select="VitalSigns"></xsl:apply-templates>
                    <!--体格检查章节-->  
                    <xsl:apply-templates select="PhysicalExams"/>
                    <!--辅助检查章节-->  
                    <xsl:apply-templates select="SupplementaryExams"/>
                    <!--主要健康问题章节-->
                    <xsl:apply-templates select="Problem"></xsl:apply-templates>
                    <!--治疗计划章节--> 
                    <xsl:apply-templates select="TreatmentPlan"></xsl:apply-templates>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
    <!--治疗计划章节--> 
    <xsl:template match="TreatmentPlan">
        <xsl:comment>治疗计划章节</xsl:comment>
        <component> 
            <section> 
                <code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>  
                <text/>  
                <xsl:comment>治则治法条目</xsl:comment>
                <entry> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE06.00.300.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="治则治法"/>  
                        <value xsi:type="ST"><xsl:value-of select="treatmentPrinciple/Value"/></value> 
                    </observation> 
                </entry> 
            </section> 
        </component> 
    </xsl:template>
    <!--主要健康问题章节-->
    <xsl:template match="Problem">
        <component> 
            <section> 
                <code code="11450-4" displayName="PROBLEM LIST" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>  
                <text/>  
              <xsl:comment>陈述内容可靠标志</xsl:comment>    
                <entry> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE05.10.143.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="陈述内容可靠标志"/>  
                        <value xsi:type="BL" value="{reliableStatement/Value}"/> 
                    </observation> 
                </entry>  
                <!--初步诊断-西医条目-->  
                <entry> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初步诊断-西医诊断名称"/>  
                        <!--初步诊断日期-->  
                        <effectiveTime value="{preliminaryDiag/date/Value}"/>  
                        <value xsi:type="ST"><xsl:value-of select="preliminaryDiag/name/Display"/></value>  
                        <entryRelationship typeCode="COMP"> 
                            <observation classCode="OBS" moodCode="EVN"> 
                                <!--初步诊断-西医诊断编码-代码-->  
                                <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初步诊断-西医诊断编码"/>  
                                <value xsi:type="CD" code="{preliminaryDiag/code/Value}" displayName="{preliminaryDiag/code/Display}"  codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/> 
                            </observation> 
                        </entryRelationship>  
                        <!--入院诊断顺位-->  
                        <entryRelationship typeCode="COMP"> 
                            <observation classCode="OBS" moodCode="EVN"> 
                                <code code="DE05.01.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断顺位"/>  
                                <value xsi:type="INT" value="{preliminaryDiag/orders/Value}"/> 
                            </observation> 
                        </entryRelationship> 
                    </observation> 
                </entry>
                    <!--中医“四诊”观察结果-->  
                    <xsl:apply-templates select="TCMObs/TCMObservation"></xsl:apply-templates>
                    <!--初步诊断-中医条目-->  
                    <xsl:apply-templates select="TCMPreliminaryDiag"></xsl:apply-templates>
                    <!--修正诊断-西医条目--> 
                    <xsl:apply-templates select="revisedDiag"></xsl:apply-templates>
                    <!--修正诊断-中医条目-->  
                   <xsl:apply-templates select="TCMRevisedDiag"></xsl:apply-templates>
                   <!--确定诊断-西医条目-->  
                <xsl:apply-templates select="diagnoses/ConfirmedDiag"></xsl:apply-templates>
                <!--确定诊断-中医条目-->  
                <xsl:apply-templates select="TCMdiagnoses/TCMConfirmedDiag"></xsl:apply-templates>
                <!--补充诊断-西医条目-->  
                <xsl:apply-templates select="supplementaryDiag"></xsl:apply-templates>
            </section>
        </component>
    </xsl:template>
    <!--补充诊断-西医条目-->  
    <xsl:template match="supplementaryDiag">
        <xsl:comment>补充诊断-西医条目</xsl:comment>
        <entry> 
            <observation classCode="OBS" moodCode="EVN"> 
                <code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="补充诊断-西医诊断名称"/>  
              <xsl:comment>补充诊断日期</xsl:comment>   
                <effectiveTime value="{date/Value}"/>  
                <value xsi:type="ST"><xsl:value-of select="name/Value"/></value>  
                <entryRelationship typeCode="COMP"> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <xsl:comment>补充诊断-西医诊断编码-代码</xsl:comment>     
                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="补充诊断-西医诊断编码"/>  
                        <value xsi:type="CD" code="{code/Value}" displayName="{code/Display}"  codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）"/> 
                    </observation> 
                </entryRelationship>  
                <xsl:comment>入院诊断顺位</xsl:comment>   
                <entryRelationship typeCode="COMP"> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE05.01.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断顺位"/>  
                        <value xsi:type="INT" value="{orders/Value}"/> 
                    </observation> 
                </entryRelationship> 
            </observation> 
        </entry> 
    </xsl:template>
    <!--确定诊断-中医条目--> 
    <xsl:template match="TCMdiagnoses/TCMConfirmedDiag">
        <xsl:comment>确定诊断-中医条目</xsl:comment>
          <xsl:choose>
              <xsl:when test="(TCMdiag/code/Value) and (syndrome/code/Value)">
                  <entry> 
                      <observation classCode="OBS" moodCode="EVN"> 
                          <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="确定诊断-中医病名名称"/>  
                          <xsl:comment>确定诊断日期</xsl:comment>   
                          <effectiveTime value="{TCMdiag/date/Value}"/>  
                          <value xsi:type="ST">无</value>  
                          <entryRelationship typeCode="COMP"> 
                              <observation classCode="OBS" moodCode="EVN"> 
                                  <xsl:comment>确定诊断-中医诊断编码-代码</xsl:comment>   
                                  <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="确定诊断-中医病名代码"/>  
                                   <value xsi:type="CD" code="{TCMdiag/code/Value}" displayName="{TCMdiag/code/Display}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)"/>
                              </observation> 
                          </entryRelationship>  
                          <entryRelationship typeCode="COMP"> 
                              <observation classCode="OBS" moodCode="EVN"> 
                                  <xsl:comment>确定诊断-中医证候编码-名称</xsl:comment>   
                                  <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="确定诊断-中医证候名称"/>  
                                  <value xsi:type="ST"><xsl:value-of select="syndrome/name/Value"/></value> 
                              </observation> 
                          </entryRelationship>  
                          <entryRelationship typeCode="COMP"> 
                              <observation classCode="OBS" moodCode="EVN"> 
                                  <xsl:comment>确定诊断-中医证候编码-代码</xsl:comment>  
                                  <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="确定诊断-中医证候代码"/>  
                                   <value xsi:type="CD" code="{syndrome/code/Value}" displayName="{syndrome/code/Display}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)"/>                             
                              </observation> 
                          </entryRelationship>  
                          <xsl:comment>入院诊断顺位</xsl:comment>  
                          <entryRelationship typeCode="COMP"> 
                              <observation classCode="OBS" moodCode="EVN"> 
                                  <code code="DE05.01.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断顺位"/>  
                                  <value xsi:type="INT" value="{TCMdiag/orders/Value}"/> 
                              </observation> 
                          </entryRelationship> 
                      </observation> 
                  </entry>  
              </xsl:when>
          </xsl:choose>
    </xsl:template>
    <!--确定诊断-西医条目-->  
    <xsl:template match="diagnoses/ConfirmedDiag">
        <xsl:comment>确定诊断-西医条目</xsl:comment>
       <xsl:choose> 
           <xsl:when test="diag/code/Value"> 
           <entry> 
            <observation classCode="OBS" moodCode="EVN"> 
                <code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="确定诊断-西医诊断名称"/>  
              <xsl:comment>确定诊断日期</xsl:comment>  
                <effectiveTime value="{diag/date/Value}"/>  
                <value xsi:type="ST">创伤性脑损伤</value>  
                <entryRelationship typeCode="COMP"> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <xsl:comment>确定诊断-西医诊断编码-代码</xsl:comment> 
                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="确定诊断-西医诊断编码"/>                  
                         <value xsi:type="CD" code="{diag/code/Value}" displayName="{diag/code/Display}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>    
                    </observation> 
                </entryRelationship>  
                <xsl:comment>入院诊断顺位</xsl:comment>  
                <entryRelationship typeCode="COMP"> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE05.01.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断顺位"/>  
                        <value xsi:type="INT" value="{diag/orders/Value}"/> 
                    </observation> 
                </entryRelationship> 
            </observation> 
        </entry>    
           </xsl:when>                
           <xsl:otherwise> 
           </xsl:otherwise>
       </xsl:choose> 
    </xsl:template>
    <!--修正诊断-中医条目-->  
    <xsl:template match="TCMRevisedDiag">
        <xsl:comment>修正诊断-中医条目</xsl:comment>
        <entry> 
            <observation classCode="OBS" moodCode="EVN"> 
                <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="修正诊断-中医病名名称"/>  
                <xsl:comment>修正诊断日期</xsl:comment>   
                <effectiveTime value="{TCMdiag/date/Value}"/>  
                <value xsi:type="ST"><xsl:value-of select="TCMdiag/name/Value"/></value>  
                <entryRelationship typeCode="COMP"> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <xsl:comment>修正诊断-中医诊断编码-代码</xsl:comment>     
                        <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="修正诊断-中医病名代码"/>  
                        <value xsi:type="CD" code="{TCMdiag/code/Value}" displayName="{TCMdiag/code/Display}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)"/> 
                    </observation> 
                </entryRelationship>  
                <entryRelationship typeCode="COMP"> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <xsl:comment>修正诊断-中医证候编码-名称</xsl:comment>  
                        <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="修正诊断-中医证候名称"/>  
                        <value xsi:type="ST"><xsl:value-of select="syndrome/name/Value"/></value> 
                    </observation> 
                </entryRelationship>  
                <entryRelationship typeCode="COMP"> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <xsl:comment>修正诊断-中医证候编码-代码</xsl:comment>   
                        <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="修正诊断-中医证候代码"/>  
                        <value xsi:type="CD" code="{syndrome/code/Value}" displayName="{syndrome/code/Display}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)"/> 
                    </observation> 
                </entryRelationship>  
                <xsl:comment>入院诊断顺位</xsl:comment>  
                <entryRelationship typeCode="COMP"> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE05.01.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断顺位"/>  
                        <value xsi:type="INT" value="{TCMdiag/orders/Value}"/> 
                    </observation> 
                </entryRelationship> 
            </observation> 
        </entry>  
    </xsl:template>
    <!--修正诊断-西医条目--> 
    <xsl:template match="revisedDiag">
        <xsl:comment>修正诊断-西医条目</xsl:comment>
        <entry> 
            <observation classCode="OBS" moodCode="EVN"> 
                <code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="修正诊断-西医诊断名称"/>  
                <xsl:comment>修正诊断日期</xsl:comment>  
                <effectiveTime value="{date/Value}"/>  
                <value xsi:type="ST"><xsl:value-of select="name/Value"/></value>  
                <entryRelationship typeCode="COMP"> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <xsl:comment>修正诊断-西医诊断编码-代码</xsl:comment>     
                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="修正诊断-西医诊断编码"/>  
                        <value xsi:type="CD" code="{code/Value}" displayName="{code/Display}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/> 
                    </observation> 
                </entryRelationship>  
                <xsl:comment>入院诊断顺位</xsl:comment>    
                <entryRelationship typeCode="COMP"> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE05.01.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断顺位"/>  
                        <value xsi:type="INT" value="{orders/Value}"/> 
                    </observation> 
                </entryRelationship> 
            </observation> 
        </entry>  
    </xsl:template>
    <!--初步诊断-中医条目--> 
    <xsl:template match="TCMPreliminaryDiag">
        <entry> 
            <observation classCode="OBS" moodCode="EVN"> 
                <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初步诊断-中医病名名称"/>  
               <xsl:comment>初步诊断日期</xsl:comment>  
                <effectiveTime value="{TCMdiag/date/Value}"/>  
                <value xsi:type="ST"><xsl:value-of select="TCMdiag/name/Display"/></value> 
                <entryRelationship typeCode="COMP"> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <xsl:comment>初步诊断-中医诊断编码-代码</xsl:comment>  
                        <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初步诊断-中医病名代码"/>  
                        <value xsi:type="CD"   code="{TCMdiag/code/Value}" displayName="{TCMdiag/code/Display}"  codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)"/> 
                    </observation> 
                </entryRelationship>  
                <entryRelationship typeCode="COMP"> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <xsl:comment>初步诊断-中医证候编码-名称</xsl:comment>   
                        <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初步诊断-中医证候名称"/>  
                        <value xsi:type="ST"><xsl:value-of select="syndrome/name/Value"/></value> 
                    </observation> 
                </entryRelationship>  
                <entryRelationship typeCode="COMP"> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <xsl:comment>初步诊断-中医证候编码-代码</xsl:comment>  
                        <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初步诊断-中医证候代码"/>  
                        <value xsi:type="CD" code="{syndrome/code/Value}" displayName="{syndrome/code/Display}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)"/> 
                    </observation> 
                </entryRelationship>  
                <xsl:comment>入院诊断顺位</xsl:comment> 
                <entryRelationship typeCode="COMP"> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE05.01.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断顺位"/>  
                        <value xsi:type="INT" value="{TCMdiag/orders/Value}"/> 
                    </observation> 
                </entryRelationship> 
            </observation>
        </entry>
    </xsl:template>
    <!--中医“四诊”观察结果--> 
    <xsl:template match="TCMObs/TCMObservation">
       <xsl:comment>中医“四诊”观察结果 </xsl:comment>  
        <entry> 
            <observation classCode="OBS" moodCode="EVN"> 
                <code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中医“四诊”观察结果"/>  
                <value xsi:type="ST"><xsl:value-of select="item/Value"/></value> 
            </observation> 
        </entry>  
    </xsl:template>
    <!--辅助检查章节-->  
    <xsl:template match ="SupplementaryExams">
        <component> 
            <section> 
                <code displayName="辅助检查"/>  
                <text/>  
                <xsl:apply-templates select="SupplementaryExam"></xsl:apply-templates>
            </section> 
        </component>  
    </xsl:template>
    <!--辅助检查结果条目-->  
    <xsl:template match="SupplementaryExam">
       <xsl:comment>辅助检查结果条目</xsl:comment>   
        <entry> 
            <observation classCode="OBS" moodCode="EVN"> 
                <code code="DE04.30.009.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="辅助检查结果"/>  
                <value xsi:type="ST"><xsl:value-of select="result/Value"/></value> 
            </observation> 
        </entry> 
    </xsl:template>
    <!--体格检查章节--> 
    <xsl:template match="PhysicalExams">
        <xsl:comment>体格检查章节 </xsl:comment>
        <component> 
            <section> 
                <code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="PHYSICAL EXAMINATION"/>  
                <text/>  
                <xsl:apply-templates select="PhysicalExam"></xsl:apply-templates>
            </section>
        </component>
    </xsl:template>
    <!-- 体格检查条目 -->
    <xsl:template match="PhysicalExam">
        <xsl:comment><xsl:value-of select="codeSystemName"/></xsl:comment>
        <entry> 
            <observation classCode="OBS" moodCode="EVN"> 
                <code code="{type}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{codeSystemName}"/>  
                <value xsi:type="ST"><xsl:value-of select="value"/></value> 
            </observation> 
        </entry>  
    </xsl:template>
    <!--生命体征章节--> 
    <xsl:template match="VitalSigns">
        <xsl:comment> 生命体征章节 </xsl:comment>
        <component>
            <section>
                <code code="8716-3" displayName="VITAL SIGNS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <xsl:apply-templates select="VitalSign"></xsl:apply-templates>
            </section>
        </component>
    </xsl:template>
    <!-- 生命体征条目 -->
    <xsl:template match="VitalSign">
        <xsl:choose>
            <xsl:when test=" type='DE04.10.174.00'">
                <entry>
                    <organizer classCode="BATTERY" moodCode="EVN">
                        <code displayName="血压"></code>
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
            <xsl:when test="substring-after(display,'（') != ''">
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="{type}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{display}"/>
                        <value xsi:type="PQ" value="{value}" unit="{substring-before(substring-after(display,'（'),'）')}"/>
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
    <!--家族史章节--> 
    <xsl:template match="FamilyHistories">
        <component> 
            <section> 
                <code code="10157-6" displayName="HISTORY OF FAMILY MEMBER DISEASES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>  
                <text/>  
                <xsl:apply-templates select="FamilyHistory"></xsl:apply-templates>
            </section> 
        </component> 
    </xsl:template>
    <!--家族史条目--> 
    <xsl:template match="FamilyHistory">
       <xsl:comment>家族史条目</xsl:comment>   
        <entry> 
            <observation classCode="OBS" moodCode="EVN"> 
                <code code="DE02.10.103.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="家族史"/>  
                <value xsi:type="ST"><xsl:value-of select="code/Value"/></value> 
            </observation> 
        </entry> 
    </xsl:template>
    <!--月经史章节--> 
    <xsl:template match="Menstrual">
        <xsl:comment>月经史章节</xsl:comment>
        <component> 
            <section> 
                <code code="49033-4" displayName="Menstrual History" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>  
                <text/>  
                <xsl:comment>月经史条目</xsl:comment>     
                <entry> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE02.10.102.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="月经史"/>  
                        <value xsi:type="ST"><xsl:value-of select="menstrual/Value"/></value> 
                    </observation> 
                </entry> 
            </section> 
        </component>  
    </xsl:template>
    <!--个人史章节-->  
    <xsl:template match="SocialHistory">
        <xsl:comment>个人史章节</xsl:comment>
        <component> 
            <section> 
                <code code="29762-2" displayName="Social history" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>  
                <text/>  
                <!--个人史条目-->  
                <entry> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE02.10.097.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="个人史"/>  
                        <value xsi:type="ST"><xsl:value-of select="code/Value"/></value> 
                    </observation> 
                </entry> 
            </section> 
        </component> 
    </xsl:template>
    <!--输血章节-->  
    <xsl:template match="BloodTransfusion">
        <xsl:comment>输血章节</xsl:comment>
        <component> 
            <section> 
                <code code="56836-0" displayName="History of blood transfusion" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>  
                <text/>  
                <xsl:comment>输血史条目</xsl:comment>
                <entry> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE02.10.100.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血史"/>  
                        <value xsi:type="ST"><xsl:value-of select="history/Value"/></value> 
                    </observation> 
                </entry> 
            </section> 
        </component>  
    </xsl:template>
    <!-- 预防免疫史章节 -->
    <xsl:template match="Vaccinations">
        <xsl:comment>预防免疫史章节</xsl:comment>
        <component> 
            <section> 
                <code code="11369-6" displayName="HISTORY OF IMMUNIZATIONS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>  
                <text/>  
                <entry> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE02.10.101.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="预防接种史"/>  
                        <value xsi:type="ST"><xsl:value-of select="Vaccination/name/Value"/></value> 
                    </observation> 
                </entry> 
            </section> 
        </component>
    </xsl:template>
    <!-- 既往史章节 -->
    <xsl:template match="PastHistory">
     <xsl:comment>既往史章节</xsl:comment> 
        <component> 
            <section> 
                <code code="11348-0" displayName="HISTORY OF PAST ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>  
                <text/>  
                <xsl:comment>一般健康状况标志</xsl:comment> 
                <entry> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE05.10.031.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="一般健康状况标志"/>  
                        <value xsi:type="BL" value="{healthStatus/Value}"/>  
                        <xsl:comment>疾病史（含外伤）</xsl:comment> 
                        <entryRelationship typeCode="COMP"> 
                            <observation classCode="OBS" moodCode="EVN"> 
                                <code code="DE02.10.026.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="疾病史（含外伤）"/>  
                                <value xsi:type="ST"><xsl:value-of select="Illnesses/Illness/name/Value"/></value> 
                            </observation> 
                        </entryRelationship> 
                    </observation> 
                </entry>  
                <xsl:comment>患者传染性标志</xsl:comment>
                <entry> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE05.10.119.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者传染性标志"/>  
                        <value xsi:type="BL" value="{infectionStatus/Value}"/>  
                        <xsl:comment>传染病史</xsl:comment> 
                        <entryRelationship typeCode="COMP"> 
                            <observation classCode="OBS" moodCode="EVN"> 
                                <code code="DE02.10.008.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="传染病史"/>  
                                <value xsi:type="ST"><xsl:value-of select="Infections/Infection/name/Value"/></value> 
                            </observation> 
                        </entryRelationship> 
                    </observation> 
                </entry>  
                <!-- 婚育史条目 -->
                <xsl:apply-templates select="Obstetrics/Obstetric"></xsl:apply-templates>
                <!-- 过敏史条目 -->
                <xsl:apply-templates select="/Document/Allergy/Allergies/Item"></xsl:apply-templates>
                <!-- 手术史条目 --> 
                <xsl:apply-templates select="Surgeries/Surgery"></xsl:apply-templates>
            </section> 
        </component>
    </xsl:template>
    <!-- 婚育史条目 -->
    <xsl:template match="Obstetrics/Obstetric">
      <xsl:comment>婚育史条目</xsl:comment>    
        <entry> 
            <observation classCode="OBS" moodCode="EVN"> 
                <code code="DE02.10.098.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="婚育史"/>  
                <value xsi:type="ST"><xsl:value-of select="name/Value"/></value> 
            </observation> 
        </entry>  
    </xsl:template>
    <!-- 过敏史条目 -->
    <xsl:template match ="/Document/Allergy/Allergies/Item">
        <xsl:comment>过敏史条目</xsl:comment>   
        <entry> 
            <observation classCode="OBS" moodCode="EVN"> 
                <code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史"/>  
                <value xsi:type="ST"><xsl:value-of select="allergen/Value"/></value> 
            </observation> 
        </entry>  
    </xsl:template>
    <!-- 手术史条目 --> 
    <xsl:template match ="Surgeries/Surgery">
        <xsl:comment>手术史条目</xsl:comment>  
        <entry> 
            <observation classCode="OBS" moodCode="EVN"> 
                <code code="DE02.10.061.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术史"/>  
                <value xsi:type="ST"><xsl:value-of select="name/Value"/></value> 
            </observation> 
        </entry> 
    </xsl:template>
    <!--现病史章节-->  
    <xsl:template match="PresentIllnessHistory">
        <xsl:comment>现病史章节</xsl:comment>
        <component> 
            <section> 
                <code code="10164-2" displayName="HISTORY OF PRESENT ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>  
                <text/>  
               <xsl:comment>现病史条目</xsl:comment> 
                <entry> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE02.10.071.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="现病史"/>  
                        <value xsi:type="ST"><xsl:value-of select="presentIllness/Value"/></value> 
                    </observation> 
                </entry> 
            </section> 
        </component> 
    </xsl:template>
    <!--主诉章节-->
    <xsl:template match="ChiefComplaint">
        <xsl:comment>主诉章节</xsl:comment>  
        <component> 
            <section> 
                <code code="10154-3" displayName="CHIEF COMPLAINT" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>  
                <text/>  
              <xsl:comment>主诉条目</xsl:comment>    
                <entry> 
                    <observation classCode="OBS" moodCode="EVN"> 
                        <code code="DE04.01.119.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="主诉"/>  
                        <value xsi:type="ST"><xsl:value-of select="chiefComplaint/Value"/>。</value> 
                    </observation> 
                </entry> 
            </section> 
        </component> 
    </xsl:template>
    <!-- 病区病床科室 -->
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
    <!-- 病史陈述者 -->
    <xsl:template match="Header/Informants/Informant">
        <xsl:comment>病史陈述者</xsl:comment>
        <informant>
            <assignedEntity>
                <id root="2.16.156.10011.1.3" extension="-"/>
                <xsl:comment>陈述者与患者的关系代码</xsl:comment>
                <code code="{code/Value}" displayName="{code/Display}"
                    codeSystem="2.16.156.10011.2.3.3.8" codeSystemName="家庭关系代码表(GB/T 4761)"/>
                <assignedPerson>
                    <name>
                        <xsl:value-of select="name/Value"/>
                    </name>
                </assignedPerson>
            </assignedEntity>
        </informant>
    </xsl:template>
    <!-- 医师签名 -->
    <xsl:template match="Header/Authenticators/Authenticator">
        <xsl:choose>
            <xsl:when
                test="assignedEntityCode = '接诊医师' or assignedEntityCode = '住院医师' or assignedEntityCode = '主治医师'or assignedEntityCode = '出院医嘱开立人'">
                <xsl:call-template name="MediAuthenticator"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="MediAuthenticator">
        <authenticator>
            <time>             
            </time>
            <signatureCode/>
            <assignedEntity>
                <id root="2.16.156.10011.1.5" extension="{assignedEntityId}"/>
                <code displayName="{assignedEntityCode}"/>
                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                    <name>
                        <xsl:value-of select="assignedPersonName/Value"/>
                    </name>
                </assignedPerson>
            </assignedEntity>
        </authenticator>
    </xsl:template>
    <!-- 最终审核者 -->
    <xsl:template match="Header/LegalAuthenticators/LegalAuthenticator">
        <xsl:choose>
            <xsl:when test="assignedEntityCode = '科主任'">
                <xsl:comment>最终审核者签名</xsl:comment>
                <legalAuthenticator typeCode="LA">
                    <time value="{time/Value}"/>
                    <signatureCode code="s"/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.5" extension="最终审核医师签名"/>
                        <code displayName="主任医师"></code>
                        <assignedPerson>
                            <name>
                                <xsl:value-of select="assignedPersonName/Value"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </legalAuthenticator>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>