<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:isc="http://extension-functions.intersystems.com" xmlns:exsl="http://exslt.org/common" xmlns:set="http://exslt.org/sets" exclude-result-prefixes="isc sdtc exsl set">
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
			<templateId root="2.16.156.10011.2.1.1.26"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>检查报告</title>
			<!--文档机器生成时间-->
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--文档记录对象（患者）-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 门（急）诊号标识 -->
					<xsl:apply-templates select="Header/recordTarget/outpatientNum" mode="outpatientNum"/>
					<!-- 住院号标识-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					<!-- 检查报告单号标识-->
					<xsl:apply-templates select="Header/recordTarget/labReportNum" mode="labReportNum"/>
					<!-- 电子申请单编号 -->
					<xsl:apply-templates select="Header/recordTarget/labOrderNum" mode="labOrderNum"/>
					<!-- 标本编号标识 -->
					<xsl:apply-templates select="Header/recordTarget/specimenNum" mode="specimenNum"/>
					<!-- 患者类别代码 -->
					<patientType>
						<patienttypeCode code="{Header/recordTarget/patientType/Value}" codeSystem="2.16.156.10011.2.3.1.271" codeSystemName="患者类型代码表" displayName="门诊"></patienttypeCode>
					</patientType>
					<xsl:apply-templates select="Header/recordTarget" mode="PhoneNumber"/>
					
					
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
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
				
			<!-- LegalAuthenticator签名 -->
			<xsl:for-each select="Header/LegalAuthenticators/LegalAuthenticator">
				<xsl:if test="assignedEntityCode = '审核医师'">
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
				<xsl:if test="assignedEntityCode = '检验技师' or assignedEntityCode = '检验医师'">
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
			
			<!-- 检查申请机构及科室 -->
			<xsl:apply-templates select="Header/Participants" mode="SupportContact"/>
			
			<!--关联活动信息-->
			<xsl:if test="Header/RelatedDocuments/RelatedDocument">
				<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			</xsl:if>
			
			<!-- 病床号、病房、病区、科室和医院的关联 -->
			<componentOf>
				<encompassingEncounter>
					<effectiveTime/>
					<location>
						<healthCareFacility>
							<serviceProviderOrganization>
								<asOrganizationPartOf classCode="PART">
									<!-- DE01.00.026.00	病床号 -->
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
											<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
										</xsl:if>
									
										<!-- DE01.00.019.00	病房号 -->
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												</xsl:if>
												
												<!-- DE08.10.026.00	科室名称 -->
												<asOrganizationPartOf classCode="PART">
													<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
														<id root="2.16.156.10011.1.26"/>
														<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptId"/></name>
														<!-- DE08.10.054.00	病区名称 -->
														<asOrganizationPartOf classCode="PART">
															<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
																<id root="2.16.156.10011.1.27"/>
																<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
																<!--XXX医院 -->
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
					<!-- 诊断记录章节-->
					<xsl:comment>诊断记录章节</xsl:comment>
					<xsl:apply-templates select="Diagnosis/Westerns"/>
					<!-- 主诉章节 -->
					<xsl:comment>主诉章节</xsl:comment>
					<xsl:apply-templates select="ChiefComplaint"/>
					<!-- 症状章节 -->
					<xsl:comment>症状章节</xsl:comment>
					<xsl:apply-templates select="Symptoms"/>
					<!-- 手术操作章节 -->
					<xsl:comment>手术操作章节</xsl:comment>
					<xsl:if test="Procedure">
						<xsl:apply-templates select="Procedure"/>
					</xsl:if>
					<!-- 体格检查章节-->
					<xsl:comment>体格检查章节</xsl:comment>
					<xsl:apply-templates select="ERPhysicalExam"/>
					<!--  其他处置章节 -->
					<xsl:comment>其他处置章节</xsl:comment>
					<xsl:if test="OtherProc">
						<xsl:apply-templates select="OtherProc"/>
					</xsl:if>
					<!-- 检查报告章节 -->
					<xsl:comment>检查报告章节</xsl:comment>
					<xsl:apply-templates select="CheckReport"/>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
	<!--诊断记录章节模板-->
	<xsl:template match="Diagnosis/Westerns">
		<component>
			<section>
				<code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--诊断代码条目-->
				<xsl:comment>诊断代码条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.024.00" displayName="{Western[1]/diag/code/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<!--诊断日期-->
						<xsl:comment>诊断日期</xsl:comment>
						<effectiveTime value="{Western[1]/diag/date/Value}"/>
						<value xsi:type="CD" code="{Western[1]/diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）"/>
						<!--执行机构-->
						<xsl:comment>执行机构</xsl:comment>
						<performer>
							<assignedEntity>
								<id/>
								<representedOrganization>
									<name>
										<xsl:value-of select="Western[1]/diag/diagnosisOrg/Value"/>
									</name>
								</representedOrganization>
							</assignedEntity>
						</performer>
					</observation>
				</entry>
			</section>
		</component>
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
						<value xsi:type="ST">
							<xsl:value-of select="chiefComplaint/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--症状章节模板-->
	<xsl:template match="Symptoms">
		<component>
			<section>
				<code code="11450-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="PROBLEM LIST"/>
				<text/>
				<!-- 症状描述条目 -->
				<xsl:comment>症状描述条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.01.117.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{Symptom[1]/symptomDesc/displayName}"/>
						<!-- 症状开始时间与停止时间 -->
						<xsl:comment>症状开始时间与停止时间</xsl:comment>
						<effectiveTime>
							<low value="{Symptom[1]/beginTime/Value}"/>
							<high value="{Symptom[1]/endTime/Value}"/>
						</effectiveTime>
						<value xsi:type="ST">
							<xsl:value-of select="Symptom[1]/symptomDesc/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!-- 手术操作章节 -->
	<xsl:template match="Procedure">
		<component>
			<section>
				<code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--手术记录条目-->
				<xsl:comment>手术记录条目</xsl:comment>
				<xsl:apply-templates select="Items/ProcedureItem"/>
			</section>
		</component>
	</xsl:template>
	<!--手术操作章节-手术记录条目-->
	<xsl:template match="Items/ProcedureItem">
		<entry>		
			<procedure classCode="PROC" moodCode="EVN">
				<xsl:if test="code/Value">
					<code code="{code/Value}" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表（ICD-9-CM）"/>
				</xsl:if>
				<statusCode/>
				<!--操作日期/时间-->
				<xsl:comment>操作日期/时间</xsl:comment>
				<xsl:if test="procedureTime/Value">
					<effectiveTime value="{procedureTime/Value}"/>
				</xsl:if>
				<!--操作部位代码-->
				<xsl:comment>操作部位代码</xsl:comment>
				<xsl:if test="bodyPart/Value">
					<targetSiteCode code="{bodyPart/Value}" codeSystem="2.16.156.10011.2.3.1.266" codeSystemName="操作部位代码表"/>
				</xsl:if>
				<!--手术操作名称-->
				<xsl:comment>手术操作名称</xsl:comment>
				<xsl:if test="name/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.094.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{name/displayName}"/>
							<value xsi:type="ST">
								<xsl:value-of select="name/Value"/>
							</value>
						</observation>
					</entryRelationship>
				</xsl:if>
				<!--介入物名称-->
				<xsl:comment>介入物名称</xsl:comment>
				<xsl:if test="intervention/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE08.50.037.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{intervention/displayName}"/>
							<value xsi:type="ST">
								<xsl:value-of select="intervention/Value"/>
							</value>
						</observation>
					</entryRelationship>
				</xsl:if>
				<!--操作方法-->
				<xsl:comment>操作方法</xsl:comment>
				<xsl:if test="operationWay/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.251.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{operationWay/displayName}"/>
							<value xsi:type="ST">
								<xsl:value-of select="operationWay/Value"/>
							</value>
						</observation>
					</entryRelationship>
				</xsl:if>		
				<!--操作次数-->
				<xsl:comment>操作次数</xsl:comment>
				<xsl:if test="operationTimes/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.250.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{operationTimes/displayName}"/>
							<value xsi:type="ST">
								<xsl:value-of select="operationTimes/Value"/>
							</value>
						</observation>
					</entryRelationship>	
				</xsl:if>
				<!--麻醉方式 -->
				<xsl:comment>麻醉方式</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<xsl:if test="anesthesiaMethod/Value">
							<code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{anesthesiaMethod/displayName}"/>
							<value code="{anesthesiaMethod/Value}" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方式代码表" xsi:type="CD"/>
						</xsl:if>
						<!-- 麻醉医师签名 -->
						<xsl:comment>麻醉医师签名</xsl:comment>
						<performer>
							<assignedEntity>
								<id/>
								<assignedPerson>
									<name>
										<xsl:value-of select="anesthesiaDoctor/Value"/>
									</name>
								</assignedPerson>
							</assignedEntity>
						</performer>
					</observation>
				</entryRelationship>
				<!--麻醉观察结果-->
				<xsl:comment>麻醉观察结果</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{anesthesiaObservation/displayName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="anesthesiaObservation/Value"/>
						</value>
					</observation>
				</entryRelationship>
				<!--麻醉中西医标识代码-->
				<xsl:comment>麻醉中西医标识代码</xsl:comment>
				<xsl:if test="anesthesiaWay/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.307.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{anesthesiaWay/displayName}"/>
							<value code="{anesthesiaWay/Value}" codeSystem="2.16.156.10011.2.3.2.41" codeSystemName="麻醉中西医标识代码表" xsi:type="CD"/>
						</observation>
					</entryRelationship>
				</xsl:if>
			</procedure>
		</entry>
	</xsl:template>
	<!--体格检查章节模板-->
	<xsl:template match="ERPhysicalExam">
		<component>
			<section>
				<code code="29545-1" displayName="PHYSICAL EXAMINATION" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--特殊检查条目-->
				<xsl:comment>特殊检查条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.01.079.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{special/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="special/Value"/></value>
					</observation>
				</entry>
				<!--检查方法名称条目-->
				<xsl:comment>检查方法名称条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.10.027.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{name/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="name/Value"/></value>
					</observation>
				</entry>
				<!--检查类别条目-->
				<xsl:comment>检查类别条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.30.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{type/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="type/Value"/></value>
					</observation>
				</entry>
				<!--检查项目条目-->
				<xsl:comment>检查项目条目</xsl:comment>
				<xsl:apply-templates select="Items/Item"></xsl:apply-templates>
				
				
			</section>
		</component>
	</xsl:template>
	<!--体格检查：检查项目条目-->
	<xsl:template match="Items/Item">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE04.30.019.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检查项目代码"/>
				<!-- 检查日期 -->
				<xsl:comment>检查日期</xsl:comment>
				<effectiveTime value="{date/Value}"/>
				<value xsi:type="ST"><xsl:value-of select="code/Value"/></value>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.50.134.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="标本类别"/>
						<!-- DE04.50.137.00	标本采样日期时间 DE04.50.141.00	接收标本日期时间 -->
						<effectiveTime>
							<low value="{collectTime/Value}"/>
							<high value="{receiveTime/Value}"/>
						</effectiveTime>
						<value xsi:type="ST"><xsl:value-of select="type/Value"/></value>
					</observation>
				</entryRelationship>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.50.135.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="标本状态"/>
						<value xsi:type="ST"><xsl:value-of select="specimenStatus/Value"/></value>
					</observation>
				</entryRelationship>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE08.50.027.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="标本固定液名称"/>
						<value xsi:type="ST"><xsl:value-of select="specimenFixing/Value"/></value>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE04.30.017.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检查结果代码"/>
				<value xsi:type="CD" code="{resultCode/Value}" codeSystem="2.16.156.10011.2.3.2.38" codeSystemName="检查（检验）结果代码表"/>
			</observation>
		</entry>
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE04.30.015.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检查定量结果"/>
				<value xsi:type="REAL" value="{value/Value}"/>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.30.016.00" displayName="检查定量结果计量单位" codeSystemName="卫生信息数据元目录" codeSystem="2.16.156.10011.2.2.1"/>
						<value xsi:type="ST"><xsl:value-of select="unit/Value"/></value>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>
	<!-- 其他处置章节模板 -->
	<xsl:template match="OtherProc">
		<component>
			<section>
				<code displayName="其他处置章节"/>
				<text/>
				<!-- 诊疗过程描述　-->
				<xsl:comment>诊疗过程描述</xsl:comment>
				<xsl:if test="treatmentProc/Value">
					<entry typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.296.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{treatmentProc/displayName}"/>
							<value xsi:type="ST">
								<xsl:value-of select="treatmentProc/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>	
			</section>
		</component>
	</xsl:template>
	<!-- 检查报告章节模板 -->
	<xsl:template match="CheckReport">
		<component>
			<section>
				<code displayName="检查报告"/>
				<text/>
				<xsl:if test="objective/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.50.131.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{objective/displayName}"/>
							<value xsi:type="ST">
								<xsl:value-of select="objective/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
				<xsl:if test="subjective/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.50.132.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{subjective/displayName}"/>
							<value xsi:type="ST">
								<xsl:value-of select="subjective/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
				<xsl:if test="dept/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE08.10.026.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{dept/displayName}"/>
							<value xsi:type="ST">
								<xsl:value-of select="dept/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
				<xsl:if test="org/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE08.10.013.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{org/displayName}"/>
							<value xsi:type="ST">
								<xsl:value-of select="org/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
				<xsl:if test="notes/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.179.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{notes/displayName}"/>
							<value xsi:type="ST">
								<xsl:value-of select="notes/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
			</section>
		</component>
	</xsl:template>
</xsl:stylesheet>
