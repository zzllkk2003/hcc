<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.51"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>其他知情同意书</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--患者信息-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole>
					<!--患者身份证号码，必选-->
					<xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>	
					<!-- 门（急）诊号标识 -->
					<xsl:apply-templates select="Header/recordTarget/outpatientNum" mode="outpatientNum"/>
					<!--住院号-->
					<xsl:apply-templates select="Header/recordTarget/patient/inpatientNum" mode="inpatientNum"/>
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
			<xsl:apply-templates select="Header/LegalAuthenticators/LegalAuthenticator[1]" mode="legalAuthenticator"/>
			
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '患者' or assignedEntityCode = '代理人'">
					<xsl:comment><xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
					<authenticator>
						<!-- DE09.00.053.00	患者/法定代理人签名日期时间 -->
						<time value="{time/Value}"/>
						<signatureCode/>
						<assignedEntity>
							<id root="2.16.156.10011.1.3" extension="{assignedEntityId}"/>
							<!--代理人关系-->
							<code code="{assignedEntityCode}" codeSystem="2.16.156.10011.2.3.3.8" codeSystemName="GB/T 4716-2008"/>
							<assignedPerson>
								<name><xsl:value-of select="assignedPersonName/Display"/></name>
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
									<xsl:comment>病床号</xsl:comment>
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
											<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
										</xsl:if>
										
										<!-- DE01.00.019.00	病房号 -->
										<xsl:comment>病房号</xsl:comment>
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												</xsl:if>
												
												<!-- DE08.10.026.00	科室名称 -->
												<xsl:comment>科室名称</xsl:comment>
												<asOrganizationPartOf classCode="PART">
													<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
														<xsl:if test="Header/encompassingEncounter/Locations/Location/deptId">
															<id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/deptId}"/>
														</xsl:if>
														
														<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptName/Value"/></name>
														<!-- DE08.10.054.00	病区名称 -->
														<xsl:comment>病区名称</xsl:comment>
														<asOrganizationPartOf classCode="PART">
															<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
																<xsl:if test="Header/encompassingEncounter/Locations/Location/areaId">
																	<id root="2.16.156.10011.1.27" extension="{Header/encompassingEncounter/Locations/Location/areaId}"/>
																</xsl:if>
																<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
																<!--XXX医院 -->
																<xsl:comment>医院</xsl:comment>
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
			<!--body-->
			<component>
				<structuredBody>
					<!--诊断章节-->
					<xsl:comment>诊断章节</xsl:comment>
					<xsl:apply-templates select="Diagnosis"></xsl:apply-templates>
					<!--知情同意章节-->
					<xsl:comment>知情同意章节</xsl:comment>
					<xsl:apply-templates select="Consent"></xsl:apply-templates>
					<!--意见章节-->
					<xsl:comment>意见章节</xsl:comment>
					<xsl:apply-templates select="Suggestion"></xsl:apply-templates>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
	
	<!--诊断记录章节模板-->
	<xsl:template match="Diagnosis">
		<component>
			<section>
				<code code="29548-5" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Diagnosis"/>
				<title/>
				<text/>
				<!--诊断代码条目-->
				<xsl:comment>诊断代码条目</xsl:comment>
				<xsl:apply-templates select="Westerns/Western"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<!--诊断代码条目-->
	<xsl:template match="Westerns/Western">
		<xsl:if test="diag/code/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="卫生信息数据元目录" displayName="疾病诊断编码"/>
					<value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10" displayName="{diag/code/Display}"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	
	<!--知情同意章节模板-->
	<xsl:template match="Consent">
		<component>
			<section>
				<code code="34895-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="EDUCATION NOTE"/>
				<text/>
				<!-- DE09.00.117.00	知情同意书名称 -->
				<xsl:comment>知情同意书名称</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE09.00.117.00" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="卫生信息数据元目录" displayName="知情同意书名称"/>
						<value xsi:type="ST"><xsl:value-of select="title/Value"/></value>
					</observation>
				</entry>					
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE09.00.116.00" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="卫生信息数据元目录" displayName="知情同意内容"/>
						<value xsi:type="ST"><xsl:value-of select="content/Value"/></value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	
	<!--意见章节模板-->
	<xsl:template match="Suggestion">
		<component>
			<section>
				<code displayName="意见章节"/>
				<text/>
				<!--医疗机构意见-->
				<xsl:comment>医疗机构意见</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="医疗机构的意见"/>
						<value xsi:type="ST"><xsl:value-of select="hospital/Value"/></value>
					</observation>
				</entry>
				<!--患者意见-->
				<xsl:comment>患者意见</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者的意见"/>
						<value xsi:type="ST"><xsl:value-of select="patient/Value"/></value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	
</xsl:stylesheet>
