<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" indent="yes"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.52"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>住院病案首页</title>
			<!-- 文档机器生成时间 -->
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--文档记录对象（患者）-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 健康卡号 -->
					<xsl:apply-templates select="Header/recordTarget/healthCardId"
						mode="HealthCardNumber"/>
					<!-- 住院号标识 todo-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum"
						mode="HealthCardNumber"/>
					<!-- 病案号标识 todo-->
					<xsl:apply-templates select="Header/recordTarget/MRN" mode="MRN"/>
					<!-- 现住址 -->
					<xsl:apply-templates select="Header/recordTarget/addr" mode="Address"/>
					<xsl:apply-templates select="Header/recordTarget/telcom" mode="PhoneNumber"/>
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者身份证号码，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientId"
							mode="nationalIdNumber"/>
						<!--门诊号-->
						<xsl:apply-templates select="Header/recordTarget/patient/outpatientNum"
							mode="outpatientNum"/>
						<!--住院号-->
						<xsl:apply-templates select="Header/recordTarget/patient/inpatientNum"
							mode="inpatientNum"/>
						<!--电子申请单号-->
						<xsl:apply-templates select="Header/recordTarget/patient/MRN" mode="MRN"/>
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName"
							mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates
							select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 出生时间1..1 -->
						<xsl:apply-templates select="Header/recordTarget/Patient/birthTime"
							mode="BirthTime"/>
						<!-- 婚姻状况1..1 -->
						<xsl:apply-templates select="Header/recordTarget/patient/maritalStatusCode"
							mode="MaritalStatus"/>
						<!-- 民族1..1 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ethnicGroupCode"
							mode="EthnicGroup"/>
						<!-- 出生地 -->
						<xsl:apply-templates select="Header/recordTarget/patient/birthplace"
							mode="BirthPlace"/>
						<!-- 国籍 -->
						<xsl:apply-templates select="Header/recordTarget/patient/nationality"
							mode="nationality"/>
						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear"
							mode="Age"/>
						<!-- 工作单位 -->
						<xsl:apply-templates select="Header/recordTarget/patient" mode="Employer"/>
						<!-- 户口信息 -->
						<xsl:apply-templates select="Header/recordTarget/patient/household"
							mode="household"/>
						<!-- 籍贯信息 -->
						<xsl:apply-templates select="Header/recordTarget/patient/nativePlace"
							mode="nativePlace"/>
						<!--职业状况-->
						<xsl:apply-templates select="Header/recordTarget/patient/occupationCode"
							mode="Occupation"/>
					</patient>
					<!--提供患者服务机构-->
					<xsl:apply-templates select="Header/recordTarget/providerOrganization"
						mode="providerOrganization"/>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			<!-- LegalAuthenticator签名 -->
			<xsl:for-each select="Header/LegalAuthenticators/LegalAuthenticator">
				<xsl:if test="assignedEntityCode = '科主任'">
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
				<xsl:if test="assignedEntityCode = '主任(副主任)医师' or assignedEntityCode = '主治医师' or assignedEntityCode = '住院医师' or assignedEntityCode = '责任护士' or assignedEntityCode = '进修医师'
					or assignedEntityCode = '实习医师' or assignedEntityCode = '编码员'">
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
			<!-- 检验申请机构及科室 -->
			<xsl:for-each select="Header/Participants/Participant">
				<xsl:if test="typeCode = 'NOT'">
					<xsl:comment>检验申请机构及科室</xsl:comment>
					<participant typeCode="NOT"> 
						<!--联系人@classCode：CON，固定值，表示角色是联系人 -->  
						<associatedEntity classCode="ECON"> 
							<!--联系人类别，表示与患者之间的关系-->  
							<code code="{associatedEntityCode/Value}" codeSystem="2.16.156.10011.2.3.3.8" codeSystemName="家庭关系代码表(GB/T 4761)" displayName="{associatedEntityCode/Display}"/>  
							<!--联系人地址-->  
							<xsl:apply-templates select="addr" mode="Address"/> 
							<!--电话号码-->  
							<telecom use="H" value="{telcom/Value}"/>  
							<!--联系人-->  
							<associatedPerson classCode="PSN" determinerCode="INSTANCE"> 
								<!--姓名-->  
								<name><xsl:value-of select="wholeOrganization/Display"/></name> 
							</associatedPerson> 
						</associatedEntity> 
					</participant>  
				</xsl:if>
				
			</xsl:for-each>
			<!--关联活动信息-->
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument"
				mode="relatedDocument"/>
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<componentOf typeCode="COMP">
				<xsl:apply-templates select="Header/encompassingEncounter"
					mode="EncompassingEncounter0032"/>
			</componentOf>

			<!--****************************文档体Body********************-->



			<!--****************************文档体Body********************-->
			<component>
				<structuredBody>
					<!--
