<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:template match="*" mode="providerOrganization">
		<providerOrganization classCode="ORG" determinerCode="INSTANCE">
			<!--机构标识号-->
			<id root="2.16.156.10011.1.5" extension="{providerOrganizationId/Value}"/>
			<!--住院机构名称-->
			<name>
				<xsl:value-of select="providerOrganizationId/Display"/>
			</name>
		</providerOrganization>
	</xsl:template>
	<xsl:template match="*" mode="EncompassingEncounter0032">	
			<!--就诊-->
			<encompassingEncounter classCode="ENC" moodCode="EVN">
				<!--入院途径 -->
				<code code="{admissionCode/Value}" displayName="{admissionCode/Display}" codeSystem="2.16.156.10011.2.3.1.270" codeSystemName="入院途径代码表"/>
				<!--就诊时间-->
				<effectiveTime>
					<!--入院日期-->
					<low value="{effectiveTimeLow/Value}"/>
					<!--出院日期-->
					<high value="{effectiveTimeHigh/Value}"/>
				</effectiveTime>
				<location typeCode="LOC">
					<healthCareFacility classCode="SDLOC">
						<!--机构角色-->
						<serviceProviderOrganization classCode="ORG" determinerCode="INSTANCE">
							<!--入院病房-->
							<asOrganizationPartOf classCode="PART">
								<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
									<id root="2.16.156.10011.1.21" extension="{Locations/Location/wardName/Display}"/>
									<name>无</name>
									<!--入院科室-->
									<asOrganizationPartOf classCode="PART">
										<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
											<id root="2.16.156.10011.1.26" extension="{Locations/Location/deptName/Display}"/>
											<name>
												<xsl:value-of select="Locations/Location/deptName/Display"/>
											</name>
										</wholeOrganization>
									</asOrganizationPartOf>
								</wholeOrganization>
							</asOrganizationPartOf>
						</serviceProviderOrganization>
					</healthCareFacility>
				</location>
			</encompassingEncounter>
	</xsl:template>
	<xsl:template match="*" mode="EncompassingEncounter">
		<!--住院状况模板： C0038-->
		<xsl:comment>住院信息</xsl:comment>
		<encompassingEncounter>
			<!-- 入院日期时间 -->
			<effectiveTime value="20121112102325"/>
			<location>
				<healthCareFacility>
					<serviceProviderOrganization>
						<asOrganizationPartOf classCode="PART">
							<!-- DE01.00.026.00	病床号 -->
							<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
								<id root="2.16.156.10011.1.22" extension="001"/>
								<name><xsl:value-of select="bedNum/Value"/></name>
								<!-- DE01.00.019.00	病房号 -->
								<asOrganizationPartOf classCode="PART">
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<id root="2.16.156.10011.1.21" extension="001"/>
										<name><xsl:value-of select="wardName/Value"/></name>
										<!-- DE08.10.026.00	科室名称 -->
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
												<id root="2.16.156.10011.1.26" extension="001"/>
												<name><xsl:value-of select="deptName/Value"/></name>
												<!-- DE08.10.054.00	病区名称 -->
												<asOrganizationPartOf classCode="PART">
													<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
														<id root="2.16.156.10011.1.27" extension="001"/>
														<name><xsl:value-of select="areaName/Value"/></name>
														<!--XXX医院 -->
														<asOrganizationPartOf classCode="PART">
															<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
																<id root="2.16.156.10011.1.5" extension="{hosId}"/>
																<name><xsl:value-of select="hosName"/></name>
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
	</xsl:template>
</xsl:stylesheet>
