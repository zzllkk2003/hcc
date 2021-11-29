<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.41"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>出入量记录</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 住院号标识 todo-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者身份证号码，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>	
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"/>
					</patient>
					<!--提供患者服务机构-->
					<xsl:apply-templates select="Header/recordTarget/providerOrganization" mode="providerOrganization"/>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			<!-- 文档生成机构 -->
			<xsl:if test="Header/custodian">
				<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			</xsl:if>
				
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="contains(assignedEntityCode,'护士') ">
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
			
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<componentOf typeCode="COMP">
				<!--就诊-->
				<encompassingEncounter classCode="ENC" moodCode="EVN">
					<code/>
					<effectiveTime nullFlavor="NI"/>
					<location typeCode="LOC">
						<healthCareFacility classCode="SDLOC">
							<!--机构角色-->
							<serviceProviderOrganization classCode="ORG" determinerCode="INSTANCE">
								<asOrganizationPartOf classCode="PART">
									<!--病床号：DE01.00.026.00-->
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<!--N:加上OID-->
										<xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
											<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
										</xsl:if>
										
										<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/bedNum/Value"/></name>
										<!--病房号：DE01.00.019.00-->
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
												<!--N:加上OID-->
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/wardName/Value"/></name>
												<!--病区名称：DE08.10.054.00-->
												<asOrganizationPartOf classCode="PART">
													<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
														<!--N:加上OID-->
														<xsl:if test="Header/encompassingEncounter/Locations/Location/areaId">
															<id root="2.16.156.10011.1.27" extension="{Header/encompassingEncounter/Locations/Location/areaId}"/>
														</xsl:if>
														
														<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
														<!--科室名称：DE08.10.026.00-->
														<asOrganizationPartOf classCode="PART">
															<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
																<!--N:加上OID-->
																<xsl:if test="Header/encompassingEncounter/Locations/Location/deptId">
																	<id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/deptId}"/>
																</xsl:if>
																
																<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptName/Value"/></name>
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
					<!--诊断记录章节-->
					<xsl:comment>诊断记录章节</xsl:comment>
					<xsl:apply-templates select="Diagnosis/Westerns"></xsl:apply-templates>
					<!--生命体征章节-->
					<xsl:comment>生命体征章节</xsl:comment>
					<xsl:apply-templates select="VitalSigns"></xsl:apply-templates>			
					<!--护理记录章节-->
					<xsl:comment>护理记录章节</xsl:comment>
					<xsl:apply-templates select="NursingRecord"></xsl:apply-templates>				
					<!--护理观察章节-->
					<xsl:comment>护理观察章节</xsl:comment>
					<xsl:apply-templates select="NursingObservations"></xsl:apply-templates>					
					<!--护理操作章节：一个护理操作对应多个操作项目类目，一个操作项目类目又对应多个操作结果-->
					<xsl:comment>护理操作章节</xsl:comment>
					<xsl:apply-templates select="NursingOperations"></xsl:apply-templates>					
					<!--用药章节 -->
					<xsl:comment>用药章节</xsl:comment>
					<xsl:if test="MedicationUseHistory/MedicineItems">
						<xsl:apply-templates select="MedicationUseHistory/MedicineItems"></xsl:apply-templates>
					</xsl:if>
										
					<!--护理标志章节-->
					<xsl:comment>护理标志章节</xsl:comment>
					<xsl:apply-templates select="NursingSign"></xsl:apply-templates>
					
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
	
	<!--诊断记录章节模板-->
	<xsl:template match="Diagnosis/Westerns">
		<xsl:if test="Western">
			<component>
				<section>
					<code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
					<text/>
					<!--疾病诊断条目-->
					<xsl:comment>疾病诊断条目</xsl:comment>
					<xsl:apply-templates select="Western"></xsl:apply-templates>
				</section>
			</component>
		</xsl:if>	
	</xsl:template>
	<!--疾病诊断条目-->
	<xsl:template match="Western">
		<xsl:if test="diag/code/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="疾病诊断代码"/>
					<value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10" displayName="{diag/code/Display}"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	
	<!--生命体征章节模板-->
	<xsl:template match="VitalSigns">
		<component>
			<section>
				<code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="VITAL SIGNS"/>
				<text/>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{VitalSign[1]/display}"/>
						<value xsi:type="PQ" value="{VitalSign[1]/value}" unit="kg"/>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	
	<!--护理记录章节模板-->
	<xsl:template match="NursingRecord">
		<component>
			<section>
				<code displayName="护理记录"/>
				<text/>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.211.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理等级代码"/>
						<xsl:choose>
							<xsl:when test="nursingLevel/Value and nursingLevel/Display">
								<value xsi:type="CD" code="{nursingLevel/Value}" displayName="{nursingLevel/Display}" codeSystem="2.16.156.10011.2.3.1.259" codeSystemName="护理等级代码表"/>
							</xsl:when>
							<xsl:when test="nursingLevel/Value and not(nursingLevel/Display)">
								<value xsi:type="CD" code="{nursingLevel/Value}" codeSystem="2.16.156.10011.2.3.1.259" codeSystemName="护理等级代码表"/>
							</xsl:when>
						</xsl:choose>
						
					</observation>
				</entry>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.212.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理类型代码"/>
						<xsl:choose>
							<xsl:when test="nursingType/Value and nursingType/Display">
								<value xsi:type="CD" code="{nursingType/Value}" displayName="{nursingType/Display}" codeSystem="2.16.156.10011.2.3.1.260" codeSystemName="护理类型代码表"/>
							</xsl:when>
							<xsl:when test="nursingType/Value and not(nursingType/Display)">
								<value xsi:type="CD" code="{nursingType/Value}" codeSystem="2.16.156.10011.2.3.1.260" codeSystemName="护理类型代码表"/>
							</xsl:when>
						</xsl:choose>
						
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	
	<!--护理观察章节模板-->
	<xsl:template match="NursingObservations">
		<component>
			<section>
				<code displayName="护理观察"/>
				<text/>
				<!--护理观察项目名称和结果条目-->
				<xsl:comment>护理观察项目名称和结果条目</xsl:comment>
				<xsl:apply-templates select="NursingObservation"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<!--护理观察项目名称和结果条目-->
	<xsl:template match="NursingObservation">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.031.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="观察项目名称"/>
				<value xsi:type="ST"><xsl:value-of select="item/Value"/></value>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="观察结果"/>
						<value xsi:type="ST"><xsl:value-of select="result/Value"/></value>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>
	
	<!--护理操作章节-->
	<xsl:template match="NursingOperations">
		<component>
			<section>
				<code nullFlavor="UNK" displayName="护理操作"/>
				<text/>
				<!--护理操作名称条目-->
				<xsl:comment>护理操作名称条目</xsl:comment>
				<xsl:apply-templates select="NursingOperation"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<!--护理操作名称条目-->
	<xsl:template match="NursingOperation">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE06.00.342.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作名称"/>
				<value xsi:type="ST"><xsl:value-of select="operation/Value"/></value>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.210.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作项目类目名称"/>
						<value xsi:type="ST"><xsl:value-of select="category/Value"/></value>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.209.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="导管护理描述"/>
								<value xsi:type="ST"><xsl:value-of select="result/Value"/></value>
							</observation>
						</entryRelationship>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>
	
	<!--用药章节-->
	<xsl:template match="MedicationUseHistory/MedicineItems">
		<component>
			<section>
				<code code="10160-0" codeSystem="2.16.840.1.113883.6.1" displayName="HISTORY OF MEDICATION USE" codeSystemName="LOINC"/>
				<text/>
				<!--用药条目-->
				<xsl:comment>用药条目</xsl:comment>
				<xsl:apply-templates select="MedicineItem"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<!--用药条目-->
	<xsl:template match="MedicineItem">
		<entry>
			<substanceAdministration classCode="SBADM" moodCode="EVN">
				<text/>
				<!--药物使用途径代码：DE06.00.134.00-->
				<xsl:comment>药物使用途径代码</xsl:comment>
				<xsl:if test="route/Value">
					<routeCode code="{route/Value}" displayName="{route/Display}" codeSystem="2.16.156.10011.2.3.1.158" codeSystemName="用药途径代码表"/>
				</xsl:if>
				
				<!--用药剂量-单次 -->
				<xsl:comment>用药剂量</xsl:comment>
				<xsl:if test="dose/Value">
					<doseQuantity value="{dose/Value}" unit="{doseUnit}"/>
				</xsl:if>
				
				<!--用药频率-->
				<xsl:comment>用药频率</xsl:comment>
				<xsl:if test="rate/Value">
					<rateQuantity value="{rate/Value}" unit="{rateUnit}"/>
				</xsl:if>
				
				<xsl:if test="name/Value">
					<consumable>
						<manufacturedProduct>
							<manufacturedLabeledDrug>
								<!--药品名称 -->
								<xsl:comment>药品名称</xsl:comment>
								<code/>
								<name><xsl:value-of select="name/Value"/></name>
							</manufacturedLabeledDrug>
						</manufacturedProduct>
					</consumable>
				</xsl:if>
				
				<xsl:if test="useWay/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.136.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物用法"/>
							<!--药物用法描述-->
							<xsl:comment>药物用法描述</xsl:comment>
							<value xsi:type="ST"><xsl:value-of select="useWay/Value"/></value>
						</observation>
					</entryRelationship>
				</xsl:if>
				
				<xsl:if test="TCMType/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.164.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中药使用类别代码"/>
							<!--中药使用类别代码-->
							<xsl:comment>中药使用类别代码</xsl:comment>
							<value code="{TCMType/Value}" displayName="{TCMType/Display}" codeSystem="2.16.156.10011.2.3.1.157" codeSystemName="中药使用类别代码表" xsi:type="CD"/>
						</observation>
					</entryRelationship>
				</xsl:if>
				
				<xsl:if test="totalDose/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.135.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物使用总剂量"/>
							<!--药物使用总剂量-->
							<xsl:comment>药物使用总剂量</xsl:comment>
							<value xsi:type="PQ" value="{totalDose/Value}" unit="mg"/>
						</observation>
					</entryRelationship>
				</xsl:if>
				
			</substanceAdministration>
		</entry>
	</xsl:template>
	
	<!--护理标志章节-->
	<xsl:template match="NursingSign">
		<component>
			<section>
				<code nullFlavor="UNK" displayName="护理标志"/>
				<title>护理标志章节</title>
				<!--呕吐标志条目-->
				<xsl:comment>呕吐标志条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.01.048.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="呕吐标志"/>
						<value xsi:type="BL" value="{vomit/Value}"/>
					</observation>
				</entry>
				<!--排尿困难标志条目-->
				<xsl:comment>排尿困难标志条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.01.051.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="排尿困难标志"/>
						<value xsi:type="BL" value="{dysuria/Value}"/>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
</xsl:stylesheet>
