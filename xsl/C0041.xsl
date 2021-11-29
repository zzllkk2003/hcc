<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/Document">
	<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			
			<!--
********************************************************
 CDA Header
********************************************************
-->
	<realmCode code="CN"/>
	<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
	<templateId root="2.16.156.10011.2.1.1.61"/>
	<!-- 文档流水号 -->
	<xsl:call-template name="DocumentNo"/>
	
	<title>交接班记录</title>
	<xsl:call-template name="effectiveTime"/>
	<xsl:call-template name="Confidentiality"/>
	<xsl:call-template name="languageCode"/>
	<setId/>
	<versionNumber/>

	<!--文档记录对象（患者） [1..*] contextControlCode="OP"表示本信息可以被重载-->
	<recordTarget typeCode="RCT" contextControlCode="OP">
		<patientRole classCode="PAT">
			<!--住院号-->
			<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
			<patient classCode="PSN" determinerCode="INSTANCE">
				<!--患者身份证号-->
				<!--患者身份证号码，必选-->
				<xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>	
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
		
	<!-- Authenticator签名 -->
	<xsl:for-each select="Header/Authenticators/Authenticator">
		<xsl:if test="assignedEntityCode = '交班者' or assignedEntityCode = '接班者'">
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
	
	<!--关联活动信息-->
	<xsl:if test="Header/RelatedDocuments/RelatedDocument">
		<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
	</xsl:if>
	
	<componentOf>
		<encompassingEncounter>
			<code displayName="{Header/encompassingEncounter/effectiveTimeLow/displayName}"/>
			<effectiveTime value="{Header/encompassingEncounter/effectiveTimeLow/Value}"/>
			<location>
				<healthCareFacility>
					<serviceProviderOrganization>
						<asOrganizationPartOf classCode="PART">
							<!-- DE01.00.026.00	病床号 -->
							<xsl:comment>病床号</xsl:comment>
							<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
								<xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
									<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
								</xsl:if>
								<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/bedNum/Value"/></name>
								<!-- DE01.00.019.00	病房号 -->
								<xsl:comment>病房号</xsl:comment>
								<asOrganizationPartOf classCode="PART">
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
											<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
										</xsl:if>
										
										<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/wardName/Value"/></name>
										<!-- DE08.10.026.00	科室名称 -->
										<xsl:comment>科室名称</xsl:comment>
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/deptId">
													<id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/deptId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptName/Value"/></name>
												<!-- DE08.10.054.00	病区名称 -->
												<xsl:comment>病区名称</xsl:comment>
												<asOrganizationPartOf classCode="PART">
													<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
														<xsl:if test="Header/encompassingEncounter/Locations/Location/areaId">
															<id root="2.16.156.10011.1.27" extension="{Header/encompassingEncounter/Locations/Location/areaId}"/>
														</xsl:if>
														
														<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
														<!--医疗机构名称 -->
														<xsl:comment>医疗机构名称</xsl:comment>
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
<!--***************************************************
文档体Body
*******************************************************
-->
	<component>
		<structuredBody>
			<!--主诉章节-->		
			<xsl:comment>主诉章节</xsl:comment>
			<xsl:apply-templates select="ChiefComplaint"></xsl:apply-templates>		
			<!--入院诊断章节-->	
			<xsl:comment>入院诊断章节</xsl:comment>
			<xsl:apply-templates select="AdmDiag"></xsl:apply-templates>
			<!--诊断章节-->
			<xsl:comment>诊断章节</xsl:comment>
			<xsl:apply-templates select="Diagnosis"></xsl:apply-templates>
			<!--治疗计划章节-->
			<xsl:comment>治疗计划章节</xsl:comment>
			<xsl:apply-templates select="TreatmentPlan"></xsl:apply-templates>
			<!--住院过程章节-->
			<xsl:comment>住院过程章节</xsl:comment>
			<xsl:apply-templates select="HospitalCourse"></xsl:apply-templates>
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
						<code code="DE04.01.119.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="主诉"/>
						<value xsi:type="ST"><xsl:value-of select="chiefComplaint/Value"/></value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	
	<!--入院诊断章节-->
	<xsl:template match="AdmDiag">
		<component>
			<section>
				<code code="46241-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="HOSPITAL ADMISSION DX" />
				<text/>
				<!--入院情况-->
				<xsl:comment>入院情况</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN ">
						<code code="DE05.10.148.00" displayName="入院情况" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST"><xsl:value-of select="admitCondition/Value"/></value>
					</observation>
				</entry>
				
				<!--入院诊断-西医诊断编码-->
				<xsl:comment>西医诊断编码</xsl:comment>
				<xsl:apply-templates select="Diagnoses/Diagnosis[diag/code/Value]"></xsl:apply-templates>
				
				<!--入院诊断-中医病名代码-->
				<xsl:comment>中医病名代码</xsl:comment>
				<xsl:apply-templates select="TCMs/TCM[diag/code/Value]"></xsl:apply-templates>
				
				<!--入院诊断-中医症候代码-->
				<xsl:comment>中医症候代码</xsl:comment>
				<xsl:apply-templates select="TCMs/TCM[syndrome/code/Value]"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	
	<!--诊断记录章节模板-->
	<xsl:template match="Diagnosis">
		<component>
			<section>
				<code code="29548-5" displayName="Diagnosis"  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--条目:目前情况-->
				<xsl:comment>目前情况</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN ">
						<code code="DE06.00.184.00" displayName="{situation/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST"><xsl:value-of select="situation/Value"/></value>
					</observation>
				</entry>
				<!--目前诊断-西医诊断编码-->
				<xsl:comment>目前诊断-西医诊断编码</xsl:comment>
				<xsl:apply-templates select="Westerns/Western[diag/code/Value]"></xsl:apply-templates>
				<!--目前诊断-中医病名代码-->
				<xsl:comment>中医病名代码</xsl:comment>
				<xsl:apply-templates select="TCM/TCM[TCMdiag/code/Value]"></xsl:apply-templates>
				
				<!--目前诊断-中医症候代码-->
				<xsl:comment>中医症候代码</xsl:comment>
				<xsl:apply-templates select="TCMSyndrome/TCMSyndrome[syndrome/code/Value]"></xsl:apply-templates>
				
				<!--中医“四诊”观察结果-->
				<xsl:comment>中医“四诊”观察结果</xsl:comment>
				<xsl:if test="TCMFourDiags/TCMFourDiagnostic/TCMFourDiagnostic/Value ">
					<entry>
						<observation classCode="OBS" moodCode="EVN ">
							<code code="DE02.10.028.00" displayName="中医“四诊”观察结果" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST"><xsl:value-of select="TCMFourDiags/TCMFourDiagnostic/TCMFourDiagnostic/Value"/></value>
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
				<code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1"  codeSystemName="LOINC"/>
				<text/>
				<!--接班诊疗计划-->
				<xsl:comment>接班诊疗计划</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.298.00" displayName="接班诊疗计划" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST"><xsl:value-of select="shiftPlan/Value"/></value> 
					</observation>
				</entry>
				
				<!--治则治法-->
				<xsl:comment>治则治法</xsl:comment>
				<xsl:if test="treatmentPrinciple/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.300.00" displayName="治则治法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST"><xsl:value-of select="treatmentPrinciple/Value"/></value> 	 
						</observation>
					</entry>
				</xsl:if>
				
				<!--注意事项-->
				<xsl:comment>注意事项</xsl:comment>
				<xsl:if test="caution/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN ">
							<code code="DE09.00.119.00" displayName="注意事项" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST"><xsl:value-of select="caution/Value"/></value>
						</observation>
					</entry>
				</xsl:if>
			</section>
		</component>
	</xsl:template>
	
	<!--住院过程章节-->
	<xsl:template match="HospitalCourse">
		<component>
			<section>
				<code code="8648-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Hospital Course"/>
				<text/>
				<!--诊疗过程描述--> 
				<xsl:comment>诊疗过程描述</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.296.00" displayName="诊疗过程描述"  codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST"><xsl:value-of select="treatmentCourse/Value"/></value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--入院诊断-西医诊断编码-->
	<xsl:template match="Diagnoses/Diagnosis[diag/code/Value]">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.024.00" displayName="入院诊断-西医诊断编码"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10" displayName="{diag/code/Display}" />
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="TCMs/TCM[diag/code/Value]">
		<!--入院诊断-中医病名代码-->
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.130.00" displayName="入院诊断-中医病名代码"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" />
				<value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)" displayName="{diag/code/Display}" />
			</observation>
		</entry>
	</xsl:template>
	<!--入院诊断-中医症候代码-->
	<xsl:template match="TCMs/TCM[syndrome/code/Value]">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.130.00" displayName="入院诊断-中医症候代码"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" />
				<value xsi:type="CD" code="{syndrome/code/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)" displayName="{syndrome/code/Display}" />
			</observation>
		</entry>
	</xsl:template>
	<!--目前诊断-西医诊断编码-->
	<xsl:template match="Westerns/Western[diag/code/Value]">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.024.00" displayName="目前诊断-西医诊断编码"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10" displayName="{diag/code/Display}" />
			</observation>
		</entry>	
	</xsl:template>
	<!--目前诊断-中医病名代码-->
	<xsl:template match="TCM/TCM[TCMdiag/code/Value]">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.130.00" displayName="目前诊断-中医病名代码"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="CD" code="{TCMdiag/code/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)" displayName="{TCMdiag/code/Display}" />
			</observation>
		</entry>
	</xsl:template>
	<!--目前诊断-中医症候代码-->
	<xsl:template match="TCMSyndrome/TCMSyndrome[syndrome/code/Value]">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.130.00" displayName="目前诊断-中医症候代码"  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="CD" code="{syndrome/code/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)" displayName="{syndrome/code/Display}" />
			</observation>
		</entry>
	</xsl:template>
</xsl:stylesheet>
