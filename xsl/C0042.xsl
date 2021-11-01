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
			<!--疾病诊断章节-->
			<!--
********************************************************
 CDA Header
********************************************************
-->
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.62"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>

			<title>转科记录</title>
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
						<!--患者身份证号码，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>	
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
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
				<xsl:if test="assignedEntityCode = '转入医师' or assignedEntityCode = '转出医师'">
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
					<xsl:if test="Header/encompassingEncounter/effectiveTimeLow/Value">
						<code displayName="{Header/encompassingEncounter/effectiveTimeLow/displayName}"/>
						<effectiveTime value="{Header/encompassingEncounter/effectiveTimeLow/Value}"/>
					</xsl:if>
					
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
											<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/wardName/Value"/></name>
												<!-- DE08.10.026.00	科室名称 -->
												<xsl:comment>科室名称</xsl:comment>
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/deptId">
													<id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/deptId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptName/Value"/></name>
												<!-- DE08.10.054.00	病区名称 -->
												<xsl:comment>病区名称</xsl:comment>
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/areaId">
													<id root="2.16.156.10011.1.27" extension="{Header/encompassingEncounter/Locations/Location/areaId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
												<!--医疗机构名称 -->
												<xsl:comment>医疗机构名称</xsl:comment>
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
			<!--***************************************************
