<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:include href="CDA-Support-Files/Diagnosis.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.52"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>治疗记录</title>
			<!-- 文档机器生成时间 -->
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--文档记录对象（患者）-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!--门诊号-->
					<xsl:apply-templates select="Header/recordTarget/patient/outpatientNum" mode="outpatientNum"/>
					<!--住院号-->
					<xsl:apply-templates select="Header/recordTarget/patient/inpatientNum" mode="inpatientNum"/>
					<!--电子申请单号-->
					<xsl:apply-templates select="Header/recordTarget/patient/MRN" mode="MRN"/>
					<!-- 健康卡号 -->
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"/>
					</patient>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			<!-- Authenticator签名 -->
			<xsl:apply-templates select="Header/Authenticators/Authenticator" mode="Authenticator"/>
			<!--关联活动信息-->
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<xsl:apply-templates select="Header/encompassingEncounter" mode="EncompassingEncounter"/>
			<!--****************************文档体Body********************-->
			<component>
				<structuredBody>
					<!-- 既往史章节 -->
					<component>
						<section>
							<code code="11348-0" displayName="HISTORY OF PAST ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE05.10.165.00" displayName="有创诊疗操作标志" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="BL" value="{PastHistory/invasiveTreatment/Value}"/>
								</observation>
							</entry>
							<entry>
								<!-- 过敏史标志 -->
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE02.10.023.00" displayName="过敏史标志" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="BL" value="{Allergy/active/Value}"/>
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE02.10.022.00" displayName="过敏史" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="ST">
												<xsl:value-of select="Allergy/Allergies/Item/allergen/Value"/>
											</value>
										</observation>
									</entryRelationship>
								</observation>
							</entry>
						</section>
					</component>
					<!--生命体征章节-->
					<component>
						<section>
							<code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="VITAL SIGNS"/>
							<text/>
							<!--体格检查-体重（kg）-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体重（kg）"/>
									<value xsi:type="PQ" value="{VitalSigns/VitalSign[type='DE04.10.188.00']/value}" unit="kg"/>
								</observation>
							</entry>
						</section>
					</component>
					<!--
********************************************************
入院诊断章节
********************************************************
-->
					<component>
						<section>
							<code code="46241-6" displayName="HOSPITAL ADMISSION DX" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--疾病诊断编码-->
							<xsl:apply-templates select="AdmDiag/Diagnoses/Diagnosis" mode="Diag024"/>
						</section>
					</component>
					<!--
********************************************************
治疗计划章节TreatmentPlan
********************************************************
-->
					<component>
						<section>
							<code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--处理及指导意见-->
							<entry>
								<observation classCode="OBS" moodCode="INT">
									<!--处理及指导意见-->
									<code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="处理及指导意见"/>
									<value xsi:type="ST">
										<xsl:value-of select="TreatmentPlan/guide/Value"/>
									</value>
								</observation>
							</entry>
							<!--医嘱使用备注-->
							<entry>
								<observation classCode="OBS" moodCode="INT">
									<!--医嘱使用备注-->
									<code code="DE06.00.179.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="医嘱使用备注"/>
									<value xsi:type="ST">
										<xsl:value-of select="TreatmentPlan/notes/Value"/>
									</value>
								</observation>
							</entry>
							<!--今后治疗方案-->
							<entry>
								<observation classCode="OBS" moodCode="INT">
									<!--今后治疗方案-->
									<code code="DE06.00.159.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="今后治疗方案"/>
									<value xsi:type="ST">
										<xsl:value-of select="TreatmentPlan/plan/Value"/>
									</value>
								</observation>
							</entry>
							<!--随访条目-->
							<entry>
								<observation classCode="CASE" moodCode="EVN">
									<!--活动代码（随访）-->
									<code code="DE06.00.108.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="随访方式"/>
									<!--随访时间（数据元）-->
									<effectiveTime value="20110212"/>
									<value code="{TreatmentPlan/followup/code/Value}" codeSystem="2.16.156.10011.2.3.1.183" codeSystemName="随访方式代码表" xsi:type="CD" displayName="{TreatmentPlan/followup/code/Display}"/>
									<!--随访周期建议代码-->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.112.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="随访周期建议代码"/>
											<value xsi:type="CD" code="{TreatmentPlan/followup/period/Value}" displayName="{TreatmentPlan/followup/period/Value}" codeSystem="2.16.156.10011.2.3.1.184" codeSystemName="随访周期建议代码表"/>
										</observation>
									</entryRelationship>
								</observation>
							</entry>
						</section>
					</component>
					<!--
********************************************************
手术操作章节
********************************************************
-->
					<component>
						<section>
							<code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<entry>
								<!-- 1..1 手术记录 -->
								<procedure classCode="PROC" moodCode="EVN">
									<code code="1" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表（ICD-9-CM）"/>
									<!--操作日期/时间-->
									<effectiveTime>
										<!--操作结束日期时间-->
										<high value="{Procedure/Items/ProcedureItem/endTime/Value}"/>
									</effectiveTime>
									<!--操作名称 -->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.094.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="操作名称"/>
											<value xsi:type="ST">
												<xsl:value-of select="Procedure/Items/ProcedureItem/name/Value"/>
											</value>
										</observation>
									</entryRelationship>
									<!--操作目标部位名称 -->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.187.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术目标部位名称"/>
											<value xsi:type="ST">
												<xsl:value-of select="Procedure/Items/ProcedureItem/bodyPartName/Value"/>
											</value>
										</observation>
									</entryRelationship>
									<!--介入物名称 -->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE08.50.037.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="介入物名称"/>
											<value xsi:type="ST">
												<xsl:value-of select="Procedure/Items/ProcedureItem/intervention/Value"/>
											</value>
										</observation>
									</entryRelationship>
									<!--操作方法描述-->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.251.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="操作方法描述"/>
											<value xsi:type="ST">
												<xsl:value-of select="Procedure/Items/ProcedureItem/operationWay/Value"/>
											</value>
										</observation>
									</entryRelationship>
									<!--操作次数-->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.250.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="操作次数"/>
											<value xsi:type="INT" value="{Procedure/Items/ProcedureItem/operationTimes/Value}"/>
										</observation>
									</entryRelationship>
								</procedure>
							</entry>
						</section>
					</component>
					<!--用药管理章节-->
					<component>
						<section>
							<code code="18610-6" codeSystem="2.16.840.1.113883.6.1" displayName="MEDICATION ADMINISTERED" codeSystemName="LOINC"/>
							<text/>
							<xsl:apply-templates select="MedicationAdministereds/MedicationAdministered" mode="MedicationAdministered"/>
						</section>
					</component>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
