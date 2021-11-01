<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:output method="xml"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.67"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<!--title-->
			<title>术前讨论</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>

			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 健康档案标识号 -->
					<xsl:apply-templates select="Header/recordTarget/healthRecordId" mode="healthRecordNumber"/>
					<!--住院号-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					<!-- 现住址 -->
					<xsl:apply-templates select="Header/recordTarget/addr" mode="Address"/>
					<xsl:apply-templates select="Header/recordTarget/telcom" mode="PhoneNumber"/>
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 出生时间1..1 -->
						<xsl:apply-templates select="Header/recordTarget/patient/birthTime" mode="BirthTime"/>
						<!-- 婚姻状况1..1 -->
						<xsl:apply-templates select="Header/recordTarget/patient/maritalStatusCode" mode="MaritalStatus"/>
						<!-- 民族1..1 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ethnicGroupCode" mode="EthnicGroup"/>
						<!-- 出生地 -->
						<xsl:apply-templates select="Header/recordTarget/patient/birthplace" mode="BirthPlace"/>

						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"/>

						<!-- 工作单位 -->
						<xsl:apply-templates select="Header/recordTarget/patient" mode="Employer"/>
						<!--职业状况-->
						<xsl:apply-templates select="Header/recordTarget/patient/occupationCode" mode="Occupation"/>
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
				<xsl:if test="assignedEntityCode = '手术者' or contains(assignedEntityCode , '医师')">
					<xsl:comment><xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
					<authenticator>
						<!-- DE09.00.053.00	签名日期时间  -->
						<time value="{time/Value}"/>
						<signatureCode/>
						<assignedEntity>
							<id root="2.16.156.10011.1.5" extension="{assignedEntityId}"/>
							<code displayName="{assignedEntityCode}"/>
							<assignedPerson>
								<name><xsl:value-of select="assignedPersonName/Display"/></name>
								<!-- 专业技术职务：无信息 -->
								<professionalTechnicalPosition>
									<professionaltechnicalpositionCode code="1"
										codeSystem="2.16.156.10011.2.3.1.209" codeSystemName="专业技术职务类别代码表"
										displayName="正高"/>
								</professionalTechnicalPosition>
							</assignedPerson>
						</assignedEntity>
					</authenticator>
				</xsl:if>
			</xsl:for-each>
			
			<!--讨论成员信息-->
			<participant typeCode="CON">
				<associatedEntity classCode="ECON">
					<xsl:comment>检验申请机构及科室</xsl:comment>
					<!--参加讨论人员名单-->
					<associatedPerson>
						<xsl:for-each select="Header/Participants/Participant">
							<xsl:if test="typeCode = 'CON'">
								<name><xsl:value-of select="associatedPersonName/Value"/></name>
							</xsl:if>
						</xsl:for-each>
					</associatedPerson>
				</associatedEntity>
			</participant>
			
			<!--讨论主持人信息-->
			<xsl:for-each select="Header/Participants/Participant">
				<xsl:if test="typeCode = 'ORG'">
					<xsl:comment>检验申请机构及科室</xsl:comment>
					<participant typeCode="ORG">
						<associatedEntity classCode="ECON">
							<code displayName="主持人"/>
							<associatedPerson>
								<!--主持人姓名-->
								<name><xsl:value-of select="associatedPersonName/Value"/></name>
							</associatedPerson>
						</associatedEntity>
					</participant>
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
									<!--HDSD00.09.003	DE01.00.026.00	病床号 -->
									<xsl:comment></xsl:comment>
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
											<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>	
										</xsl:if>
									
										<!--HDSD00.09.004	DE01.00.019.00	病房号 -->
										<xsl:comment>病房号</xsl:comment>
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												</xsl:if>
												
												<!--HDSD00.09.036	DE08.10.026.00	科室名称 -->
												<xsl:comment>科室名称</xsl:comment>
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<!--HDSD00.09.005	DE08.10.054.00	病区名称 -->
												<xsl:comment>病区名称</xsl:comment>
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
												<!--XXX医院 -->
												<xsl:comment>医院</xsl:comment>
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
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
					<!--术前诊断章节-->
					<xsl:comment>术前诊断章节</xsl:comment>
					<xsl:if test="PreOpDiag">
						<xsl:apply-templates select="PreOpDiag"/>
					</xsl:if>
				
					<!--治疗计划章节-->
					<xsl:comment>治疗计划章节</xsl:comment>
					<xsl:apply-templates select="TreatmentPlan"/>
					<!--手术章节-->
					<xsl:comment>手术章节</xsl:comment>
					<xsl:apply-templates select="Procedure"/>
					<!--术前总结章节-->
					<xsl:comment>术前总结章节</xsl:comment>
					<xsl:apply-templates select="PreoperativeSummary"/>
				</structuredBody>
			</component>


		</ClinicalDocument>
	</xsl:template>

	<!--术前诊断章节模板-->
	<xsl:template match="PreOpDiag">
		<component>
			<section>
				<xsl:comment>术前诊断编码</xsl:comment>
				<code code="10219-4" displayName="Surgical operation note preoperative Dx"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<xsl:if test="Items/Item">
					<xsl:apply-templates select="Items/Item"/>
				</xsl:if>
				<xsl:comment>入院日期时间</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.092.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="入院日期时间"/>
						<value xsi:type="TS" value="{admitTime/Value}"/>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="Items/Item">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1"
					codeSystemName="卫生信息数据元目录" displayName="术前诊断编码"/>
				<xsl:if test="diagnosisCode/Value">
					<value xsi:type="CD" code="{diagnosisCode/Value}"
						codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="ICD-10诊断编码表"/>
				</xsl:if>
				
			</observation>
		</entry>
	</xsl:template>

	<!--治疗计划章节模板-->
	<xsl:template match="TreatmentPlan">
		<component>
			<section>
				<code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1"
					codeSystemName="LOINC"/>
				<text/>
				<xsl:comment>拟实施手术及操作名称</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.094.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="拟实施手术及操作名称"/>
						<value xsi:type="ST">
							<xsl:value-of select="procedures/Procedure[1]/name/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>拟实施手术及操作编码</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.093.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="拟实施手术及操作编码"/>
						<value xsi:type="CD" code="{procedures/Procedure[1]/code/Value}"
							codeSystem="2.9999" codeSystemName="ICD-9-CM-3"/>
					</observation>
				</entry>
				<xsl:comment>拟实施手术目标部位名称</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.187.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="拟实施手术目标部位名称"/>
						<value xsi:type="ST">
							<xsl:value-of select="procedures/Procedure[1]/bodypart/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>拟实施手术及操作日期时间</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.221.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="拟实施手术及操作日期时间"/>
						<value xsi:type="TS" value="{procedures/Procedure[1]/time/Value}"/>
					</observation>
				</entry>
				<xsl:comment>拟实施麻醉方法代码</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="拟实施麻醉方法代码"/>
						<value xsi:type="CD" code="{procedures/Procedure[1]/anesthesiaCode/Value}"
							codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="实施麻醉方法代码表"/>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--手术操作章节模板-->
	<xsl:template match="Procedure">
		<component>
			<section>
				<code code="47519-4" displayName="HISTORY OF PROCEDURES"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<xsl:comment>手术要点</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.254.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="手术要点"/>
						<value xsi:type="ST">
							<xsl:value-of select="keypoint/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>术前准备</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.271.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="术前准备"/>
						<value xsi:type="ST">
							<xsl:value-of select="preoperativePrep/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>手术指征</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.340.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="手术指征"/>
						<value xsi:type="ST">
							<xsl:value-of select="illness/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>手术方案</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.301.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="手术方案"/>
						<value xsi:type="ST">
							<xsl:value-of select="program/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>注意事项</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE09.00.119.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="注意事项"/>
						<value xsi:type="ST">
							<xsl:value-of select="attention/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--术前诊断章节模板-->
	<xsl:template match="PreoperativeSummary">
		<component>
			<section>
				<code displayName="讨论总结"/>
				<text/>
				<xsl:comment>讨论意见</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="讨论意见"/>
						<value xsi:type="ST">
							<xsl:value-of select="conclusion/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>讨论结论</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="讨论结论"/>
						<value xsi:type="ST">
							<xsl:value-of select="suggestion/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

</xsl:stylesheet>
