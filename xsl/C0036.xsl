<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:output method="xml"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<!--
********************************************************
 CDA Header
********************************************************
-->
	<realmCode code="CN"/>
	<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
	<templateId root="2.16.156.10011.2.1.1.56"/>
	<!-- 文档流水号 -->
	<xsl:call-template name="DocumentNo"/>
	<title>24h内入院死亡记录</title>
	<xsl:call-template name="effectiveTime"/>
	<xsl:call-template name="Confidentiality"/>
	<xsl:call-template name="languageCode"/>
	<setId/>
	<versionNumber/>
	<!--文档记录对象（患者） [1..*] contextControlCode="OP"表示本信息可以被重载-->
	<recordTarget typeCode="RCT" contextControlCode="OP">
		<patientRole classCode="PAT">
			<!-- 住院号标识 -->
			<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
			<!-- 现住址 -->
			<xsl:apply-templates select="Header/recordTarget/addr" mode="Address"/>
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
				<!-- 年龄 -->
				<xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"/>
				<!--职业状况-->
				<xsl:apply-templates select="Header/recordTarget/patient/occupationCode" mode="Occupation"/>
			</patient>
		</patientRole>
	</recordTarget>
	<!-- 文档创作者 -->
	<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
	<!-- 病史陈述者：未写，因为无此信息 -->
	<xsl:for-each select="Header/Informants/Informant">
		<informant>
			<assignedEntity>
				<id/>
				<!--陈述者与患者的关系代码-->
				<code code="{code/Value}" displayName="{code/Display}" codeSystem="2.16.156.10011.2.3.3.8" codeSystemName="家庭关系代码表（GB/T 4761）"/>
				<assignedPerson>
					<name><xsl:value-of select="name/Value"/></name>
				</assignedPerson>
			</assignedEntity>
		</informant>
	</xsl:for-each>
	<!-- 保管机构-数据录入者信息 -->
	<xsl:if test="Header/custodian">
		<xsl:apply-templates select="Header/custodian" mode="Custodian"/>	
	</xsl:if>
	
	<!-- LegalAuthenticator签名 -->
	<xsl:for-each select="Header/LegalAuthenticators/LegalAuthenticator">
		<xsl:if test="contains(assignedEntityCode,'主任')">
			<xsl:comment><xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
			<legalAuthenticator typeCode="LA">
				<!-- DE09.00.053.00	医师签名日期时间  -->
				<time value="{time/Value}"/>
				<signatureCode/>
				<assignedEntity>
					<id root="2.16.156.10011.1.5" extension="{assignedEntityId}"/>
					<assignedPerson>
						<name><xsl:value-of select="assignedPersonName/Value"/></name>
					</assignedPerson>
				</assignedEntity>
			</legalAuthenticator>	
		</xsl:if>
	</xsl:for-each>

	<!-- Authenticator签名 -->
	<xsl:for-each select="Header/Authenticators/Authenticator">
		<xsl:if test="assignedEntityCode = '接诊医师' or assignedEntityCode = '住院医师' or assignedEntityCode = '主治医师' ">
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
			<effectiveTime>
				<!-- 入院日期时间 -->
				<xsl:if test="Header/encompassingEncounter/effectiveTimeLow/Value">
					<low value="{Header/encompassingEncounter/effectiveTimeLow/Value}"/>
				</xsl:if>
				
				<!-- 出院日期时间 -->
				<xsl:if test="Header/encompassingEncounter/effectiveTimeHigh/Value">
					<high value="{Header/encompassingEncounter/effectiveTimeHigh/Value}"/>
				</xsl:if>
				
			</effectiveTime>
		</encompassingEncounter>
	</componentOf>
	<!--***************************************************
