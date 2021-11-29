<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" indent="yes"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:include href="CDA-Support-Files/VitalSign.xsl"/>
	<xsl:include href="CDA-Support-Files/history.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.43"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>入院评估</title>
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
					<xsl:apply-templates select="Header/recordTarget/healthCardId" mode="HealthCardNumber"/>
					<!-- 住院号标识 -->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					<telecom use="MP" value="{Header/recordTarget/telcom/Value}"/>
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者身份证号码，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 婚姻状况1..1 -->
						<xsl:apply-templates select="Header/recordTarget/patient/maritalStatusCode" mode="MaritalStatus"/>
						<!-- 民族1..1 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ethnicGroupCode" mode="EthnicGroup"/>
						<!-- 国籍 -->
						<xsl:apply-templates select="Header/recordTarget/patient/nationality" mode="nationality"/>
						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"/>
						
						<!-- 教育-->
						<xsl:apply-templates select="Header/recordTarget/patient/educationCode" mode="Education"/>
						<!--职业状况-->
						<xsl:apply-templates select="Header/recordTarget/patient/occupationCode" mode="Occupation"/>
					</patient>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			<!-- LegalAuthenticator签名 -->
			<xsl:for-each select="Header/LegalAuthenticators/LegalAuthenticator">
				<xsl:if test="assignedEntityCode = '责任护士'">
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
				<xsl:if test="assignedEntityCode = '接诊护士'">
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
						<associatedEntity classCode="ECON">
							<code/>
							<!--HDSD00.09.038 DE02.01.010.00 联系人电话号码 -->
							<telecom  use="MP" value="{telcom/Value}"/>
							<!--联系人-->
							<associatedPerson>
								<!--HDSD00.09.039 DE02.01.039.00 联系人姓名 -->
								<name><xsl:value-of select="wholeOrganization/Display"/></name>
							</associatedPerson>
						</associatedEntity>
					</participant>
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
					<!--入院信息章节-->
					<component>
						<section>
							<code displayName="入院信息"/>
							<text/>
							<!--HDSD00.09.053 DE05.10.053.00 入院原因 -->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<!--HDSD00.09.053 DE05.10.053.00 入院原因 -->
									<code code="DE05.10.053.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院原因"/>
									<value xsi:type="ST"><xsl:value-of select="AdmissionInformation/admitReason/Value"/></value>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<!--HDSD00.09.052 DE06.00.339.00 入院途径代码 -->
									<code code="DE06.00.339.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院途径代码"/>
									<value xsi:type="CD" code="{AdmissionInformation/route/Value}" codeSystem="2.16.156.10011.2.3.1.270" codeSystemName="入院途径代码表">
										<xsl:if test="AdmissionInformation/route/Display">
											<xsl:attribute name="displayName"><xsl:value-of select="AdmissionInformation/route/Display"/></xsl:attribute>
										</xsl:if>
									</value>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.237.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入病房方式"/>
									<!--HDSD00.09.050 DE06.00.237.00 入病房方式 -->
									<value xsi:type="ST"><xsl:value-of select="AdmissionInformation/admitMode/Value"/></value>
								</observation>
							</entry>
						</section>
					</component>
					<!--症状章节 补充LOINC代码-->
					<component>
						<section>
							<code code="11450-4" displayName="PROBLEM LIST" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--主要症状描述-->
							<xsl:apply-templates select="Symptoms/Symptom"></xsl:apply-templates>
						</section>
					</component>
					<!--生命体征章节-->
					<xsl:apply-templates select="VitalSigns"/>
					<!--既往史章节-->
					<xsl:apply-templates select="PastHistory"></xsl:apply-templates>
					<!--过敏史章节-->
					<xsl:apply-templates select="Allergy/Allergies"/>
					<xsl:apply-templates select="FamilyHistories"/>
					<!--健康评估章节-->
					<xsl:apply-templates select="HealthAssessment"/>
					<!--生活方式章节-->
					<component>
						<section>
							<code displayName="生活方式"/>
							<text/>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE03.00.070.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="吸烟标志"/>
									<!--HDSD00.09.068 DE03.00.070.00 吸烟标志-->
									<value xsi:type="BL" value="{LifeStyle/smoke/Value}"/>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE03.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="吸烟状况代码"/>
									<!--HDSD00.09.069 DE03.00.073.00 吸烟状况代码 -->
									<value xsi:type="CD" code="{LifeStyle/smokeStatus/Value}" displayName="{LifeStyle/smokeStatus/Display}" codeSystem="2.16.156.10011.2.3.2.5" codeSystemName="吸烟状况代码表"/>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE03.00.053.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="日吸烟量(支)"/>
									<!--HDSD00.09.048 DE03.00.053.00 日吸烟量（支）-->
									<value xsi:type="PQ" value="{LifeStyle/smokeQuantity/Value}" unit="支"/>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE03.00.065.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="停止吸烟天数"/>
									<!--HDSD00.09.065 DE03.00.065.00 停止吸烟天数 -->
									<value xsi:type="PQ" value="{LifeStyle/stopSmokeDays/Value}" unit="d"/>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE03.00.030.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="饮酒标志"/>
									<!--HDSD00.09.075 DE03.00.030.00 饮酒标志 -->
									<value xsi:type="BL" value="{LifeStyle/liquor/Value}"/>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE03.00.076.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="饮酒频率代码"/>
									<!--HDSD00.09.076 DE03.00.076.00 饮酒频率代码 -->
									<value xsi:type="CD" code="{LifeStyle/liquorFrequency/Value}" displayName="{LifeStyle/liquorFrequency/Display}" codeSystem="2.16.156.10011.2.3.1.16" codeSystemName="饮酒频率代码表"/>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE03.00.054.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="日饮酒量（mL）"/>
									<!--HDSD00.09.049 DE03.00.054.00 日饮酒量（mL）-->
									<value xsi:type="PQ" value="{LifeStyle/liquorVolume/Value}" unit="mL"/>
								</observation>
							</entry>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE03.00.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="饮食情况代码"/>
									<!--HDSD00.09.077 DE03.00.080.00 饮食情况代码 -->
									<value xsi:type="CD" code="{LifeStyle/diet/Value}" displayName="{LifeStyle/diet/Display}" codeSystem="2.16.156.10011.2.3.2.34" codeSystemName="饮食情况代码表"/>
								</observation>
							</entry>
						</section>
					</component>
					<!--入院诊断章节-->
					<xsl:apply-templates select="AdmDiag/Diagnoses/Diagnosis"></xsl:apply-templates>
					<!--护理观察章节-->
					<xsl:apply-templates select="NursingObservations"></xsl:apply-templates>
					<!-- 住院过程章节 -->
					<component>
						<section>
							<code code="8648-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Hospital Course"/>
							<text/>
							<!-- 通知医师情况 -->
							<entry typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.280.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="通知医师标志"/>
									<value xsi:type="BL" value="true"/>
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.279.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="通知医师日期时间"/>
											<value xsi:type="TS" value="20130203121314"/>
										</observation>
									</entryRelationship>
								</observation>
							</entry>
							<!-- 评估日期时间 -->
							<entry typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE05.10.144.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="评估日期时间"/>
									<value xsi:type="TS" value="20130203121314"/>
								</observation>
							</entry>
						</section>
					</component>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
	<xsl:template match="HealthAssessment">
		<component>
			<section>
				<code code="51848-0" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Assessment note"/>
				<text/>
				<xsl:if test="Apgar/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="Apgar评分值"/>
							<!--HDSD00.09.001 DE05.10.001.00 Apgar评分值-->
							<value xsi:type="INT" value="{Apgar/Value}"/>
						</observation>
					</entry>
				</xsl:if>
				<xsl:if test="growth/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="发育程度代码"/>
							<!--HDSD00.09.011 DE05.10.022.00 发育程度代码 -->
							<value xsi:type="CD" code="{growth/Value}" displayName="{growth/Display}" codeSystem="2.16.156.10011.2.3.2.53" codeSystemName="发育程度代码表"/>
						</observation>
					</entry>
				</xsl:if>
				<xsl:if test="mental/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.142.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="精神状态正常标志"/>
							<!--HDSD00.09.035 DE05.10.142.00 精神状态正常标志 -->
							<value xsi:type="BL" value="{mental/Value}"/>
						</observation>
					</entry>
				</xsl:if>
				<xsl:if test="sleep/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.065.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="睡眠状况"/>
							<!--HDSD00.09.060 DE05.10.065.00 睡眠状况 -->
							<value xsi:type="ST">
								<xsl:value-of select="sleep/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
				<xsl:if test="special/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.158.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="特殊情况"/>
							<!--HDSD00.09.061 DE05.10.158.00 特殊情况 -->
							<value xsi:type="ST">
								<xsl:value-of select="special/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
				<xsl:if test="psychology/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.084.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="心理状态代码"/>
							<!--HDSD00.09.070 DE05.10.084.00 心理状态代码 -->
							<value xsi:type="CD" code="{psychology/Value}" displayName="{psychology/Display}" codeSystem="2.16.156.10011.2.3.1.140" codeSystemName="心理状态代码表"/>
						</observation>
					</entry>
				</xsl:if>
				<xsl:if test="Nutritional/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.097.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="营养状态代码"/>
							<!--HDSD00.09.079 DE05.10.097.00 营养状态代码 -->
							<value xsi:type="CD" code="{Nutritional/Value}" displayName="{Nutritional/Display}" codeSystem="2.16.156.10011.2.3.2.54" codeSystemName="营养状态代码表"/>
						</observation>
					</entry>
				</xsl:if>
				<xsl:if test="selfcare/Value !=''">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.122.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="自理能力代码"/>
							<!--HDSD00.09.086 DE05.10.122.00 自理能力代码 -->
							<value xsi:type="CD" code="{selfcare/Value}" displayName="{selfcare/Display}" codeSystem="2.16.156.10011.2.3.2.55" codeSystemName="自理能力代码表"/>
						</observation>
					</entry>
				</xsl:if>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="Symptoms/Symptom">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE04.01.118.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="主要症状名称"/>
				<!--HDSD00.09.084 DE04.01.117.00 主要症状名称 -->
				<value xsi:type="ST"><xsl:value-of select="symptomName/Value"/></value>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="AdmDiag/Diagnoses/Diagnosis">
		<component>
			<section>
				<code code="46241-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="HOSPITAL ADMISSION DX"/>
				<text/>
				<!--入院诊断编码 -->
				<xsl:apply-templates select="diag/code"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="diag/code">
		<xsl:if test="Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断编码"/>
					<!--HDSD00.09.054 DE05.01.024.00 入院诊断编码 -->
					<value xsi:type="CD" code="{Value}"  codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
						<xsl:if test="Display">
							<xsl:attribute name="displayName"><xsl:value-of select="Display"/></xsl:attribute>
						</xsl:if>
					</value>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<xsl:template match="NursingObservations">
		<component>
			<section>
				<code displayName="护理观察"/>
				<text/>
				<xsl:apply-templates select="NursingObservation"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="NursingObservation">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.031.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理观察项目名称"/>
				<!--HDSD00.09.022 DE02.10.031.00 护理观察项目名称 -->
				<value xsi:type="ST"><xsl:value-of select="item/Value"/></value>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理观察结果"/>
						<!--HDSD00.09.021 DE02.10.028.00 护理观察结果 -->
						<value xsi:type="ST"><xsl:value-of select="result/Value"/></value>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="PastHistory">
		<component>
			<section>
				<code code="11348-0" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="HISTORY OF PAST ILLNESS"/>
				<text/>
				<xsl:apply-templates select="Illnesses/Illness" mode="IllnessHistory"/>
				<!-- 传染病史 -->
				<xsl:comment>传染病史</xsl:comment>
				<xsl:apply-templates select="Infections/Infection" mode="InfectiousDiseaseHistory"/>
				<!-- 预防接种史 -->
				<xsl:comment>预防接种史</xsl:comment>
				<xsl:apply-templates select="Transfusions/Transfusion" />
				<!--手术史条目-->
				<xsl:apply-templates select="Surgeries/Surgery" mode="SurgeryHistory"/>
				<xsl:apply-templates select="BloodTransfusion"/>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.031.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="一般健康状况标志"/>
						<value xsi:type="BL" value="{healthStatus/Value}"/>
					</observation>
				</entry>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.119.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者传染性标志"/>
						<value xsi:type="BL" value="{infectionStatus/Value}"/>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="Header/encompassingEncounter/Locations/Location">
		<encompassingEncounter>
			<code/>
			<effectiveTime nullFlavor="NI"/>
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
	<xsl:template match="Allergy/Allergies">
		<!--过敏史章节-->
		<component>
			<section>
				<!--code code="10155-0" codeSystem="2.16.840.1.113883.6.1"
