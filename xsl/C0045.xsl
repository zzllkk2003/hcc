<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" indent="yes"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:include href="CDA-Support-Files/Procedures.xsl"/>
	<xsl:include href="CDA-Support-Files/TreatmentPlan.xsl"/>
	<xsl:include href="CDA-Support-Files/Sections.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.52"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>会诊记录</title>
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
					<!-- 住院号标识 todo-->
					<xsl:apply-templates select="Header/recordTarget/labOrderNum" mode="labOrderNum"/>
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
						<!-- 出生时间1..1 -->
						<xsl:apply-templates select="Header/recordTarget/Patient/birthTime"
							mode="BirthTime"/>
						<!-- 年龄1..1 -->
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
				<xsl:if test="assignedEntityCode = '会诊申请医师'">
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
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '会诊医师'">
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
			<!--Authenticator签名会诊所在医疗机构名称-->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '申请会诊科室'">
					<xsl:comment><xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
					<authenticator>
						<time/>
						<signatureCode/>
						<assignedEntity>
							<id/>
							<representedOrganization>
								<asOrganizationPartOf>
									<wholeOrganization>
										<id root="2.16.156.10011.1.26"
											extension="{assignedEntityId}"/>
										<!-- 申请会诊科室名称 -->
										<name><xsl:value-of select="assignedPersonName/Display"/></name>
										<asOrganizationPartOf>
											<wholeOrganization>
												<id root="2.16.156.10011.1.5" extension="会诊申请医疗机构名称"/>
												<name>会诊申请医疗机构名称</name>
											</wholeOrganization>
										</asOrganizationPartOf>
									</wholeOrganization>
								</asOrganizationPartOf>
							</representedOrganization>
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
									<!--HDSD00.09.003 DE01.00.026.00 病床号 -->
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<xsl:comment>病床号</xsl:comment>
										<xsl:if
											test="Header/encompassingEncounter/Locations/Location/bedId">
											<id root="2.16.156.10011.1.22"
												extension="{Header/encompassingEncounter/Locations/Location/bedId}"
											/>
										</xsl:if>
										<name>
											<xsl:value-of
												select="Header/encompassingEncounter/Locations/Location/bedName/Value"
											/>
										</name>
										<!--HDSD00.09.004 DE01.00.019.00 病房号 -->
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<xsl:comment>病房号</xsl:comment>
												<xsl:if
												test="Header/encompassingEncounter/Locations/Location/wardId">
												<id root="2.16.156.10011.1.21"
												extension="{Header/encompassingEncounter/Locations/Location/wardId}"
												/>
												</xsl:if>
												<name>
												<xsl:value-of
												select="Header/encompassingEncounter/Locations/Location/wardName/Value"
												/>
												</name>
												<!--HDSD00.09.036 DE08.10.026.00 科室名称 -->
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<xsl:comment>科室名称</xsl:comment>
												<xsl:if
												test="Header/encompassingEncounter/Locations/Location/wardId">
												<id root="2.16.156.10011.1.26"
												extension="{Header/encompassingEncounter/Locations/Location/deptId}"
												/>
												</xsl:if>
												<name>
												<xsl:value-of
												select="Header/encompassingEncounter/Locations/Location/deptName/Value"
												/>
												</name>
												<!--HDSD00.09.005 DE08.10.054.00 病区名称
-->
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<xsl:comment>病区名称</xsl:comment>
												<xsl:if
												test="Header/encompassingEncounter/Locations/Location/areaId">
												<id root="2.16.156.10011.1.27"
												extension="{Header/encompassingEncounter/Locations/Location/areaId}"
												/>
												</xsl:if>
												<name>
												<xsl:value-of
												select="Header/encompassingEncounter/Locations/Location/areaName/Value"
												/>
												</name>
												<!--XXX医院 -->
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<xsl:comment>医院名称</xsl:comment>
												<xsl:if
												test="Header/encompassingEncounter/Locations/Location/hosId">
												<id root="2.16.156.10011.1.26"
												extension="{Header/encompassingEncounter/Locations/Location/hosId}"
												/>
												</xsl:if>
												<name>
												<xsl:value-of
												select="Header/encompassingEncounter/Locations/Location/hosName"
												/>
												</name>
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
**************************************************
健康评估章节MRsummary
**************************************************
-->
					<!--健康评估章节-->
					<xsl:comment>健康评估章节</xsl:comment>
					<component>
						<section>
							<code code="51848-0" displayName="Assessment note"
								codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<entry>
								<!-- 病历摘要-->
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.182.00" displayName="病历摘要"
										codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="ST">
										<xsl:value-of select="HealthAssessment/MRsummary/Value"/>
									</value>
								</observation>
							</entry>
						</section>
					</component>
					<!--
*********************************************
诊断章节
*********************************************
-->
					<!--诊断章节-->
					<component>
						<section>
							<code code="29548-5" displayName="Diagnosis"
								codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--西医诊断-->
							<xsl:apply-templates select="Diagnosis/Westerns/Western[diag/code/Value]"></xsl:apply-templates>

							<!--中医诊断-->
							<xsl:apply-templates select="Diagnosis/TCM/TCM[TCMdiag/code/Value]"></xsl:apply-templates>

							<!--中医症候-->	
							<xsl:apply-templates select="Diagnosis/TCMSyndrome/TCMSyndrome[syndrome/code/Value]"></xsl:apply-templates>
			
							<!--中医“四诊”观察结果-->
							<xsl:comment>中医“四诊”观察结果</xsl:comment>
							<xsl:apply-templates select="Diagnosis/TCMFourDiags/TCMFourDiagnostic/TCMFourDiagnostic"></xsl:apply-templates>
						</section>
					</component>
					<!--
