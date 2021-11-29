<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" indent="yes"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:include href="CDA-Support-Files/Diagnosis.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.46"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>输血治疗同意书</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--患者信息-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole>
					<!--门诊号-->
					<xsl:apply-templates select="Header/recordTarget/outpatientNum" mode="outpatientNum"/>
					<!--住院号-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					<patient>
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 出生时间1..1 -->
						<xsl:apply-templates select="Header/recordTarget/patient/birthTime" mode="BirthTime"/>
						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"/>
					</patient>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:if test="Header/custodian">
				<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			</xsl:if>
			<!-- LegalAuthenticator签名 -->
			<xsl:for-each select="Header/LegalAuthenticators/LegalAuthenticator">
				<xsl:if test="assignedEntityCode = '医师'">
					<xsl:comment><xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
					<legalAuthenticator>
						<time/>
						<signatureCode/>
						<assignedEntity>
							<id root="2.16.156.10011.1.4" extension="{assignedEntityId}"/>
							<code displayName="{assignedEntityCode}"/>
							<assignedPerson classCode="PSN" determinerCode="INSTANCE">
								<name>
									<xsl:value-of select="assignedPersonName/Display"/>
								</name>
							</assignedPerson>
						</assignedEntity>
					</legalAuthenticator>
				</xsl:if>
			</xsl:for-each>
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '患者' or assignedEntityCode = '代理人'">
					<xsl:comment>
						<xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
					<authenticator>
						<time/>
						<signatureCode/>
						<assignedEntity>
							<id root="2.16.156.10011.1.4" extension="{assignedEntityId}"/>
							<code displayName="{assignedEntityCode}"/>
							<assignedPerson classCode="PSN" determinerCode="INSTANCE">
								<name>
									<xsl:value-of select="assignedPersonName/Display"/>
								</name>
							</assignedPerson>
						</assignedEntity>
					</authenticator>
				</xsl:if>
			</xsl:for-each>
			<!--关联活动信息-->
			<xsl:if test="Header/RelatedDocuments/RelatedDocument">
				<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			</xsl:if>
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<componentOf>
				<xsl:apply-templates select="Header/encompassingEncounter/Locations/Location" mode="EncompassingEncounter"/>
			</componentOf>
			<!--CDA body-->
			<component>
				<structuredBody>
					<!--诊断章节-->
					<component>
						<section>
							<code code="29548-5" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Diagnosis"/>
							<text/>
							<!--疾病诊断编码-->
							<xsl:apply-templates select="Diagnosis/Westerns/Western" mode="Diag024"/>
						</section>
					</component>
					<!--输血章节-->
					<component>
						<section>
							<code code="56836-0" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="History of blood transfusion"/>
							<text/>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.106.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<!--1无，2有，9未说明-->
									<value xsi:type="CD" code="{BloodTransfusion/historyMark/Value}" codeSystem="2.16.156.10011.2.3.2.42" codeSystemName="输血史标识代码表" displayName="{BloodTransfusion/historyMark/Display}"/>
								</observation>
							</entry>
						</section>
					</component>
					<!--治疗计划章节-->
					<component>
						<section>
							<code code="18776-5" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="TREATMENT PLAN"/>
							<text/>
							<entry>
								<!--输血过程-->
								<procedure classCode="PROC" moodCode="EVN">
									<code/>
									<!--输血时间-->
									<effectiveTime/>
									<!--输血方式-->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.266.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血方式"/>
											<value xsi:type="ST">
												<xsl:value-of select="BloodTransfusion/type/Value"/>
											</value>
										</observation>
									</entryRelationship>
									<!--输血指征-->
									<entryRelationship typeCode="CAUS">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.340.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血指征"/>
											<value xsi:type="ST">
												<xsl:value-of select="BloodTransfusion/trigger/Value"/>
											</value>
										</observation>
									</entryRelationship>
									<!--输血品种代码-->
									<entryRelationship typeCode="COMP">
										<substanceAdministration classCode="SBADM" moodCode="RQO">
											<consumable>
												<manufacturedProduct>
													<manufacturedMaterial>
														<code code="{BloodTransfusion/type/Value}" codeSystem="2.16.156.10011.2.3.1.251" codeSystemName="输血品种代码表" displayName="{BloodTransfusion/type/Display}"/>
													</manufacturedMaterial>
												</manufacturedProduct>
											</consumable>
										</substanceAdministration>
									</entryRelationship>
									<!--输血前有关检查项目以及结果-->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE05.10.109.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血前有关检查项目以及结果"/>
											<value xsi:type="ED">
												<xsl:value-of select="BloodTransfusion/testResult/Value"/>
											</value>
										</observation>
									</entryRelationship>
								</procedure>
							</entry>
						</section>
					</component>
					<!--意见章节-->
					<component>
						<section>
							<code displayName="意见章节"/>
							<text/>
							<!--医疗机构意见-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="医疗机构的意见"/>
									<value xsi:type="ST">
										<xsl:value-of select="Suggestion/hospital/Value"/>
									</value>
								</observation>
							</entry>
							<!--患者意见-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者的意见"/>
									<value xsi:type="ST">
										<xsl:value-of select="Suggestion/patient/Value"/>
									</value>
								</observation>
							</entry>
						</section>
					</component>
					<!--风险章节-->
					<component>
						<section>
							<code displayName="操作风险"/>
							<text/>
							<!--输血风险及可能发生的不良后果-->
							<entry>
								<observation classCode="OBS" moodCode="DEF">
									<code code="DE06.00.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血风险及可能发生的不良后果"/>
									<value xsi:type="ST">
										<xsl:value-of select="Risk/operationRisk/Value"/>
									</value>
								</observation>
							</entry>
						</section>
					</component>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
