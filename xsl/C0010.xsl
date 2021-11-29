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
			<templateId root="2.16.156.10011.2.1.1.30"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>麻醉术前访视记录</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--文档记录对象（患者） [1..*] contextControlCode="OP"表示本信息可以被重载-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 门（急）诊号标识 -->
					<xsl:apply-templates select="Header/recordTarget/outpatientNum"
						mode="outpatientNum"/>
					<!--住院号-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum"
						mode="inpatientNum"/>
					<!--电子申请单号-->
					<xsl:apply-templates select="Header/recordTarget/MRN" mode="MRN"/>
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者身份证号码，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName"
							mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates
							select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear"
							mode="Age"/>
					</patient>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '麻醉医师'">
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
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument"
				mode="relatedDocument"/>
			<!-- 病床号、病房、病区、科室和医院的关联 -->
			<componentOf>
				<encompassingEncounter>
					<!-- 入院日期时间 -->
					<xsl:comment>入院日期时间</xsl:comment>
					<effectiveTime value="{Header/encompassingEncounter/effectiveTimeLow/Value}"/>
					<location>
						<healthCareFacility>
							<serviceProviderOrganization>
								<asOrganizationPartOf classCode="PART">
									<!-- DE01.00.026.00	病床号 -->
									<xsl:comment>病床号</xsl:comment>
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<id root="2.16.156.10011.1.22"
											extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
										<name>
											<xsl:value-of
												select="Header/encompassingEncounter/Locations/Location/bedNum/Value"
											/>
										</name>
										<!-- DE01.00.019.00	病房号 -->
										<xsl:comment>病房号</xsl:comment>
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<id root="2.16.156.10011.1.21"
												extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												<name>
												<xsl:value-of
												select="Header/encompassingEncounter/Locations/Location/wardName/Value"
												/>
												</name>
												<!-- DE08.10.026.00	科室名称 -->
												<xsl:comment>科室名称</xsl:comment>
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<id root="2.16.156.10011.1.26"
												extension="{Header/encompassingEncounter/Locations/Location/deptId}"/>
												<name>
												<xsl:value-of
												select="Header/encompassingEncounter/Locations/Location/deptName/Value"
												/>
												</name>
												<!-- DE08.10.054.00	病区名称 -->
												<xsl:comment>病区名称</xsl:comment>
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<id root="2.16.156.10011.1.27"
												extension="{Header/encompassingEncounter/Locations/Location/areaId}"/>
												<name>
												<xsl:value-of
												select="Header/encompassingEncounter/Locations/Location/areaName/Value"
												/>
												</name>
												<!--XXX医院 -->
												<xsl:comment>医院</xsl:comment>
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<id root="2.16.156.10011.1.5"
												extension="{Header/encompassingEncounter/Locations/Location/hosId}"/>
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
			<!--***************************************************
