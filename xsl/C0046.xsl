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
			<templateId root="2.16.156.10011.2.1.1.66"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<!--title-->
			<title>术前小结</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 健康档案标识号 -->
					<xsl:apply-templates select="Header/recordTarget/healthRecordId" mode="healthRecordNumber"/>
					<!-- 住院号标识-->
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
				<xsl:if test="assignedEntityCode = '交班者' or contains(assignedEntityCode , '医师')">
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
			<!--联系人@classCode：CON，固定值，表示角色是联系人 -->
			<xsl:for-each select="Header/Participants/Participant">
				<xsl:if test="typeCode = 'NOT'">
					<xsl:comment>检验申请机构及科室</xsl:comment>
					<participant typeCode="NOT">
						<!--联系人@classCode：CON，固定值，表示角色是联系人 -->
						<associatedEntity classCode="ECON">
							<!--联系人电话-->
							<telecom value="{telcom/Value}"/>
							<!--联系人-->
							<associatedPerson>
								<!--姓名-->
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
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
											<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
										</xsl:if>
										
										<!--HDSD00.09.004	DE01.00.019.00	病房号 -->
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												</xsl:if>
												
												<!--HDSD00.09.036	DE08.10.026.00	科室名称 -->
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<!--HDSD00.09.005	DE08.10.054.00	病区名称 -->
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
												<!--XXX医院 -->
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
					<!--病历摘要章节-->
					<xsl:comment>病历摘要章节</xsl:comment>
					<xsl:apply-templates select="MRSummary"/>
					<!--术前诊断章节-->
					<xsl:comment>术前诊断章节</xsl:comment>
					<xsl:apply-templates select="PreOpDiag"/>
					<!--既往史章节-->
					<xsl:comment>既往史章节</xsl:comment>
					<xsl:if test="Allergy">
						<xsl:apply-templates select="Allergy"/>
					</xsl:if>
					
					<!--辅助检查章节-->
					<xsl:comment>辅助检查章节</xsl:comment>
					<xsl:if test="SupplementaryExams">
						<xsl:apply-templates select="SupplementaryExams"/>
					</xsl:if>
					
					<!--手术章节-->
					<xsl:comment>手术章节</xsl:comment>
					<xsl:if test="Procedure">
						<xsl:apply-templates select="Procedure"/>
					</xsl:if>
					
					<!--会诊章节-->
					<xsl:comment>会诊章节</xsl:comment>
					<xsl:if test="ConsultSuggestion">
						<xsl:apply-templates select="ConsultSuggestion"/>
					</xsl:if>
					
					<!--治疗计划章节-->
					<xsl:comment>治疗计划章节</xsl:comment>
					<xsl:apply-templates select="TreatmentPlan"/>
					<!--注意事项章节-->
					<xsl:comment>注意事项章节</xsl:comment>
					<xsl:apply-templates select="Attention"/>
				</structuredBody>
			</component>			
		</ClinicalDocument>
	</xsl:template>

	<!--病历摘要章节-->
	<xsl:template match="MRSummary">
		<component>
			<section>
				<code code="DE06.00.182.00" codeSystem="2.16.156.10011.2.2.1"
					codeSystemName="卫生信息数据元目录" displayName="{content/displayName}"/>
				<text>
					<xsl:value-of select="content/Value"/>
				</text>
			</section>
		</component>
	</xsl:template>

	<!--术前诊断章节模板-->
	<xsl:template match="PreOpDiag">
		<component>
			<section>
				<code code="11535-2" displayName="HOSPITAL DISCHARGE DX"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--术前诊断编码条目-->
				<xsl:comment>术前诊断编码条目</xsl:comment>
				<xsl:apply-templates select="Items/Item"/>
				<!--诊断依据-->
				<xsl:comment>诊断依据</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.070.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{basis/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="basis/Value"/></value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--术前诊断编码条目-->
	<xsl:template match="Items/Item">
		<xsl:if test="diagnosisCode/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录" displayName="{diagnosisCode/displayName}"/>
					<value xsi:type="CD" code="{diagnosisCode/Value}" codeSystem="2.16.156.10011.2.3.3.11.3"
						codeSystemName="ICD-10诊断编码表"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>

	<!--既往史章节模板-->
	<xsl:template match="Allergy">
		<component>
			<section>
				<code code="11348-0" displayName="HISTORY OF PAST ILLNESS"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--过敏史标志-->
				<xsl:comment>过敏史标志</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.10.023.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{active/displayName}"/>
						<value xsi:type="BL" value="{active/Value}"/>
					</observation>
				</entry>
				<!--过敏史条目-->
				<xsl:comment>过敏史条目</xsl:comment>
				<xsl:apply-templates select="Allergies/Item"/>
			</section>
		</component>
	</xsl:template>
	<!--过敏史条目-->
	<xsl:template match="Allergies/Item">
		<xsl:if test="allergen/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录" displayName="{allergen/displayName}"/>
					<value xsi:type="ST">
						<xsl:value-of select="allergen/Value"/>
					</value>
				</observation>
			</entry>
		</xsl:if>
		
	</xsl:template>

	<!--辅助检查章节模板-->
	<xsl:template match="SupplementaryExams">
		<component>
			<section>
				<code displayName="辅助检查章节"/>
				<text/>
				<!--辅助检查结果-->
				<xsl:comment>辅助检查结果</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.30.009.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录"
							displayName="{SupplementaryExam[1]/result/displayName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="SupplementaryExam[1]/result/Value"/>
						</value>
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
				<!--手术适应症-->
				<xsl:comment>手术适应症</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.151.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{indication/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="indication/Value"/></value>
					</observation>
				</entry>
				<!--手术禁忌症-->
				<xsl:comment>手术禁忌症</xsl:comment>
				<xsl:if test="contraindication/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.141.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="{contraindication/displayName}"/>
							<value xsi:type="ST">
								<xsl:value-of select="contraindication/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
				<!--手术指征-->
				<xsl:comment>手术指征</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.340.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{illness/displayName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="illness/Value"/>
						</value>
					</observation>
				</entry>

			</section>
		</component>
	</xsl:template>

	<!--会诊章节模板-->
	<xsl:template match="ConsultSuggestion">
		<component>
			<section>
				<code displayName="会诊章节"/>
				<text/>
				<!--会诊意见条目-->
				<xsl:comment>会诊意见条目</xsl:comment>
				<xsl:if test="suggestion/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="{suggestion/displayName}"/>
							<value xsi:type="ST">
								<xsl:value-of select="suggestion/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
			</section>
		</component>
	</xsl:template>

	<!--治疗计划章节模板-->
	<xsl:template match="TreatmentPlan">
		<component>
			<section>
				<code code="18776-5" codeSystem="2.16.840.1.113883.6.1" displayName="TREATMENT PLAN"
					codeSystemName="LOINC"/>
				<text/>
				<!--拟实施手术及操作编码-->
				<xsl:comment>拟实施手术及操作编码</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.093.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录"
							displayName="{procedures/Procedure[1]/code/displayName}"/>
						<value xsi:type="CD" code="{procedures/Procedure[1]/code/Value}"
							codeSystem="2.9999" codeSystemName="ICD-9-CM-3"/>
					</observation>
				</entry>
				<!--拟实施手术及操作名称-->
				<xsl:comment>拟实施手术及操作名称</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.094.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录"
							displayName="{procedures/Procedure[1]/name/displayName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="procedures/Procedure[1]/name/Value"/>
						</value>
					</observation>
				</entry>
				<!--拟实施手术及操作部位名称-->
				<xsl:comment>拟实施手术及操作部位名称</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.187.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录"
							displayName="{procedures/Procedure[1]/bodypart/displayName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="procedures/Procedure[1]/bodypart/Value"/>
						</value>
					</observation>
				</entry>
				<!--拟实施手术及操作日期时间-->
				<xsl:comment>拟实施手术及操作日期时间</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.221.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="拟实施手术及操作日期时间"/>
						<value xsi:type="TS" value="{procedures/Procedure[1]/time/Value}"/>
					</observation>
				</entry>
				<!--拟实施麻醉方法代码表-->
				<xsl:comment>拟实施麻醉方法代码表</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录"
							displayName="{procedures/Procedure[1]/anesthesiaCode/displayName}"/>
						<value xsi:type="CD" code="{procedures/Procedure[1]/anesthesiaCode/Value}"
							codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="拟实施麻醉方法代码表"/>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--注意事项章节模板-->
	<xsl:template match="Attention">
		<component>
			<section>
				<code code="DE09.00.119.00" codeSystem="2.16.156.10011.2.2.1"
					codeSystemName="卫生信息数据元目录" displayName="注意事项章节"/>
				<text/>
				<!--手术要点-->
				<xsl:comment>手术要点</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.254.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{surgeryKeypoint/displayName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="surgeryKeypoint/Value"/>
						</value>
					</observation>
				</entry>
				<!--术前准备-->
				<xsl:comment>术前准备</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.271.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{preoperativePrep/displayName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="preoperativePrep/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

</xsl:stylesheet>
