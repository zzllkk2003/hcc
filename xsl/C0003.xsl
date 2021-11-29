<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.23"/>

			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>急诊留观病历</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>

			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">

					<!-- 门（急）诊号标识 -->
					<xsl:apply-templates select="Header/recordTarget/outpatientNum"
						mode="outpatientNum"/>
					<!-- 电子申请单编号 -->
					<xsl:apply-templates select="Header/recordTarget/labOrderNum" mode="labOrderNum"/>

					<xsl:apply-templates select="Header/recordTarget/telcom" mode="PhoneNumber"/>
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
						<xsl:apply-templates select="Header/recordTarget/patient/birthTime"
							mode="BirthTime"/>
						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear"
							mode="Age"/>
					</patient>
					<!--提供患者服务机构-->
					<xsl:apply-templates select="Header/recordTarget/providerOrganization"
						mode="providerOrganization"/>
				</patientRole>
			</recordTarget>

			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>

			<!-- 保管机构-数据录入者信息 -->
			<xsl:if test="Header/custodian">
				<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			</xsl:if>


			<!-- LegalAuthenticator签名 -->
			<xsl:for-each select="Header/LegalAuthenticators/LegalAuthenticator">
				<xsl:if test="assignedEntityCode = '责任医师'">
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

			<!--关联活动信息-->
			<xsl:if test="Header/RelatedDocuments/RelatedDocument">
				<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument"
					mode="relatedDocument"/>
			</xsl:if>


			<component>
				<structuredBody>

					<!-- 过敏史章节 -->
					<xsl:comment>过敏史章节</xsl:comment>
					<xsl:apply-templates select="Allergy"/>
					<!-- 主诉章节 -->
					<xsl:comment>主诉章节</xsl:comment>
					<xsl:apply-templates select="ChiefComplaint"/>
					<!--现病史章节-->
					<xsl:comment>现病史章节</xsl:comment>
					<xsl:apply-templates select="PresentIllnessHistory"/>
					<!-- 既往史章节 -->
					<xsl:comment>既往史章节</xsl:comment>
					<xsl:apply-templates select="PastHistory"/>
					<!-- 体格检查章节 -->
					<xsl:comment>体格检查章节</xsl:comment>
					<xsl:apply-templates select="PhysicalExams"/>
					<!-- 实验室检验章节 -->
					<xsl:comment>实验室检验章节</xsl:comment>
					<xsl:apply-templates select="LabTest"/>
					<!-- 诊断记录章节 -->
					<xsl:comment>诊断记录章节</xsl:comment>
					<xsl:apply-templates select="Diagnosis"/>
					<!-- 治疗计划章节 -->
					<xsl:comment>治疗计划章节</xsl:comment>
					<xsl:if test="TreatmentPlan">
						<xsl:apply-templates select="TreatmentPlan"/>
					</xsl:if>
					<!--医嘱章节-->
					<xsl:comment>医嘱章节</xsl:comment>
					<xsl:apply-templates select="ProviderOrder/Items/Item[1]"/>
					<!-- 手术操作章节 -->
					<xsl:comment>手术操作章节</xsl:comment>
					<xsl:if test="Procedure/Items">
						<xsl:apply-templates select="Procedure/Items"/>
					</xsl:if>
					<!-- 抢救记录章节 -->
					<xsl:comment>抢救记录章节</xsl:comment>
					<xsl:if test="RescueRecord">
						<xsl:apply-templates select="RescueRecord"/>
					</xsl:if>
					<!-- 住院过程章节 -->
					<xsl:comment>住院过程章节</xsl:comment>
					<xsl:apply-templates select="HospitalCourse"/>
					<!--  其他相关信息章节 -->
					<xsl:comment>其他相关信息章节</xsl:comment>
					<xsl:apply-templates select="Other"/>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>

	<!--过敏史章节模板-->
	<xsl:template match="Allergy">
		<!-- 过敏史章节 -->
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
						<!--过敏史章节条目-->
						<xsl:comment>过敏史章节条目</xsl:comment>
						<xsl:apply-templates select="Allergies/Item"/>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--过敏史章节条目-->
	<xsl:template match="Allergies/Item">
		<xsl:if test="allergen/Value">
			<entryRelationship typeCode="SUBJ">
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.01.022.00" displayName="allergen/displayName"
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
				<xsl:comment>既往史条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.10.099.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录"
							displayName="{Healths/Health[1]/name/displayName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="Healths/Health[1]/name/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
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
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.258.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="体格检查"/>
						<value xsi:type="ST">
							<xsl:value-of select="PhysicalExam[1]/value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
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
						<value xsi:type="CD" code="{firstVisit/Value}" codeSystem="2.16.156.10011.2.3.2.39" codeSystemName="初诊标志代码表" displayName="{firstVisit/Display}"/>
					</observation>
				</entry>
				<!--中医“四诊”观察结果-->
				<xsl:comment>中医“四诊”观察结果</xsl:comment>
				<xsl:if test="TCMFourDiags/TCMFourDiagnostic/TCMFourDiagnostic/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.01.028.00" displayName="中医“四诊”观察结果"
								codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of
									select="TCMFourDiags/TCMFourDiagnostic/TCMFourDiagnostic/Value"
								/>
							</value>
						</observation>
					</entry>
				</xsl:if>
				<!--条目：西医诊断-->
				<xsl:comment>西医诊断条目</xsl:comment>
				<entry>
					<organizer classCode="CLUSTER" moodCode="EVN">
						<statusCode/>
						<xsl:apply-templates select="Westerns/Western[diag/code/Value]/diag/code"></xsl:apply-templates>
					</organizer>
				</entry>
				<xsl:comment>中医病名代码条目</xsl:comment>
				<entry>
					<organizer classCode="CLUSTER" moodCode="EVN">
						<statusCode/>
						<xsl:apply-templates select="TCM/TCM[1]/TCMdiag/code"></xsl:apply-templates>
					</organizer>
				</entry>
				<xsl:comment>中医证候代码条目</xsl:comment>
				<entry>
					<organizer classCode="CLUSTER" moodCode="EVN">
						<statusCode/>
						<xsl:apply-templates select="TCMSyndrome/TCMSyndrome[1]/syndrome/code"></xsl:apply-templates>
					</organizer>
				</entry>
			</section>
		</component>
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
							<code code="DE05.10.132.00"
								displayName="{differentiationBasis/displayName}"
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
							<code code="DE06.00.300.00"
								displayName="{treatmentPrinciple/displayName}"
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
	<xsl:template match="ProviderOrder/Items/Item[1]">
		<component>
			<section>
				<code code="46209-3" codeSystem="2.16.840.1.113883.6.1"
					displayName="Provider Orders" codeSystemName="LOINC"/>
				<text/>
				<!--医嘱条目-->
				<xsl:comment>医嘱条目</xsl:comment>
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
											codeSystem="2.16.156.10011.2.3.1.268"
											codeSystemName="医嘱项目类型代码表"/>
									</xsl:when>
									<xsl:when test="orderType/Value and not(orderType/Display)">
										<value xsi:type="CD" code="{orderType/Value}"
											codeSystem="2.16.156.10011.2.3.1.268"
											codeSystemName="医嘱项目类型代码表"/>
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
									<xsl:if test="plannedBeginTime/Value">
										<low value="{plannedBeginTime/Value}"/>
									</xsl:if>
									<!--医嘱计划结束日期时间-->
									<xsl:comment/>
									<xsl:if test="plannedEndTime/Value">
										<high value="{plannedEndTime/Value}"/>
									</xsl:if>
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
									<xsl:if test="exec/Time/Value">
										<time value="{exec/Time/Value}"/>
									</xsl:if>
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
									<xsl:comment>医嘱审核日期时间</xsl:comment>
									<xsl:if test="review/Time/Value">
										<time value="{review/Time/Value}"/>
									</xsl:if>
									<participantRole classCode="ASSIGNED">
										<!--角色-->
										<code displayName="医嘱审核人"/>
										<!--医嘱审核人签名：DE02.01.039.00-->
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
									<xsl:if test="cancel/Time/Value">
										<time value="{cancel/Time/Value}"/>
									</xsl:if>
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
								<xsl:if test="notes/Value">
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.179.00"
												displayName="{notes/displayName}"
												codeSystem="2.16.156.10011.2.2.1"
												codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="ST">
												<xsl:value-of select="notes/Value"/>
											</value>
										</observation>
									</entryRelationship>
								</xsl:if>
								<!--医嘱执行状态-->
								<xsl:comment>医嘱执行状态</xsl:comment>
								<xsl:if test="exec/status/Value">
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.290.00"
												displayName="{exec/status/displayName}"
												codeSystem="2.16.156.10011.2.2.1"
												codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="ST">
												<xsl:value-of select="exec/status/Value"/>
											</value>
										</observation>
									</entryRelationship>
								</xsl:if>
							</observation>
						</component>
					</organizer>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--手术操作章节模板-->
	<xsl:template match="Procedure/Items">
		<component>
			<section>
				<code code="47519-4" displayName="HISTORY OF PROCEDURES"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<xsl:comment>手术条目</xsl:comment>
				<xsl:apply-templates select="ProcedureItem"/>
			</section>
		</component>
	</xsl:template>
	<!--手术条目-->
	<xsl:template match="ProcedureItem">
		<entry>
			<procedure classCode="PROC" moodCode="EVN">
				<xsl:if test="code/Value">
					<code code="{code/Value}" codeSystem="2.16.156.10011.2.3.3.12"
						codeSystemName="手术(操作)代码表(ICD-9-CM)">
						<xsl:if test="code/Display">
							<xsl:attribute name="displayName"><xsl:value-of select="code/Display"/></xsl:attribute>
						</xsl:if>
					</code>
				</xsl:if>
				<statusCode/>
				<xsl:comment>手术名称条目</xsl:comment>
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
				<xsl:comment>手术及操作目标部位名称</xsl:comment>
				<xsl:if test="bodyPartName/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.093.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="手术及操作目标部位名称"/>
							<value xsi:type="ST">
								<xsl:value-of select="bodyPartName/Value"/>
							</value>
						</observation>
					</entryRelationship>
				</xsl:if>
				<xsl:comment>介入物名称</xsl:comment>
				<xsl:if test="intervention/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE08.50.037.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="介入物名称"/>
							<value xsi:type="ST">
								<xsl:value-of select="intervention/Value"/>
							</value>
						</observation>
					</entryRelationship>
				</xsl:if>
				<xsl:comment>操作方法描述</xsl:comment>
				<xsl:if test="operationWay/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.251.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="操作方法描述"/>
							<value xsi:type="ST">
								<xsl:value-of select="operationWay/Value"/>
							</value>
						</observation>
					</entryRelationship>
				</xsl:if>
				<xsl:comment>操作次数</xsl:comment>
				<xsl:if test="operationTimes/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.250.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="操作次数"/>
							<value xsi:type="ST">
								<xsl:value-of select="operationTimes/Value"/>
							</value>
						</observation>
					</entryRelationship>
				</xsl:if>
			</procedure>
		</entry>
	</xsl:template>

	<!--抢救记录章节模板-->
	<xsl:template match="RescueRecord">
		<component>
			<section>
				<code displayName="抢救记录章节"/>
				<text/>
				<!-- 急诊抢救记录 抢救开始日期时间
