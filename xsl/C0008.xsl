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
			<title>治疗记录</title>
			<!-- 文档机器生成时间 -->
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--文档记录对象（患者）-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!--门诊号-->
					<xsl:apply-templates select="Header/recordTarget/outpatientNum" mode="outpatientNum"/>
					<!--住院号-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					<!-- 电子申请单编号 -->
					<xsl:apply-templates select="Header/recordTarget/labOrderNum" mode="labOrderNum"/>
					<!-- 健康卡号 -->
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者身份证号码，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientId"
							mode="nationalIdNumber"/>
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates
							select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"/>
					</patient>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorNoOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '医嘱执行者'">
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
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<componentOf>
				<xsl:apply-templates select="Header/encompassingEncounter/Locations/Location" mode="EncompassingEncounter"/>	
			</componentOf>
			<!--****************************文档体Body********************-->
			<component>
				<structuredBody>
					<!-- 既往史章节 -->
					<xsl:apply-templates select="PastHistory"></xsl:apply-templates>
					<!--生命体征章节-->
					<xsl:apply-templates select="VitalSigns"></xsl:apply-templates>
					<!--
********************************************************
入院诊断章节
********************************************************
-->
					<component>
						<section>
							<code code="46241-6" displayName="HOSPITAL ADMISSION DX" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--疾病诊断编码-->
							<xsl:apply-templates select="AdmDiag/Diagnoses/Diagnosis" mode="Diag024"/>
						</section>
					</component>
					<!--
********************************************************
治疗计划章节TreatmentPlan
********************************************************
-->
					<xsl:apply-templates select="TreatmentPlan"></xsl:apply-templates>
					<!--