文档体Body
*******************************************************
-->
	<component>
		<structuredBody>
			<!--主诉章节-->
			<xsl:comment>主诉章节</xsl:comment>
			<xsl:apply-templates select="ChiefComplaint"></xsl:apply-templates>
			<!--主要健康问题章节 -->
			<xsl:comment>主要健康问题章节</xsl:comment>
			<xsl:apply-templates select="Problem"></xsl:apply-templates>
			<!--入院诊断章节-->
			<xsl:comment>入院诊断章节</xsl:comment>
			<xsl:apply-templates select="AdmDiag"></xsl:apply-templates>
			<!--治疗计划章节-->
			<xsl:comment>治疗计划章节</xsl:comment>
			<xsl:if test="TreatmentPlan">
				<xsl:apply-templates select="TreatmentPlan"></xsl:apply-templates>
			</xsl:if>
			<!--住院过程章节-->
			<xsl:comment>住院过程章节</xsl:comment>
			<xsl:call-template name="AdmProcess"></xsl:call-template>
		</structuredBody>
	</component>
		</ClinicalDocument>
	</xsl:template>
	
	<!--主诉章节模板-->
	<xsl:template match="ChiefComplaint">
		<component>
			<section>
				<code code="10154-3" displayName="CHIEF COMPLAINT" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--主诉条目-->
				<xsl:comment>主诉条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.01.119.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{chiefComplaint/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="chiefComplaint/Value"/></value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	
	<!--主要健康问题章节模板-->
	<xsl:template match="Problem">
		<component>
			<section>
				<code code="11450-4" displayName="PROBLEM LIST" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--陈述内容可靠标志-->
				<xsl:comment>陈述内容可靠标志</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.143.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{reliableStatement/displayName}"/>
						<value xsi:type="BL" value="{reliableStatement/Value}"/>
					</observation>
				</entry>
				<!--中医“四诊”观察结果条目-->
				<xsl:comment>中医“四诊”观察结果条目</xsl:comment>
				<xsl:apply-templates select="TCMObservation"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<!--中医“四诊”观察结果条目-->
	<xsl:template match="TCMObservation">
		<xsl:if test="Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中医“四诊”观察结果"/>
					<value xsi:type="ST"><xsl:value-of select="Value"/></value>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	
	<!--入院诊断章节模板-->
	<xsl:template match="AdmDiag">
		<component>
			<section>
				<code code="46241-6" displayName="HOSPITAL ADMISSION DX" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--入院诊断-西医条目-->
				<xsl:comment>西医条目</xsl:comment>
				<xsl:apply-templates select="Diagnoses/Diagnosis"></xsl:apply-templates>
				
				<!--入院诊断-中医条目-->
				<xsl:comment>中医条目</xsl:comment>
				<xsl:apply-templates select="TCMs/TCM"></xsl:apply-templates>
				
			</section>
		</component>
	</xsl:template>
	<!--入院诊断-西医条目-->
	<xsl:template match="Diagnoses/Diagnosis">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断-西医诊断名称"/>
				<xsl:if test="diag/name/Value">
					<value xsi:type="ST"><xsl:value-of select="diag/name/Value"/></value>
				</xsl:if>
				<xsl:if test="diag/code/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<!--入院诊断-西医诊断编码-代码-->
							<xsl:comment>西医诊断编码</xsl:comment>
							<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断-西医诊断编码"/>
							<xsl:choose>
								<xsl:when test="diag/code/Display">
									<value xsi:type="CD" code="{diag/code/Value}" displayName="{diag/code/Display}" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）"/>
								</xsl:when>
								<xsl:when test="not(diag/code/Display)">
									<value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）"/>
								</xsl:when>
							</xsl:choose>
							
						</observation>
					</entryRelationship>
				</xsl:if>
			</observation>
		</entry>
	</xsl:template>
	<!--入院诊断-中医条目-->
	<xsl:template match="TCMs/TCM">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断-中医病名名称"/>
				<xsl:if test="diag/name/Value">
					<value xsi:type="ST"><xsl:value-of select="diag/name/Value"/></value>
				</xsl:if>
				<xsl:if test="diag/code/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<!--入院诊断-中医诊断编码-代码-->
							<xsl:comment>中医诊断编码</xsl:comment>
							<code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断-中医病名代码"/>
							<xsl:choose>
								<xsl:when test="diag/code/Display">
									<value xsi:type="CD" code="{diag/code/Value}" displayName="{diag/code/Display}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表（GB/T 15657-1995）"/>
								</xsl:when>
								<xsl:when test="not(diag/code/Display)">
									<value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表（GB/T 15657-1995）"/>
								</xsl:when>
							</xsl:choose>
							
						</observation>
					</entryRelationship>
				</xsl:if>
				<xsl:if test="syndrome/name/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<!--入院诊断-中医证候编码-名称-->
							<xsl:comment>中医证候编码</xsl:comment>
							<code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断-中医证候名称"/>
							<value xsi:type="ST"><xsl:value-of select="syndrome/name/Value"/></value>
						</observation>
					</entryRelationship>
				</xsl:if>
				<xsl:if test="syndrome/code/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<!--入院诊断-中医证候编码-代码-->
							<xsl:comment>中医证候编码</xsl:comment>
							<code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断-中医证候代码"/>
							<xsl:choose>
								<xsl:when test="syndrome/code/Display">
									<value xsi:type="CD" code="{syndrome/code/Value}" displayName="{syndrome/code/Display}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表（GB/T 15657-1995）"/>
								</xsl:when>
								<xsl:when test="not(syndrome/code/Display)">
									<value xsi:type="CD" code="{syndrome/code/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表（GB/T 15657-1995）"/>
								</xsl:when>
							</xsl:choose>
						
						</observation>
					</entryRelationship>
				</xsl:if>
			</observation>
		</entry>
	</xsl:template>
	
	<!--治疗计划章节模板-->
	<xsl:template match="TreatmentPlan">
		<component>
			<section>
				<code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--治则治法条目-->
				<xsl:comment>治则治法条目</xsl:comment>
				<xsl:if test="treatmentPrinciple/Value">
					<entry>
						<observation classCode="OBS" moodCode="INT">
							<code code="DE06.00.300.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{treatmentPrinciple/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="treatmentPrinciple/Value"/></value>
						</observation>
					</entry>
				</xsl:if>
			</section>
		</component>
	</xsl:template>
	
	<!--住院过程章节章节模板-->
	<xsl:template name="AdmProcess">
		<component>
			<section>
				<code code="8648-8" displayName="HOSPITAL COURSE" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--入院情况条目-->
				<xsl:comment>入院情况条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.148.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院情况"/>
						<value xsi:type="ST"><xsl:value-of select="AdmDiag/admitCondition/Value"/></value>
					</observation>
				</entry>
				<!--诊疗过程描述条目-->
				<xsl:comment>诊疗过程描述条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.296.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="诊疗过程描述"/>
						<value xsi:type="ST"><xsl:value-of select="HospitalCourse/treatmentCourse/Value"/></value>
					</observation>
				</entry>
				<!--死亡日期时间条目-->
				<xsl:comment>死亡日期时间条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.01.036.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡日期时间"/>
						<effectiveTime>
							<high value="{HospitalCourse/deathTime/Value}"/>
						</effectiveTime>
					</observation>
				</entry>
				<!--死亡原因条目-->
				<xsl:comment>死亡原因条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.099.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡原因"/>
						<value xsi:type="ST"><xsl:value-of select="HospitalCourse/deathReason/Value"/></value>
					</observation>
				</entry>
				<!--死亡诊断-西医条目-->
				<xsl:comment>西医条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡诊断-西医诊断名称"/>
						<value xsi:type="ST"><xsl:value-of select="HospitalCourse/deathDiag/name/Value"/></value>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<!--死亡诊断-西医诊断编码-代码-->
								<xsl:comment>西医诊断编码</xsl:comment>
								<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡诊断-西医诊断编码"/>
								<xsl:choose>
									<xsl:when test="HospitalCourse/deathDiag/code/Value and HospitalCourse/deathDiag/code/Display ">
										<value xsi:type="CD" code="{HospitalCourse/deathDiag/code/Value}" displayName="{HospitalCourse/deathDiag/code/Display}" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）"/>
									</xsl:when>
									<xsl:when test="HospitalCourse/deathDiag/code/Value and not(HospitalCourse/deathDiag/code/Display) ">
										<value xsi:type="CD" code="{HospitalCourse/deathDiag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）"/>
									</xsl:when>
								</xsl:choose>
							
							</observation>
						</entryRelationship>
					</observation>
				</entry>
				<!--死亡诊断-中医条目-->
				<xsl:comment>中医条目</xsl:comment>
				<xsl:apply-templates select="HospitalCourse/TCMDiags/DeathTCMDiag"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<!--死亡诊断-中医条目-->
	<xsl:template match="HospitalCourse/TCMDiags/DeathTCMDiag">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡诊断-中医病名名称"/>
				<xsl:if test="TCMDiag/name/Value">
					<value xsi:type="ST"><xsl:value-of select="TCMDiag/name/Value"/></value>
				</xsl:if>
				<xsl:if test="TCMDiag/code/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<!--死亡诊断-中医诊断编码-代码-->
							<xsl:comment>中医诊断编码</xsl:comment>
							<code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡诊断-中医病名代码"/>
							<xsl:choose>
								<xsl:when test="TCMDiag/code/Display">
									<value xsi:type="CD" code="{TCMDiag/code/Value}" displayName="{TCMDiag/code/Display}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表（GB/T 15657-1995）"/>
								</xsl:when>
								<xsl:when test="not(TCMDiag/code/Display)">
									<value xsi:type="CD" code="{TCMDiag/code/Value}"  codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表（GB/T 15657-1995）"/>
								</xsl:when>
							</xsl:choose>
							
						</observation>
					</entryRelationship>
				</xsl:if>
				<xsl:if test="syndrome/name/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<!--死亡诊断-中医证候编码-名称-->
							<xsl:comment>中医证候编码</xsl:comment>
							<code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡诊断-中医证候名称"/>
							<value xsi:type="ST"><xsl:value-of select="syndrome/name/Value"/></value>
						</observation>
					</entryRelationship>
				</xsl:if>
				<xsl:if test="syndrome/code/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<!--死亡诊断-中医证候编码-代码-->
							<xsl:comment>中医证候编码</xsl:comment>
							<code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡诊断-中医证候代码"/>
							<xsl:choose>
								<xsl:when test="syndrome/code/Display">
									<value xsi:type="CD" code="{syndrome/code/Value}" displayName="{syndrome/code/Display}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表（GB/T 15657-1995）"/>
								</xsl:when>
								<xsl:when test="not(syndrome/code/Display)">
									<value xsi:type="CD" code="{syndrome/code/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表（GB/T 15657-1995）"/>
								</xsl:when>
							</xsl:choose>
							
						</observation>
					</entryRelationship>
				</xsl:if>
			</observation>
		</entry>
	</xsl:template>
</xsl:stylesheet>
