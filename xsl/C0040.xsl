<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:include href="CDA-Support-Files/Procedures.xsl"/>
	<xsl:include href="CDA-Support-Files/TreatmentPlan.xsl"/>
	<xsl:include href="CDA-Support-Files/Diagnosis.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.52"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>疑难病例讨论记录</title>
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
					<providerOrganization classCode="ORG" determinerCode="INSTANCE">
						<asOrganizationPartOf classCode="PART">
							<!--讨论时间-->
							<effectiveTime value="20130112"/>
							<wholeOrganization>
								<addr>六病区医师办公室</addr>
							</wholeOrganization>
						</asOrganizationPartOf>
					</providerOrganization>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			<xsl:apply-templates select="Header/LegalAuthenticator" mode="legalAuthenticator"/>
			<!-- Authenticator签名 -->
			<xsl:apply-templates select="Header/Authenticators/Authenticator" mode="Authenticator"/>
			<!--关联活动信息-->
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<xsl:apply-templates select="Header/encompassingEncounter" mode="EncompassingEncounter"/>
			<!--****************************文档体Body********************-->
			<component>
				<structuredBody>
					<!--
********************************************************
健康评估章节HealthAssessment
********************************************************
-->
					<component>
						<section>
							<code code="51848-0" displayName="Assessment note" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<entry>
								<observation classCode="OBS" moodCode="EVN ">
									<code code="DE06.00.018.00" displayName="讨论意见" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="ST">
										<xsl:value-of select="HealthAssessment/suggestion"/>
									</value>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN ">
									<code code="DE06.00.018.00" displayName="主持人总结意见" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="ST">
										<xsl:value-of select="HealthAssessment/summary"/>
									</value>
								</observation>
							</entry>
						</section>
					</component>
					<!--
*******************************************************
 诊断章节 
*******************************************************
-->
					<component>
						<section>
							<code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<xsl:apply-templates select="TCMFourDiags" mode="Diag028"/>
						</section>
					</component>
					<!-- 
********************************************************
治疗计划章节
********************************************************
-->
					<!--治疗计划章节-->
					<xsl:apply-templates select="TreatmentPlan" mode="TP131"/>
					<!--用药章节-->
					<xsl:apply-templates select="MedicationUseHistory"/>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
	<!--用药章节模板-->
	<xsl:template match="MedicationUseHistory">
		<component>
			<section>
				<code code="10160-0" displayName="HISTORY OF MEDICATION USE" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--中药处方医嘱内容-->
				<xsl:comment>中药处方医嘱内容</xsl:comment>
				<xsl:if test="content/Value">
					<entry>
						<observation classCode="OBS " moodCode="EVN ">
							<code code="DE06.00.287.00" displayName="中药处方医嘱内容" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of select="content/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
				<!--中药煎煮方法-->
				<xsl:comment>中药煎煮方法</xsl:comment>
				<xsl:if test="TCMCook/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN ">
							<code code="DE08.50.047.00" displayName="中药煎煮方法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of select="TCMCook/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
				<!--中药用药方法-->
				<xsl:comment>中药用药方法</xsl:comment>
				<xsl:if test="TCMUseWay/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN ">
							<code code="DE06.00.136.00" displayName="中药用药方法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of select="TCMUseWay/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
			</section>
		</component>
	</xsl:template>
</xsl:stylesheet>
