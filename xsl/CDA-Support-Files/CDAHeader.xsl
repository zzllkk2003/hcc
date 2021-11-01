<!-- This file contains templates regrading CDAHeader, Author, CreationTime-->
<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--effectiveTime-->
	<xsl:template name="effectiveTime">
		<effectiveTime value="{Header/activity/effectiveTime}"/>
	</xsl:template>
	<!--DocumentUID-->
	<xsl:template name="DocumentNo">
		<id root="2.16.156.10011.1.1" extension="{DocumentNo}"/>
		<code code="{Header/activity/code}" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
	</xsl:template>
	<xsl:template name="languageCode">
		<languageCode code="{Header/activity/languageCode}"/>
	</xsl:template>
	<!--Confidentiality-->
	<xsl:template name="Confidentiality">
		<confidentialityCode code="{Header/activity/confidentialityCode}" codeSystem="2.16.840.1.113883.5.25" codeSystemName="Confidentiality" displayName="正常访问保密级别"/>
	</xsl:template>
	<!--相关文档-->
	<xsl:template match="*" mode="relatedDocument">
		<xsl:comment>相关文档</xsl:comment>
		<relatedDocument typeCode="RPLC">
			<parentDocument classCode="DOCCLIN" moodCode="EVN">
				<id root="2.16.156.10011.1.1.2" extension="{parentDocumentId}"/>
				<setId/>
				<versionNumber/>
			</parentDocument>
		</relatedDocument>
	</xsl:template>
	<!-- 文档创建者1-->
	<xsl:template match="*" mode="AuthorWithOrganization">
		<xsl:comment>文档作者</xsl:comment>
		<author typeCode="AUT" contextControlCode="OP">
			<!--CDR里文档只考虑了一个时间, 没有建档时间的考虑-->
			<time value="{time}"/>
			<assignedAuthor classCode="ASSIGNED">
				<id root="2.16.156.10011.1.7" extension="{assignedPersonName/Value}"/>
				<assignedPerson>
					<name>
						<xsl:value-of select="assignedPersonName/Value"/>
					</name>
				</assignedPerson>
				<representedOrganization>
					<id root="2.16.156.10011.1.5" extension="{representedOrganization/id/Value}"/>
					<name>
						<xsl:value-of select="representedOrganization/name/Value"/>
					</name>
				</representedOrganization>
			</assignedAuthor>
		</author>
	</xsl:template>
	<!-- 文档创建者2-->
	<xsl:template match="*" mode="AuthorNoOrganization">
		<xsl:comment>文档作者</xsl:comment>
		<author typeCode="AUT" contextControlCode="OP">
			<time value="{time}"/>
			<assignedAuthor classCode="ASSIGNED">
				<id root="2.16.156.10011.1.7" extension="{assignedPersonId}"/>
				<assignedPerson>
					<name>
						<xsl:value-of select="assignedPersonName/Value"/>
					</name>
				</assignedPerson>
			</assignedAuthor>
		</author>
	</xsl:template>
	<!--保管机构-->
	<xsl:template match="*" mode="Custodian">
		<xsl:comment>保管机构</xsl:comment>
		<custodian typeCode="CST">
			<assignedCustodian classCode="ASSIGNED">
				<representedCustodianOrganization classCode="ORG" determinerCode="INSTANCE">
					<id root="2.16.156.10011.1.5" extension="{organizationId}"/>
					<name>
						<xsl:value-of select="organizationName"/>
					</name>
					<telecom value="{organizationTel}"/>
					<addr>
						<xsl:value-of select="organizationAddr"/>
					</addr>
				</representedCustodianOrganization>
			</assignedCustodian>
		</custodian>
	</xsl:template>
	<!-- 法律责任参与者签名 -->
	<xsl:template match="*" mode="legalAuthenticator">
		<xsl:comment>法律责任参与者签名</xsl:comment>
		<legalAuthenticator>
			<!-- 签名 -->
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
	</xsl:template>
	<!-- Authenticator -->
	<xsl:template match="*" mode="Authenticator">
		<xsl:comment>Authenticator</xsl:comment>
		<authenticator>
			<time value="{time/Value}"/>
			<signatureCode/>
			<assignedEntity>
				<id root="2.16.156.10011.1.4" extension="{assignedEntityCode}"/>
				<code displayName="{assignedEntityCode}"/>
				<assignedPerson classCode="PSN" determinerCode="INSTANCE">
					<name>
						<xsl:value-of select="assignedPersonName/Display"/>
					</name>
				</assignedPerson>
			</assignedEntity>
		</authenticator>
	</xsl:template>
</xsl:stylesheet>