文档体Body
*******************************************************
-->
			<component>
				<structuredBody>
					<!--术前诊断章节-->
					<xsl:comment>术前诊断章节</xsl:comment>
					<xsl:apply-templates select="PreOpDiag"/>
					<!--现病史章节-->
					<xsl:comment>现病史章节</xsl:comment>
					<xsl:apply-templates select="PresentIllnessHistory"/>
					<!--既往史章节-->
					<xsl:comment>既往史章节</xsl:comment>
					<xsl:apply-templates select="Allergy/Allergies"/>
					<!--体格检查章节-->
					<xsl:comment>体格检查章节</xsl:comment>
					<xsl:apply-templates select="PhysicalExams"/>
					<!--实验室检查章节-->
					<xsl:comment>实验室检查章节</xsl:comment>
					<xsl:apply-templates select="LabTest"/>
					<!--治疗计划章节-->
					<xsl:comment>治疗计划章节</xsl:comment>
					<xsl:apply-templates select="TreatmentPlan"/>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>

	<!--诊断记录章节模板-->
	<xsl:template match="PreOpDiag">
		<component>
			<section>
				<code code="10219-4" displayName="Surgical operation note preoperative Dx"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--术前诊断-->
				<xsl:comment>术前诊断</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<!--术前诊断编码-->
						<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="术前诊断编码"/>
						<value xsi:type="CD" codeSystem="2.16.156.10011.2.3.3.11"
							codeSystemName="ICD-10">
							<xsl:if test="Items/Item[1]/diagnosisCode/Value">
								<xsl:attribute name="code">
									<xsl:value-of select="Items/Item[1]/diagnosisCode/Value"/>
								</xsl:attribute>
							</xsl:if>
							<xsl:if test="Items/Item[1]/diagnosisCode/Display">
								<xsl:attribute name="displayName">
									<xsl:value-of select="Items/Item[1]/diagnosisCode/Display"/>
								</xsl:attribute>
							</xsl:if>
						</value>
					</observation>
				</entry>
				<!-- 术前合并疾病 -->
				<xsl:comment>术前合并疾病</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.076.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="术前合并疾病"/>
						<value xsi:type="ST"><xsl:value-of select="complication/Value"/></value>
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
				<!--简要病史条目-->
				<xsl:comment>简要病史条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.140.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="简要病史"/>
						<value xsi:type="ST"><xsl:value-of select="briefIllness/Value"/></value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--既往史章节模板-->
	<xsl:template match="Allergy/Allergies">
		<component>
			<section>
				<code code="11348-0" displayName="HISTORY OF PAST ILLNESS"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--过敏史条目-->
				<xsl:comment>过敏史条目</xsl:comment>
				<xsl:apply-templates select="Item"/>
			</section>
		</component>
	</xsl:template>
	<!--过敏史条目-->
	<xsl:template match="Item">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1"
					codeSystemName="卫生信息数据元目录" displayName="过敏史"/>
				<value xsi:type="ST">
					<xsl:value-of select="allergen/Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>

	<!--体格检查章节模板-->
	<xsl:template match="PhysicalExams">
		<component>
			<section>
				<code code="29545-1" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
					displayName="PHYSICAL EXAMINATION"/>
				<text/>
				<xsl:comment>体格检查条目</xsl:comment>
				<xsl:apply-templates select="PhysicalExam"/>
			</section>
		</component>
	</xsl:template>
	<!-- 体格检查条目 -->
	<xsl:template match="PhysicalExam">
		<xsl:choose>
			<xsl:when test="type = 'DE05.10.142.00'">
				<xsl:comment><xsl:value-of select="codeSystemName"/></xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.142.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{codeSystemName}"/>
						<value xsi:type="BL" value="{value}"/>
					</observation>
				</entry>
			</xsl:when>
			<xsl:otherwise>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="{type}" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{codeSystemName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="value"/>
						</value>
					</observation>
				</entry>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!--实验室检查章节模板-->
	<xsl:template match="LabTest">
		<component>
			<section>
				<code code="30954-2" displayName="STUDIES SUMMARY"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<entry typeCode="COMP">
					<!-- 血型-->
					<xsl:comment>血型</xsl:comment>
					<organizer classCode="BATTERY" moodCode="EVN">
						<statusCode/>
						<component typeCode="COMP" contextConductionInd="true">
							<!-- ABO血型 -->
							<xsl:comment>ABO血型</xsl:comment>
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1"
									codeSystemName="卫生信息数据元目录" displayName="ABO血型代码"/>
								<value xsi:type="CD" codeSystem="2.16.156.10011.2.3.1.85"
									codeSystemName="ABO血型代码表">
									<xsl:if test="bloodABO/Value">
										<xsl:attribute name="code">
											<xsl:value-of select="bloodABO/Value"/>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="bloodABO/Display">
										<xsl:attribute name="displayName">
											<xsl:value-of select="bloodABO/Display"/>
										</xsl:attribute>
									</xsl:if>
								</value>
							</observation>
						</component>
						<component typeCode="COMP" contextConductionInd="true">
							<!-- Rh血型 -->
							<xsl:comment>Rh血型</xsl:comment>
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE04.50.010.00" codeSystem="2.16.156.10011.2.2.1"
									codeSystemName="卫生信息数据元目录" displayName="Rh（D）血型代码"/>
								<value xsi:type="CD" codeSystem="2.16.156.10011.2.3.1.250"
									codeSystemName="Rh(D)血型代码表">
									<xsl:if test="bloodRh/Value">
										<xsl:attribute name="code">
											<xsl:value-of select="bloodRh/Value"/>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="bloodRh/Display">
										<xsl:attribute name="displayName">
											<xsl:value-of select="bloodRh/Display"/>
										</xsl:attribute>
									</xsl:if>
								</value>
							</observation>
						</component>
					</organizer>
				</entry>
				<!-- 心电图检查结果 -->
				<xsl:comment>心电图检查结果</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.30.043.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="心电图检查结果"/>
						<value xsi:type="ST">
							<xsl:value-of select="anesthesiaVisit/EKG/Value"/>
						</value>
					</observation>
				</entry>
				<!-- 胸部X线检查结果 -->
				<xsl:comment>胸部X线检查结果</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.30.045.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="胸部X线检查结果"/>
						<value xsi:type="ST">
							<xsl:value-of select="anesthesiaVisit/XRay/Value"/>
						</value>
					</observation>
				</entry>
				<!-- CT检查结果 -->
				<xsl:comment>CT检查结果</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.30.005.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="CT检查结果"/>
						<value xsi:type="ST">
							<xsl:value-of select="anesthesiaVisit/CT/Value"/>
						</value>
					</observation>
				</entry>
				<!-- B超检查结果 -->
				<xsl:comment>B超检查结果</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.30.002.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="B超检查结果"/>
						<value xsi:type="ST">
							<xsl:value-of select="anesthesiaVisit/ultrasonic/Value"/>
						</value>
					</observation>
				</entry>
				<!-- MRI检查结果 -->
				<xsl:comment>MRI检查结果</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.30.009.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="MRI检查结果"/>
						<value xsi:type="ST">
							<xsl:value-of select="anesthesiaVisit/MRI/Value"/>
						</value>
					</observation>
				</entry>
				<!-- 肺功能检查结果 -->
				<xsl:comment>肺功能检查结果</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.30.009.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="肺功能检查结果"/>
						<value xsi:type="ST">
							<xsl:value-of select="anesthesiaVisit/lungFunc/Value"/>
						</value>
					</observation>
				</entry>
				<!-- 血常规检查结果 -->
				<xsl:comment>血常规检查结果</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.50.128.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="血常规检查结果"/>
						<value xsi:type="ST">
							<xsl:value-of select="anesthesiaVisit/CBC/Value"/>
						</value>
					</observation>
				</entry>
				<!-- 尿常规检查结果 -->
				<xsl:comment>尿常规检查结果</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.50.048.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="尿常规检查结果"/>
						<value xsi:type="ST">
							<xsl:value-of select="anesthesiaVisit/urine/Value"/>
						</value>
					</observation>
				</entry>
				<!-- 凝血功能检查结果 -->
				<xsl:comment>凝血功能检查结果</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.50.142.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="凝血功能检查结果"/>
						<value xsi:type="ST">
							<xsl:value-of select="anesthesiaVisit/coagulation/Value"/>
						</value>
					</observation>
				</entry>
				<!-- 肝功能检查结果 -->
				<xsl:comment>肝功能检查结果</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.50.026.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="肝功能检查结果"/>
						<value xsi:type="ST">
							<xsl:value-of select="anesthesiaVisit/liver/Value"/>
						</value>
					</observation>
				</entry>
				<!-- 血气分析检查结果 -->
				<xsl:comment>血气分析检查结果</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.50.128.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="血气分析检查结果"/>
						<value xsi:type="ST">
							<xsl:value-of select="anesthesiaVisit/ABG/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--实验室检查条目-->
	<xsl:template match="TreatmentPlan">
		<component>
			<section>
				<code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1"
					codeSystemName="LOINC"/>
				<text/>
				<!-- 拟实施手术及操作编码 DE06.00.093.00 -->
				<xsl:comment>拟实施手术及操作编码</xsl:comment>
				<xsl:apply-templates select="procedures/Procedure"/>
				<xsl:comment>拟实施麻醉方法代码条目</xsl:comment>
				<xsl:apply-templates select="anesthesia"/>


			</section>
		</component>
	</xsl:template>
	<!--拟实施手术及操作编码条目-->
	<xsl:template match="procedures/Procedure">
		<entry>
			<procedure classCode="PROC" moodCode="EVN">
				<code xsi:type="CD" codeSystem="2.16.156.10011.2.3.3.12"
					codeSystemName="手术(操作)代码表(ICD-9-CM)">
					<xsl:if test="code/Value">
						<xsl:attribute name="code">
							<xsl:value-of select="code/Value"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="code/Display">
						<xsl:attribute name="displayName">
							<xsl:value-of select="code/Display"/>
						</xsl:attribute>
					</xsl:if>
				</code>
				<!--手术间编号-->
				<xsl:comment>手术间编号</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.256.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="患者实施手术所在的手术室编号"/>
						<value xsi:type="ST">
							<xsl:value-of select="procedureRoom/Value"/>
						</value>
					</observation>
				</entryRelationship>
			</procedure>
		</entry>
	</xsl:template>
	<!--拟实施麻醉方法代码条目-->
	<xsl:template match="anesthesia">
		<entry>
			<!-- 拟实施麻醉方法代码 -->
			<xsl:comment>拟实施麻醉方法代码</xsl:comment>
			<observation classCode="OBS" moodCode="INT">
				<code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1"
					codeSystemName="卫生信息数据元目录" displayName="拟实施麻醉方法代码"/>
				<value xsi:type="CD" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表">
					<xsl:if test="code/Value">
						<xsl:attribute name="code">
							<xsl:value-of select="code/Value"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="code/Display">
						<xsl:attribute name="displayName">
							<xsl:value-of select="code/Display"/>
						</xsl:attribute>
					</xsl:if>
				</value>
				<!-- 术前麻醉医嘱 -->
				<xsl:comment>术前麻醉医嘱</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="INT">
						<code code="DE06.00.287.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="术前麻醉医嘱"/>
						<value xsi:type="ST">
							<xsl:value-of select="anesthesiaOrder/Value"/>
						</value>
					</observation>
				</entryRelationship>
				<!-- 麻醉适应证 -->
				<xsl:comment>麻醉适应证</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.227.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="麻醉适应证"/>
						<value xsi:type="ST">
							<xsl:value-of select="indication/Value"/>
						</value>
					</observation>
				</entryRelationship>
				<!-- 注意事项 -->
				<xsl:comment>注意事项</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE09.00.119.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="注意事项"/>
						<value xsi:type="ST">
							<xsl:value-of select="note/Value"/>
						</value>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>

</xsl:stylesheet>
