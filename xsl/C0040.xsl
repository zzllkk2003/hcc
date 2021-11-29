<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" indent="yes"/>
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
			<!-- LegalAuthenticator签名 -->
			<xsl:for-each select="Header/LegalAuthenticators/LegalAuthenticator">
				<xsl:if test="assignedEntityCode = '主任医师'">
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
				<xsl:if test="assignedEntityCode = '医师' or assignedEntityCode = '主治医师' or assignedEntityCode = '主持人'">
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
						</assignedEntity>
					</authenticator>
				</xsl:if>
			</xsl:for-each>
			<!--联系人1..*-->
			<xsl:for-each select="Header/Participants/Participant[typeCode = 'PRCP'][1]">
				<xsl:comment>其他参与者（联系人）</xsl:comment>
				<participant typeCode="PRCP">
					<!--联系人@classCode：CON，固定值，表示角色是联系人 -->
					<associatedEntity classCode="ASSIGNED">
						<!--联系人-->
						<associatedPerson>
							<!--姓名-->
							<xsl:apply-templates select="/Document/Header/Participants/Participant[typeCode='PRCP']/associatedPersonName"></xsl:apply-templates>
						</associatedPerson>
					</associatedEntity>
				</participant>
			</xsl:for-each>
			<!--关联活动信息-->
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<componentOf>
				<encompassingEncounter>
					<effectiveTime/>
					<location>
						<healthCareFacility>
							<serviceProviderOrganization>
								<asOrganizationPartOf classCode="PART">
									<!-- DE01.00.026.00病床号 -->
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<xsl:comment>病床号</xsl:comment>
										<xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
											<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
										</xsl:if>
										<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/bedName/Value"/></name>	
										<!-- DE01.00.019.00病房号 -->
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
												<xsl:comment>病房号</xsl:comment>
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												</xsl:if>
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/wardName/Value"/></name>
												<!-- DE08.10.026.00科室名称 -->
												<asOrganizationPartOf classCode="PART">
													<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
														<xsl:comment>科室名称</xsl:comment>
														<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
															<id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/deptId}"/>
														</xsl:if>
														<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptName/Value"/></name>
														<!-- DE08.10.054.00病区名称 -->
														<asOrganizationPartOf classCode="PART">
															<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
																<xsl:comment>病区名称</xsl:comment>
																<xsl:if test="Header/encompassingEncounter/Locations/Location/areaId">
																	<id root="2.16.156.10011.1.27" extension="{Header/encompassingEncounter/Locations/Location/areaId}"/>
																</xsl:if>
																<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
																<!--医疗机构名称 -->
																<asOrganizationPartOf classCode="PART">
																	<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
																		<xsl:comment>医院名称</xsl:comment>
																		<xsl:if test="Header/encompassingEncounter/Locations/Location/hosId">
																			<id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/hosId}"/>
																		</xsl:if>	
																		<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/hosName"/></name>
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
			</componentOf>
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
	<xsl:template match="/Document/Header/Participants/Participant[typeCode='PRCP']/associatedPersonName">
		<name>
			<xsl:value-of select="Value"/>
		</name>
	</xsl:template>
</xsl:stylesheet>
