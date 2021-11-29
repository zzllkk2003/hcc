<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" indent="yes"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:include href="CDA-Support-Files/Diagnosis.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.52"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>病危（重）同意书</title>
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
					<xsl:apply-templates select="Header/recordTarget/outpatientNum"
						mode="outpatientNum"/>
					<!--住院号-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum"
						mode="inpatientNum"/>
					<!-- 知情同意书编号 -->
					<id root="2.16.156.10011.1.34" extension="001"/>
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者身份证号码，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName"
							mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates
							select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 出生时间1..1 -->
						<xsl:apply-templates select="Header/recordTarget/Patient/birthTime"
							mode="BirthTime"/>

						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear"
							mode="Age"/>

					</patient>
					<!--提供患者服务机构-->
					<xsl:apply-templates select="Header/recordTarget/providerOrganization"
						mode="providerOrganization"/>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorNoOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			<!-- LegalAuthenticator签名 -->
			<xsl:for-each select="Header/LegalAuthenticators/LegalAuthenticator">
				<xsl:if test="assignedEntityCode = '经治医师'">
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

			<!--关联活动信息-->
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument"
				mode="relatedDocument"/>
			<!-- 病床号、病房、病区、科室和医院的关联 -->  
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
																<!--XXX医院 -->  
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
					<!--诊断章节-->
					<xsl:comment>诊断章节</xsl:comment>
					<component>
						<section>
							<code code="29548-5" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
								displayName="Diagnosis"/>
							<text/>
							<!--疾病诊断编码-->
							<xsl:comment>疾病诊断编码</xsl:comment>
							<xsl:apply-templates select="Diagnosis/Westerns/Western" mode="Diag024"/>
							
						</section>
					</component>
					<!--知情同意章节-->
					<xsl:comment>知情同意章节</xsl:comment>
					<component>
						<section>
							<code code="34895-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
								displayName="EDUCATION NOTE"/>
							<text/>
							<entry>
								<!--病情概况以及主要抢救措施-->
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.183.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="病情概况以及主要抢救措施"/>
									<value xsi:type="ST">
										<xsl:value-of select="Consent/notes/Value"/>
									</value>
									<!--病危（重）通知内容-->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.278.00" codeSystem="2.16.156.10011.2.2.1"
												codeSystemName="卫生信息数据元目录" displayName="病危（重）通知内容"/>
											<!--通知时间-->
											<effectiveTime value="{Consent/time/Value}"/>
											<value xsi:type="ST">
												<xsl:value-of select="Consent/crisisContent/Value"/>
											</value>
										</observation>
									</entryRelationship>
								</observation>
							</entry>
						</section>
					</component>	
				</structuredBody>
			</component>	
		</ClinicalDocument>
	</xsl:template>


</xsl:stylesheet>
