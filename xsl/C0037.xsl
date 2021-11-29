<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.57"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			
			<title>首次病程记录</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 住院号标识-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者身份证号码，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>	
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
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>	
			
			<!-- legalAuthenticator签名 -->
			<xsl:for-each select="Header/LegalAuthenticators/LegalAuthenticator">
				<xsl:if test="assignedEntityCode = '上级医师'">
					<xsl:comment><xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
					<legalAuthenticator>
						<!-- 签名 -->
						<time/>
						<signatureCode/>
						<assignedEntity>
							<id root="2.16.156.10011.1.4" extension="{assignedEntityId}"/>
							<code displayName="{assignedEntityCode}"></code>
							<assignedPerson classCode="PSN" determinerCode="INSTANCE">
								<name>
									<xsl:value-of select="assignedPersonName/Value"/>
								</name>
							</assignedPerson>
						</assignedEntity>
					</legalAuthenticator>
				</xsl:if>
			</xsl:for-each>
		
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '住院医师'">
					<xsl:comment><xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
					<authenticator>
						<time xsi:type="TS" value="{time/Value}"/>
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
			
			
			<!-- 病床号、病房、病区、科室和医院的关联 -->
			<componentOf>
				<encompassingEncounter>
					<effectiveTime/>
					<location>
						<healthCareFacility>
							<serviceProviderOrganization>
								<asOrganizationPartOf classCode="PART">
									<!-- DE01.00.026.00	病床号 -->
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
											<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
										</xsl:if>
										
										<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/bedNum/Value"/></name>
										<!-- DE01.00.019.00	病房号 -->
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/wardNum/Value"/></name>
												<!-- DE08.10.026.00	科室名称 -->
												<asOrganizationPartOf classCode="PART">
													<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
														<xsl:if test="Header/encompassingEncounter/Locations/Location/deptId">
															<id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/deptId}"/>
														</xsl:if>
														
														<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptNum/Value"/></name>
														<!-- DE08.10.054.00	病区名称 -->
														<asOrganizationPartOf classCode="PART">
															<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
																<id root="2.16.156.10011.1.27"/>
																<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaNum/Value"/></name>
																<!--XX医院 -->
																<asOrganizationPartOf classCode="PART">
																	<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
																		<xsl:if test="Header/encompassingEncounter/Locations/Location/hosId">
																			<id root="2.16.156.10011.1.5" extension="{Header/encompassingEncounter/Locations/Location/hosId}"/>
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
			
			<component>
				<!--文档体-->
				<structuredBody>
					
					<!--主诉章节-->
					<xsl:apply-templates select="ChiefComplaint"/>
					
					<!--诊断章节-->
					<xsl:apply-templates select="Diagnosis"/>
					
					<!--治疗计划章节-->
					<xsl:if test="TreatmentPlan">
						<xsl:apply-templates select="TreatmentPlan"/>
					</xsl:if>
					
				</structuredBody>
			</component>

		</ClinicalDocument>
	</xsl:template>

	<!--主诉章节模板-->
	<xsl:template match="ChiefComplaint">
		<component>
			<section>
				<code code="10154-3" displayName="CHIEF COMPLAINT" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--主诉条目-->
				<xsl:comment>主诉条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.01.119.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{chiefComplaint/displayName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="chiefComplaint/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	
	<!--诊断记录章节模板-->
	<xsl:template match="Diagnosis">
		<component>
			<section>
				<code code="29548-5" displayName="Diagnosis"  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--病例特点-->
				<entry>
					<observation classCode="OBS" moodCode="EVN ">
						<code code="DE05.10.133.00" displayName="病例特点" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST"><xsl:value-of select="caseCharacteristics/Value"/></value>
					</observation>
				</entry>
				<!--中医“四诊”观察结果-->
				<xsl:if test="TCMFourDiags/TCMFourDiagnostic/TCMFourDiagnostic/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE02.10.028.00" displayName="中医“四诊”观察结果" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST"><xsl:value-of select="TCMFourDiags/TCMFourDiagnostic/TCMFourDiagnostic/Value"/></value>
						</observation>
					</entry>
				</xsl:if>
				
				<!--诊断依据-->
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.070.00" displayName="诊断依据" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST"><xsl:value-of select="basis/Value"/></value>	
					</observation>
				</entry>	
				<!--初步诊断-西医诊断编码-->
				<xsl:apply-templates select="Westerns/Western[diag/code/Value]"/>
				<!--初步诊断-中医病名代码-->
				<xsl:apply-templates select="TCM/TCM[TCMdiag/code/Value]"></xsl:apply-templates>
				<!--初步诊断-中医症候代码-->
				<xsl:apply-templates select="TCMSyndrome/TCMSyndrome[syndrome/code/Value]"></xsl:apply-templates>
				<!--鉴别诊断-西医诊断名称-->
				<entry>
					<observation classCode="OBS" moodCode="EVN ">
						<code code="DE05.01.025.00" displayName="鉴别诊断-西医诊断名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST"><xsl:value-of select="Westerns/Western[diag/name/Value]/diag/name/Value"/></value>
					</observation>
				</entry>
				<!--鉴别诊断-中医病名名称-->
				<xsl:apply-templates select="TCM/TCM[TCMdiag/name/Value]"></xsl:apply-templates>
			
				<!--鉴别诊断-中医症候名称-->
				<xsl:apply-templates select="TCMSyndrome/TCMSyndrome[syndrome/name/Value]"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	
	<!--主诉章节模板-->
	<xsl:template match="TreatmentPlan">
		<component>
			<section>
				<code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<entry>
					<observation classCode="OBS" moodCode="GOL ">
						<code code="DE05.01.025.00" displayName="诊疗计划" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST"><xsl:value-of select="carePlan/Value"/></value>
					</observation>
				</entry>
				
				<!--治则治法-->
				<xsl:if test="treatmentPrinciple/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.300.00" displayName="治则治法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST"><xsl:value-of select="treatmentPrinciple/Value"/></value>			
						</observation>
					</entry>
				</xsl:if>		
			</section>
		</component>
	</xsl:template>
	
	<!--初步诊断-西医诊断编码-->
	<xsl:template match="Westerns/Western[diag/code/Value]">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.024.00"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初步诊断-西医诊断编码"/>
				<value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10" displayName="{diag/code/Display}" />
			</observation>
		</entry>
	</xsl:template>
	<!--初步诊断-中医病名代码-->
	<xsl:template match="TCM/TCM[TCMdiag/code/Value]">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.130.00"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初步诊断-中医病名代码"><qualifier><name displayName="中医病名代码"></name></qualifier></code>
				<value xsi:type="CD" code="{TCMdiag/code/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)" displayName="{TCMdiag/code/Display}" />
			</observation>
		</entry>
	</xsl:template>
	<!--初步诊断-中医症候代码-->
	<xsl:template match="TCMSyndrome/TCMSyndrome[syndrome/code/Value]">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.130.00"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初步诊断-中医症候代码"><qualifier><name displayName="中医症候代码"></name></qualifier></code>
				<value xsi:type="CD" code="{syndrome/code/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)" displayName="{syndrome/code/Display}" />
			</observation>
		</entry>	
	</xsl:template>
	<!--鉴别诊断-中医病名名称-->
	<xsl:template match="TCM/TCM[TCMdiag/name/Value]">
		<entry>
			<observation classCode="OBS" moodCode="EVN ">
				<code code="DE05.10.172.00" displayName="鉴别诊断-中医病名名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"><qualifier><name displayName="中医病名名称"></name></qualifier></code>
				<value xsi:type="ST"><xsl:value-of select="TCMdiag/name/Value"/></value>
			</observation>
		</entry>
	</xsl:template>
	<!--鉴别诊断-中医症候名称-->
	<xsl:template match="TCMSyndrome/TCMSyndrome[syndrome/name/Value]">
		<entry>
			<observation classCode="OBS" moodCode="EVN ">
				<code code="DE05.10.172.00" displayName="鉴别诊断-中医症候名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"><qualifier><name displayName="中医症候名称"></name></qualifier></code>
				<value xsi:type="ST"><xsl:value-of select="syndrome/name/Value"/></value>
			</observation>
		</entry>
	</xsl:template>
	
</xsl:stylesheet>
