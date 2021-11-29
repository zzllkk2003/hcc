<!-- This file contains templates regrading CDAHeader, Author, CreationTime-->
<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--effectiveTime-->
	<xsl:template name="effectiveTime">
		<effectiveTime value="{Header/activity/effectiveTime}"/>
	</xsl:template>

</xsl:stylesheet>
