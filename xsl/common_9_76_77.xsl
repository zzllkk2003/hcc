<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:isc="http://extension-functions.intersystems.com" xmlns:exsl="http://exslt.org/common" xmlns:set="http://exslt.org/sets" exclude-result-prefixes="isc sdtc exsl set">
	<xsl:output method="xml"/>
	<xsl:template match="/Document">
		
			<!--76-实验室检验章节-EMR01-->
			<xsl:apply-templates select="LabTest"/>
			<!--77-既往史章节-EMR01-->
			<xsl:apply-templates select="PastHistory"/>
			<!--9-卫生事件章节-EMR01-->
			<xsl:apply-templates select="HealthcareEvent"/>
			
	</xsl:template>
	
	<!--EMR01-实验室检验章节模板-->
	<xsl:template match="LabTest">
		<component>
			<section>
				<code code="30954-2" displayName="STUDIES SUMMARY" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!-- 血型-->
				<entry typeCode="COMP">
					<organizer classCode="BATTERY" moodCode="EVN">
						<statusCode/>
						<!-- ABO血型 -->
						<component typeCode="COMP" contextConductionInd="true">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
								<value xsi:type="CD" code="{bloodABO/Value}" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="{bloodABO/displayName}" displayName="{bloodABO/Display}"/>
							</observation>
						</component>
						<!-- Rh血型 -->
						<component typeCode="COMP" contextConductionInd="true">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE04.50.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
								<value xsi:type="CD" code="{bloodRh/Value}" codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="{bloodRh/displayName}" displayName="{bloodRh/Display}"/>
							</observation>
						</component>
					</organizer>
				</entry>
			</section>
		</component>
	</xsl:template>
	
	<!--EMR01-既往史章节模板 -->
	<xsl:template match="PastHistory">
		<component>
			<section>
				<code code="11348-0" displayName="HISTORY OF PAST ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!-- 疾病史（含外伤） -->
				<xsl:apply-templates select="Illnesses/Illness"/>
				<!-- 传染病史 -->
				<xsl:apply-templates select="Infections/Infection"/>
				<!--手术史条目-->
				<xsl:apply-templates select="Surgeries/Surgery"/>
				<!--婚育史条目-->
				<xsl:apply-templates select="Obstetrics/Obstetric"/>
			</section>
		</component>
	</xsl:template>
	<!-- 疾病史（含外伤） -->
	<xsl:template match="Illnesses/Illness">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.026.00" displayName="{name/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="name/Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!-- 传染病史 -->
	<xsl:template match="Infections/Infection">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.008.00" displayName="{name/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="name/Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--手术史条目-->
	<xsl:template match="Surgeries/Surgery">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.061.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{name/displayName}"/>
				<value xsi:type="ST">
					<xsl:value-of select="name/Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--婚育史条目-->
	<xsl:template match="Obstetrics/Obstetric">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.098.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{name/displayName}"/>
				<value xsi:type="ST">
					<xsl:value-of select="name/Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	
	<!--卫生事件章节-->
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
	
</xsl:stylesheet>