codeSystemName="LOINC" displayName="HISTORY OF ALLERGIES"/-->
				<code code="48765-2" displayName="Allergies, adverse reactions, alerts" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<xsl:apply-templates select="Item"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="Item">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<!--HDSD00.09.015 DE02.10.022.00 过敏史 -->
				<code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史"/>
				<value xsi:type="ST"><xsl:value-of select="allergen/Value"/></value>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="FamilyHistories">
		<component>
			<section>
				<code code="10157-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="HISTORY OF FAMILY MEMBER DISEASES"/>
				<text/>
				<xsl:apply-templates select="FamilyHistory"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="FamilyHistory">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.103.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="家族史"/>
				<!--HDSD00.09.033 DE02.10.103.00 家族史 -->
				<value xsi:type="ST"><xsl:value-of select="code/Value"/></value>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="BloodTransfusion">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.100.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血史"/>
				<!--HDSD00.09.059 DE02.10.100.00 输血史 -->
				<value xsi:type="ST"><xsl:value-of select="history/Value"/></value>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="Transfusions/Transfusion">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.101.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="预防接种史"/>
				<!--HDSD00.09.081 DE02.10.101.00 预防接种史 -->
				<value xsi:type="ST"><xsl:value-of select="name/Value"/></value>
			</observation>
		</entry>
	</xsl:template>
</xsl:stylesheet>
