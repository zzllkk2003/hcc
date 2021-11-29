<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" indent="yes"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.52"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>病危（重）护理记录</title>
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
						<!--患者身份证号码，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>
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
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '护士'">
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
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<componentOf typeCode="COMP">
				<xsl:apply-templates select="Header/encompassingEncounter/Locations/Location"/>
			</componentOf>
			<!--****************************文档体Body********************-->
			<component>
				<structuredBody>
					<!-- 过敏史章节 -->
					<component>
						<section>
							<code code="48765-2" displayName="Allergies, adverse reactions, alerts" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<title>过敏史章节</title>
							<text/>
							<entry typeCode="DRIV">
								<act classCode="ACT" moodCode="EVN">
									<code nullFlavor="NA"/>
									<entryRelationship typeCode="SUBJ">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE02.10.023.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史标志"/>
											<value xsi:type="BL" value="{Allergy/active/Value}"/>
											<participant typeCode="CSM">
												<participantRole classCode="MANU">
													<playingEntity classCode="MMAT">
														<!--过敏史描述-->
														<code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史"/>
														<desc xsi:type="ST">
															<xsl:value-of select="Allergy/Allergies/Item/allergen/Value"/>
														</desc>
													</playingEntity>
												</participantRole>
											</participant>
										</observation>
									</entryRelationship>
								</act>
							</entry>
						</section>
					</component>
					<!--疾病诊断章节-->
					<component>
						<section>
							<code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<title>疾病诊断章节</title>
							<text/>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="疾病诊断编码"/>
									<value xsi:type="CD" code="{Diagnosis/Westerns/Western/diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
										<xsl:if test="Diagnosis/Westerns/Western/diag/code/Display">
											<xsl:attribute name="displayName"><xsl:value-of select="Diagnosis/Westerns/Western/diag/code/Display"/></xsl:attribute>
										</xsl:if>
									</value>
								</observation>
							</entry>
						</section>
					</component>
					<!--生命体征章节-->
					<component>
						<section>
							<code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="VITAL SIGNS"/>
							<title>生命体征章节</title>
							<text/>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体重（kg）"/>
									<value xsi:type="PQ" value="{VitalSigns/VitalSign[type='DE04.10.188.00']/value}" unit="kg"/>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE04.10.186.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体温（℃）"/>
									<value xsi:type="PQ" value="{VitalSigns/VitalSign[type='DE04.10.186.00']/value}" unit="℃"/>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE04.10.206.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="心率（次/min）"/>
									<value xsi:type="PQ" value="{VitalSigns/VitalSign[type='DE04.10.206.00']/value}" unit="次/min"/>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE04.10.081.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="呼吸频率（次/min）"/>
									<value xsi:type="PQ" value="{VitalSigns/VitalSign[type='DE04.10.081.00']/value}" unit="次/min"/>
								</observation>
							</entry>
							<entry>
								<organizer classCode="BATTERY" moodCode="EVN">
									<statusCode/>
									<component>
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE04.10.174.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目
录" displayName="收缩压"/>
											<value xsi:type="PQ" value="{VitalSigns/VitalSign[type='DE04.10.174.00']/value}" unit="mmHg"/>
										</observation>
									</component>
									<component>
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE04.10.176.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目
录" displayName="舒张压"/>
											<value xsi:type="PQ" value="{VitalSigns/VitalSign[type='DE04.10.176.00']/value}" unit="mmHg"/>
										</observation>
									</component>
								</organizer>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE04.50.102.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="血糖检测值（mmol/L）"/>
									<value xsi:type="PQ" value="{VitalSigns/VitalSign[type='DE04.50.102.00']/value}" unit="mmol/L"/>
								</observation>
							</entry>
						</section>
					</component>
					<!--健康评估章节-->
					<component>
						<section>
							<code code="51848-0" displayName="Assessment note" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<title>健康评估章节</title>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE03.00.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="饮食情况代码"/>
									<value xsi:type="CD" code="1" displayName="良好" codeSystem="2.16.156.10011.2.3.2.34" codeSystemName="饮食情况代码"/>
								</observation>
							</entry>
						</section>
					</component>
					<!--护理记录章节-->
					<component>
						<section>
							<code displayName="护理记录"/>
							<title>护理记录章节</title>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.211.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理等级代码"/>
									<value xsi:type="CD" code="1" displayName="特级护理" codeSystem="2.16.156.10011.2.3.1.259" codeSystemName="护理等级代码表"/>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.212.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理类型代码"/>
									<value xsi:type="CD" code="1" displayName="基础护理" codeSystem="2.16.156.10011.2.3.1.260" codeSystemName="护理类型代码表"/>
								</observation>
							</entry>
						</section>
					</component>
					<!--护理观察章节-->
					<component>
						<section>
							<code nullFlavor="UNK" displayName="护理观察章节"/>
							<title>护理观察章节</title>
							<!--多个观察写多个entry即可，每个观察对应着观察结果描述-->
							<xsl:for-each select="NursingOperations">
								<entry>
									<observation classCode="OBS" moodCode="EVN">
										<code code="DE02.10.031.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理观察项目名称"/>
										<value xsi:type="ST">
											<xsl:value-of select="NursingObservation/item/Value"/>
										</value>
										<entryRelationship typeCode="COMP">
											<observation classCode="OBS" moodCode="EVN">
												<code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理观察结果"/>
												<value xsi:type="ST">
													<xsl:value-of select="NNursingObservation/result/Value"/>
												</value>
											</observation>
										</entryRelationship>
									</observation>
								</entry>
							</xsl:for-each>
						</section>
					</component>
					<!--护理操作章节：一个护理操作对应多个操作项目类目，一个操作项目类目又对应多个操作结果-->
					<component>
						<section>
							<code nullFlavor="UNK" displayName="护理操作"/>
							<title>护理操作章节</title>
							<xsl:for-each select="NursingOperations">
								<entry>
									<observation classCode="OBS" moodCode="EVN">
										<code code="DE06.00.342.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作名称"/>
										<value xsi:type="ST">
											<xsl:value-of select="NursingOperation/category/Value"/>
										</value>
										<entryRelationship typeCode="COMP">
											<observation classCode="OBS" moodCode="EVN">
												<code code="DE06.00.210.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作项目类目名称"/>
												<value xsi:type="ST">
													<xsl:value-of select="NursingOperation/operation/Value"/>
												</value>
												<entryRelationship typeCode="COMP">
													<observation classCode="OBS" moodCode="EVN">
														<code code="DE06.00.209.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作结果"/>
														<value xsi:type="ST">
															<xsl:value-of select="NursingOperation/result/Value"/>
														</value>
													</observation>
												</entryRelationship>
											</observation>
										</entryRelationship>
									</observation>
								</entry>
								<entry>
									<observation classCode="OBS" moodCode="EVN">
										<code code="DE06.00.207.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="呼吸机监护项目"/>
										<value xsi:type="ST">
											<xsl:value-of select="NursingOperation/Ventilator/Value"/>
										</value>
									</observation>
								</entry>
							</xsl:for-each>
						</section>
					</component>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
	<xsl:template match="Header/encompassingEncounter/Locations/Location">
		<xsl:comment>住院信息</xsl:comment>
		<encompassingEncounter>
			<code/>
			<!-- 入院日期时间 -->
			<effectiveTime/>
			<location>
				<healthCareFacility>
					<serviceProviderOrganization>
						<asOrganizationPartOf classCode="PART">
							<!-- DE01.00.026.00	病床号 -->
							<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
								<xsl:if test="bedId">
									<id root="2.16.156.10011.1.22" extension="{bedId}"/>
								</xsl:if>
								<name><xsl:value-of select="bedNum/Value"/></name>
								<!-- DE01.00.019.00	病房号 -->
								<asOrganizationPartOf classCode="PART">
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<xsl:if test="wardId">
											<id root="2.16.156.10011.1.21" extension="{wardId}"/>
										</xsl:if>
										
										<name><xsl:value-of select="wardName/Value"/></name>
										<!-- DE08.10.026.00	科室名称 -->
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
												<xsl:if test="deptId">
													<id root="2.16.156.10011.1.26" extension="{deptId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="deptName/Value"/></name>
												<!-- DE08.10.054.00	病区名称 -->
												<asOrganizationPartOf classCode="PART">
													<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
														<xsl:if test="areaId">
															<id root="2.16.156.10011.1.27" extension="{areaId}"/>
														</xsl:if>
														
														<name><xsl:value-of select="areaName/Value"/></name>
														<!--XXX医院 -->
														<asOrganizationPartOf classCode="PART">
															<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
																<xsl:if test="hosId">
																	<id root="2.16.156.10011.1.5" extension="{hosId}"/>
																</xsl:if>
																
																<name><xsl:value-of select="hosName"/></name>
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
	</xsl:template>
</xsl:stylesheet>
