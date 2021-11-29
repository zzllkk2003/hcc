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
			<!--注意事项章节-->
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.71"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>死亡病例讨论记录</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					
					<!--住院号-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"/>
						
					</patient>
					<!--提供患者服务机构-->
					<xsl:apply-templates select="Header/recordTarget/providerOrganization" mode="providerOrganization"/>			
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:if test="Header/custodian">
				<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			</xsl:if>
				
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '住院医师' or assignedEntityCode = '主治医师' or assignedEntityCode = '主任医师'">
					<xsl:comment><xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
					<authenticator>
						<time xsi:type="TS" value="{time/Value}"/>
						<signatureCode/>
						<assignedEntity>
							<id/>
							<code displayName="{assignedEntityCode}"/>
							<assignedPerson classCode="PSN" determinerCode="INSTANCE">
								<name>
									<xsl:value-of select="assignedPersonName/Display"/>
								</name>
								<!-- 专业技术职务-->
								<professionalTechnicalPosition>
									<xsl:choose>
										<xsl:when test="profTechPosCode/Value and profTechPosCode/Display" >
											<professionaltechnicalpositionCode code="{profTechPosCode/Value}" codeSystem="2.16.156.10011.2.3.1.209" codeSystemName="专业技术职务类别代码表" displayName="{profTechPosCode/Display}"></professionaltechnicalpositionCode>
										</xsl:when>
										<xsl:when test="profTechPosCode/Value and not(profTechPosCode/Display)" >
											<professionaltechnicalpositionCode code="{profTechPosCode/Value}" codeSystem="2.16.156.10011.2.3.1.209" codeSystemName="专业技术职务类别代码表"></professionaltechnicalpositionCode>
										</xsl:when>
									</xsl:choose>
									
								</professionalTechnicalPosition>	
							</assignedPerson>
						</assignedEntity>
					</authenticator>
				</xsl:if>
			</xsl:for-each>
		
			<!--讨论成员信息-->
			<xsl:for-each select="Header/Participants/Participant[typeCode = 'CON'][1]">
				<xsl:comment>讨论成员信息</xsl:comment>
				<participant typeCode="CON">
					<!--联系人@classCode：CON，固定值，表示角色是联系人 -->
					<associatedEntity classCode="ECON">
						<!--联系人-->
						<associatedPerson>
							<!--讨论人-->
							<xsl:apply-templates select="/Document/Header/Participants/Participant[typeCode='CON']/associatedPersonName"></xsl:apply-templates>
						</associatedPerson>
					</associatedEntity>
				</participant>
			</xsl:for-each>
			
			<!--主持人..*-->
			<xsl:for-each select="Header/Participants/Participant[typeCode = 'ORG'][1]">
				<xsl:comment>主持人信息</xsl:comment>
				<participant typeCode="ORG">
					<!--联系人@classCode：CON，固定值，表示角色是联系人 -->
					<associatedEntity classCode="ECON">
						<!--联系人-->
						<code displayName="主持人"/>
						<associatedPerson>
							<!--主持人-->
							<xsl:apply-templates select="/Document/Header/Participants/Participant[typeCode='ORG']/associatedPersonName"></xsl:apply-templates>
						</associatedPerson>
					</associatedEntity>
				</participant>
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
									<!--HDSD00.09.003	DE01.00.026.00	病床号 -->
									<xsl:comment>病床号</xsl:comment>
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
											<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
										</xsl:if>
									
										<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/bedName/Value"/></name>
										<!--HDSD00.09.004	DE01.00.019.00	病房号 -->
										<xsl:comment>病房号</xsl:comment>
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/wardName/Value"/></name>
												<!--HDSD00.09.036	DE08.10.026.00	科室名称 -->
												<xsl:comment>科室名称</xsl:comment>
												<asOrganizationPartOf classCode="PART">
													<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
														<xsl:if test="Header/encompassingEncounter/Locations/Location/deptId">
															<id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/deptId}"/>
														</xsl:if>
														
														<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptName/Value"/></name>
														<!--HDSD00.09.005	DE08.10.054.00	病区名称 -->
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
			<component>
				<structuredBody>
					<!--死亡原因章节 -->
					<xsl:comment>死亡原因章节</xsl:comment>
					<xsl:apply-templates select="DeathReason"/>		
					<!--诊断章节-->
					<xsl:comment>诊断章节</xsl:comment>
					<xsl:apply-templates select="Diagnosis"/>
					<!--讨论内容章节-->
					<xsl:comment>讨论内容章节</xsl:comment>
					<xsl:if test="Discussion">
						<xsl:apply-templates select="Discussion"/>
					</xsl:if>
					
					<!--讨论总结章节 -->
					<xsl:comment>讨论总结章节</xsl:comment>
					<xsl:apply-templates select="DiscussionSummary"/>
				</structuredBody>
			</component>			
		</ClinicalDocument>
	</xsl:template>

	<!--死亡原因章节模板-->
	<xsl:template match="DeathReason">
		<component>
			<section>
				<code displayName="死亡原因"/>
				<text/>
				<xsl:comment>直接死亡原因</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="直接死亡原因名称"/>
						<value xsi:type="ST"><xsl:value-of select="reasonName/Value"/></value>
						<!--直接死亡原因编码-->
						<xsl:call-template name="DeathReasonCode"></xsl:call-template>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--直接死亡原因编码-->
	<xsl:template name="DeathReasonCode">
		<entryRelationship typeCode="CAUS">
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.021.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="直接死亡原因编码"/>
				<value xsi:type="CD" code="{reasonCode/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10" displayName="{reasonCode/Display}"/>
			</observation>
		</entryRelationship>
	</xsl:template>
	<!--诊断章节模板-->
	<xsl:template match="Diagnosis">
		<component>
			<section>
				<code code="11535-2" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--死亡诊断条目-->
				<xsl:comment>死亡诊断条目</xsl:comment>
				<xsl:apply-templates select="Deaths/Death[code/Display]"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	
	<!--死亡诊断条目-->
	<xsl:template match="Deaths/Death[code/Value]">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡诊断名称"/>
				<value xsi:type="ST"><xsl:value-of select="code/Display"/></value>
				<entryRelationship typeCode="CAUS">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.021.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡诊断编码"/>
						<value xsi:type="CD" code="{code/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10" displayName="{code/Display}" />
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>
	
	<!--内容讨论章节模板-->
	<xsl:template match="Discussion">
		<xsl:if test="content/Value">
			<component>
				<section>
					<code code="DE06.00.181.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡讨论记录"/>
					<text><xsl:value-of select="content/Value"/></text>
				</section>
			</component>
		</xsl:if>
		
	</xsl:template>
	
	<!--讨论总结章节模板-->
	<xsl:template match="DiscussionSummary">
		<component>
			<section>
				<code code="DE06.00.181.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="主持人总结意见"/>
				<text><xsl:value-of select="content/Value"/></text>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="/Document/Header/Participants/Participant[typeCode='ORG']/associatedPersonName">
		<name>
			<xsl:value-of select="Value"/>
		</name>
	</xsl:template>
	<xsl:template match="/Document/Header/Participants/Participant[typeCode='CON']/associatedPersonName">
		<name>
			<xsl:value-of select="Value"/>
		</name>
	</xsl:template>
</xsl:stylesheet>