*********************************************
 辅助检查章节
*********************************************
-->
					<component>
						<section>
							<code displayName="辅助检查章节"/>
							<text/>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE04.30.009.00" displayName="辅助检查结果"
										codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="ST">
										<xsl:value-of
											select="SupplementaryExams/SupplementaryExam/result/Value"
										/>
									</value>
								</observation>
							</entry>
						</section>
					</component>
					<!-- 
********************************************************
治疗计划章节
********************************************************
-->
					<!--治疗计划章节-->
					<component>
						<section>
							<code code="18776-5" displayName="TREATMENT PLAN"
								codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<xsl:apply-templates select="TreatmentPlan" mode="TP297"/>
							<xsl:apply-templates select="TreatmentPlan" mode="TP300"/>
							<xsl:apply-templates select="TreatmentPlan" mode="TP214"/>
						</section>
					</component>
					<!-- 
********************************************************
会诊原因章节
********************************************************
-->
					<!--会诊原因章节-->
					<component>
						<section>
							<code displayName="会诊原因"/>
							<text/>

							<!--会诊类型-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.319.00" displayName="会诊类型"
										codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="ST">
										<xsl:value-of select="ConsultReason/Type/Value"/>
									</value>
								</observation>
							</entry>

							<!--会诊原因-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.039.00" displayName="会诊原因"
										codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="ST">
										<xsl:value-of select="ConsultReason/reason/Value"/>
									</value>
								</observation>
							</entry>
						</section>
					</component>
					<!-- 
********************************************************
会诊意见章节
********************************************************
-->
					<!--会诊意见章节-->
					<component>
						<section>
							<code displayName="会诊意见"/>
							<text/>
							<!--会诊意见-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.018.00" displayName="会诊意见"
										codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="ST">
										<xsl:value-of select="ConsultSuggestion/suggestion/Value"/>
									</value>
								</observation>
							</entry>
						</section>
					</component>
					<!--
****************************************************
 住院过程章节
****************************************************
 -->
					<component>
						<section>
							<code code="8648-8" codeSystem="2.16.840.1.113883.6.1"
								codeSystemName="LOINC" displayName="Hospital Course"/>
							<text/>
							<!--诊疗过程描述-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.296.00" displayName="诊疗过程描述"
										codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="ST">
										<xsl:value-of select="/HospitalCourse/treatmentCourse/Value"
										/>
									</value>
								</observation>
							</entry>
						</section>
					</component>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
	<xsl:template match="Diagnosis/Westerns/Western[diag/code/Value]">
		<xsl:comment>西医诊断</xsl:comment>
		<entry>
			<observation classCode="OBS" moodCode="EVN ">
				<xsl:comment>西医诊断名称</xsl:comment>
				<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="西医诊断名称"/>
				<value xsi:type="ST"><xsl:value-of select="diag/code/Display"/></value>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.024.00" displayName="西医诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="CD" code="{diag/code/Value}"  codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
							<xsl:if test="diag/code/Display">
								<xsl:attribute name="displayName"><xsl:value-of select="diag/code/Display"/></xsl:attribute>
							</xsl:if>
						</value>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>	
	<!--中医诊断-->
	<xsl:template match="Diagnosis/TCM/TCM[TCMdiag/code/Value]">
		<xsl:comment>中医诊断</xsl:comment>
		<entry>
			<observation classCode="OBS" moodCode="EVN ">
				<code code="DE05.10.172.00" displayName="中医诊断名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
					<qualifier>
						<name displayName="中医诊断名称"/>
					</qualifier>
				</code>
				<value xsi:type="ST"><xsl:value-of select="TCMdiag/code/Display"/></value>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.130.00" displayName="中医病名代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
							<qualifier>
								<name displayName="中医病名代码"/>
							</qualifier>
						</code>
						<value xsi:type="CD" code="{TCMdiag/code/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
							<xsl:if test="TCMdiag/code/Display">
								<xsl:attribute name="displayName"><xsl:value-of select="TCMdiag/code/Display"/></xsl:attribute>
							</xsl:if>				
						</value>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>
	<!--中医症候诊断-->
	<xsl:template match="Diagnosis/TCMSyndrome/TCMSyndrome[syndrome/code/Value]">
		<xsl:comment>中医症候诊断</xsl:comment>
		<entry>
			<observation classCode="OBS" moodCode="EVN ">
				<code code="DE05.10.172.00" displayName="中医诊断症候名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
					<qualifier>
						<name displayName="中医证候名称"/>
					</qualifier>
				</code>
				<value xsi:type="ST"><xsl:value-of select="syndrome/code/Display"/></value>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.130.00" displayName="中医证候代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
							<qualifier>
								<name displayName="中医证候代码"/>
							</qualifier>
						</code>
						<value xsi:type="CD" code="{syndrome/code/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
							<xsl:if test="syndrome/code/Display">
								<xsl:attribute name="displayName"><xsl:value-of select="syndrome/code/Display"/></xsl:attribute>
							</xsl:if>				
						</value>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>
	<!--中医“四诊”观察结果-->
	<xsl:template match="Diagnosis/TCMFourDiags/TCMFourDiagnostic/TCMFourDiagnostic">
		<entry>
			<observation classCode="OBS" moodCode="EVN ">
				<code code="DE02.10.028.00" displayName="中医“四诊”观察结果" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
</xsl:stylesheet>
