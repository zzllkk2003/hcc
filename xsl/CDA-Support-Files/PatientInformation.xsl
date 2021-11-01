<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--****************************************-->
	<!--		患者医疗号码						-->
	<!--****************************************-->
	<!--假设患者的PatientID只是身份证号一种-->
	<xsl:template match="*" mode="healthRecordNumber">
		<xsl:comment>健康档案标识号</xsl:comment>
		<id root="2.16.156.10011.1.2" extension="{Value}"/>
	</xsl:template>
	<xsl:template match="*" mode="HealthCardNumber">
		<xsl:comment>健康卡号</xsl:comment>
		<id root="2.16.156.10011.1.19" extension="{Value}"/>
	</xsl:template>
	<xsl:template match="*" mode="MPIID">
		<xsl:comment>病案号标识</xsl:comment>
		<id root="2.16.156.10011.1.13" extension="{MPIID}"/>
	</xsl:template>
	<xsl:template match="*" mode="MRN">
		<xsl:comment>患者身份标识</xsl:comment>
		<id root="2.16.156.10011.1.3" extension="{Value}"/>
	</xsl:template>
	<!--患者身份证号-->
	<xsl:template match="*" mode="nationalIdNumber">
		<xsl:comment>患者身份证号码</xsl:comment>
		<id root="2.16.156.10011.1.3" extension="{Value}"/>
	</xsl:template>
	<xsl:template match="*" mode="outpatientNum">
		<xsl:comment>门急诊号</xsl:comment>
		<id root="2.16.156.10011.1.11" extension="{Value}"/>
	</xsl:template>
	<xsl:template match="*" mode="inpatientNum">
		<xsl:comment>住院号</xsl:comment>
		<id root="2.16.156.10011.1.12" extension="{Value}"/>
	</xsl:template>
	<xsl:template match="*" mode="patientType">
		<xsl:comment>患者类别代码</xsl:comment>
		<id root="2.16.156.10011.1.32" extension="{Value}"/>
	</xsl:template>
	<xsl:template match="*" mode="specimenNum">
		<xsl:comment>标本编号标识</xsl:comment>
		<id root="2.16.156.10011.1.14" extension="{Value}"/>
	</xsl:template>
	<xsl:template match="*" mode="labOrderNum">
		<xsl:comment>电子申请单编号</xsl:comment>
		<id root="2.16.156.10011.1.24" extension="{Value}"/>
	</xsl:template>
	<xsl:template match="*" mode="labReportNum">
		<xsl:comment>检查报告单号标识</xsl:comment>
		<id root="2.16.156.10011.1.32" extension="{Value}"/>
	</xsl:template>
	<!--****************************************-->
	<!--		患者基本信息						-->
	<!--****************************************-->
	<!--姓名-->
	<xsl:template match="*" mode="Name">
		<xsl:comment>患者姓名</xsl:comment>
		<name>
			<xsl:value-of select="Value"/>
		</name>
	</xsl:template>
	<!--性别-->
	<xsl:template match="*" mode="Gender">
		<xsl:comment>患者性别</xsl:comment>
		<administrativeGenderCode code="{Value}" codeSystemName="生理性别代码表(GB/T 2261.1)" codeSystem="2.16.156.10011.2.3.3.4" displayName="{displayName}"/>
	</xsl:template>
	<!--生日 BirthTime-->
	<xsl:template match="*" mode="BirthTime">
		<xsl:comment>患者出生时间</xsl:comment>
		<birthTime value="{Value}"/>
	</xsl:template>
	<!--年龄 Age -->
	<xsl:template match="*" mode="Age">
		<xsl:comment>患者年龄</xsl:comment>
		<age unit="岁" value="{Value}"/>
	</xsl:template>
	<!--PhoneNumber-->
	<xsl:template match="*" mode="PhoneNumber">
		<xsl:comment>电话</xsl:comment>
		<telecom value="{Value}"/>
	</xsl:template>
	<!--地址 Address-->
	<xsl:template match="*" mode="Address">
		<xsl:comment>住址</xsl:comment>
		<addr use="H">
			<houseNumber>
				<xsl:value-of select="houseNum/Value"/>
			</houseNumber>
			<streetName>
				<xsl:value-of select="streetName/Value"/>
			</streetName>
			<township>
				<xsl:value-of select="township/Value"/>
			</township>
			<county>
				<xsl:value-of select="county/Value"/>
			</county>
			<city>
				<xsl:value-of select="city/Value"/>
			</city>
			<state>
				<xsl:value-of select="state/Value"/>
			</state>
			<postalCode>
				<xsl:value-of select="postCode/Value"/>
			</postalCode>
		</addr>
	</xsl:template>
	<!-- 籍贯信息 -->
	<xsl:template match="*" mode="nativePlace">
		<nativePlace>
			<place classCode="PLC" determinerCode="INSTANCE">
				<houseNumber>
					<xsl:value-of select="houseNum/Value"/>
				</houseNumber>
				<streetName>
					<xsl:value-of select="streetName/Value"/>
				</streetName>
				<township>
					<xsl:value-of select="township/Value"/>
				</township>
				<county>
					<xsl:value-of select="county/Value"/>
				</county>
				<city>
					<xsl:value-of select="city/Value"/>
				</city>
				<state>
					<xsl:value-of select="state/Value"/>
				</state>
				<postalCode>
					<xsl:value-of select="postCode/Value"/>
				</postalCode>
			</place>
		</nativePlace>
	</xsl:template>
	<!-- 户口 -->
	<xsl:template match="*" mode="household">
		<household>
			<place classCode="PLC" determinerCode="INSTANCE">
				<houseNumber>
					<xsl:value-of select="houseNum/Value"/>
				</houseNumber>
				<streetName>
					<xsl:value-of select="streetName/Value"/>
				</streetName>
				<township>
					<xsl:value-of select="township/Value"/>
				</township>
				<county>
					<xsl:value-of select="county/Value"/>
				</county>
				<city>
					<xsl:value-of select="city/Value"/>
				</city>
				<state>
					<xsl:value-of select="state/Value"/>
				</state>
				<postalCode>
					<xsl:value-of select="postCode/Value"/>
				</postalCode>
			</place>
		</household>
	</xsl:template>
	<!-- 出生地 -->
	<xsl:template match="*" mode="BirthPlace">
		<birthplace>
			<place classCode="PLC" determinerCode="INSTANCE">
				<addr>
					<county>
						<xsl:value-of select="county/Value"/>
					</county>
					<city>
						<xsl:value-of select="city/Value"/>
					</city>
					<state>
						<xsl:value-of select="state/Value"/>
					</state>
					<postalCode>
						<xsl:value-of select="postCode/Value"/>
					</postalCode>
				</addr>
			</place>
		</birthplace>
	</xsl:template>
	<!--Age-->
	<xsl:template match="*" mode="Age">
		<age unit="岁" value="{Value}"/>
	</xsl:template>
	<!--employerOrganization-->
	<!--Question: if using xsl:copy to copy EmployerOrganization, always put namespace in attribute, why?-->
	<xsl:template match="*" mode="Employer">
		<xsl:comment>工作单位</xsl:comment>
		<employerOrganization>
			<name>
				<xsl:value-of select="employer/name/Value"/>
			</name>
			<telecom>
				<xsl:attribute name="value"><xsl:value-of select="employer/telecom/Value"/></xsl:attribute>
			</telecom>
		</employerOrganization>
	</xsl:template>
	<!--ethnicGroup-->
	<xsl:template match="*" mode="EthnicGroup">
		<xsl:comment>民族</xsl:comment>
		<ethnicGroupCode code="{Value}" displayName="{Display}" codeSystem="2.16.156.10011.2.3.3.3" codeSystemName="民族类别代码表(GB 3304)"/>
	</xsl:template>
	<!--MaritalStatus-->
	<xsl:template match="*" mode="MaritalStatus">
		<xsl:comment>婚姻状况</xsl:comment>
		<maritalStatusCode code="{Value}" displayName="{Display}" codeSystem="2.16.156.10011.2.3.3.5" codeSystemName="婚姻状况代码表(GB/T 2261.2)"/>
	</xsl:template>
	<!--nationality-->
	<xsl:template match="*" mode="nationality">
		<xsl:comment>nationality</xsl:comment>
		<nationality code="{Value}" codeSystem="2.16.156.10011.2.3.3.1" codeSystemName="世界各国和地区名称代码(GB/T 2659)" displayName="{Display}"/>
	</xsl:template>
	<!--Occupation-->
	<xsl:template match="*" mode="Occupation">
		<xsl:comment>职业</xsl:comment>
		<occupation>
			<occupationCode code="{Value}" displayName="{Display}" codeSystem="2.16.156.10011.2.3.3.13" codeSystemName="从业状况(个人身体)代码表(GB/T 2261.4)"/>
		</occupation>
	</xsl:template>
	<!--联系人1..*, @typeCode: NOT(ugent notification contact)，固定值，表示不同的参与者-->
	<xsl:template match="*" mode="SupportContact">
		<xsl:comment>其他参与者</xsl:comment>
		<participant typeCode="NOT">
			<!--联系人@classCode：CON，固定值，表示角色是联系人-->
			<associatedEntity classCode="ECON">
				<!--联系人类别，表示与患者之间的关系, 没有定义格式-->
				<code/>
				<!--联系人地址-->
				<xsl:apply-templates select="addr" mode="Address"/>
				<!--电话号码-->
				<telecom use="H" value="{telcom/Value}"/>
				<!--联系人-->
				<associatedPerson classCode="PSN" determinerCode="INSTANCE">
					<!--姓名-->
					<name>
						<xsl:value-of select="associatedPersonName/Value"/>
					</name>
				</associatedPerson>
			</associatedEntity>
		</participant>
	</xsl:template>
</xsl:stylesheet>