********************************************************
生命体征章节
********************************************************
-->
					<component>
						<section>
							<code code="8716-3" displayName="VITAL SIGNS"
								codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<xsl:apply-templates select="VitalSigns"/>
						</section>
					</component>
					<!--
********************************************************
诊断章节
********************************************************
-->
					<component>
						<section>
							<code code="29548-5" displayName="Diagnosis"
								codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--门（急）诊诊断-->
							<xsl:apply-templates select="Diagnosis/Westerns/Western"/>
							<xsl:apply-templates select="Diagnosis/Pathologys/Pathology"/>
						</section>
					</component>
					<!--
********************************************************
主要健康问题章节
********************************************************
-->
					<component>
						<section>
							<code code="11450-4" displayName="PROBLEM LIST"
								codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<xsl:apply-templates select="Problem"/>
						</section>
					</component>
					<!--
********************************************************
转科记录章节
********************************************************
-->
					<component>
						<section>
							<code code="42349-1" displayName="REASON FOR REFERRAL"
								codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--转科条目-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code/>
									<!--转科原因（数据元）-->
									<author>
										<time/>
										<assignedAuthor>
											<id/>
											<representedOrganization>
												<!--住院患者转科科室名称-->
												<name>
												<xsl:value-of
												select="Referral/referralTarget/Display"/>
												</name>
											</representedOrganization>
										</assignedAuthor>
									</author>
								</observation>
							</entry>
						</section>
					</component>
					<!--
********************************************************
出院诊断章节
********************************************************
-->
					<component>
						<section>
							<code code="11535-2" displayName="HOSPITAL DISCHARGE DX"
								codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--出院诊断-主要诊断条目-->
							<xsl:apply-templates select="DisDiag/Primarys/Primary"/>
							<!--出院诊断-其他诊断-->
							<xsl:apply-templates select="DisDiag/Others/Other"/>
							<!--离院方式-->
							<entry typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.223.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="离院方式"/>
									<value xsi:type="CD" code="{DisDiag/dischargeDisposition/Value}"
										displayName="{DisDiag/dischargeDisposition/Display}"
										codeSystem="2.16.156.10011.2.3.1.265"
										codeSystemName="离院方式代码表"/>
									<entryRelationship typeCode="COMP" negationInd="false">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE08.10.013.00"
												codeSystem="2.16.156.10011.2.2.1"
												codeSystemName="卫生信息数据元目录" displayName="拟接受医疗机构名称"/>
											<value xsi:type="ST">
												<xsl:value-of
													select="DisDiag/receivingOrganization/Value"/>
											</value>
										</observation>
									</entryRelationship>
								</observation>
							</entry>
						</section>
					</component>
					<!--
********************************************************
过敏史章节
********************************************************
-->
					<component>
						<section>
							<code code="48765-2" displayName="Allergies, adverse reactions, alerts"
								codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<entry typeCode="DRIV">
								<act classCode="ACT" moodCode="EVN">
									<code nullFlavor="NA"/>
									<entryRelationship typeCode="SUBJ">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE02.10.023.00"
												codeSystem="2.16.156.10011.2.2.1"
												codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="BL" value="true"/>
											<participant typeCode="CSM">
												<participantRole classCode="MANU">
												<playingEntity classCode="MMAT">
												<!--住院患者过敏源-->
												<code code="DE02.10.022.00"
												codeSystem="2.16.156.10011.2.2.1"
												codeSystemName="卫生信息数据元目录" displayName="过敏药物"/>
												<desc xsi:type="ST">
												<xsl:value-of
												select="Allergy/Allergies/Item/allergen/Value"/>
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
					<!--