抢救结束日期时间
急诊抢救记录
　-->
				<xsl:comment>急诊抢救记录</xsl:comment>
				<entry typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.181.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="急诊抢救记录"/>
						<effectiveTime>
							<low value="{startTime/Value}"/>
							<high value="{endTime/Value}"/>
						</effectiveTime>
						<value xsi:type="ST">
							<xsl:value-of select="rescueRecord/Value"/>
						</value>
						<entryRelationship typeCode="COMP">
							<organizer classCode="CLUSTER" moodCode="EVN">
								<statusCode/>
								<!-- 参加抢救人员名单 -->
								<xsl:comment>参加抢救人员名单</xsl:comment>
								<component>
									<observation classCode="OBS" moodCode="EVN">
										<code code="DE08.30.032.00"
											codeSystem="2.16.156.10011.2.2.1"
											codeSystemName="卫生信息数据元目录" displayName="参加抢救人员名单"/>
										<value xsi:type="ST">
											<xsl:value-of select="attendees/Attendee/attendee/Value"
											/>
										</value>
									</observation>
								</component>
								<!-- 专业技术职务类别代码 -->
								<xsl:comment>专业技术职务类别代码</xsl:comment>
								<xsl:if test="attendees/Attendee/specialtyLevel/Value">
									<component>
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE08.30.031.00"
												codeSystem="2.16.156.10011.2.2.1"
												codeSystemName="卫生信息数据元目录" displayName="专业技术职务类别代码"/>
											<value xsi:type="CD"
												code="{attendees/Attendee/specialtyLevel/Value}"
												codeSystem="2.16.156.10011.2.3.1.209"
												codeSystemName="专业技术职务类别代码表"/>
										</observation>
									</component>
								</xsl:if>
							</organizer>
						</entryRelationship>
					</observation>
				</entry>
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
				<!--急诊留观病程记录-->
				<xsl:comment>急诊留观病程记录</xsl:comment>
				<entry typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.181.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="急诊留观病程记录"/>
						<!--收入观察室日期时间-->
						<xsl:comment>收入观察室日期时间</xsl:comment>
						<effectiveTime value="{observationTime/Value}"/>
						<value xsi:type="ST">
							<xsl:value-of select="observationCourse/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--其他相关信息章节模板-->
	<xsl:template match="Other">
		<component>
			<section>
				<code displayName="其他相关信息"/>
				<text/>
				<!-- 注意事项 -->
				<xsl:comment>注意事项</xsl:comment>
				<xsl:if test="notes/Value">
					<entry typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE09.00.119.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="注意事项"/>
							<value xsi:type="ST">
								<xsl:value-of select="notes/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
				<!-- 患者去向代码 -->
				<xsl:comment>患者去向代码</xsl:comment>
				<xsl:if test="dischargeTarget/Value">
					<entry typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.185.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="患者去向代码"/>
							<value xsi:type="ST">
								<xsl:value-of select="dischargeTarget/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
			</section>
		</component>
	</xsl:template>

	<!-- 西医诊断 -->
	<xsl:template match="Westerns/Western[diag/code/Value]/diag/code">
		<xsl:if test="Value">
			<component>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.01.025.00" displayName="诊断名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
					<value xsi:type="ST"><xsl:value-of select="Display"/></value>
				</observation>
			</component>
			<component>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.01.024.00" displayName="诊断代码" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录"/>
					<value xsi:type="CD" code="{Value}"
						codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
						<xsl:if test="Display">
							<xsl:attribute name="displayName">
								<xsl:value-of select="Display"/>
							</xsl:attribute>
						</xsl:if>
					</value>
				</observation>
			</component>
		</xsl:if>
	</xsl:template>

	<!-- 中医诊断 -->
	<xsl:template match="TCM/TCM[1]/TCMdiag/code">
		<xsl:if test="Value">
			<component>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.10.172.00" displayName="中医病名名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
						<qualifier>
							<name displayName="中医病名名称"/>
						</qualifier>
					</code>
					<value xsi:type="ST"><xsl:value-of select="Display"/></value>
				</observation>
			</component>
			<component>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.10.130.00" displayName="中医病名代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
						<qualifier>
							<name displayName="中医病名代码"/>
						</qualifier>
					</code>
					<value xsi:type="CD" code="{Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
						<xsl:if test="Display">
							<xsl:attribute name="displayName">
								<xsl:value-of select="Display"/>
							</xsl:attribute>
						</xsl:if>
					</value>
				</observation>
			</component>
		</xsl:if>
	</xsl:template>
	<!-- 中医症候 -->
	<xsl:template match="TCMSyndrome/TCMSyndrome[1]/syndrome/code">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.172.00" displayName="中医证候名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
					<qualifier>
						<name displayName="中医证候名称"/>
					</qualifier>
				</code>
				<value xsi:type="ST"><xsl:value-of select="Display"/></value>
			</observation>
		</component>
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.130.00" displayName="中医证候代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
					<qualifier>
						<name displayName="中医证候代码"/>
					</qualifier>
				</code>
				<value xsi:type="CD"  code="{Value}" displayName="呕吐病" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
					<xsl:if test="Display">
						<xsl:attribute name="displayName">
							<xsl:value-of select="Display"/>
						</xsl:attribute>
					</xsl:if>
				</value>
			</observation>
		</component>
	</xsl:template>
</xsl:stylesheet>
