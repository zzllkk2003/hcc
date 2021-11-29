<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" indent="yes"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:include href="CDA-Support-Files/Diagnosis.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.52"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>阶段小结</title>
			<!-- 文档机器生成时间 -->
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--文档记录对象（患者）-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!--住院号-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者身份证号码，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 出生时间1..1 -->
						<xsl:apply-templates select="Header/recordTarget/Patient/birthTime" mode="BirthTime"/>
						<!-- 婚姻状况1..1 -->
						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"/>
					</patient>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '医师'">
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
			<!--小结日期时间-->
			<documentationOf>
				<serviceEvent>
					<code displayName="小结日期时间"/>
					<effectiveTime xsi:type="IVL_TS" value="201202031223"/>
				</serviceEvent>
			</documentationOf>
			<!--关联活动信息-->
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<componentOf>
				<xsl:apply-templates select="Header/encompassingEncounter/Locations/Location" mode="EncompassingEncounter"/>
			</componentOf>
			<!--****************************文档体Body********************-->
			<component>
				<structuredBody><!--主诉章节-->
					<xsl:comment>主诉章节</xsl:comment>
					<xsl:apply-templates select="ChiefComplaint"/>
					<!--入院诊断章节-->
					<xsl:comment>入院诊断章节</xsl:comment>				
					<!--入院诊断章节-->
					<component>
						<section>
							<code code="46241-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="HOSPITAL ADMISSION DX"/>
							<text/>
							<!--入院情况-->
							<xsl:apply-templates select="AdmDiag/admitCondition" mode="Diag148"/>
							<!--入院诊断-西医诊断名称-->
							<xsl:apply-templates select="AdmDiag/Diagnoses/Diagnosis[diag/code/Value]" mode="Diag043"/>
							<!--入院诊断-中医病名代码-->
							<xsl:apply-templates select="AdmDiag/TCMs/TCM[diag/code/Value]" mode="Diag130"/>
							<!--入院诊断-中医症候代码-->
							<xsl:apply-templates select="AdmDiag/TCMs/TCM[syndrome/code/Value]" mode="Diag130-2"/>
						</section>
					</component>
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
	</xsl:template><!--主诉章节模板-->
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
				<xsl:apply-templates select="Westerns/Western[diag/code/Value]"/>

				<!--目前诊断-中医病名代码-->
				<xsl:comment>中医病名代码</xsl:comment>
				<xsl:apply-templates select="TCM/TCM[TCMdiag/code/Value]"></xsl:apply-templates>	

				<!--目前诊断-中医症候代码-->
				<xsl:comment>中医症候代码</xsl:comment>
				<xsl:apply-templates select="TCMSyndrome/TCMSyndrome[syndrome/code/Value]"></xsl:apply-templates>
				
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
				<!--今后治疗方案--> 
				<xsl:comment>今后治疗方案</xsl:comment>
				<entry> 
					<observation classCode="OBS" moodCode="EVN"> 
						<code code="DE06.00.159.00" displayName="今后治疗方案" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>  
						<value xsi:type="ST"><xsl:value-of select="TreatmentPlan/plan/Value"/></value> 
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
	<!--目前诊断-西医诊断编码-->  
	<xsl:template match="Westerns/Western[diag/code/Value]">
		<!--目前诊断-->  
		<entry> 
			<observation classCode="OBS" moodCode="EVN"> 
				<code code="DE05.01.024.00" displayName="目前诊断-西医诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>  
				<value xsi:type="CD"  code="{diag/code/Value}" displayName="{diag/code/Display}"  codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/> 
			</observation> 
		</entry>  
	</xsl:template>
	<!--目前诊断-中医病名代码-->
	<xsl:template match="TCM/TCM[TCMdiag/code/Value]">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.130.00" displayName="目前诊断-中医病名代码"
					codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
					<qualifier>
						<name displayName="中医病名代码"/>
					</qualifier>
				</code>
				<value xsi:type="CD" code="{TCMdiag/code/Value}"
					codeSystem="2.16.156.10011.2.3.3.14"
					codeSystemName="中医病证分类与代码表( GB/T 15657)"
					displayName="{TCMdiag/code/Display}"/>
			</observation>
		</entry>	
	</xsl:template>
	<!--目前诊断-中医症候代码-->
	<xsl:template match="TCMSyndrome/TCMSyndrome[syndrome/code/Value]">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.130.00" displayName="目前诊断-中医症候代码"
					codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
					<qualifier>
						<name displayName="中医症候代码"/>
					</qualifier>
				</code>
				<value xsi:type="CD" code="{syndrome/code/Value}"
					codeSystem="2.16.156.10011.2.3.3.14"
					codeSystemName="中医病证分类与代码表( GB/T 15657)"
					displayName="{syndrome/code/Display}"/>
			</observation>
		</entry>
	</xsl:template>
</xsl:stylesheet>