********************************************************
实验室检查章节
********************************************************
-->
					<component>
						<section>
							<code code="30954-2" displayName="STUDIES SUMMARY"
								codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<entry typeCode="COMP">
								<!-- 血型-->
								<organizer classCode="BATTERY" moodCode="EVN">
									<statusCode/>
									<component typeCode="COMP">
										<!-- ABO血型 -->
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE04.50.001.00"
												codeSystem="2.16.156.10011.2.2.1"
												codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="CD" code="1"
												codeSystem="2.16.156.10011.2.3.1.85"
												codeSystemName="ABO血型代码表" displayName="A型"/>
										</observation>
									</component>
									<component typeCode="COMP">
										<!-- Rh血型 -->
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE04.50.010.00"
												codeSystem="2.16.156.10011.2.2.1"
												codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="CD" code="2"
												codeSystem="2.16.156.10011.2.3.1.250"
												codeSystemName="Rh(D)血型代码表" displayName="阳性"/>
										</observation>
									</component>
								</organizer>
							</entry>
						</section>
					</component>
					<!--
********************************************************
手术操作章节
********************************************************
-->
					<xsl:apply-templates select="Procedure/Items/ProcedureItem"/>
					<!--
*******************************************************
住院史章节
*******************************************************
-->
					<component>
						<section>
							<code code="11336-5" codeSystem="2.16.840.1.113883.6.1"
								displayName="HISTORY OF HOSPITALIZATIONS" codeSystemName="LOINC"/>
							<text/>
							<!--住院次数 -->
							<entry typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE02.10.090.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="住院次数"/>
									<value xsi:type="INT"
										value="{Hospitalization/hospitalizationCount/Value}"/>
								</observation>
							</entry>
						</section>
					</component>
					<!--
*******************************************************
住院过程章节
*******************************************************
-->
					<component>
						<section>
							<code code="8648-8" codeSystem="2.16.840.1.113883.6.1"
								codeSystemName="LOINC" displayName="Hospital Course"/>
							<text/>
							<!--实际住院天数 -->
							<entry typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.310.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="实际住院天数"/>
									<value xsi:type="PQ" value="{HospitalCourse/stayDays/Value}"
										unit="天"/>
								</observation>
							</entry>
							<entry>
								<!--出院科室及病房 -->
								<act classCode="ACT" moodCode="EVN">
									<code/>
									<author>
										<time/>
										<assignedAuthor>
											<id/>
											<representedOrganization>
												<!--住院患者出院病房、科室名称-->
												<id root="2.16.156.10011.1.21" extension="003"/>
												<name>
												<xsl:value-of
												select="HospitalizationProcess/dischargeWard/Display"
												/>
												</name>
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<id root="2.16.156.10011.1.26" extension="567"/>
												<name>
												<xsl:value-of
												select="HospitalCourse/dischargeDepartment/Display"
												/>
												</name>
												</wholeOrganization>
												</asOrganizationPartOf>
											</representedOrganization>
										</assignedAuthor>
									</author>
								</act>
							</entry>
						</section>
					</component>
					<!--
********************************************************
行政管理章节
********************************************************
-->
					<component>
						<section>
							<code displayName="行政管理"/>
							<text/>
							<!--亡患者尸检标志-->
							<entry typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE09.00.108.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="死亡患者尸检标志"/>
									<value xsi:type="BL" value="{Administration/autospy/Value}"/>
								</observation>
							</entry>
							<!--病案质量-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE09.00.103.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="病案质量"/>
									<!-- 质控日期 -->
									<effectiveTime value="20120109"/>
									<value xsi:type="CD" code="{Administration/MRQuality/Value}"
										displayName="{Administration/MRQuality/Display}"
										codeSystem="2.16.156.10011.2.3.2.29"
										codeSystemName="病案质量等级表"/>
									<author>
										<time/>
										<assignedAuthor>
											<id root="2.16.156.10011.1.4" extension="医务人员编码"/>
											<code displayName="质控医生"/>
											<assignedPerson>
												<name>
												<xsl:value-of
												select="Administration/QCDocter/Display"/>
												</name>
											</assignedPerson>
										</assignedAuthor>
									</author>
									<author>
										<time/>
										<assignedAuthor>
											<id root="2.16.156.10011.1.4" extension="医务人员编码"/>
											<code displayName="质控护士"/>
											<assignedPerson>
												<name>
												<xsl:value-of
												select="Administration/QCNurse/Display"/>
												</name>
											</assignedPerson>
										</assignedAuthor>
									</author>
								</observation>
							</entry>
						</section>
					</component>
					<!--
***********************************************
治疗计划章节
***********************************************
-->
					<xsl:apply-templates select="TreatmentPlan"></xsl:apply-templates>
					<!--