********************************************************
手术操作章节
********************************************************
-->
					<xsl:apply-templates select="Procedure/Items/ProcedureItem"></xsl:apply-templates>
					<!--用药管理章节-->
					
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
	<xsl:template match="PastHistory">
		<component>
			<section>
				<code code="11348-0" displayName="HISTORY OF PAST ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<xsl:apply-templates select="invasiveTreatment"></xsl:apply-templates>
				<!-- 过敏史标志 -->
				<xsl:apply-templates select="/Document/Allergy"></xsl:apply-templates>	
			</section>
		</component>
	</xsl:template>
	<!-- 既往史：有创诊疗操作标志 -->
	<xsl:template match="invasiveTreatment">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.165.00" displayName="有创诊疗操作标志" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="BL" value="{Value}"/>
			</observation>
		</entry>
	</xsl:template>
	<!-- 过敏史 -->
	<xsl:template match ="/Document/Allergy">
		<xsl:comment>过敏史条目</xsl:comment>  
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.023.00" displayName="过敏史标志" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="BL" value="{active/Value}"/>
				<xsl:apply-templates select="Allergies/Item[1]"></xsl:apply-templates>
			</observation>
		</entry>
		<entry> 
			<observation classCode="OBS" moodCode="EVN"> 
				<code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史"/>  
				<value xsi:type="ST"><xsl:value-of select="allergen/Value"/></value> 
			</observation> 
		</entry>  
	</xsl:template>
	<!-- 过敏史条目 -->
	<xsl:template match ="Allergies/Item[1]">
		<xsl:comment>过敏史条目</xsl:comment>  
		<entryRelationship typeCode="COMP">
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.022.00" displayName="过敏史" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="allergen/Value"/>
				</value>
			</observation>
		</entryRelationship> 
	</xsl:template>
	<xsl:template match="VitalSigns">
		<component>
			<section>
				<code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="VITAL SIGNS"/>
				<text/>
				<!--体格检查-体重（kg）-->
				<xsl:apply-templates select="VitalSign[type='DE04.10.188.00']"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="VitalSign[type='DE04.10.188.00']">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体重（kg）"/>
				<value xsi:type="PQ" value="{value}" unit="kg"/>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="TreatmentPlan">
		<component>
			<section>
				<code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--处理及指导意见-->
				<xsl:apply-templates select="guide"></xsl:apply-templates>
				<!--医嘱使用备注-->
				<xsl:apply-templates select="notes"></xsl:apply-templates>
				<!--今后治疗方案-->
				<xsl:apply-templates select="plan"></xsl:apply-templates>
				<!--随访条目-->
				<xsl:apply-templates select="followup"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="guide">
		<entry>
			<observation classCode="OBS" moodCode="INT">
				<!--处理及指导意见-->
				<code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="处理及指导意见"/>
				<value xsi:type="ST">
					<xsl:value-of select="Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="notes">
		<entry>
			<observation classCode="OBS" moodCode="INT">
				<!--医嘱使用备注-->
				<code code="DE06.00.179.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="医嘱使用备注"/>
				<value xsi:type="ST">
					<xsl:value-of select="Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="plan">
		<entry>
			<observation classCode="OBS" moodCode="INT">
				<!--今后治疗方案-->
				<code code="DE06.00.159.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="今后治疗方案"/>
				<value xsi:type="ST">
					<xsl:value-of select="Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="followup">
		<entry>
			<observation classCode="CASE" moodCode="EVN">
				<!--活动代码（随访）-->
				<code code="DE06.00.108.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="随访方式"/>
				<!--随访时间（数据元）-->
				<effectiveTime value="20110212"/>
				<value code="{code/Value}" codeSystem="2.16.156.10011.2.3.1.183" codeSystemName="随访方式代码表" xsi:type="CD" displayName="{code/Display}"/>
				<!--随访周期建议代码-->
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.112.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="随访周期建议代码"/>
						<value xsi:type="CD" code="{period/Value}" displayName="{period/Display}" codeSystem="2.16.156.10011.2.3.1.184" codeSystemName="随访周期建议代码表"/>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="Procedure/Items/ProcedureItem">
		<component>
			<section>
				<code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<entry>
					<!-- 1..1 手术记录 -->
					<procedure classCode="PROC" moodCode="EVN">
						<code code="{code/Value}" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表(ICD-9-CM)" displayName="{code/Display}"/>
						<!--操作日期/时间-->
						<effectiveTime>
							<!--操作结束日期时间-->
							<high value="{endTime/Value}"/>
						</effectiveTime>
						<!--操作名称 -->
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.094.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="操作名称"/>
								<value xsi:type="ST">
									<xsl:value-of select="name/Value"/>
								</value>
							</observation>
						</entryRelationship>
						<!--操作目标部位名称 -->
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.187.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术目标部位名称"/>
								<value xsi:type="ST">
									<xsl:value-of select="bodyPartName/Value"/>
								</value>
							</observation>
						</entryRelationship>
						<!--介入物名称 -->
						<xsl:apply-templates select="intervention"></xsl:apply-templates>
						<!--操作方法描述-->
						<xsl:apply-templates select="operationWay"></xsl:apply-templates>
						<!--操作次数-->
						<xsl:apply-templates select="operationTimes"></xsl:apply-templates>
					</procedure>
				</entry>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="intervention">
		<entryRelationship typeCode="COMP">
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE08.50.037.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="介入物名称"/>
				<value xsi:type="ST">
					<xsl:value-of select="Value"/>
				</value>
			</observation>
		</entryRelationship>
	</xsl:template>
	<xsl:template match="operationWay">
		<entryRelationship typeCode="COMP">
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE06.00.251.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="操作方法描述"/>
				<value xsi:type="ST">
					<xsl:value-of select="Value"/>
				</value>
			</observation>
		</entryRelationship>
	</xsl:template>
	<xsl:template match="operationTimes">
		<entryRelationship typeCode="COMP">
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE06.00.250.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="操作次数"/>
				<value xsi:type="INT" value="{Value}"/>
			</observation>
		</entryRelationship>
	</xsl:template>
	<xsl:template match="MedicationAdministereds/MedicationAdministered">
		<component>
			<section>
				<code code="18610-6" codeSystem="2.16.840.1.113883.6.1" displayName="MEDICATION ADMINISTERED" codeSystemName="LOINC"/>
				<text/>
				<entry>
					<substanceAdministration classCode="SBADM" moodCode="EVN">
						<text/>
						<!--药物使用途径代码 -->
						<xsl:comment>药物使用途径代码</xsl:comment>
						<routeCode code="{route/Value}" displayName="口服" codeSystem="2.16.156.10011.2.3.1.158" codeSystemName="用药途径代码表"/>
						<!--药物使用次剂量 -->
						<xsl:comment>药物使用次剂量</xsl:comment>
						<doseQuantity value="{dose/Value}" unit="mg"/>
						<consumable>
							<manufacturedProduct>
								<manufacturedLabeledDrug>
									<!--药品代码及名称(通用名) -->
									<xsl:comment>药品代码及名称</xsl:comment>
									<code/>
									<name>
										<xsl:value-of select="name/Value"/>
									</name>
								</manufacturedLabeledDrug>
							</manufacturedProduct>
						</consumable>
						<!--药物用法 -->
						<xsl:comment>药物用法</xsl:comment>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.136.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物用法"/>
								<value xsi:type="ST">
									<xsl:value-of select="usage/Value"/>
								</value>
							</observation>
						</entryRelationship>
						<!--中药使用类别代码-->  
						<xsl:apply-templates select="TCMUsage"></xsl:apply-templates>
						<!--药物使用频率 -->
						<xsl:apply-templates select="rate"></xsl:apply-templates>
						<!--药物剂型代码--> 
						<xsl:apply-templates select="form"></xsl:apply-templates>
						<!--药物使用剂量单位 -->
						<xsl:apply-templates select="unit"></xsl:apply-templates>
						<!--药物使用总剂量 -->
						<xsl:comment>药物使用总剂量</xsl:comment>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.135.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物使用总剂量"/>
								<value xsi:type="PQ" value="{totalDose/Value}" unit="g"/>
							</observation>
						</entryRelationship>
					</substanceAdministration>
				</entry>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="TCMUsage">
		<xsl:if test="Value">
			<entryRelationship typeCode="COMP"> 
				<observation classCode="OBS" moodCode="EVN"> 
					<code code="DE06.00.164.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中药使用类别代码"/>  
					<value xsi:type="CD" code="{Value}"  codeSystem="2.16.156.10011.2.3.1.157" codeSystemName="中药使用类别代码表">
						<xsl:if test="Display">
							<xsl:attribute name="Display"><xsl:value-of select="Display"/></xsl:attribute>
						</xsl:if>
					</value> 
				</observation> 
			</entryRelationship>  
		</xsl:if>	
	</xsl:template>
	<xsl:template match="rate">
		<xsl:comment>药物用法</xsl:comment>
		<entryRelationship typeCode="COMP"> 
			<observation classCode="OBS" moodCode="EVN"> 
				<code code="DE06.00.133.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物使用频率"/>  
				<value xsi:type="CD" code="{Value}" codeSystem="2.16.156.10011.2.3.1.267" codeSystemName="药物使用频次代码表">
					<xsl:if test="Display">
						<xsl:attribute name="Display"><xsl:value-of select="Display"/></xsl:attribute>
					</xsl:if>
				</value> 
			</observation> 
		</entryRelationship>  
	</xsl:template>
	<xsl:template match="form">
		<entryRelationship typeCode="COMP"> 
			<observation classCode="OBS" moodCode="EVN"> 
				<code code="DE08.50.011.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物剂型代码"/>  
				<value xsi:type="CD" code="{Value}" codeSystem="2.16.156.10011.2.3.1.211" codeSystemName="药物剂型代码表">
					<xsl:if test="Display">
						<xsl:attribute name="Display"><xsl:value-of select="Display"/></xsl:attribute>
					</xsl:if>
				</value> 
			</observation> 
		</entryRelationship>  
	</xsl:template>
	<xsl:template match="unit">
		<xsl:comment>药物使用剂量单位</xsl:comment>
		<entryRelationship typeCode="COMP">
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE08.50.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物使用剂量单位"/>
				<value xsi:type="ST">
					<xsl:value-of select="Value"/>
				</value>
			</observation>
		</entryRelationship>
	</xsl:template>
</xsl:stylesheet>
