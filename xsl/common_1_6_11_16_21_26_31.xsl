<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:isc="http://extension-functions.intersystems.com" xmlns:exsl="http://exslt.org/common" xmlns:set="http://exslt.org/sets" exclude-result-prefixes="isc sdtc exsl set">
	<xsl:output method="xml"/>
	<xsl:template match="/Document">
		<!--1.一般状况检查章节-EMR12-->
		<xsl:apply-templates select="GeneralStatus/result"/>
		<!--11.四肢章节-EMR17-->
		<xsl:apply-templates select="Extremities/arteriaDorsalPedisPulse"/>
		<!--16.手术过程描述章节-EMR9-->
		<xsl:apply-templates select="ProcedureNote"/>
		<!--21.术后交接章节-EMR19-->
		<xsl:call-template name="Postoperation"/>
		<!--26.病例摘要章节-EMR46-->
		<xsl:apply-templates select="MRSummary/content"/>
		<!--31.高值耗材章节-EMR22-->
		<xsl:apply-templates select="HighValueConsumables/HighValueConsumable"/>
	</xsl:template>
	<!--一般状况检查章节模板-->
	<xsl:template match="GeneralStatus/result">
		<component>
			<section>
				<code code="10210-3" displayName="GENERAL STATUS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--一般状况检查结果-->
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.219.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="一般状况检查结果"/>
						<value xsi:type="ST">
							<xsl:value-of select="Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--四肢章节模板-->
	<xsl:template match="Extremities/arteriaDorsalPedisPulse">
		<component>
			<section>
				<code code="10196-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="EXTREMITIES"/>
				<title>四肢章节</title>
				<text/>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.237.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="足背动脉搏动标志"/>
						<value xsi:type="BL" value="{Value}"/>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--手术过程描述章节模板-->
	<xsl:template match="ProcedureNote">
		<component>
			<section>
				<code code="8724-7" displayName="Surgical operation note description" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--一般状况检查结果-->
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.063.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术过程描述"/>
						<value xsi:type="ST">
							<xsl:value-of select="notes/Value"/>
						</value>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.187.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术目标部位名称"/>
								<value xsi:type="ST">
									<xsl:value-of select="bodyPartName/Value"/>
								</value>
							</observation>
						</entryRelationship>
						<!--介入物名称 -->
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE08.50.037.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="介入物名称"/>
								<value xsi:type="ST">
									<xsl:value-of select="intervention/Value"/>
								</value>
							</observation>
						</entryRelationship>
						<!--手术体位代码 -->
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.260.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术体位代码"/>
								<value xsi:type="CD" code="{bodyPosition/Value}" displayName="{bodyPosition/Display}" codeSystem="2.16.156.10011.2.3.1.262" codeSystemName="手术体位代码表"/>
							</observation>
						</entryRelationship>
						<!--皮肤消毒描述-->
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE08.50.057.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="皮肤消毒描述"/>
								<value xsi:type="ST">
									<xsl:value-of select="skinDisinfection/Value"/>
								</value>
							</observation>
						</entryRelationship>
						<!--手术切口描述-->
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.321.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术切口描述"/>
								<value xsi:type="ST">
									<xsl:value-of select="cutNotes/Value"/>
								</value>
							</observation>
						</entryRelationship>
						<!--引流标志-->
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE05.10.165.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="引流标志"/>
								<value xsi:type="BL" value="{drainage/Value}"/>
							</observation>
						</entryRelationship>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--术后交接模板-->
	<xsl:template name="Postoperation">
		<component>
			<section>
				<code code="8648-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Hospital Course"/>
				<title>住院过程章节章节</title>
				<xsl:apply-templates select="PostoperationHandover"/>
			</section>
		</component>
	</xsl:template>
	<!--术后交接条目-->
	<xsl:template match="PostoperationHandover">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE06.00.206.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="病人交接核对项目"/>
				<value xsi:type="ST">病人交接核对项目</value>
				<!--交接护士-->
				<author>
					<!--交接日期时间：DE09.00.107.00-->
					<!--<time  value="201210240910"/>-->
					<time value="{time/Value}"/>
					<assignedAuthor>
						<id/>
						<code displayName="交接护士"/>
						<!--交接护士签名：DE02.01.039.00-->
						<assignedPerson>
							<name>
								<xsl:value-of select="nurseName/Value"/>
								<prefix>交接护士</prefix>
							</name>
						</assignedPerson>
					</assignedAuthor>
				</author>
				<!--转运者-->
				<participant typeCode="ATND">
					<participantRole classCode="ASSIGNED">
						<!--角色-->
						<code code="PP" displayName="转运者" codeSystem="2.16.840.1.113883.12.443" codeSystemName="Provider Role"/>
						<!--转运者签名：DE02.01.039.00-->
						<playingEntity classCode="PSN" determinerCode="INSTANCE">
							<name>
								<xsl:value-of select="transporter/Value"/>
								<prefix>转运者</prefix>
							</name>
						</playingEntity>
					</participantRole>
				</participant>
			</observation>
		</entry>
	</xsl:template>
	<!--病例摘要章节模板-->
	<xsl:template match="MRSummary/content">
		<component>
			<section>
				<code code="DE06.00.182.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="病历摘要章节"/>
				<text>
					<xsl:value-of select="Value"/>
				</text>
			</section>
		</component>
	</xsl:template>
	<!--高值耗材章节模板-->
	<xsl:template match="HighValueConsumables/HighValueConsumable">
		<component>
			<section>
				<code code="10160-0" codeSystem="2.16.840.1.113883.6.1" displayName="HISTORY OF MEDICATION USE" codeSystemName="LOINC"/>
				<title>高值耗材章节</title>
				<text/>
				<entry>
					<substanceAdministration classCode="SBADM" moodCode="EVN">
						<text/>
						<!--使用途径：DE06.00.242.00-->
						<routeCode nullFlavor="OTH">
							<originalText>
								<xsl:value-of select="route/Value"/>
							</originalText>
						</routeCode>
						<!--耗材数量DE06.00.241.00、耗材单位DE08.50.034.00 -->
						<doseQuantity value="{quantity/Value}" unit="{unit/Value}"/>
						<consumable>
							<manufacturedProduct>
								<!--产品编码-->
								<id root="{productNo/codeSystem}" extension="{productNo/Value}"/>
								<manufacturedMaterial>
									<!--材料名称 -->
									<code/>
									<name>
										<xsl:value-of select="name/displayName"/>
									</name>
								</manufacturedMaterial>
								<manufacturerOrganization>
									<name>
										<xsl:value-of select="manufacturer/displayName"/>
									</name>
									<asOrganizationPartOf>
										<wholeOrganization>
											<name>
												<xsl:value-of select="provider/displayName"/>
											</name>
										</wholeOrganization>
									</asOrganizationPartOf>
								</manufacturerOrganization>
							</manufacturedProduct>
						</consumable>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE08.50.058.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="植入性耗材标志"/>
								<!-- 植入性耗材标志：DE08.50.058.00 -->
								<value xsi:type="BL" value="{implantable/Value}"/>
							</observation>
						</entryRelationship>
					</substanceAdministration>
				</entry>
			</section>
		</component>
	</xsl:template>
</xsl:stylesheet>