********************************************************
费用章节
********************************************************
-->
					<xsl:apply-templates select="Payment"/>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>



	<xsl:template match="VitalSigns/VitalSign">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="{type}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"
					displayName="出生体重">
					<qualifier>
						<name displayName="{display}"/>
					</qualifier>
				</code>
				<value xsi:type="PQ" value="{value}" unit="g"/>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="Diagnosis/Westerns/Western">
		<!--门（急）诊诊断-疾病名称-->
		<entry>
			<organizer classCode="CLUSTER" moodCode="EVN">
				<statusCode/>
				<xsl:if test="diag/code/Display">
					<component>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.01.025.00"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="门（急）诊诊断名称"><qualifier><name displayName="门（急）诊诊断"></name></qualifier></code>
							<value xsi:type="ST"><xsl:value-of select="diag/code/Display"/></value>
						</observation>
					</component>
				</xsl:if>
				<xsl:if test="diag/code/Value">
					<component>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.01.024.00"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="门（急）诊诊断疾病编码"><qualifier><name displayName="门（急）诊诊断"></name></qualifier></code>
							<value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11"
								codeSystemName="ICD-10" displayName="{diag/code/Display}"/>
						</observation>
					</component>
				</xsl:if>
			</organizer>
		</entry>
	</xsl:template>
	<xsl:template match="Diagnosis/Pathologys/Pathology">
		<entry>
			<organizer classCode="CLUSTER" moodCode="EVN">
				<statusCode/>
				<xsl:if test="diag/code/Display">
					<component>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.01.025.00"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="病理诊断-疾病名称"><qualifier><name displayName="病理诊断"></name></qualifier></code>
							<value xsi:type="ST"><xsl:value-of select="diag/code/Display"/></value>
						</observation>
					</component>
				</xsl:if>
				<xsl:if test="diag/code/Value">
					<component>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.01.024.00"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="病理诊断-疾病编码"><qualifier><name displayName="病理诊断"></name></qualifier></code>
							<value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11" displayName="{diag/code/Display}"
								codeSystemName="ICD-10"/>
						</observation>
					</component>
				</xsl:if>
			</organizer>
		</entry>	
	</xsl:template>
	<xsl:template match="Problem">
		<entry typeCode="COMP">
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.119.00"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="住院者疾病状态代码"/>
				<value xsi:type="CD" code="{sickCondition/Value}" codeSystem="2.16.156.10011.2.3.1.100" codeSystemName="住院者疾病状态代码表" displayName="{sickCondition/Display}"/>
			</observation>
		</entry>
		<!--住院患者损伤和中毒外部原因-->
		<entry typeCode="COMP">
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.152.00"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="损伤中毒的外部原因"/>
				<value xsi:type="ST"><xsl:value-of select="damageReason/Value"/></value>
				<entryRelationship typeCode="REFR" negationInd="false">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.078.00"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="损伤中毒的外部原因-疾病编码"/>
						<value xsi:type="CD" code="{damageDiag/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10" displayName="{damageDiag/Display}"/>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
		<entry typeCode="COMP">
			<organizer classCode="CLUSTER" moodCode="EVN">
				<statusCode/>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.138.01" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="颅脑损伤患者入 院前昏迷时间-d"/>
						<value xsi:type="PQ" unit="d" value="{comaBeforeAdmit/days/Value}"/>
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.138.02" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="颅脑损伤患者入 院前昏迷时间-h"/>
						<value xsi:type="PQ" unit="h" value="{comaBeforeAdmit/hours/Value}"/>
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.138.03" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="颅脑损伤患者入 院前昏迷时间-min"/>
						<value xsi:type="PQ" unit="min" value="{comaBeforeAdmit/minutes/Value}"/>
					</observation>
				</component>
			</organizer>
		</entry>
	</xsl:template>
	<xsl:template match="DisDiag/Primarys/Primary">
		<entry>
			<organizer classCode="CLUSTER" moodCode="EVN">
				<statusCode/>
				<xsl:if test="diag/code/Display">
					<component>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-主要诊断名称"><qualifier><name displayName="主要诊断名称"></name></qualifier></code>
							<!--确诊日期-->
							<effectiveTime value="{diag/date/Value}"/>
							<value xsi:type="ST"><xsl:value-of select="diag/code/Display"/></value>
							
						</observation>
					</component>
				</xsl:if>
				<xsl:if test="diag/code/Value">
					<component>
						<observation classCode="OBS" moodCode="EVN">
							<!--住院患者疾病诊断类型-代码/住院患者疾病诊断类型-详细描述-->
							<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-主要诊断疾病编码"><qualifier><name displayName="主要诊断疾病编码"></name></qualifier></code>
							<!--疾病诊断代码/疾病诊断名称-->
							<value xsi:type="CD" code="{diag/code/Value}"
								displayName="{diag/code/Display}" codeSystem="2.16.156.10011.2.3.3.11"
								codeSystemName="ICD-10"/>
						</observation>
					</component>	
				</xsl:if>
				<xsl:if test="sickCondition/Value">
					<component>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE09.00.104.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-主要诊断入院病情代码"><qualifier><name displayName="主要诊断入院病情代码"></name></qualifier></code>
							<value xsi:type="CD" code="{sickCondition/Value}"
								displayName="{sickCondition/Display}"
								codeSystem="2.16.156.10011.2.3.1.253" codeSystemName="入院病情代码表"/>
						</observation>
					</component>
				</xsl:if>
			</organizer>
		</entry>
	</xsl:template>
	<xsl:template match="DisDiag/Others/Other">
		<!--出院诊断-其他诊断条目-->
		<entry>
			<organizer classCode="CLUSTER" moodCode="EVN">
				<statusCode/>
				<xsl:if test="diag/code/Display">
					<component>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-其他诊断名称"><qualifier><name displayName="其他诊断名称"></name></qualifier></code>
							<!--确诊日期-->
							<effectiveTime value="{diag/date/Value}"/>
							<value xsi:type="ST"><xsl:value-of select="diag/code/Display"/></value>
						</observation>
					</component>
				</xsl:if>
				<xsl:if test="diag/code/Value">
					<component>
						<observation classCode="OBS" moodCode="EVN">
							<!--住院患者疾病诊断类型-代码/住院患者疾病诊断类型-详细描述-->
							<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-其他诊断疾病编码"><qualifier><name displayName="其他诊断疾病编码"></name></qualifier></code>
							<!--疾病诊断代码/疾病诊断名称-->
							<value xsi:type="CD" code="{diag/code/Value}"
								codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
								<xsl:if test="diag/code/Display">
									<xsl:attribute name="displayName">
										<xsl:value-of select="diag/code/Display"/>
									</xsl:attribute>
								</xsl:if>
							</value>
						</observation>
					</component>
				</xsl:if>
				<xsl:if test="sickCondition/Display">
					<component>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE09.00.104.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-其他诊断入院病情代码"><qualifier><name displayName="其他诊断入院病情代码"></name></qualifier></code>
							<value xsi:type="CD" code="{sickCondition/Value}"
								displayName="{sickCondition/Display}"
								codeSystem="2.16.156.10011.2.3.1.253" codeSystemName="入院病情代码表"/>
						</observation>
					</component>
					
				</xsl:if>
				
			</organizer>
		</entry>
	</xsl:template>
	<xsl:template match="Procedure/Items/ProcedureItem">
		<component>
			<section>
				<code code="47519-4" displayName="HISTORY OF PROCEDURES"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<entry>
					<!-- 1..1 手术记录 -->
					<procedure classCode="PROC" moodCode="EVN">
						<code code="{code/Value}" displayName="{code/Display}"
							codeSystem="2.16.156.10011.2.3.3.12"
							codeSystemName="手术(操作)代码表(ICD-9-CM)"/>
						<statusCode/>
						<!--操作日期/时间-->
						<effectiveTime value="{procedureTime/Value}"/>
						<!--手术者-->
						<performer>
							<assignedEntity>
								<id root="2.16.156.10011.1.4" extension="医务人员编码"/>
								<assignedPerson>
									<name>
										<xsl:value-of select="procedureDocotr/Display"/>
									</name>
								</assignedPerson>
							</assignedEntity>
						</performer>
						<!--第一助手-->
						<xsl:if test="primaryAssistant/Value">
							<participant typeCode="ATND">
								<participantRole classCode="ASSIGNED">
									<id root="2.16.156.10011.1.4" extension="医务人员编码"/>
									<code displayName="第一助手"/>
									<playingEntity classCode="PSN" determinerCode="INSTANCE">
										<name>
											<xsl:value-of select="primaryAssistant/Value"/>
										</name>
									</playingEntity>
								</participantRole>
							</participant>
						</xsl:if>
						
						<!--第二助手-->
						<xsl:if test="secondAssistant/Value">
							<participant typeCode="ATND">
								<participantRole classCode="ASSIGNED">
									<id root="2.16.156.10011.1.4" extension="医务人员编码"/>
									<code displayName="第二助手"/>
									<playingEntity classCode="PSN" determinerCode="INSTANCE">
										<name>
											<xsl:value-of select="secondAssistant/Value"/>
										</name>
									</playingEntity>
								</participantRole>
							</participant>
						</xsl:if>
						<xsl:if test="name/Value">
							<entryRelationship typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.094.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="手术（操作）名称"/>
									<value xsi:type="ST">
										<xsl:value-of select="name/Value"/>
									</value>
								</observation>
							</entryRelationship>
						</xsl:if>
						
						<!--手术级别 -->
						<xsl:if test="procedureClass/Value">
							<entryRelationship typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.255.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="手术级别"/>
									<!--手术级别 -->
									<value xsi:type="CD" code="{procedureClass/Value}"
										displayName="{procedureClass/Display}"
										codeSystem="2.16.156.10011.2.3.1.258" codeSystemName="手术级别代码表"/>
								</observation>
							</entryRelationship>
						</xsl:if>
						
						<!--手术切口类别 -->
						<xsl:if test="cutLevel/Value">
							<entryRelationship typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.257.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="手术切口类别代码"/>
									<!--手术级别 -->
									<value xsi:type="CD" code="{cutLevel/Value}"
										displayName="{cutLevel/Display}"
										codeSystem="2.16.156.10011.2.3.1.256" codeSystemName="手术切口类别代码表"
									/>
								</observation>
							</entryRelationship>
						</xsl:if>
						
						<!--手术切口愈合等级-->
						<xsl:if test="healingLevel/Value">
							<entryRelationship typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE05.10.147.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="手术切口愈合等级"/>
									<!--手术切口愈合等级-->
									<value xsi:type="CD" code="{healingLevel/Value}" displayName="{healingLevel/Display}"
										codeSystem="2.16.156.10011.2.3.1.257"
										codeSystemName="手术切口愈合等级代码表"/>
								</observation>
							</entryRelationship>
						</xsl:if>
						<!-- 0..1 麻醉信息 -->
						<xsl:if test="anesthesiaMethod/Value">
							<entryRelationship typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="麻醉方式代码"/>
									<value code="{anesthesiaMethod/Value}"
										displayName="{anesthesiaMethod/Display}"
										codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表"
										xsi:type="CD"/>
									<performer>
										<assignedEntity>
											<id root="2.16.156.10011.1.4" extension="医务人员编码 "/>
											<assignedPerson>
												<name>
													<xsl:value-of select="anesthesiaDoctor/Display"/>
												</name>
											</assignedPerson>
										</assignedEntity>
									</performer>
								</observation>
							</entryRelationship>
						</xsl:if>
						
					</procedure>
				</entry>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="Payment">
		<component>
			<section>
				<code code="48768-6" displayName="PAYMENT SOURCES"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--医疗付费方式 -->
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE07.00.007.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="医疗付费方式代码"/>
						<value xsi:type="CD" code="{paymentWay/Value}"
							codeSystem="2.16.156.10011.2.3.1.269" displayName="{paymentWay/Display}"
							codeSystemName="医疗付费方式代码表"/>
					</observation>
				</entry>
				<!--住院总费用 -->
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.142" codeSystem="2.16.156.10011.2.2.4"
							codeSystemName="住院病案首页基本数据集" displayName="住院总费用"/>
						<value xsi:type="MO" value="{totalFee/total/Value}" currency="元"/>
						<entryRelationship typeCode="COMP" negationInd="false">
							<observation classCode="OBS" moodCode="EVN">
								<code code="HDSD00.11.143" codeSystem="2.16.156.10011.2.2.4"
									codeSystemName="住院病案首页基本数据集" displayName="住院总费用- 自付金额（元）"/>
								<value xsi:type="MO" value="{totalFee/patientPay/Amount/Value}"
									currency="元"/>
							</observation>
						</entryRelationship>
					</observation>
				</entry>
				<!--综合医疗服务费 -->
				<entry>
					<organizer classCode="CLUSTER" moodCode="EVN">
						<statusCode/>
						<xsl:apply-templates select="generalFee/service"/>
						<xsl:apply-templates select="generalFee/treatment"/>
						<xsl:apply-templates select="generalFee/nurse"/>
						<xsl:apply-templates select="generalFee/other"/>
					</organizer>
				</entry>
				<!--诊断类服务费 -->
				<entry>
					<organizer classCode="CLUSTER" moodCode="EVN">
						<statusCode/>
						<xsl:apply-templates select="diagFee/pathology"/>
						<xsl:apply-templates select="diagFee/lab"/>
						<xsl:apply-templates select="diagFee/image"/>
						<xsl:apply-templates select="diagFee/diagnosis"/>
					</organizer>
				</entry>
				<!--治疗类服务费 -->
				<entry>
					<organizer classCode="CLUSTER" moodCode="EVN">
						<statusCode/>
						<xsl:apply-templates select="treatmentFee/nonSurgery"/>
						<xsl:apply-templates select="treatmentFee/Surgery"/>
					</organizer>
				</entry>
				<!--康复费类服务费 -->
				<xsl:apply-templates select="rehabilitationFee"/>
				<!--中医治疗费 -->
				<xsl:apply-templates select="TCMTreatmentFee"/>
				<!--西药费 -->
				<xsl:apply-templates select="medicineFee"/>
				<!--中药费 -->
				<xsl:apply-templates select="TCMFee"/>
				<!-- 血液和血液制品类服务费 -->
				<xsl:apply-templates select="bloodFee"/>
				<!-- 耗材类费用 -->
				<xsl:apply-templates select="consumableFee"/>
				<!--其他费 -->
				<xsl:apply-templates select="otherFee"/>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="generalFee/service">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.147" codeSystem="2.16.156.10011.2.2.4"
					codeSystemName="住院病案首页基本数据集" displayName="综合医疗服务费-一般医疗服务费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="generalFee/treatment">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.148" codeSystem="2.16.156.10011.2.2.4"
					codeSystemName="住院病案首页基本数据集" displayName="综合医疗服 务费-一般治疗操作费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="generalFee/nurse">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.145" codeSystem="2.16.156.10011.2.2.4"
					codeSystemName="住院病案首页基本数据集" displayName="综合医疗服 务费-护理费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="generalFee/other">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.146" codeSystem="2.16.156.10011.2.2.4"
					codeSystemName="住院病案首页基本数据集" displayName="综合医疗服 务费-其他费用"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="diagFee/pathology">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.121" codeSystem="2.16.156.10011.2.2.4"
					codeSystemName="住院病案首页基本数据集" displayName="诊断-病理诊断费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="diagFee/lab">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.123" codeSystem="2.16.156.10011.2.2.4"
					codeSystemName="住院病案首页基本数据集" displayName="诊断-实验室诊断费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="diagFee/image">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.124" codeSystem="2.16.156.10011.2.2.4"
					codeSystemName="住院病案首页基本数据集" displayName="诊断-影像学诊断费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="diagFee/diagnosis">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.122" codeSystem="2.16.156.10011.2.2.4"
					codeSystemName="住院病案首页基本数据集" displayName="诊断-临床诊断项目费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="treatmentFee/nonSurgery">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.129" codeSystem="2.16.156.10011.2.2.4"
					codeSystemName="住院病案首页基本数据集" displayName="治疗-非手术治疗项目费"/>
				<value xsi:type="MO" value="{nonSurgery/Value}" currency="元"/>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.130" codeSystem="2.16.156.10011.2.2.4"
							codeSystemName="住院病案首页基本数据集" displayName="治疗-非手术 治疗项目费-临床物理治疗费"/>
						<value xsi:type="MO" value="{physical/Amount/Value}" currency="元"
						/>
					</observation>
				</entryRelationship>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="treatmentFee/Surgery">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.131" codeSystem="2.16.156.10011.2.2.4"
					codeSystemName="住院病案首页基本数据集" displayName="治疗-手术治 疗费"/>
				<value xsi:type="MO" value="{surgery/Value}" currency="元"/>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.132" codeSystem="2.16.156.10011.2.2.4"
							codeSystemName="住院病案首页基本数据集" displayName="治疗-手术治 疗费-麻醉费"/>
						<value xsi:type="MO" value="{detail/anesthesia/Value}" currency="元"/>
					</observation>
				</entryRelationship>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.133" codeSystem="2.16.156.10011.2.2.4"
							codeSystemName="住院病案首页基本数据集" displayName="治疗-手术治 疗费-手术费"/>
						<value xsi:type="MO" value="{detail/surgery/Value}" currency="元"/>
					</observation>
				</entryRelationship>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="rehabilitationFee">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.055" codeSystem="2.16.156.10011.2.2.4"
					codeSystemName="住院病案首页基本数据集" displayName="康复费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="TCMTreatmentFee">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.136" codeSystem="2.16.156.10011.2.2.4"
					codeSystemName="住院病案首页基本数据集" displayName="中医治疗费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="medicineFee">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.098" codeSystem="2.16.156.10011.2.2.4"
					codeSystemName="住院病案首页基本数据集" displayName="西药费"/>
				<value xsi:type="MO" value="{medicine/Value}" currency="元"/>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.099" codeSystem="2.16.156.10011.2.2.4"
							codeSystemName="住院病案首页基本数据集" displayName="西药费-抗菌 药物费用"/>
						<value xsi:type="MO" value="{antibacterial/Value}" currency="元"/>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="TCMFee">
		<entry>
			<organizer classCode="CLUSTER" moodCode="EVN">
				<statusCode/>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.135" codeSystem="2.16.156.10011.2.2.4"
							codeSystemName="住院病案首页基本数据集" displayName="中药费-中成 药费"/>
						<value xsi:type="MO" value="{patent/Value}" currency="元"/>
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.134" codeSystem="2.16.156.10011.2.2.4"
							codeSystemName="住院病案首页基本数据集" displayName="中药费-中草 药费"/>
						<value xsi:type="MO" value="{herb/Value}" currency="元"/>
					</observation>
				</component>
			</organizer>
		</entry>
	</xsl:template>
	<xsl:template match="bloodFee">
		<entry>
			<organizer classCode="CLUSTER" moodCode="EVN">
				<statusCode/>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.115" codeSystem="2.16.156.10011.2.2.4"
							codeSystemName="住院病案首页基本数据集" displayName="血费"/>
						<value xsi:type="MO" value="{blood/Value}" currency="元"/>
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.111" codeSystem="2.16.156.10011.2.2.4"
							codeSystemName="住院病案首页基本数据集" displayName="白蛋白类制 品费"/>
						<value xsi:type="MO" value="{albumin/Value}" currency="元"/>
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.113" codeSystem="2.16.156.10011.2.2.4"
							codeSystemName="住院病案首页基本数据集" displayName="球蛋白类制 品费"/>
						<value xsi:type="MO" value="{globulin/Value}" currency="元"/>
					</observation>
				</component>
				<!-- 凝血因子类制品费 -->
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.112" codeSystem="2.16.156.10011.2.2.4"
							codeSystemName="住院病案首页基本数据集" displayName="凝血因子类 制品费"/>
						<value xsi:type="MO" value="{clotfactor/Value}" currency="元"/>
					</observation>
				</component>
				<!--细胞因子类制品费 -->
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.114" codeSystem="2.16.156.10011.2.2.4"
							codeSystemName="住院病案首页基本数据集" displayName="细胞因子类 制品费"/>
						<value xsi:type="MO" value="{cellfactor/Value}" currency="元"/>
					</observation>
				</component>
			</organizer>
		</entry>
	</xsl:template>
	<xsl:template match="consumableFee">
		<entry>
			<organizer classCode="CLUSTER" moodCode="EVN">
				<statusCode/>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.038" codeSystem="2.16.156.10011.2.2.4"
							codeSystemName="住院病案首页基本数据集" displayName="一次性医用 材料费-检查用"/>
						<value xsi:type="MO" value="{exam/Value}" currency="元"/>
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.040" codeSystem="2.16.156.10011.2.2.4"
							codeSystemName="住院病案首页基本数据集" displayName="一次性医用 材料费-治疗用"/>
						<value xsi:type="MO" value="{treatment/Value}" currency="元"/>
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.039" codeSystem="2.16.156.10011.2.2.4"
							codeSystemName="住院病案首页基本数据集" displayName="一次性医用 材料费-手术用"/>
						<value xsi:type="MO" value="{surgery/Value}" currency="元"/>
					</observation>
				</component>
			</organizer>
		</entry>
	</xsl:template>
	<xsl:template match="otherFee">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HSDB05.10.130" codeSystem="2.16.156.10011.2.2.4"
					codeSystemName="住院病案首页基本数据集" displayName="其他费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="TreatmentPlan">
		<component>
			<section>
				<code code="18776-5" displayName="TREATMENT PLAN"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!-- 有否出院31天内再住院计划 -->
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.194.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="出院31天内再住院标志"/>
						<value xsi:type="BL" value="{readmission/Value}"/>
						<entryRelationship typeCode="GEVL" negationInd="false">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.195.00"
									codeSystem="2.16.156.10011.2.2.1"
									codeSystemName="卫生信息数据元目录" displayName="出院31天内再住院目的"/>
								<value xsi:type="ST">
									<xsl:value-of
										select="readmissionReason/Value"/>
								</value>
							</observation>
						</entryRelationship>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
</xsl:stylesheet>
