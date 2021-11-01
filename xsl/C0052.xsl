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

			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.72"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>住院医嘱</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!--住院号-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					<xsl:apply-templates select="Header/recordTarget/telcom" mode="PhoneNumber"/>
					<patient classCode="PSN" determinerCode="INSTANCE">
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
			<!-- 保管机构-数据录入者信息 -->
			<xsl:if test="Header/custodian">
				<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			</xsl:if>
				
			<!--关联活动信息-->
			<xsl:if test="Header/RelatedDocuments/RelatedDocument">
				<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			</xsl:if>
			
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<componentOf typeCode="COMP">
				<!--就诊-->
				<encompassingEncounter classCode="ENC" moodCode="EVN">
					<code/>
					<!--就诊时间-->
					<effectiveTime>
						<!--医嘱开立日期时间-->
						<xsl:comment>医嘱开立日期时间</xsl:comment>
						<xsl:if test="Header/encompassingEncounter/effectiveTimeLow/Value">
							<low value="{Header/encompassingEncounter/effectiveTimeLow/Value}"/>
						</xsl:if>
						
					</effectiveTime>
					<location typeCode="LOC">
						<healthCareFacility classCode="SDLOC">
							<!--机构角色-->
							<serviceProviderOrganization classCode="ORG" determinerCode="INSTANCE">
								<asOrganizationPartOf classCode="PART">
									<!--床位号-->
									<xsl:comment>床位号</xsl:comment>
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<!--N:加上OID-->
										<xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
											<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
										</xsl:if>
										
										<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/bedNum/Value"/></name>
										<!--病房号-->
										<xsl:comment>病房号</xsl:comment>
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<!--N:加上OID-->
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/wardName/Value"/></name>
												<!--病区-->
												<xsl:comment>病区</xsl:comment>
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<!--N:加上OID-->
												<xsl:if test="Header/encompassingEncounter/Locations/Location/areaId">
													<id root="2.16.156.10011.1.27" extension="{Header/encompassingEncounter/Locations/Location/areaId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaNum/Value"/></name>
												<!--科室-->
												<xsl:comment>科室</xsl:comment>
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<!--N:加上OID-->
												<xsl:if test="Header/encompassingEncounter/Locations/Location/deptId">
													<id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/deptId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptNum/Value"/></name>
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
					<!--生命体征章节-->
					<xsl:comment>生命体征章节</xsl:comment>
					<xsl:apply-templates select="VitalSigns"/>
					<!--医嘱章节-->
					<xsl:comment>医嘱章节</xsl:comment>
					<xsl:apply-templates select="ProviderOrder"/>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>

	<!--生命体征章节模板-->
	<xsl:template match="VitalSigns">
		<component>
			<section>
				<code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
					displayName="VITAL SIGNS"/>
				<text/>
				<xsl:comment>体重</xsl:comment>
				<entry>
					<xsl:if test="VitalSign/type = 'DE04.10.188.00'">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="体重"/>
							<!--N:定为生命体征，疑问-->
							<value xsi:type="PQ" value="{VitalSign/value}" unit="kg"/>
						</observation>
					</xsl:if>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--医嘱章节模板-->
	<xsl:template match="ProviderOrder">
		<component>
			<section>
				<!--N:!!!-->
				<code code="46209-3" codeSystem="2.16.840.1.113883.6.1"
					displayName="Provider Orders" codeSystemName="LOINC"/>
				<text/>
				<xsl:comment>医嘱类别</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.286.00" displayName="医嘱类别"
							codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<xsl:choose>
							<xsl:when test="type/Value and type/Display">
								<value xsi:type="CD" code="{type/Value}" displayName="{type/Display}"
									codeSystem="2.16.156.10011.2.3.2.58" codeSystemName="医嘱类别代码表"/>
							</xsl:when>
							<xsl:when test="type/Value and not(type/Display)">
								<value xsi:type="CD" code="{type/Value}"
									codeSystem="2.16.156.10011.2.3.2.58" codeSystemName="医嘱类别代码表"/>
							</xsl:when>
						</xsl:choose>
						
					</observation>
				</entry>
				<!--住院医嘱条目-->
				<xsl:comment>住院医嘱条目</xsl:comment>
				<xsl:apply-templates select="Items/Item"/>

			</section>
		</component>
	</xsl:template>
	<!--住院医嘱条目-->
	<xsl:template match="Items/Item">
		<entry>
			<organizer classCode="CLUSTER" moodCode="EVN">
				<statusCode/>
				<xsl:comment>医嘱项目类型</xsl:comment>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.289.00" displayName="医嘱项目类型"
							codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<xsl:choose>
							<xsl:when test="orderType/Value and orderType/Display">
								<value xsi:type="CD" code="{orderType/Value}"
									displayName="{orderType/Display}" codeSystem="2.16.156.10011.2.3.1.268"
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

						<!--作者：医嘱开立者-->
						<xsl:comment>医嘱开立者</xsl:comment>
						<author>
							<!--医嘱开立日期时间：DE06.00.220.00-->
							<time value="{place/Time/Value}"/>
							<assignedAuthor>
								<id/>
								<code displayName="医嘱开立者"/>
								<!--医嘱开立者签名：DE02.01.039.00-->
								<assignedPerson>
									<name>
										<xsl:value-of select="place/provider/Value"/>
									</name>
								</assignedPerson>
								<!--医嘱开立科室：DE08.10.026.00-->
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
								<playingEntity classCode="PSN" determinerCode="INSTANCE">
									<name>
										<xsl:value-of select="review/provider/Value"/>
									</name>
								</playingEntity>
							</participantRole>
						</participant>
						<!--医嘱核对-->
						<xsl:comment>医嘱核对</xsl:comment>
						<participant typeCode="ATND">
							<!--医嘱核对日期时间：DE06.00.205.00-->
							<time value="{verify/Time/Value}"/>
							<participantRole classCode="ASSIGNED">
								<!--角色-->
								<code displayName="医嘱核对人"/>
								<!--医嘱核对护士签名：DE02.01.039.00-->
								<playingEntity classCode="PSN" determinerCode="INSTANCE">
									<name>
										<xsl:value-of select="verify/provider/Value"/>
									</name>
								</playingEntity>
							</participantRole>
						</participant>
						<!--医嘱停止-->
						<xsl:comment>医嘱停止</xsl:comment>
						<xsl:if test="terminate/provider/Value">
							<participant typeCode="ATND">
								<!--医嘱停止日期时间：DE06.00.218.00-->
								<time value="{terminate/Time/Value}"/>
								<participantRole classCode="ASSIGNED">
									<!--角色-->
									<code displayName="医嘱停止人"/>
									<!--停止医嘱者签名：DE02.01.039.00-->
									<playingEntity classCode="PSN" determinerCode="INSTANCE">
										<name><xsl:value-of select="terminate/provider/Value"/></name>
									</playingEntity>
								</participantRole>
							</participant>
						</xsl:if>
						
						<!--医嘱取消-->
						<xsl:comment>医嘱取消</xsl:comment>
						<xsl:if test="cancel/provider/Value">
							<participant typeCode="ATND">
								<!--医嘱取消日期时间：DE06.00.234.00-->
								<time value="{cancel/Time/Value}"/>
								<participantRole classCode="ASSIGNED">
									<!--角色-->
									<code displayName="医嘱取消人"/>
									<!--取消医嘱者签名：DE02.01.039.00-->
									<playingEntity classCode="PSN" determinerCode="INSTANCE">
										<name>
											<xsl:value-of select="cancel/provider/Value"/>
										</name>
									</playingEntity>
								</participantRole>
							</participant>
						</xsl:if>
						
						<!--医嘱备注信息-->
						<xsl:comment>医嘱备注信息</xsl:comment>
						<xsl:if test="notes/Value">
							<entryRelationship typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.179.00" displayName="医嘱备注信息"
										codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="ST">
										<xsl:value-of select="notes/Value"/>
									</value>
								</observation>
							</entryRelationship>
						</xsl:if>
						
						<!--医嘱执行状态-->
						<xsl:comment>医嘱执行状态</xsl:comment>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.290.00" displayName="医嘱执行状态"
									codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
								<value xsi:type="ST">
									<xsl:value-of select="exec/status/Value"/>
								</value>
								<!--执行者-->
								<xsl:comment>执行者</xsl:comment>
								<performer>
									<!--医嘱执行日期时间：DE06.00.222.00-->
									<time value="{exec/Time/Value}"/>
									<assignedEntity>
										<id/>
										<code displayName="医嘱执行者"/>
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
							</observation>
						</entryRelationship>
						<!--电子申请单编号-->
						<xsl:comment>电子申请单编号</xsl:comment>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE01.00.008.00" displayName="电子申请单编号"
									codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
								<value xsi:type="ST">
									<xsl:value-of select="eApplyNo/Value"/>
								</value>
							</observation>
						</entryRelationship>
						<!--处方药品组号-->
						<xsl:comment>处方药品组号</xsl:comment>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE08.50.056.00" displayName="处方药品组号"
									codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
								<value xsi:type="ST">
									<xsl:value-of select="groupNo/Value"/>
								</value>
							</observation>
						</entryRelationship>
					</observation>
				</component>
			</organizer>
		</entry>
	</xsl:template>

</xsl:stylesheet>
