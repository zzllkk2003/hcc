<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.46"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>手术知情告知书</title>
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
			<xsl:apply-templates select="Header/LegalAuthenticators/LegalAuthenticator[1]" mode="legalAuthenticator"/>
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '手术者' or assignedEntityCode = '患者' or assignedEntityCode = '代理人'">
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
										
										<!-- DE01.00.019.00	病房号 -->
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												</xsl:if>
												
												<!-- DE08.10.026.00	科室名称 -->
												<asOrganizationPartOf classCode="PART">
													<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
														<!-- DE08.10.054.00	病区名称 -->
														<asOrganizationPartOf classCode="PART">
															<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
																<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
																<!--XXX医院 -->
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
			<!--CDA body-->
			<component>
				<structuredBody>
					<!--术前诊断章节-->
					<xsl:comment>术前诊断章节</xsl:comment>
					<xsl:apply-templates select="PreOpDiag"></xsl:apply-templates>
					<!--治疗计划章节-->
					<xsl:comment>治疗计划章节</xsl:comment>
					<xsl:apply-templates select="TreatmentPlan"></xsl:apply-templates>
					<!--意见章节-->
					<xsl:comment>意见章节</xsl:comment>
					<xsl:apply-templates select="Suggestion"></xsl:apply-templates>
					<!--风险章节-->
					<xsl:comment>风险章节</xsl:comment>
					<xsl:apply-templates select="Risk"></xsl:apply-templates>
				</structuredBody>
			</component>
			
		</ClinicalDocument>
	</xsl:template>
	
	<!--术前诊断章节模板-->
	<xsl:template match="PreOpDiag">
		<component>
			<section>
				<code code="10219-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Surgical operation note preoperative Dx"/>
				<text/>
				<!--术前诊断代码条目-->
				<xsl:comment>术前诊断代码条目</xsl:comment>
				<xsl:apply-templates select="diagnosisCode"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<!--术前诊断代码条目-->
	<xsl:template match="diagnosisCode">
		<entry typeCode="COMP">
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="CD" code="{Value}" codeSystem="2.16.156.10011.2.3.1.100" codeSystemName="ICD-10"/>
			</observation>
		</entry>
	</xsl:template>
	
	<!--治疗计划章节模板-->
	<xsl:template match="TreatmentPlan">
		<component>
			<section>
				<code code="18776-5" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="TREATMENT PLAN"/>
				<text/>
				<!--拟实施手术-->
				<xsl:comment>拟实施手术</xsl:comment>
				<xsl:apply-templates select="procedures/Procedure"></xsl:apply-templates>
				<!--替代方案-->
				<xsl:comment>替代方案</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="DEF">
						<code code="DE06.00.301.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{procedureSubtitude/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="procedureSubtitude/Value"/></value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--拟实施手术条目-->
	<xsl:template match="procedures/Procedure">
		<entry>
			<!--拟实施手术-->
			<xsl:comment>拟实施手术</xsl:comment>
			<procedure classCode="PROC" moodCode="RQO">
				<xsl:if test="code/Value">
					<code code="{code/Value}" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表（ICD-9-CM)" displayName="{code/displayName}"/>
					<statusCode code="new"/>
				</xsl:if>
				
				<!--手术时间-->
				<xsl:comment>手术时间</xsl:comment>
				<xsl:if test="time/Value">
					<effectiveTime value="{time/Value}"/>
				</xsl:if>
				
				<!--手术方式描述-->
				<xsl:comment>手术方式描述</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.302.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{method/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="method/Value"/></value>
					</observation>
				</entryRelationship>
				
				<!--手术前的准备-->
				<xsl:comment>手术前的准备</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.271.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{prepare/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="prepare/Value"/></value>
					</observation>
				</entryRelationship>
				<!--手术禁忌症-->
				<xsl:comment>手术禁忌症</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="DEF">
						<code code="DE05.10.141.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{contraindication/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="contraindication/Value"/></value>
					</observation>
				</entryRelationship>
				<!--手术指征-->
				<xsl:comment>手术指征</xsl:comment>
				<entryRelationship typeCode="RSON">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.340.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{indication/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="indication/Value"/></value>
					</observation>
				</entryRelationship>
				<!--拟麻醉信息-->
				<xsl:comment>拟麻醉信息</xsl:comment>
				<xsl:if test="anesthesiaCode/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="拟实施麻醉方法代码"/>
							<value code="{anesthesiaCode/Value}" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方式代码表" xsi:type="CD"/>
						</observation>
					</entryRelationship>
				</xsl:if>
			</procedure>
		</entry>
	</xsl:template>
	
	<!--术前诊断章节模板-->
	<xsl:template match="Suggestion">
		<component>
			<section>
				<code displayName="意见章节"/>
				<text/>
				<!--医疗机构意见-->
				<xsl:comment>医疗机构意见</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{hospital/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="hospital/Value"/></value>
					</observation>
				</entry>
				<!--患者意见-->
				<xsl:comment>患者意见</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{patient/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="patient/Value"/></value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	
	<!--风险章节模板-->
	<xsl:template match="Risk">
		<component>
			<section>
				<code displayName="操作风险"/>
				<text/>
				<!--手术中可能出现的意外-->
				<xsl:comment>手术中可能出现的意外</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="DEF">
						<code code="DE05.10.162.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{operationRisk/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="operationRisk/Value"/></value>
						
					</observation>
				</entry>						
				<!--手术后可能出现的意外-->
				<xsl:comment>手术后可能出现的意外</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="DEF">
						<code code="DE05.01.075.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{postOperationRisk/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="postOperationRisk/Value"/></value>
						
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
</xsl:stylesheet>
