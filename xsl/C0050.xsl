<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" indent="yes"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:include href="CDA-Support-Files/Procedures.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
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
					<xsl:apply-templates select="Header/recordTarget/inpatientNum"
						mode="inpatientNum"/>

					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者身份证号码，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientId"
							mode="nationalIdNumber"/>
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName"
							mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates
							select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 年龄..1 -->
						<xsl:apply-templates select="Header/recordTarget/Patient/Age" mode="Age"/>
					</patient>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorNoOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '主任医师' or assignedEntityCode = '主治医师' or assignedEntityCode = '住院医师'">
					<xsl:comment><xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
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
							<!--会诊医师所在医疗机构名称-->
							<representedOrganization>
								<name>会诊医师所在医疗机构名称</name>
							</representedOrganization>
						</assignedEntity>
					</authenticator>
				</xsl:if>
			</xsl:for-each>
			<!--关联活动信息-->
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument"
				mode="relatedDocument"/>
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<componentOf>
				<xsl:apply-templates select="Header/encompassingEncounter/Locations/Location" mode="EncompassingEncounter"/>
			</componentOf>
			<!--****************************文档体Body********************-->
			<component>
				<structuredBody>
					<!--入院诊断章节-->
					<component>
						<section>
							<code code="11535-2" displayName="HOSPITAL DISCHARGE DX"
								codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.092.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="入院日期时间"/>
									<value xsi:type="TS" value="{AdmDiag/admitTime/Value}"></value>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="入院诊断编码"/>
									<value xsi:type="CD"
										code="{AdmDiag/Diagnoses/Diagnosis[diag/code/Value]/diag/code/Value}" displayName="{AdmDiag/Diagnoses/Diagnosis[diag/code/Display]/diag/code/Display}"
										codeSystem="2.16.156.10011.2.3.3.11"
										codeSystemName="ICD-10"/>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE05.10.148.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="入院情况"/>
									<value xsi:type="ST">
										<xsl:value-of select="AdmDiag/admitCondition/Value"/>
									</value>
								</observation>
							</entry>
						</section>
					</component>
					<!--住院过程章节-->
					<component>
						<section>
							<code code="8648-8" displayName="Hospital Course"
								codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.296.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="诊疗过程描述"/>
									<value xsi:type="ST"><xsl:value-of select="HospitalCourse/treatmentCourse/Value"/></value>
								</observation>
							</entry>
						</section>
					</component>
					<!--死亡原因章节-->
					<component>
						<section>
							<code displayName="死亡原因章节"/>
							<text/>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE02.01.036.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="死亡日期时间"/>
									<value xsi:type="TS" value="{DeathReason/deathTime/Value}"/>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="直接死亡原因名称"/>
									<value xsi:type="ST">
										<xsl:value-of select="DeathReason/reasonName/Value"/>
									</value>
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="直接死亡原因编码"/>
											<value xsi:type="CD" code="{DeathReason/reasonCode/Value}"
												codeSystem="2.16.156.10011.2.3.3.11"
												codeSystemName="ICD-10">
												<xsl:if test="DeathReason/reasonCode/Display">
													<xsl:attribute name="displayName"><xsl:value-of select="DeathReason/reasonCode/Display"/></xsl:attribute>
												</xsl:if>
											</value>
										</observation>
									</entryRelationship>
								</observation>
							</entry>
						</section>
					</component>
					<!--诊断章节-->
					<component>
						<section>
							<code code="11535-2" displayName="Diagnosis"
								codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="死亡诊断名称"/>
									<value xsi:type="ST">
										<xsl:value-of select="DeathReason/reasonCode/Display"/>
									</value>
									<entryRelationship typeCode="CAUS">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡诊断编码"/>
											<value xsi:type="CD" code="{DeathReason/reasonCode/Value}"
												codeSystem="2.16.156.10011.2.3.3.11"
												codeSystemName="ICD-10">
												<xsl:if test="DeathReason/reasonCode/Display">
													<xsl:attribute name="displayName"><xsl:value-of select="DeathReason/reasonCode/Display"/></xsl:attribute>
												</xsl:if>
											</value>
										</observation>
									</entryRelationship>
								</observation>
							</entry>
						</section>
					</component>
					<!--尸检意见章节-->
					<component>
						<section>
							<code displayName="尸检意见章节"/>
							<text/>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE09.00.115.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="家属是否同意尸体解剖标志"/>
									<value xsi:type="BL" value="{AutopsyOpinion/agree/Value}"/>
								</observation>
							</entry>
						</section>
					</component>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
