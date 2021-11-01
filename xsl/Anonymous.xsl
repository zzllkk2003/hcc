<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:isc="http://extension-functions.intersystems.com" xmlns:hl7="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:exsl="http://exslt.org/common" exclude-result-prefixes="isc hl7 sdtc xsi exsl">
	<xsl:output method="xml"/>
	<xsl:template match="/">
		<xsl:apply-templates select="*"/>
	</xsl:template>
	<xsl:template match="*">
		<xsl:copy>
			<xsl:for-each select="@*">
				<xsl:copy/>
			</xsl:for-each>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<!--patient name -->
	<xsl:template match="hl7:patient/hl7:name">
		<xsl:element name="{local-name()}" namespace="urn:hl7-org:v3">********</xsl:element>
	</xsl:template>
	<!--patient telcom and id  -->
	<xsl:template match="hl7:patientRole/hl7:id|hl7:patient/hl7:id">
		<xsl:element name="{local-name()}" namespace="urn:hl7-org:v3">
			<xsl:attribute name="root"><xsl:value-of select="@root"/></xsl:attribute>
			<xsl:attribute name="extension">******</xsl:attribute>
		</xsl:element>
	</xsl:template>
	<xsl:template match="hl7:patientRole/hl7:addr/*">
		<xsl:element name="{local-name()}" namespace="urn:hl7-org:v3">
			<xsl:value-of select="'******'"/>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
