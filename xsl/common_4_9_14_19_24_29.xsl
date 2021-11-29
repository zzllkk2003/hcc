<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:isc="http://extension-functions.intersystems.com" xmlns:exsl="http://exslt.org/common" xmlns:set="http://exslt.org/sets" exclude-result-prefixes="isc sdtc exsl set">
    <xsl:output method="xml"/>
    <xsl:template match="/Document">
        <!--4.会诊意见章节 45-->
        <xsl:apply-templates select="ConsultSuggestion/suggestion"/>
        <!--9.卫生事件章节 01-->
        <xsl:apply-templates select="HealthcareEvent"/>
        <!--14.引流章节 09-->
        <xsl:apply-templates select="SurgicalDrains"/>
        <!--19.护理隔离章节 17-->
        <xsl:apply-templates select="NursingIsolation"/>
        <!--24.检验报告章节 07-->
        <xsl:apply-templates select="LabReport"/>
        <!--29.讨论总结章节 51-->
        <xsl:apply-templates select="DiscussionSummary"/>
    </xsl:template>
    <!--会诊意见章节模板-->
    <xsl:template match="ConsultSuggestion/suggestion">
        <component>
            <section>
                <code  displayName="会诊意见章节"/>
                <text/>
                <!--会诊意见-->
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.018.00" displayName="会诊意见" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST">
                            <xsl:value-of select="/Document/ConsultSuggestion[1]/suggestion[1]/Value[1]"/>
                        </value>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>   
    <!-- 卫生事件章节模板 -->
    <xsl:template match="HealthcareEvent">
            <component>
                <section>
                    <code displayName="卫生事件"/>
                    <text/>
                    <entry>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE08.10.026.00" displayName="{departmentName/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">
                                <xsl:value-of select="departmentName/Value"/>
                            </value>
                        </observation>
                    </entry>
                    <entry>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE02.01.060.00" displayName="患者类型代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="CD" code="{patientType/Value}" codeSystem="2.16.156.10011.2.3.1.271" codeSystemName="患者类型代码表"/>
                        </observation>
                    </entry>
                    <entry>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE01.00.010.00" displayName="门（急）诊号" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">
                                <xsl:value-of select="outpatientNum/Value"/>
                            </value>
                        </observation>
                    </entry>
                    <entry>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE01.00.014.00" displayName="住院号" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">
                                <xsl:value-of select="inpatientNum/Value"/>
                            </value>
                        </observation>
                    </entry>
                    <entry>
                        <organizer classCode="BATTERY" moodCode="EVN">
                            <statusCode/>
                            <component>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.092.00" displayName="{time/admissionTime/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="TS" value="{time/admissionTime/Value}"/>
                                </observation>
                            </component>
                            <component>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.017.00" displayName="{time/dischargeTime/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="TS" value="{time/dischargeTime/Value}"/>
                                </observation>
                            </component>
                        </organizer>
                    </entry>
                    <entry>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE04.01.018.00" displayName="{sickTime/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="TS" value="{sickTime/Value}"/>
                        </observation>
                    </entry>
                    <entry>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE05.10.053.00" displayName="就诊原因" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <!-- 就诊日期时间 DE06.00.062.00-->
                            <effectiveTime value="20130202123422"/>
                            <value xsi:type="ST">
                                <xsl:value-of select="admissionReason/Value"/>
                            </value>
                        </observation>
                    </entry>
                    <!--条目：诊断-->
                    <xsl:apply-templates select="diagnoses/Diagnosis"/>
                    <!--条目：诊断-->
                    <entry>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE05.01.024.00" displayName="其他西医诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                <qualifier>
                                    <name displayName="其他西医诊断编码"/>
                                </qualifier>
                            </code>
                            <value xsi:type="CD" code="{otherDiagnosis/Value}" codeSystem="2.16.156.10011.2.3.3.11.1" codeSystemName="诊断代码表（ICD-10）"/>
                        </observation>
                    </entry>
                    <xsl:apply-templates select="TCMdiagnoses/TCMDiagnosis"/>
                    <xsl:apply-templates select="operations/Operation"/>
                    <xsl:apply-templates select="keyMedicines/KeyMedicine"/>
                    <entry>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.251.00" displayName="{otherTreatment/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">
                                <xsl:value-of select="otherTreatment/Value"/>
                            </value>
                        </observation>
                    </entry>
                    <entry>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE05.01.021.00" displayName="{deathReason/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="CD" code="{deathReason/Value}" codeSystem="2.16.156.10011.2.3.3.11.2" codeSystemName="死因代码表（ICD-10）"/>
                        </observation>
                    </entry>
                    <entry>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE02.01.039.00" displayName="{doctorName/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">
                                <xsl:value-of select="doctorName/Value"/>
                            </value>
                        </observation>
                    </entry>
                    <!-- 费用条目 -->
                    <xsl:apply-templates select="fee"/>
                </section>
            </component>
    </xsl:template>
    <!--卫生事件章节:西医诊断条目-->
    <xsl:template match="diagnoses/Diagnosis">
        <entry>
            <observation classCode="OBS" moodCode="EVN">
                <code code="DE05.01.024.00" displayName="西医诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                    <qualifier>
                        <name displayName="西医诊断编码"/>
                    </qualifier>
                </code>
                <value xsi:type="CD" code="1" codeSystem="2.16.156.10011.2.3.3.11.1" codeSystemName="诊断代码表（ICD-10）" displayName="西医诊断"/>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.10.113.00" displayName="病情转归代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="CD" code="{result/Value}" codeSystem="2.16.156.10011.2.3.1.148" codeSystemName="病情转归代码表" displayName="{result/Display}"/>
                    </observation>
                </entryRelationship>
            </observation>
        </entry>
    </xsl:template>
    <!--卫生事件章节:中医病名代码条目-->
    <xsl:template match="TCMdiagnoses/TCMDiagnosis">
        <entry>
            <observation classCode="OBS" moodCode="EVN">
                <code code="DE05.10.130.00" displayName="中医病名代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                    <qualifier>
                        <name displayName="中医病名代码"/>
                    </qualifier>
                </code>
                <value xsi:type="CD" code="{name/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表（ GB/T 15657-1995）"/>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.10.130.00" displayName="中医证候代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                            <qualifier>
                                <name displayName="中医证候代码"/>
                            </qualifier>
                        </code>
                        <value xsi:type="CD" code="{symptom/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表（ GB/T 15657-1995）"/>
                    </observation>
                </entryRelationship>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE05.10.113.00" displayName="病情转归代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="CD" code="{result/Value}" codeSystem="2.16.156.10011.2.3.1.148" codeSystemName="病情转归代码表" displayName="{result/Display}"/>
                    </observation>
                </entryRelationship>
            </observation>
        </entry>
    </xsl:template>
    <!--卫生事件章节:手术及操作条目-->
    <xsl:template match="operations/Operation">
        <entry>
            <procedure classCode="PROC" moodCode="EVN">
                <!-- 手术及操作编码 DE06.00.093.00 -->
                <code code="{name/Value}" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表（ICD-9-CM）"/>
            </procedure>
        </entry>
    </xsl:template>
    <!--卫生事件章节:关键药物名称条目-->
    <xsl:template match="keyMedicines/KeyMedicine">
        <entry>
            <observation classCode="OBS" moodCode="EVN">
                <code code="DE08.50.022.00" displayName="关键药物名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                <value xsi:type="ST">
                    <xsl:value-of select="name/Value"/>
                </value>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.136.00" displayName="关键药物用法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST">
                            <xsl:value-of select="usage/Value"/>
                        </value>
                    </observation>
                </entryRelationship>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.129.00" displayName="药物不良反应情况" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="ST">
                            <xsl:value-of select="adverseReaction/Value"/>
                        </value>
                    </observation>
                </entryRelationship>
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.164.00" displayName="中药使用类别代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                        <value xsi:type="CD" code="{TCMType/Value}" codeSystem="2.16.156.10011.2.3.1.157" codeSystemName="中药使用类别代码表"/>
                    </observation>
                </entryRelationship>
            </observation>
        </entry>
    </xsl:template>
    <!--卫生事件章节:费用条目-->
    <xsl:template match="fee">
        <entry>
            <organizer classCode="CLUSTER" moodCode="EVN">
                <statusCode/>
                <component>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE02.01.044.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{insuranceType/displayName}"/>
                        <value xsi:type="CD" code="{insuranceType/Value}" codeSystem="2.16.156.10011.2.3.1.248" codeSystemName="医疗保险类别代码表"/>
                    </observation>
                </component>
                <component>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE07.00.007.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{paymentType/displayName}"/>
                        <value xsi:type="CD" code="{paymentType/Value}" codeSystem="2.16.156.10011.2.3.1.269" displayName="城镇职工基本医疗保险" codeSystemName="医疗付费方式代码表"/>
                    </observation>
                </component>
                <component>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE07.00.004.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{outpatient/displayName}"/>
                        <value xsi:type="MO" value="{outpatient/Value}" currency="元"/>
                    </observation>
                </component>
                <component>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE07.00.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{inpatient/displayName}"/>
                        <value xsi:type="MO" value="{inpatient/Value}" currency="元"/>
                    </observation>
                </component>
                <component>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE07.00.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{patientPay/displayName}"/>
                        <value xsi:type="MO" value="{patientPay/Value}" currency="元"/>
                    </observation>
                </component>
            </organizer>
        </entry>
    </xsl:template>
    <!--14.引流章节模板 09-->
    <xsl:template match="SurgicalDrains">
        <component>
            <section>
                <code code="11537-8" displayName="Surgical drains" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                <text/>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <!--引流标志-->
                        <code code="DE05.10.165.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="引流标志"/>
                        <value xsi:type="BL" value="{drains/Value}"/>
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE08.50.044.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{material/displayName}"/>
                                <value xsi:type="ST"><xsl:value-of select="material/Value"/></value>
                            </observation>
                        </entryRelationship>
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE08.50.045.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{count/displayName}"/>
                                <value xsi:type="ST"><xsl:value-of select="count/Value"/></value>
                            </observation>
                        </entryRelationship>
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE06.00.341.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{Position/displayName}"/>
                                <value xsi:type="ST"><xsl:value-of select="Position/Value"/></value>
                            </observation>
                        </entryRelationship>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--19.护理隔离章节 17-->
    <xsl:template match="NursingIsolation">
        <component>
            <section>
                <code nullFlavor="UNK" displayName="护理隔离"/>
                <title>护理隔离章节</title>
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.201.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="隔离标志"/>
                        <value xsi:type="BL" value="{isolation/Value}"/>
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS" moodCode="EVN">
                                <code code="DE06.00.202.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="隔离种类代码"/>
                                <value xsi:type="CD" code="{isolationType/Value}" displayName="{isolationType/Display}" codeSystem="2.16.156.10011.2.3.1.261" codeSystemName="隔离种类代码"/>
                            </observation>
                        </entryRelationship>
                    </observation>
                </entry>
            </section>
        </component>
    </xsl:template>
    <!--24.检验报告章节 07-->
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
                <entry>
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="DE06.00.179.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验报告备注"/>
                        <value xsi:type="ST"><xsl:value-of select="notes/Value"/></value>
                    </observation>
                </entry>	
            </section>
        </component>
    </xsl:template>
    <!--29.讨论总结章节 51-->
    <xsl:template match="DiscussionSummary"><component>
        <section>
            <code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="主持人总结意见"/>
            <text><xsl:value-of select="content/Value"/></text>
        </section>
    </component></xsl:template>
</xsl:stylesheet>