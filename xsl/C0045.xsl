<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:include href="CDA-Support-Files/Procedures.xsl"/>
	<xsl:include href="CDA-Support-Files/TreatmentPlan.xsl"/>
	<xsl:include href="CDA-Support-Files/Sections.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.52"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>死亡记录</title>
			<!-- 文档机器生成时间 -->
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--文档记录对象（患者）-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					
					<!-- 住院号标识 todo-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 出生时间1..1 -->
						<xsl:apply-templates select="Header/recordTarget/Patient/birthTime" mode="BirthTime"/>
						<!-- 年龄1..1 -->
						<xsl:apply-templates select="Header/recordTarget/Patient/Age" mode="Age"/>
					</patient>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			<!-- Authenticator签名 -->
			<xsl:apply-templates select="Header/Authenticators/Authenticator" mode="Authenticator"/>
			<!--会诊所在医疗机构名称 todo-->
	<authenticator>
		<time/>
		<signatureCode/>
		<assignedEntity>
			<id/>
			<code displayName="会诊所在机构"/>
			<representedOrganization>
				<asOrganizationPartOf>
					<wholeOrganization>
						<id root="2.16.156.10011.1.26" extension="会诊科室名称"/>
						<name>胸外科</name>
						<asOrganizationPartOf>
							<wholeOrganization>
								<id root="2.16.156.10011.1.5" extension="会诊所在医疗机构名称"/>
								<name>xx市人民医院</name>
							</wholeOrganization>
						</asOrganizationPartOf>
					</wholeOrganization>
				</asOrganizationPartOf>
			</representedOrganization>
		</assignedEntity>
	</authenticator>
			<!--关联活动信息-->
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			
			
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<xsl:apply-templates select="Header/encompassingEncounter" mode="EncompassingEncounter"/>
			<!--****************************文档体Body********************-->
			<component>
				<structuredBody>
					<!--
**************************************************
健康评估章节MRsummary
**************************************************
-->
			<!--健康评估章节-->
			<component>
				<section>
					<code code="51848-0" displayName="Assessment note" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
					<text/>
					<entry>
						<!-- 病历摘要-->
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.182.00" displayName="病历摘要" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST"><xsl:value-of select="HealthAssessment/MRsummary/Value"/></value>
						</observation>
					</entry>
				</section>
			</component>
<!--
*********************************************
诊断章节
*********************************************
-->
			<!--诊断章节-->
			<component>
				<section>
					<code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
					<text/>
					<!--西医诊断名称-->
					
					<xsl:apply-templates select="Diagnosis/Westerns/Western" mode="Diag024"/>
					<!--西医诊断编码-->
					<xsl:apply-templates select="Diagnosis/Westerns/Western" mode="Diag025"/>
					
					<!--中医病名名称-->
					<xsl:apply-templates select="Diagnosis/TCM/TCM/TCMdiag" mode="Diag130"/>
					<!--中医病名代码-->
					<xsl:apply-templates select="Diagnosis/TCM/TCM/TCMdiag" mode="Diag172"/>
					
					<!--中医症候名称-->
					
					<xsl:apply-templates select="TCMSyndrome/TCMSyndrome/syndrome" mode="Diag130-2"/>
					<!--中医症候代码-->
					
					<xsl:apply-templates select="TCMSyndrome/TCMSyndrome/syndrome" mode="Diag172-2"/>
					<!--中医“四诊”观察结果-->
					<xsl:apply-templates select="TCMFourDiags" mode="Diag028"/>
				</section>
			</component>
<!--
*********************************************
 辅助检查章节
*********************************************
-->
			<component>
				<section>
					<code  displayName="辅助检查章节"/>
					<text/>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.30.009.00" displayName="辅助检查结果" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST"><xsl:value-of select="SupplementaryExams/SupplementaryExam/result/Value"/></value>
						</observation>
					</entry>
				</section>
			</component>
<!-- 
********************************************************
治疗计划章节
********************************************************
-->
			<!--治疗计划章节-->
			<component>
				<section>
					<code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
					<text/>
					<xsl:apply-templates select="TreatmentPlan" mode="TP297"/>
					<xsl:apply-templates select="TreatmentPlan" mode="TP300"/>
					<xsl:apply-templates select="TreatmentPlan" mode="TP214"/>
				</section>
			</component>
<!-- 
********************************************************
会诊原因章节
********************************************************
-->
			<!--会诊原因章节-->
			<component>
				<section>
					<code displayName="会诊原因章节"/>
					<text/>
					
					<!--会诊类型-->
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.319.00" displayName="会诊类型" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST"><xsl:value-of select="ConsultReason/Type/Value"/></value>
						</observation>
					</entry>
					
					<!--会诊原因-->
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.039.00" displayName="会诊原因" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST"><xsl:value-of select="ConsultReason/reason/Value"/></value>
						</observation>
					</entry>
				</section>
			</component>
<!-- 
********************************************************
会诊意见章节
********************************************************
-->
			<!--会诊意见章节-->
			<component>
				<section>
					<code  displayName="会诊意见章节"/>
					<text/>
					<!--会诊意见-->
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.018.00" displayName="会诊意见" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST"><xsl:value-of select="ConsultSuggestion/suggestion/Value"/></value>
						</observation>
					</entry>
				</section>
			</component>
<!--
****************************************************
 住院过程章节
****************************************************
 -->
			<component>
				<section>
					<code code="8648-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Hospital Course"/>
					<text/>
					<!--诊疗过程描述-->
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.296.00" displayName="诊疗过程描述" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST"><xsl:value-of select="/HospitalCourse/treatmentCourse/Value"/></value>
						</observation>
					</entry>
				</section>
			</component>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