文档体Body
*******************************************************
-->
			<component>
				<structuredBody>
					<!--主诉章节-->
					<xsl:comment>主诉章节</xsl:comment>
					<xsl:apply-templates select="ChiefComplaint"/>
					<!--入院诊断章节-->
					<xsl:comment>入院诊断章节</xsl:comment>
					<xsl:apply-templates select="AdmDiag"/>
					<!--诊断记录章节-->
					<xsl:comment>诊断记录章节</xsl:comment>
					<xsl:apply-templates select="Diagnosis"/>
					<!--治疗计划章节-->
					<xsl:comment>治疗计划章节</xsl:comment>
					<xsl:call-template name="TreatmentPlan"/>
					<!--转科记录章节-->
					<xsl:comment>转科记录章节</xsl:comment>
					<xsl:apply-templates select="Referral"/>
					<!--用药章节-->
					<xsl:comment>用药章节</xsl:comment>
					<xsl:apply-templates select="MedicationUseHistory"/>
					<!--住院过程章节-->
					<xsl:comment>住院过程章节</xsl:comment>
					<xsl:apply-templates select="HospitalCourse"/>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>

	<!--主诉章节模板-->
	<xsl:template match="ChiefComplaint">
		<component>
			<section>
				<code code="10154-3" displayName="CHIEF COMPLAINT"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<entry typeCode="COMP" contextConductionInd="true">
					<!-- 主诉-->
					<xsl:comment>主诉</xsl:comment>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.01.119.00" displayName="主诉"
							codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST">
							<xsl:value-of select="chiefComplaint/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--入院诊断章节模板-->
	<xsl:template match="AdmDiag">
		<component>
			<section>
				<code code="46241-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
					displayName="HOSPITAL ADMISSION DX"/>
				<text/>

				<!--入院情况-->
				<xsl:comment>入院情况</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN ">
						<code code="DE05.10.148.00" displayName="入院情况"
							codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST">
							<xsl:value-of select="admitCondition/Value"/>
						</value>
					</observation>
				</entry>

				<!--入院诊断-西医诊断编码-->
				<xsl:comment>西医诊断编码</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.024.00" displayName="入院诊断-西医诊断编码"
							codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<xsl:choose>
							<xsl:when test="Diagnoses/Diagnosis[1]/diag/code/Value and Diagnoses/Diagnosis[1]/diag/code/Display">
								<value xsi:type="CD" code="{Diagnoses/Diagnosis[1]/diag/code/Value}"
									codeSystem="2.16.156.10011.2.3.3.11"
									displayName="{Diagnoses/Diagnosis[1]/diag/code/Display}"
									codeSystemName="ICD-10"/>
							</xsl:when>
							<xsl:when test="Diagnoses/Diagnosis[1]/diag/code/Value and not(Diagnoses/Diagnosis[1]/diag/code/Display)">
								<value xsi:type="CD" code="{Diagnoses/Diagnosis[1]/diag/code/Value}"
									codeSystem="2.16.156.10011.2.3.3.11"
									codeSystemName="ICD-10"/>
							</xsl:when>
						</xsl:choose>
						
					</observation>
				</entry>

				<!--入院诊断-中医病名代码-->
				<xsl:comment>中医病名代码</xsl:comment>
				<xsl:if test="TCMs/TCM[1]/diag/code/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.130.00" displayName="入院诊断-中医病名代码"
								codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
								<qualifier>
									<name displayName="中医病名代码"/>
								</qualifier>
							</code>
							<xsl:choose>
								<xsl:when test="TCMs/TCM[1]/diag/code/Display">
									<value xsi:type="CD" code="{TCMs/TCM[1]/diag/code/Value}"
										codeSystem="2.16.156.10011.2.3.3.14"
										codeSystemName="中医病证分类与代码表（ GB/T 15657-1995）"
										displayName="{TCMs/TCM[1]/diag/code/Display}"/>
								</xsl:when>
								<xsl:when test="not(TCMs/TCM[1]/diag/code/Display)">
									<value xsi:type="CD" code="{TCMs/TCM[1]/diag/code/Value}"
										codeSystem="2.16.156.10011.2.3.3.14"
										codeSystemName="中医病证分类与代码表（ GB/T 15657-1995）"
										/>
								</xsl:when>
							</xsl:choose>		
						</observation>
					</entry>
				</xsl:if>

				<!--入院诊断-中医症候代码-->
				<xsl:comment>中医症候代码</xsl:comment>
				<xsl:if test="TCMs/TCM[1]/syndrome/code/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.130.00" displayName="入院诊断-中医症候代码"
								codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
								<qualifier>
									<name displayName="中医症候名称"/>
								</qualifier>
							</code>
							<xsl:choose>
								<xsl:when test="TCMs/TCM[1]/syndrome/code/Display">
									<value xsi:type="CD" code="{TCMs/TCM[1]/syndrome/code/Value}"
										codeSystem="2.16.156.10011.2.3.3.14"
										codeSystemName="中医病证分类与代码表（ GB/T 15657-1995）"
										displayName="{TCMs/TCM[1]/syndrome/code/Display}"/>
								</xsl:when>
								
								<xsl:when test="not(TCMs/TCM[1]/syndrome/code/Display)">
									<value xsi:type="CD" code="{TCMs/TCM[1]/syndrome/code/Value}"
										codeSystem="2.16.156.10011.2.3.3.14"
										codeSystemName="中医病证分类与代码表（ GB/T 15657-1995）"
										/>
								</xsl:when>
							</xsl:choose>
											
						</observation>
					</entry>
				</xsl:if>	
			</section>
		</component>
	</xsl:template>

	<!--诊断记录章节模板-->
	<xsl:template match="Diagnosis">
		<component>
			<section>
				<code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1"
					codeSystemName="LOINC"/>
				<text/>
				<!--条目:目前情况-->
				<xsl:comment>目前情况</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN ">
						<code code="DE06.00.184.00" displayName="目前情况"
							codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST">
							<xsl:value-of select="situation/Value"/>
						</value>
					</observation>
				</entry>

				<!--目前诊断-西医诊断编码-->
				<xsl:comment>目前诊断-西医诊断编码</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.024.00" displayName="目前诊断-西医诊断编码"
							codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<xsl:choose>
							<xsl:when test="Westerns/Western[1]/diag/code/Value and Westerns/Western[1]/diag/code/Display">
								<value xsi:type="CD" code="{Westerns/Western[1]/diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11"
									displayName="{Westerns/Western[1]/diag/code/Display}" codeSystemName="ICD-10"/>
							</xsl:when>
							<xsl:when test="Westerns/Western[1]/diag/code/Value and not(Westerns/Western[1]/diag/code/Display)">
								<value xsi:type="CD" code="{Westerns/Western[1]/diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11"
									codeSystemName="ICD-10"/>
							</xsl:when>
						</xsl:choose>
						
					</observation>
				</entry>

				<!--目前诊断-中医病名代码-->
				<xsl:comment>中医病名代码</xsl:comment>
				<xsl:if test="TCM/TCM[1]/TCMdiag/code/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.130.00" displayName="目前诊断-中医病名代码"
								codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
								<qualifier>
									<name displayName="中医病名代码"/>
								</qualifier>
							</code>
							<xsl:choose>
								<xsl:when test="TCM/TCM[1]/TCMdiag/code/Display">
									<value xsi:type="CD" code="{TCM/TCM[1]/TCMdiag/code/Value}"
										codeSystem="2.16.156.10011.2.3.3.14"
										codeSystemName="中医病证分类与代码表（ GB/T 15657-1995）"
										displayName="{TCM/TCM[1]/TCMdiag/code/Display}"/>
								</xsl:when>
								<xsl:when test="not(TCM/TCM[1]/TCMdiag/code/Display)">
									<value xsi:type="CD" code="{TCM/TCM[1]/TCMdiag/code/Value}"
										codeSystem="2.16.156.10011.2.3.3.14"
										codeSystemName="中医病证分类与代码表（ GB/T 15657-1995）"
										/>
								</xsl:when>
							</xsl:choose>
							
						</observation>
					</entry>
				</xsl:if>	

				<!--目前诊断-中医症候代码-->
				<xsl:comment>中医症候代码</xsl:comment>
				<xsl:if test="TCMSyndrome/TCMSyndrome[1]/syndrome/code/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.130.00" displayName="目前诊断-中医症候代码"
								codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
								<qualifier>
									<name displayName="中医症候代码"/>
								</qualifier>
							</code>
							<xsl:choose>
								<xsl:when test="TCMSyndrome/TCMSyndrome[1]/syndrome/code/Display">
									<value xsi:type="CD" code="{TCMSyndrome/TCMSyndrome[1]/syndrome/code/Value}"
										codeSystem="2.16.156.10011.2.3.3.14"
										codeSystemName="中医病证分类与代码表（ GB/T 15657-1995）"
										displayName="{TCMSyndrome/TCMSyndrome[1]/syndrome/code/Display}"/>
								</xsl:when>
								<xsl:when test="not(TCMSyndrome/TCMSyndrome[1]/syndrome/code/Display)">
									<value xsi:type="CD" code="{TCMSyndrome/TCMSyndrome[1]/syndrome/code/Value}"
										codeSystem="2.16.156.10011.2.3.3.14"
										codeSystemName="中医病证分类与代码表（ GB/T 15657-1995）"
										/>
								</xsl:when>
							</xsl:choose>
							
						</observation>
					</entry>
				</xsl:if>
				
				<!--中医“四诊”观察结果-->
				<xsl:comment>中医“四诊”观察结果</xsl:comment>
				<xsl:if test="TCMFourDiags/TCMFourDiagnostic/TCMFourDiagnostic/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN ">
							<code code="DE02.10.028.00" displayName="中医“四诊”观察结果"
								codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of
									select="TCMFourDiags/TCMFourDiagnostic/TCMFourDiagnostic/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>		
			</section>
		</component>
	</xsl:template>

	<!--治疗计划章节模板-->
	<xsl:template name="TreatmentPlan">
		<component>
			<section>
				<code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1"
					codeSystemName="LOINC"/>
				<text/>
				<!--转科目的-->
				<xsl:comment>转科目的</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.315.00" displayName="转科目的"
							codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST">
							<xsl:value-of select="Referral/referralReason/Value"/>
						</value>
					</observation>
				</entry>

				<!-- 转入诊疗计划	患者转入科室后的诊疗计划，具体的检查、中西医治疗措施及中医调护-->
				<xsl:comment>转入诊疗计划</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.298.00" displayName="转入诊疗计划"
							codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST">
							<xsl:value-of select="TreatmentPlan/shiftPlan/Value"/>
						</value>
					</observation>
				</entry>

				<!--治则治法-->
				<xsl:comment>治则治法</xsl:comment>
				<xsl:if test="TreatmentPlan/treatmentPrinciple/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.300.00" displayName="治则治法"
								codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of select="TreatmentPlan/treatmentPrinciple/Value"/>
							</value>
							
						</observation>
					</entry>
					
				</xsl:if>
				
				<!--注意事项-->
				<xsl:comment>注意事项</xsl:comment>
				<xsl:if test="TreatmentPlan/caution/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN ">
							<code code="DE09.00.119.00" displayName="注意事项"
								codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of select="TreatmentPlan/caution/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
			</section>
		</component>
	</xsl:template>

	<!--转科记录章节模板-->
	<xsl:template match="Referral">
		<component>
			<section>
				<code displayName="转科记录"/>
				<text/>
				<xsl:comment>转科记录</xsl:comment>
				<entry>
					<observation classCode="OBS " moodCode="EVN">
						<code code="DE06.00.314.00" displayName="转科记录类型"
							codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<xsl:choose>
							<xsl:when test="referralType/Value and referralType/Display">
								<value xsi:type="CD" code="{referralType/Value}"
									codeSystem="2.16.156.10011.2.3.2.56" codeSystemName="转科记录类型代码表"
									displayName="{referralType/Display}"/>
							</xsl:when>
							<xsl:when test="referralType/Value and not(referralType/Display)">
								<value xsi:type="CD" code="{referralType/Value}"
									codeSystem="2.16.156.10011.2.3.2.56" codeSystemName="转科记录类型代码表"
								/>
							</xsl:when>
						</xsl:choose>
						
					</observation>
				</entry>

				<!--转出科室-->
				<xsl:comment>转出科室</xsl:comment>
				<entry>
					<observation classCode="OBS " moodCode="EVN ">
						<code code="DE08.10.026.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="转出科室名称"/>
						<value xsi:type="ST">
							<xsl:value-of select="referralTarget/Value"/>
						</value>
					</observation>
				</entry>

				<!--转入科室-->
				<xsl:comment>转入科室</xsl:comment>
				<entry>
					<observation classCode="OBS " moodCode="EVN ">
						<code code="DE08.10.026.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="转入科室名称"/>
						<value xsi:type="ST">
							<xsl:value-of select="referralSource/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--用药章节模板-->
	<xsl:template match="MedicationUseHistory">
		<component>
			<section>
				<code code="10160-0" displayName="HISTORY OF MEDICATION USE"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--中药处方医嘱内容-->
				<xsl:comment>中药处方医嘱内容</xsl:comment>
				<xsl:if test="content/Value">
					<entry>
						<observation classCode="OBS " moodCode="EVN ">
							<code code="DE06.00.287.00" displayName="中药处方医嘱内容"
								codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of select="content/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>

				<!--中药煎煮方法-->
				<xsl:comment>中药煎煮方法</xsl:comment>
				<xsl:if test="TCMCook/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN ">
							<code code="DE08.50.047.00" displayName="中药煎煮方法"
								codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of select="TCMCook/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
				
				<!--中药用药方法-->
				<xsl:comment>中药用药方法</xsl:comment>
				<xsl:if test="TCMUseWay/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN ">
							<code code="DE06.00.136.00" displayName="中药用药方法"
								codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of select="TCMUseWay/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
			</section>
		</component>
	</xsl:template>

	<!--住院过程章节模板-->
	<xsl:template match="HospitalCourse">
		<component>
			<section>
				<code code="8648-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
					displayName="Hospital Course"/>
				<text/>
				<!--诊疗过程描述-->
				<xsl:comment>诊疗过程描述</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.296.00" displayName="诊疗过程描述"
							codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST">
							<xsl:value-of select="treatmentCourse/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

</xsl:stylesheet>
