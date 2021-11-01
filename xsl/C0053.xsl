<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:include href="CDA-Support-Files/Procedures.xsl"/>
	<xsl:include href="CDA-Support-Files/Diagnosis.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.52"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>出院小结</title>
			<!-- 文档机器生成时间 -->
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--文档记录对象（患者）-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 健康卡号 -->
					<xsl:apply-templates select="Header/recordTarget/healthCardId" mode="HealthCardNumber"/>
					<!-- 住院号标识 todo-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					<!-- 现住址 -->
					<xsl:apply-templates select="Header/recordTarget/addr" mode="Address"/>
					<xsl:apply-templates select="Header/recordTarget/telcom" mode="PhoneNumber"/>
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 出生时间1..1 -->
						<xsl:apply-templates select="Header/recordTarget/Patient/birthTime" mode="BirthTime"/>
						<!-- 婚姻状况1..1 -->
						<xsl:apply-templates select="Header/recordTarget/patient/maritalStatusCode" mode="MaritalStatus"/>
						<!-- 民族1..1 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ethnicGroupCode" mode="EthnicGroup"/>
						<!-- 出生地 -->
						<xsl:apply-templates select="Header/recordTarget/patient/birthplace" mode="BirthPlace"/>
						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"/>
						<!-- 工作单位 -->
						<!--职业状况-->
						<xsl:apply-templates select="Header/recordTarget/patient/occupationCode" mode="Occupation"/>
					</patient>
					<!--提供患者服务机构-->
					<xsl:apply-templates select="Header/recordTarget/providerOrganization" mode="providerOrganization"/>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			<!-- LegalAuthenticator签名 -->
			<xsl:apply-templates select="Header/LegalAuthenticator" mode="legalAuthenticator"/>
			<!-- Authenticator签名 -->
			<xsl:apply-templates select="Header/Authenticators/Authenticator" mode="Authenticator"/>
			<!--联系人1..*-->
			<xsl:apply-templates select="Header/Participants" mode="SupportContact"/>
			<!--关联活动信息-->
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<xsl:apply-templates select="Header/encompassingEncounter" mode="EncompassingEncounter"/>
			<!--****************************文档体Body********************-->
			<component>
				<structuredBody>
					<!--主要健康问题章节-->
					<component>
						<section>
							<code code="11450-4" displayName="PROBLEM LIST" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--HDSD00.16.030	DE05.10.148.00	入院情况  条目-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE05.10.148.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院情况"/>
									<value xsi:type="ST"><xsl:value-of select="Problem/admitCondition/Value"/></value>
								</observation>
							</entry>
						</section>
					</component>
					<!--入院诊断章节-->
					<component>
						<section>
							<code code="46241-6" displayName="HOSPITAL ADMISSION DX" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--HDSD00.16.032	DE05.01.024.00	入院诊断-西医诊断编码  条目-->
							<xsl:apply-templates select="AdmDiag/Diagnoses/Diagnose/diag" mode="Diag024"/>
							<!--HDSD00.16.033	DE05.10.130.00	入院诊断-中医病名代码  条目-->
							<xsl:apply-templates select="AdmDiag/TCM/TCM/diag" mode="Diag130"/>
							<!--HDSD00.16.034	DE05.10.130.00	入院诊断-中医证候代码  条目-->
							<xsl:apply-templates select="AdmDiag/TCM/TCM/diag" mode="Diag130-2"/>
							
						</section>
					</component>
					<!--出院诊断章节-->
					<component>
						<section>
							<code code="11535-2" displayName="Discharge Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--HDSD00.16.008	DE05.01.024.00	出院诊断-西医诊断编码  条目-->
							<xsl:apply-templates select="DisDiag/Primarys/Primary/diag" mode="Diag024"/>
							<!--HDSD00.16.009	DE05.10.130.00	出院诊断-中医病名代码  条目-->
							<xsl:apply-templates select="DisDiag/Primarys/Primary/diag" mode="Diag130"/>
							<!--HDSD00.16.010	DE05.10.130.00	出院诊断-中医诊断代码  条目-->
							<xsl:apply-templates select="DisDiag/Primarys/Primary/diag" mode="Diag130-2"/>>
							<!--HDSD00.16.051	DE02.10.028.00	中医“四诊”观察结果  条目-->
							<xsl:apply-templates select="DisDiag/Primarys/Primary/diag" mode="Diag028"/>
							<!--HDSD00.16.006	DE04.01.117.00	出院时症状与体征  条目-->
							<xsl:apply-templates select="DisDiag/dischargeSymptom" mode="Diag117"/>
							<!--HDSD00.16.004	DE06.00.193.00	出院情况  条目   -->
							<xsl:apply-templates select="DisDiag/dischargeCondition/Primary" mode="Diag193"/>
						</section>
					</component>
					<!--手术操作章节-->
					<xsl:apply-templates select="Procedure/Items/ProcedureItem" mode="C0053PC"/>
					<!-- 治疗计划章节 -->
					<component>
						<section>
							<code code="18776-5" codeSystem="2.16.840.1.113883.6.1" displayName="TREATMENT PLAN" codeSystemName="LOINC"/>
							<text/>
							<!--HDSD00.16.048	DE06.00.300.00	治则治法  条目-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.300.00" codeSystem="2.16.156.10011.2.3.3.15" codeSystemName="卫生信息数据元目录" displayName="治则治法"/>
									<value xsi:type="ST"><xsl:value-of select="TreatmentPlan/treatmentPrinciple/Value"/></value>
									<!--GB/T 16751.3-1997-->
								</observation>
							</entry>
						</section>
					</component>
					<!--住院过程章节-->
					<component>
						<section>
							<code code="8648-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Hospital Course"/>
							<text/>
							<!--HDSD00.16.045	DE06.00.296.00	诊疗过程描述  条目-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.296.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="诊疗过程描述"/>
									<value xsi:type="ST"><xsl:value-of select="HospitalCourse/treatmentCourse/Value"/></value>
								</observation>
							</entry>
							<!--HDSD00.16.047	DE05.10.113.00	治疗结果代码  条目-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE05.10.113.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="治疗结果代码"/>
									<value xsi:type="CD" code="{HospitalCourse/result/Value}" codeSystem="2.16.156.10011.2.3.1.148" codeSystemName="治疗结果代码"/>
								</observation>
							</entry>
							<!--HDSD00.16.036	DE06.00.310.00	实际住院天数  条目-->
							<entry typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.310.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="实际住院天数"/>
									<value xsi:type="PQ" value="{HospitalCourse/stayDays/Value}" unit="天"/>
								</observation>
							</entry>
						</section>
					</component>
					<!-- 医嘱章节-->
					<component>
						<section>
							<code code="46209-3" codeSystem="2.16.840.1.113883.6.1" displayName="Provider Orders" codeSystemName="LOINC"/>
							<text/>
							<!--HDSD00.16.049	DE08.50.047.00	中药煎煮方法  条目-->
							<entry>
								<observation classCode="OBS" moodCode="EVN ">
									<code code="DE08.50.047.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中药煎煮方法"/>
									<value xsi:type="ST"><xsl:value-of select="ProviderOrder/decoctMethod/Value"/></value>
								</observation>
							</entry>
							<!--HDSD00.16.050	DE06.00.136.00	中药用药方法  条目-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.136.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中药用药方法"/>
									<value xsi:type="ST"><xsl:value-of select="ProviderOrder/useMethod/Value"/></value>
								</observation>
							</entry>
							<!--HDSD00.16.007	DE06.00.287.00	出院医嘱  条目-->
							<entry typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.287.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院医嘱"/>
									<value xsi:type="ST"><xsl:value-of select="DisDiag/dischargeOrder/Value"/></value>
								</observation>
							</entry>
						</section>
					</component>
					<!--实验室检查章节-->
					<component>
						<section>
							<code code="30954-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="STUDIES SUMMARY"/>
							<text/>
							<!--阳性辅助检查结果条目-->
							<entry typeCode="COMP" contextConductionInd="true">
								<!--阳性辅助检查结果-->
								<organizer classCode="BATTERY" moodCode="EVN">
									<statusCode nullFlavor="UNK"/>
									<component typeCode="COMP" contextConductionInd="true">
										<!--HDSD00.16.042	DE04.50.128.00	阳性辅助检查结果  -->
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE04.50.128.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="ST"><xsl:value-of select="AdmDiag/AuxExamResults/AuxExamResult/result/Value"/></value>
										</observation>
									</component>
								</organizer>
							</entry>
						</section>
					</component>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
