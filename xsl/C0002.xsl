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
			<templateId root="2.16.156.10011.2.1.1.22"/>

			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>门（急）诊病历</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>

			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					

					<!-- patient门（急）诊号标识 -->
					<xsl:apply-templates select="Header/recordTarget/outpatientNum" mode="outpatientNum"/>

					<!-- 电子申请单编号 -->
					<xsl:apply-templates select="Header/recordTarget/labOrderNum" mode="labOrderNum"/>

					<patient classCode="PSN" determinerCode="INSTANCE">
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

			<!-- LegalAuthenticator签名 -->
			<xsl:apply-templates select="Header/LegalAuthenticators/LegalAuthenticator[1]" mode="legalAuthenticator"/>

			<!--关联活动信息-->
			<xsl:if test="Header/RelatedDocuments/RelatedDocument">
				<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>	
			</xsl:if>

			<component>
				<structuredBody>
					<!-- 过敏史章节 -->
					<xsl:comment>过敏史章节</xsl:comment>
					<xsl:if test="Allergy">
						<xsl:apply-templates select="Allergy"/>
					</xsl:if>
					<!--主诉章节-->
					<xsl:comment>主诉章节</xsl:comment>
					<xsl:apply-templates select="ChiefComplaint"/>
					<!--现病史章节-->
					<xsl:comment>现病史章节</xsl:comment>
					<xsl:apply-templates select="PresentIllnessHistory"/>
					<!-- 既往史章节 -->
					<xsl:if test="PastHistory">
						<xsl:apply-templates select="PastHistory"/>	
					</xsl:if>
					<xsl:comment>既往史章节</xsl:comment>
					<!--体格检查章节-->		
					<xsl:comment>体格检查章节</xsl:comment>
					<xsl:if test="PresentIllnessHistory">
						<xsl:apply-templates select="PhysicalExams"/>
					</xsl:if>
					<!-- 实验室检验章节 -->				
					<xsl:comment>实验室检验章节</xsl:comment>
					<xsl:if test="PresentIllnessHistory">
						<xsl:apply-templates select="LabTest"/>
					</xsl:if>
					<!-- 诊断记录章节 -->
					<xsl:comment>诊断记录章节</xsl:comment>
					<xsl:apply-templates select="Diagnosis"/>
					<!-- 治疗计划章节 -->
					<xsl:comment>治疗计划章节</xsl:comment>
					<xsl:if test="PresentIllnessHistory">
						<xsl:apply-templates select="TreatmentPlan"/>
					</xsl:if>
					<!--医嘱章节-->
					<xsl:comment>医嘱章节</xsl:comment>
					<xsl:if test="PresentIllnessHistory">
						<xsl:apply-templates select="ProviderOrder"/>
					</xsl:if>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>

	<!--过敏史章节模板-->
	<xsl:template match="Allergy">
		<component>
			<section>
				<code code="48765-2" displayName="Allergies, adverse reactions, alerts"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.10.023.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{active/displayName}"/>
						<value xsi:type="BL" value="{active/Value}"/>
						<!--过敏史条目-->
						<xsl:comment>过敏史条目</xsl:comment>
						<xsl:apply-templates select="Allergies/Item"/>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--过敏史条目-->
	<xsl:template match="Allergies/Item">
		<xsl:if test="allergen/Value">
			<entryRelationship typeCode="COMP">
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.01.022.00" displayName="{allergen/displayName}"
						codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
					<value xsi:type="ST">
						<xsl:value-of select="allergen/Value"/>
					</value>
				</observation>
			</entryRelationship>
		</xsl:if>	
	</xsl:template>

	<!--主诉章节模板-->
	<xsl:template match="ChiefComplaint">
		<component>
			<section>
				<code code="10154-3" displayName="CHIEF COMPLAINT"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--主诉条目-->
				<xsl:comment>主诉条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.01.119.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{chiefComplaint/displayName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="chiefComplaint/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--现病史章节模板-->
	<xsl:template match="PresentIllnessHistory">
		<component>
			<section>
				<code code="10164-2" displayName="HISTORY OF PRESENT ILLNESS"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--现病史条目-->
				<xsl:comment>现病史条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.10.071.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{presentIllness/displayName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="presentIllness/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--既往史章节模板-->
	<xsl:template match="PastHistory">
		<component>
			<section>
				<code code="11348-0" displayName="HISTORY OF PAST ILLNESS"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--既往史条目-->
				<xsl:comment>既往史条目</xsl:comment>
				<xsl:apply-templates select="Healths/Health"/>
			</section>
		</component>
	</xsl:template>
	<!--既往史条目-->
	<xsl:template match="Healths/Health">
		<xsl:if test="name/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE02.10.099.00" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录" displayName="{name/displayName}"/>
					<value xsi:type="ST">
						<xsl:value-of select="name/Value"/>
					</value>
				</observation>
			</entry>	
		</xsl:if>
	</xsl:template>

	<!--体格检查章节模板-->
	<xsl:template match="PhysicalExams">
		<component>
			<section>
				<code code="29545-1" displayName="PHYSICAL EXAMINATION"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--体格检查-一般状况检查结果条目-->
				<xsl:comment>体格检查-一般状况检查结果条目</xsl:comment>
				<xsl:apply-templates select="PhysicalExam"/>
			</section>
		</component>
	</xsl:template>
	<!--一般体格检查结果条目-->
	<xsl:template match="PhysicalExam">
		<xsl:if test="value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.258.00" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录" displayName="体格检查"/>
					<value xsi:type="ST">
						<xsl:value-of select="value"/>
					</value>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>

	<!--实验室检验章节模板-->
	<xsl:template match="LabTest">
		<component>
			<section>
				<code code="30954-2" displayName="STUDIES SUMMARY"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--辅助检查项目条目-->
				<xsl:comment>辅助检查项目条目</xsl:comment>
				<xsl:apply-templates select="AuxExams/AuxExam"/>
			</section>
		</component>
	</xsl:template>
	<!--辅助检查项目条目-->
	<xsl:template match="AuxExams/AuxExam">
		<xsl:if test="name/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.30.010.00" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录" displayName="{name/displayName}"/>
					<value xsi:type="ST">
						<xsl:value-of select="name/Value"/>
					</value>
				</observation>
			</entry>
		</xsl:if>	
		<xsl:if test="result/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.30.009.00" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录" displayName="{result/displayName}"/>
					<value xsi:type="ST">
						<xsl:value-of select="result/Value"/>
					</value>
				</observation>
			</entry>
		</xsl:if>	
	</xsl:template>

	<!--诊断记录章节模板-->
	<xsl:template match="Diagnosis">
		<component>
			<section>
				<code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1"
					codeSystemName="LOINC"/>
				<text/>
				<!--初诊标志代码-->
				<xsl:comment>初诊标志代码</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.196.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="初诊标志代码"/>
						<xsl:choose>
							<xsl:when test="firstVisit/Value and firstVisit/Display">
								<value xsi:type="CD" code="{firstVisit/Value}"
									codeSystem="2.16.156.10011.2.3.2.39" codeSystemName="初诊标志代码表"
									displayName="{firstVisit/Display}"/>
							</xsl:when>
							<xsl:when test="firstVisit/Value and not(firstVisit/Display)">
								<value xsi:type="CD" code="{firstVisit/Value}"
									codeSystem="2.16.156.10011.2.3.2.39" codeSystemName="初诊标志代码表"
									/>
							</xsl:when>
						</xsl:choose>
						
					</observation>
				</entry>
				<!--中医“四诊”观察结果-->
				<xsl:comment>中医“四诊”观察结果</xsl:comment>
				<xsl:if test="TCMFourDiags/TCMFourDiagnostic/TCMFourDiagnostic/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE02.10.028.00" displayName="中医“四诊”观察结果"
								codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of
									select="TCMFourDiags/TCMFourDiagnostic/TCMFourDiagnostic/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
				<!--西医诊断条目-->
				<xsl:comment>西医诊断条目</xsl:comment>
				<xsl:apply-templates select="Westerns/Western"/>
				<!--中医病名条目-->
				<xsl:comment>中医病名条目</xsl:comment>
				<xsl:apply-templates select="TCM/TCM"/>
				<!--中医症候条目-->
				<xsl:comment>中医症候条目</xsl:comment>
				<xsl:apply-templates select="TCMSyndrome/TCMSyndrome"/>
			</section>
		</component>
	</xsl:template>
	<!--西医诊断条目-->
	<xsl:template match="Westerns/Western">
		<xsl:if test="diag/code/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.01.024.00" displayName="诊断代码"
						codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
					<value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11.1"
						codeSystemName="诊断代码表（ICD-10）" displayName ="{diag/code/Display}"/>
				</observation>
			</entry>
		</xsl:if>	
		<xsl:if test="diag/code/Display">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.01.025.00" displayName="诊断名称"
						codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
					<value xsi:type="ST">
						<xsl:value-of select="diag/code/Display"/>
					</value>
				</observation>
			</entry>
		</xsl:if>
		
	</xsl:template>
	<!--中医病名条目-->
	<xsl:template match="TCM/TCM">
		<xsl:if test="TCMdiag/code/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.10.130.00" displayName="中医病名代码" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录">
						<qualifier>
							<name displayName="中医病名代码"/>
						</qualifier>
					</code>
					<value xsi:type="CD" code="{TCMdiag/code/Value}"
						codeSystem="2.16.156.10011.2.3.3.14"
						codeSystemName="中医病证分类与代码表（ GB/T 15657-1995）" displayName="{TCMdiag/code/Display}"/>
				</observation>
			</entry>
		</xsl:if>
		<xsl:if test="TCMdiag/code/Display">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.10.172.00" displayName="中医病名名称" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录">
						<qualifier>
							<name displayName="中医病名名称"/>
						</qualifier>
					</code>
					<value xsi:type="ST">
						<xsl:value-of select="TCMdiag/code/Display"/>
					</value>
				</observation>
			</entry>
		</xsl:if>	
	</xsl:template>
	<!--中医症候条目-->
	<xsl:template match="TCMSyndrome/TCMSyndrome">
		<xsl:if test="syndrome/code/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.10.130.00" displayName="中医证候代码" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录">
						<qualifier>
							<name displayName="中医证候代码"/>
						</qualifier>
					</code>
					<value xsi:type="CD" code="{syndrome/code/Value}"
						codeSystem="2.16.156.10011.2.3.3.14"
						codeSystemName="中医病证分类与代码表（ GB/T 15657-1995）" displayName="{syndrome/code/Display}"/>
				</observation>
			</entry>
		</xsl:if>	
		<xsl:if test="syndrome/code/Display">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.10.172.00" displayName="中医证候名称" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录">
						<qualifier>
							<name displayName="中医证候名称"/>
						</qualifier>
					</code>
					<value xsi:type="ST">
						<xsl:value-of select="syndrome/code/Display"/>
					</value>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>

	<!--治疗计划章节模板-->
	<xsl:template match="TreatmentPlan">
		<component>
			<section>
				<code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1"
					codeSystemName="LOINC"/>
				<text/>
				<!--辨证依据描述条目-->
				<xsl:comment>辨证依据描述条目</xsl:comment>
				<xsl:if test="differentiationBasis/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.132.00" displayName="{differentiationBasis/displayName}"
								codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of select="differentiationBasis/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
				
				<!--治则治法条目-->
				<xsl:comment>治则治法条目</xsl:comment>
				<xsl:if test="treatmentPrinciple/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.300.00" displayName="{treatmentPrinciple/displayName}"
								codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of select="treatmentPrinciple/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
			</section>
		</component>
	</xsl:template>

	<!--医嘱章节模板-->
	<xsl:template match="ProviderOrder">
		<component>
			<section>
				<code code="46209-3" codeSystem="2.16.840.1.113883.6.1"
					displayName="Provider Orders" codeSystemName="LOINC"/>
				<text/>
				<!--医嘱条目-->
				<xsl:comment>医嘱条目</xsl:comment>
				<xsl:apply-templates select="Items/Item"/>
			</section>
		</component>
	</xsl:template>
	<!--医嘱条目-->
	<xsl:template match="Items/Item">
		<entry>
			<organizer classCode="CLUSTER" moodCode="EVN">
				<statusCode/>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.289.00" displayName="医嘱项目类型"
							codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<xsl:choose>
							<xsl:when test="orderType/Value and orderType/Display">
								<value xsi:type="CD" code="{orderType/Value}"
									displayName="{orderType/Display}"
									codeSystem="2.16.156.10011.2.3.1.268" codeSystemName="医嘱项目类型代码表"/>
							</xsl:when>
							<xsl:when test="orderType/Value and not(orderType/Display)">
								<value xsi:type="CD" code="{orderType/Value}"
									codeSystem="2.16.156.10011.2.3.1.268" codeSystemName="医嘱项目类型代码表"/>
							</xsl:when>
						</xsl:choose>
						
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.288.00" displayName="医嘱项目内容"
							codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<effectiveTime>
							<!--医嘱计划开始日期时间-->
							<xsl:comment>医嘱计划开始日期时间</xsl:comment>
							<low value="{plannedBeginTime/Value}"/>
							<!--医嘱计划结束日期时间-->
							<xsl:comment>医嘱计划结束日期时间</xsl:comment>
							<high value="{plannedEndTime/Value}"/>
						</effectiveTime>
						<!--医嘱计划信息-->
						<xsl:comment>医嘱计划信息</xsl:comment>
						<value xsi:type="ST">
							<xsl:value-of select="orderItem/Value"/>
						</value>
						<!--执行者-->
						<xsl:comment>执行者</xsl:comment>
						<performer>
							<!--医嘱执行日期时间：DE06.00.222.00-->
							<time value="{exec/Time/Value}"/>
							<assignedEntity>
								<id/>
								<code/>
								<!--医嘱执行者签名：DE02.01.039.00-->
								<xsl:comment>医嘱执行者签名</xsl:comment>
								<assignedPerson>
									<name>
										<xsl:value-of select="exec/provider/Value"/>
									</name>
								</assignedPerson>
								<!--医嘱执行科室：DE08.10.026.00-->
								<xsl:comment>医嘱执行科室</xsl:comment>
								<representedOrganization>
									<name>
										<xsl:value-of select="exec/Dept/Value"/>
									</name>
								</representedOrganization>
							</assignedEntity>
						</performer>
						<!--作者：医嘱开立者-->
						<xsl:comment>医嘱开立者</xsl:comment>
						<author>
							<!--医嘱开立日期时间：DE06.00.220.00-->
							<time value="{place/Time/Value}"/>
							<assignedAuthor>
								<id/>
								<!--医嘱开立者签名：DE02.01.039.00-->
								<xsl:comment>医嘱开立者签名</xsl:comment>
								<assignedPerson>
									<name>
										<xsl:value-of select="place/provider/Value"/>
									</name>
								</assignedPerson>
								<!--医嘱开立科室：DE08.10.026.00-->
								<xsl:comment>医嘱开立科室</xsl:comment>
								<representedOrganization>
									<name>
										<xsl:value-of select="place/Dept/Value"/>
									</name>
								</representedOrganization>
							</assignedAuthor>
						</author>
						<!--医嘱审核-->
						<xsl:comment>医嘱审核</xsl:comment>
						<participant typeCode="ATND">
							<!--医嘱审核日期时间：DE09.00.088.00-->
							<time value="{review/Time/Value}"/>
							<participantRole classCode="ASSIGNED">
								<!--角色-->
								<code displayName="医嘱审核人"/>				
								<!--医嘱审核人签名：DE02.01.039.00-->
								<xsl:comment>医嘱审核人签名</xsl:comment>
								<playingEntity classCode="PSN" determinerCode="INSTANCE">
									<name>
										<xsl:value-of select="review/provider/Value"/>
									</name>
								</playingEntity>
							</participantRole>
						</participant>
						<!--医嘱取消-->
						<xsl:comment>医嘱取消</xsl:comment>
						<participant typeCode="ATND">
							<!--医嘱取消日期时间：DE06.00.234.00-->
							<xsl:comment>医嘱取消日期时间</xsl:comment>
							<time value="{cancel/Time/Value}"/>
							<participantRole classCode="ASSIGNED">
								<!--角色-->
								<code displayName="医嘱取消人"/>
								<!--取消医嘱者签名：DE02.01.039.00-->
								<xsl:comment>取消医嘱者签名</xsl:comment>
								<playingEntity classCode="PSN" determinerCode="INSTANCE">
									<name>
										<xsl:value-of select="cancel/provider/Value"/>
									</name>
								</playingEntity>
							</participantRole>
						</participant>
						<!--医嘱备注信息-->
						<xsl:comment>医嘱备注信息</xsl:comment>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.179.00" displayName="{notes/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
								<value xsi:type="ST"><xsl:value-of select="notes/Value"/></value>
							</observation>
						</entryRelationship>
						<!--医嘱执行状态-->
						<xsl:comment>医嘱执行状态</xsl:comment>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.290.00" displayName="{exec/status/displayName}"
									codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
								<value xsi:type="ST">
									<xsl:value-of select="exec/status/Value"/>
								</value>
							</observation>
						</entryRelationship>
					</observation>
				</component>
			</organizer>
		</entry>
	</xsl:template>

</xsl:stylesheet>
