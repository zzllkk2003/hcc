<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n1="urn:hl7-org:v3">
	<xsl:template match="/">
		<xsl:apply-templates select="n1:ClinicalDocument"/>
	</xsl:template>
	<!-- produce browser rendered, human readable clinical document -->
	<xsl:template match="n1:ClinicalDocument">
		<head>
			<title>住院病案首页</title>
			<meta charset="utf-8"/>
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
			<!-- 新 Bootstrap4 核心 CSS 文件 -->
			<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css"/>
			<!-- bootstrap.bundle.min.js 用于弹窗、提示、下拉菜单，包含了 popper.min.js -->
			<script type="text/javascript">
        var Dropdown = function (element) {
            $(element).on('click.bs.dropdown', this.toggle)
        }


    </script>
			<style>
        .border {
            border: 1px solid black !important;
        }

        .border_no_bottom {
            border-left: 1px solid black !important;
            border-right: 1px solid black !important;
            border-top: 1px solid black !important;
        }

        .border_no_top {
            border-left: 1px solid black !important;
            border-right: 1px solid black !important;
            border-bottom: 1px solid black !important;
        }

        .border_side {
            border-left: 1px solid black !important;
            border-right: 1px solid black !important;
        }
        
        .border_top {
            border-top: 1px solid black !important;
        }
        .border_bottom {
            border-bottom: 1px solid black !important;
        }

        .text_left {
            text-align: left;
        }

        .text_center {
            text-align: center;
        }

        .underline {
            text-decoration: underline;

        }

        p {
            white-space: nowrap !important;
            display: inline !important;
            font-weight: normal;
            padding: 2px;
        }

        .table-bordered {
            color: black !important;
        }

        .table th {
            padding: 1px !important;
        }

        .padding {
            padding-top: 3px;
            padding-left: 1px;
            padding-right: 1px;

        }
  
    </style>
		</head>
		<body>
			<!--.container 类用于固定宽度并支持响应式布局的容器。-->
			<!--.container-fluid 类用于 100% 宽度，占据全部视口（viewport）的容器-->
			<!--第一页-->
			<div class="container border padding">
				<!--住 院 病 案 首 页-->
				<div class="container border_bottom padding">
					<div class="row">
						<div class="col-md-12">
							<h4 style="text-align:center"><xsl:value-of select="n1:title"/></h4>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 ">
							<div class="text_left">
								<p style="color: red;">医疗付款方式:
								<xsl:value-of select="n1:component/n1:structuredBody/n1:component/n1:section/n1:entry[position()=1]/n1:observation/n1:value/@displayName"/>
								</p>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 ">
							<p class="text_left" style="color: red;">健康卡号: <xsl:value-of select="n1:recordTarget/n1:patientRole/n1:id[position()=1]/@extension"/></p>
						</div>
						<div class="col-md-4 text-center">
							<p>第 <xsl:value-of select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='11336-5']/n1:section/n1:entry/n1:observation/n1:value/@value"/> 次 住 院</p>
						</div>
						<div class="col-md-4">
							<p class="text_left">病案号:</p>
						</div>
					</div>
				</div>
				<!--患者信息-->
				<div class="row">
					<div class="col-md-3">
						<strong>姓名</strong>
						<p class="underline">
							<xsl:value-of select="n1:recordTarget/n1:patientRole/n1:patient/n1:name"/>
						</p>
					</div>
					<div class="col-md-2 form-group">
						<strong>性别</strong>
						<p class="underline">
							<xsl:if test="n1:recordTarget/n1:patientRole/n1:patient/n1:administrativeGenderCode/@code =0">
								女
							</xsl:if>
							<xsl:if test="n1:recordTarget/n1:patientRole/n1:patient/n1:administrativeGenderCode/@code =1">
								男
							</xsl:if>
						</p>
					</div>
					<div class="col-md-3 ">
						<strong>出生日期</strong>
						<p class="underline">
							<xsl:value-of select="n1:recordTarget/n1:patientRole/n1:patient/n1:birthTime/@value"/>
						</p>
					</div>
					<div class="col-md-2 ">
						<strong>年龄</strong>
						<p class="underline">
							<xsl:value-of select="n1:recordTarget/n1:patientRole/n1:patient/n1:age/@value"/>
						</p>
					</div>
					<div class="col-md-2 ">
						<strong>国籍</strong>
						<p class="underline">
							<xsl:value-of select="n1:recordTarget/n1:patientRole/n1:patient/n1:nationality/@displayName"/>
						</p>
					</div>
				</div>
				<!--<div class="row">
					<div class="col-md-3 ">（年龄不足一周岁的）</div>
					<div class="col-md-3 ">
						<strong>年龄</strong>
						<p class="underline"/> /月</div>
					<div class="col-md-3 ">
						<strong>新生儿出生体重</strong>
						<p class="underline">
							<xsl:value-of select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='8716-3']/n1:section/n1:entry[position()=2]/n1:observation/n1:value/@value"/>
						</p>克
					</div>
					<div class="col-md-3 ">
						<strong>新生儿入院体重</strong>
						<p class="underline">
							<xsl:value-of select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='8716-3']/n1:section/n1:entry[position()=1]/n1:observation/n1:value/@value"/>
						</p>克</div>
				</div>-->
				<xsl:apply-templates select="n1:recordTarget/n1:patientRole/n1:patient"/>
				<div class="container padding">
					<div class="row">
						<div class="col-md-7">
							<strong>入院途径代码</strong>
							<p class="underline">
								<xsl:value-of select="n1:encompassingEncounter/n1:code/@displayName"/>
							</p>
						</div>
						<div class="col-md-5 ">
							<strong>入院时情况</strong>
							<select id="usertype" name="usertype">
								<option value="0">危</option>
								<option value="1">急</option>
								<option value="2">一般</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-5 ">
							<strong>入院时间</strong>
							<p class="underline">
								<xsl:value-of select="n1:encompassingEncounter/n1:effectiveTime/n1:low/@value"/>
							</p>
						</div>
						<div class="col-md-2 ">
							<strong>入院科别</strong>
							<p class="underline">
								<xsl:value-of select="n1:encompassingEncounter/n1:location/n1:healthCareFacility/n1:serviceProviderOrganization/n1:asOrganizationPartOf/n1:wholeOrganization/n1:asOrganizationPartOf/n1:wholeOrganization/n1:name"/>
							</p>
						</div>
						<div class="col-md-2 ">
							<strong>病房</strong>
							<p class="underline">
								<xsl:value-of select="n1:componentOf/n1:encompassingEncounter/n1:location/n1:healthCareFacility/n1:serviceProviderOrganization/n1:name"/>
							</p>
						</div>
						<div class="col-md-3 ">
							<strong>转科科别1</strong>
							<p class="underline">
								<xsl:value-of select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='42349-1']/n1:section/n1:entry/n1:observation/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-5 ">
							<strong>出院时间</strong>
							<p class="underline">
								<xsl:value-of select="n1:encompassingEncounter/n1:effectiveTime/n1:high/@value"/>
							</p>
						</div>
						<div class="col-md-2 ">
							<strong>出院科别</strong>
							<p class="underline">
								<xsl:value-of select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='8648-8']/n1:section/n1:entry/n1:act/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:asOrganizationPartOf/n1:wholeOrganization/n1:name"/>
							</p>
						</div>
						<div class="col-md-2 ">
							<strong>病房</strong>
							<p class="underline">
								<xsl:value-of select="n1:encompassingEncounter/n1:location/n1:healthCareFacility/n1:serviceProviderOrganization/n1:asOrganizationPartOf/n1:wholeOrganization/n1:id/@extension"/>
							</p>
						</div>
						<div class="col-md-3 ">
							<strong>实际住院</strong>
							<p class="underline">
								<xsl:value-of select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='8648-8']/n1:section/n1:entry/n1:observation/n1:value/@value"/>
							</p> 天</div>
					</div>
					<div class="row">
						<div class="col-md-9 ">
							<strong>门(急)诊诊断</strong>
							<p class="underline">
								<xsl:value-of select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='29548-5']/n1:section/n1:entry[position()=1]/n1:organizer/n1:component[position()=1]/n1:observation/n1:value"/>
							</p>
						</div>
						<div class="col-md-3 ">
							<strong>疾病编码</strong>
							<p class="underline">
								<xsl:value-of select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='11535-2']/n1:section/n1:entry/n1:component[position()=2]/n1:observation/n1:code/n1:qualifier/n1:name"/>
							</p>
						</div>
					</div>
				</div>
				<br/>
				<!--出院诊断表-->
				<!--
				<xsl:apply-templates select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='11535-2']/n1:section"/>-->
				<!--入院病情-->
				<div class="container border_bottom padding" style="margin-top: -16px;">
					<div class="row">
						<div class="col-md-6 ">入院病情
                    <select id="usertype" name="usertype">
								<option value="0" >有</option>
								<option value="1">临床未确定</option>
                    	<option value="2" selected="true">情况不明</option>
								<option value="3">无</option>
							</select>
						</div>
						<div class="col-md-6 ">治疗效果
                    <select id="usertype" name="usertype">
								<option value="0" selected="true">治愈</option>
								<option value="1">好转</option>
								<option value="2">未愈</option>
								<option value="3">死亡</option>
								<option value="4">其他</option>
							</select>
						</div>
					</div>
				</div>
				<!--入院与出院-->
				<div class="container padding">
					<div class="row">
						<div class="col-md-4 ">入院与出院诊断符合情况
                    <select id="usertype" name="usertype">
								<option value="0" selected="true">符合</option>
								<option value="1">不符合</option>
								<option value="2">疑诊</option>
								<option value="3">未做</option>
							</select>
						</div>
						<div class="col-md-4 ">术前与术后诊断符合情况
                    <select id="usertype" name="usertype">
								<option value="0" selected="true">符合</option>
								<option value="1">不符合</option>
								<option value="2">疑诊</option>
								<option value="3">未做</option>
							</select>
						</div>
						<div class="col-md-4 ">临床与病理诊断符合情况
                    <select id="usertype" name="usertype">
								<option value="0" selected="true">符合</option>
								<option value="1">不符合</option>
								<option value="2">疑诊</option>
								<option value="3">未做</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8 "/>
					</div>
					<div class="col-md-4 ">放射与病理诊断符合情况
							<select id="usertype" name="usertype">
							<option value="0" selected="true">符合</option>
							<option value="1">不符合</option>
							<option value="2">疑诊</option>
							<option value="3">未做</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 ">病历分型
                    <select id="usertype" name="usertype">
							<option value="0" selected="true">单纯普通</option>
							<option value="1">单纯急症</option>
							<option value="2">复杂疑难</option>
							<option value="3">复杂危重</option>
						</select>
					</div>
					<div class="col-md-2">抢救<p class="underline"> </p>次</div>
					<div class="col-md-2">成功<p class="underline"> </p>次</div>
				</div>
			</div>
			<!--最高诊断依据-->
			<!--损伤原因-->
			<!--病理诊断-->
			<div class="container border_top padding">
				<!--病理诊断 1-->
				<xsl:for-each select="/">
					<div class="row">
						<div class="col-md-4 ">
							<xsl:text>病理诊断：</xsl:text>
							<p class="underline">
								<xsl:value-of select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='29548-5']/n1:section/n1:entry/n1:organizer/n1:component/n1:observation[n1:code/@code='DE05.01.025.00']/n1:value"/>
							</p>
						</div>
						<div class="col-md-4 ">
							<xsl:text>疾病编码：</xsl:text>
							<p class="underline">
								<xsl:value-of select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='29548-5']/n1:section/n1:entry/n1:organizer/n1:component/n1:observation[n1:code/@code='DE05.01.024.00']/n1:value/@code"/>
							</p>
						</div>
						<div class="col-md-4 ">
							<xsl:text>病理号：</xsl:text>
							<p class="underline">
								<xsl:value-of select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='29548-5']/n1:section/n1:entry/n1:organizer/n1:component/n1:observation[n1:code/@code='DE05.01.025.00']/n1:id/@extension"/>
							</p>
						</div>
					</div>
				</xsl:for-each>
			</div>
			<!--药物过敏-->
			<div class="container border_top padding">
				<div class="row">
					<div class="col-md-3 ">药物过敏：
                    <select id="usertype" name="usertype">
							<option value="0" selected="true">有</option>
							<option value="1">无</option>
						</select>
					</div>
					<div class="col-md-5 ">过敏药物：<p class="underline">
						<xsl:value-of select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='48765-2']/n1:section/n1:entry/n1:act/n1:entryRelationship/n1:observation/n1:participant/n1:participantRole/n1:playingEntity/n1:desc"/>
					</p>
					</div>
					<div class="col-md-4 ">死亡患者尸检
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 ">
						<xsl:text>过敏原：</xsl:text>
						<select id="usertype" name="usertype">
							<option value="1" selected="true">镇静麻醉剂过敏</option>
							<option value="2">动物毛发过敏</option>
							<option value="3">抗生素过敏</option>
							<option value="4">柑橘类水果过敏</option>
							<option value="5">室内灰尘过敏</option>
							<option value="6">鸡蛋过敏</option>
							<option value="7">鱼及贝类食物过敏</option>
							<option value="8">碘过敏</option>
							<option value="9">牛奶过敏</option>
							<option value="10">带壳的果仁过敏</option>
							<option value="11">花粉过敏</option>
							<option value="99">其他过敏</option>
						</select>
					</div>
				</div>
			</div>
			<!--血型-->
			<xsl:apply-templates select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='30954-2']/n1:section"/>
			<!--手术及操作表-->
			<xsl:apply-templates select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='47519-4']/n1:section"/>
			<!--离院方式-->
			<div class="container border_side padding" style="margin-top: -16px;">
				<div class="row">
					<div class="col-md-12 ">
						<strong>离院方式</strong>;
                    <select id="usertype" name="usertype">
							<option value="1" selected="true">医嘱离院</option>
							<option value="2">医嘱转院</option>
							<option value="3">医嘱转社区卫生服务机构/乡镇卫生院</option>
							<option value="4">非医嘱离院</option>
							<option value="5">死亡</option>
							<option value="9">其他</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 ">拟接受医疗机构名称：<p class="underline"> 
						<xsl:value-of select="n1:component/n1:structuredBody/n1:component[n1:section/n1:entry/n1:observation/n1:code/@code='DE06.00.223.00']/n1:section/n1:entry[n1:observation/n1:code/@code='DE06.00.223.00']/n1:observation/n1:entryRelationship/n1:observation/n1:value"/>
					</p>
					</div>
				</div>
			</div>
			<!--再住院计划-->
			<xsl:apply-templates select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='18776-5']/n1:section"/>
			<!--患者昏迷时间-->
			<xsl:apply-templates select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='11450-4']/n1:section"/>
			<!--住院费用-->
			<xsl:apply-templates select="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='48768-6']/n1:section"/>
			<!--医师信息-->
			<!--医师信息-->
			<div class="container border_no_bottom padding">
				<div class="row">
					<div class="col-md-3 ">科主任 :<p class="underline">
							<xsl:value-of select="n1:legalAuthenticator/n1:assignedEntity/n1:assignedPerson/n1:name"/>
						</p>
					</div>
					<div class="col-md-3 ">主(副主)任医师 :<p class="underline">
						<xsl:value-of select="n1:authenticator[n1:assignedEntity/n1:code/@displayName='主任(副主任)医师']/n1:assignedEntity/n1:assignedPerson/n1:name"/>
						</p>
					</div>
					<div class="col-md-3 ">主治医师 :<p class="underline">
						<xsl:value-of select="n1:authenticator[n1:assignedEntity/n1:code/@displayName='主治医师']/n1:assignedEntity/n1:assignedPerson/n1:name"/>
						</p>
					</div>
					<div class="col-md-3 ">住院医师 :<p class="underline">
						<xsl:value-of select="n1:authenticator[n1:assignedEntity/n1:code/@displayName='住院医师']/n1:assignedEntity/n1:assignedPerson/n1:name"/>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 ">责任护士 :<p class="underline">
							<xsl:value-of select="n1:authenticator[n1:assignedEntity/n1:code/@displayName='责任护士']/n1:assignedEntity/n1:assignedPerson/n1:name"/>
						</p>
					</div>
					<div class="col-md-3 ">进修/规培医师 :<p class="underline">
							<xsl:value-of select="n1:authenticator[n1:assignedEntity/n1:code/@displayName='进修医师']/n1:assignedEntity/n1:assignedPerson/n1:name"/>
						</p>
					</div>
					<div class="col-md-3 ">实习医师 :<p class="underline">
							<xsl:value-of select="n1:authenticator[n1:assignedEntity/n1:code/@displayName='实习医师']/n1:assignedEntity/n1:assignedPerson/n1:name"/>
						</p>
					</div>
					<div class="col-md-3 ">编码员 :<p class="underline">
							<xsl:value-of select="n1:authenticator[n1:assignedEntity/n1:code/@displayName='编码员']/n1:assignedEntity/n1:assignedPerson/n1:name"/>
						</p>
					</div>
				</div>
			</div>
			<!--病案质量-->
			<xsl:apply-templates select="n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@displayName='行政管理']"/>
		</body>
	</xsl:template>
	<!-- templates start .....-->
	<xsl:template match="n1:recordTarget/n1:patientRole/n1:patient">
		
		<div class="row">
			<div class="col-md-5 ">
				<strong>出生地</strong>
				<p class="underline">
					<xsl:value-of select="n1:birthplace/n1:place/n1:addr/n1:state"/>
					<xsl:value-of select="n1:birthplace/n1:place/n1:addr/n1:city"/>
					<xsl:value-of select="n1:birthplace/n1:place/n1:addr/n1:county"/>
				</p>
			</div>
			<div class="col-md-5 ">
				<strong>籍贯</strong>
				<p class="underline">
					<xsl:value-of select="n1:nativePlace/n1:place/n1:addr/n1:state"/>
					<xsl:value-of select="n1:nativePlace/n1:place/n1:addr/n1:city"/>
				</p>
			</div>
			<div class="col-md-2 ">
				<strong>民族</strong>
				<p class="underline">
					<xsl:value-of select="n1:ethnicGroupCode/@displayName"/>
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-5 ">
				<strong>身份证号</strong>
				<p class="underline">
					<xsl:value-of select="n1:id/@extension"/>
				</p>
			</div>
			<div class="col-md-3 ">
				<strong>职业</strong>
				<p class="underline">
					<xsl:value-of select="n1:occupation/n1:occupationCode/@displayName"/>
				</p>
			</div>
			<div class="col-md-4 ">
				<strong>婚姻</strong>
				<xsl:value-of select="n1:maritalStatusCode/@displayName"/>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8 ">
				<strong>住址</strong>
				<p class="underline">
					<xsl:value-of select="../n1:addr/n1:state"/>
					<xsl:value-of select="../n1:addr/n1:city"/>
					<xsl:value-of select="../n1:addr/n1:county"/>
					<xsl:value-of select="../n1:addr/n1:township"/>
					<xsl:value-of select="../n1:addr/n1:streetName"/>
					<xsl:value-of select="../n1:addr/n1:houseNumber"/>
				</p>
			</div>
			<div class="col-md-2 ">
				<strong>电话</strong>
				<p class="underline">
					<xsl:value-of select="../n1:telecom/@value"/>
				</p>
			</div>
			<div class="col-md-2 ">
				<strong>邮编</strong>
				<p class="underline">
					<xsl:value-of select="../n1:addr/n1:postalCode"/>
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 ">
				<strong>户口地址</strong>
				<p class="underline">
					<xsl:value-of select="n1:household/n1:place/n1:state"/>
					<xsl:value-of select="n1:household/n1:place/n1:city"/>
					<xsl:value-of select="n1:household/n1:place/n1:county"/>
					<xsl:value-of select="n1:household/n1:place/n1:township"/>
					<xsl:value-of select="n1:household/n1:place/n1:streetName"/>
					<xsl:value-of select="n1:household/n1:place/n1:houseNumber"/>
				</p>
			</div>
			<div class="col-md-2 ">
				<strong>邮编</strong>
				<p class="underline">
					<xsl:value-of select="n1:household/n1:place/n1:postalCode"/>
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-7 ">
				<strong>工作单位及地址</strong>
				<p class="underline">
					<xsl:value-of select="n1:employerOrganization/n1:name"/>
				</p>
			</div>
			<div class="col-md-3 ">
				<strong>单位电话</strong>
				<p class="underline">
					<xsl:value-of select="n1:employerOrganization/n1:telecom/@value"/>
				</p>
			</div>
			<div class="col-md-2 ">
				<strong>邮编</strong>
				<p class="underline">
					<xsl:value-of select="n1:employerOrganization/n1:addr/n1:postalCode"/>
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 ">
				<strong>联系人姓名</strong>
				<p class="underline">
					<xsl:value-of select="../../../n1:participant/n1:associatedEntity/n1:associatedPerson/n1:name"/>
				</p>
			</div>
			<div class="col-md-2 ">
				<strong>关系</strong>
				<p class="underline">
					<xsl:value-of select="../../../n1:participant/n1:associatedEntity/n1:code/@displayName"/>
				</p>
			</div>
			<div class="col-md-5 ">
				<strong>地址</strong>
				<p class="underline">
					<xsl:value-of select="../../../n1:participant/n1:associatedEntity/n1:addr"/>
				</p>
			</div>
			<div class="col-md-2 ">
				<strong>电话</strong>
				<p class="underline">
					<xsl:value-of select="../../../n1:participant/n1:associatedEntity/n1:telcom/@value"/>
				</p>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='47519-4']/n1:section">
		<table class="table border">
			<thead>
				<tr>
					<th class="border" style="width: 15%;">
						<p>手术及操作编码</p>
					</th>
					<th class="border" style="width: 15%;">
						<p>手术及操作日期</p>
					</th>
					<th class="border" style="width: 5%; ">
						<p>手术级别</p>
					</th>
					<th class="border" style="width: 5%; ">
						<p>麻醉级别</p>
					</th>
					<th class="border" style="width: 20%; ">
						<p>手术及操作名称</p>
					</th>
					<th class="border" style="width: 15%; ">
						<table style="width: 100%; height: 100%;">
							<tr>
								<p>手术及操作医师</p>
							</tr>
							<tr>
								<th style="border-top:1px solid black !important; border-right:1px solid black !important; ">
									<p>术者</p>
								</th>
								<th style="border-top:1px solid black !important; border-right:1px solid black !important; ">
									<p>I 助</p>
								</th>
								<th style="border-top:1px solid black !important;">
									<p>II 助</p>
								</th>
							</tr>
						</table>
					</th>
					<th class="border" style="width: 10%; ">
						<p>麻醉方式</p>
					</th>
					<th class="border" style="width: 10%; ">
						<p>切口愈合等级</p>
					</th>
					<th class="border" style="width: 10%; ">
						<p>麻醉医师</p>
					</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="n1:entry">
					<tr>
						<th class="border" style="width: 15%;">
							<p>
								<xsl:value-of select="n1:procedure/n1:code/@code"/>
							</p>
						</th>
						<th class="border" style="width: 15%;">
							<p>
								<xsl:value-of select="n1:procedure/n1:effectiveTime/@value"/>
							</p>
						</th>
						<th class="border" style="width: 5%;">
							<p>
								<xsl:value-of select="n1:procedure/n1:entryRelationship/n1:observation[n1:code/@code='DE06.00.255.00']/n1:value/@displayName"/>
							</p>
						</th>
						<th class="border" style="width: 5%;">
							<p>
								<xsl:value-of select="n1:procedure/n1:entryRelationship/n1:observation[n1:code/@code='DE06.00.073.00']/n1:value/@code"/>
							</p>
						</th>
						<th class="border" style="width: 20%;">
							<p>
								<xsl:value-of select="n1:procedure/n1:code/@displayName"/>
							</p>
						</th>
						<th class="border" style="width: 15%;">
							<p>
								<xsl:value-of select="n1:procedure/n1:performer/n1:assignedPerson/n1:name"/>
								<xsl:text>,</xsl:text>
								<xsl:apply-templates select="n1:procedure/n1:participant/n1:participantRole/n1:playingEntity/n1:name"/>
							</p>
						</th>
						<th class="border" style="width: 10%;">
							<p>
								<xsl:value-of select="n1:procedure/n1:entryRelationship/n1:observation[n1:code/@code='DE06.00.073.00']/n1:value/@displayName"/>
							</p>
						</th>
						<th class="border" style="width: 10%;">
							<p>
								<xsl:value-of select="n1:procedure/n1:entryRelationship/n1:observation[n1:code/@code='DE05.10.147.00']/n1:value/@displayName"/>
							</p>
						</th>
						<th class="border" style="width: 10%;">
							<p>
								<xsl:value-of select="n1:procedure/n1:entryRelationship/n1:observation[n1:code/@code='DE06.00.073.00']/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name"/>
							</p>
						</th>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!--

	<xsl:template match="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='11535-2']/n1:section">
		<table class="table">
			<thead>
				<tr>
					<th class="border" style="width: 20%;">
						<strong>出院诊断</strong>
					</th>
					<th class="border" style="width: 20%;">
						<p>疾病编码</p>
					</th>
					<th class="border" style="width: 20%; ">
						<p>入院病情</p>
					</th>
					<th class="border" style="width: 20%; ">
						<p>治疗效果</p>
					</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="n1:entry">
					<tr>
						<th class="border">
							<xsl:value-of select="n1:organizer/n1:component/n1:observation[n1:code/@code='DE05.01.024.00']/n1:value/@displayName"/>
						</th>
						<th class="border">
							<p>
								<xsl:value-of select="n1:organizer/n1:component/n1:observation[n1:code/@code='DE05.01.024.00']/n1:value/@code"/>
							</p>
						</th>
						<th class="border">
							<p>
								<xsl:value-of select="n1:organizer/n1:component/n1:observation[n1:code/@code='DE09.00.104.00']/n1:value/@displayName"/>
							</p>
						</th>
						<th class="border">
							<p/>
						</th>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	-->
	<xsl:template match="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='30954-2']/n1:section">
		<div class="container border_top padding">
			<div class="row">
				<div class="col-md-6 ">ABO血型：
					<xsl:value-of select="n1:entry/n1:organizer/n1:component[position()=1]/n1:observation/n1:value/@displayName"/>
				</div>
				<div class="col-md-6 ">Rh血型：
					<xsl:value-of select="n1:entry/n1:organizer/n1:component[position()=2]/n1:observation/n1:value/@displayName"/>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='']/n1:section">
	</xsl:template>
	<xsl:template match="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='18776-5']/n1:section">
		<div class="container border_top padding">
			<div class="row">
				<div class="col-md-6 ">
					<xsl:text>是否有出院31天内再住院计划 ;  </xsl:text>
					<p class="underline">
						<xsl:value-of select="n1:entry/n1:observation/n1:value/@value"/>
					</p>
					<div class="col-md-6 ">
						<xsl:text>目的：</xsl:text>
						<p class="underline">
							<xsl:value-of select="n1:entry/n1:observation/n1:entryRelationship/n1:observation/@value"/>
						</p>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@displayName='行政管理']">
		<div class="container border padding">
			<div class="row">
				<div class="col-md-3 ">病案质量 :
                    <xsl:value-of select="n1:entry[position()=2]/n1:observation/n1:value/@displayName"/>
				</div>
				<div class="col-md-3 ">质控医师 :<p class="underline">
						<xsl:value-of select="n1:entry[position()=2]/n1:observation/n1:author[position()=1]/n1:assignedAuthor"/>
					</p>
				</div>
				<div class="col-md-3 ">质控护士 :<p class="underline">
						<xsl:value-of select="n1:entry[position()=2]/n1:observation/n1:author[position()=2]/n1:assignedAuthor"/>
					</p>
				</div>
				<div class="col-md-3 ">质控日期 :<p class="underline">
						<xsl:value-of select="n1:entry[position()=2]/n1:effectiveTime/@value"/>
					</p>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='48768-6']/n1:section">
		<div class="container border_top padding">
			<div class="row">
				<div class="col-md-12">
                    住院费用(元)：总费用 ;<p class="underline">
						<xsl:value-of select="n1:entry[n1:observation/n1:code/@code='HDSD00.11.142']/n1:observation/n1:value/@value"/>
					</p>(自付金额:) ;<p class="underline">
						<xsl:value-of select="n1:entry[n1:observation/n1:code/@code='HDSD00.11.142']/n1:observation/n1:entryRelationship/n1:observation/n1:value/@value"/>
					</p>
				</div>
			</div>
			<!--1.综合医疗服务类-->
			<div class="row">
				<div class="col-md-3">
					<strong>1.综合医疗服务类：</strong>
				</div>
				<div class="col-md-3">
                    (1)一般医疗服务费 <p class="underline">
                    	<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.147']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.147']/n1:observation/n1:value/@value"/>;
					</p>
				</div>
				<div class="col-md-3">
                    (2)一般治疗操作费 <p class="underline">
                    	<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.148']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.148']/n1:observation/n1:value/@value"/>;
					</p>
				</div>
				<div class="col-md-3">
                    (3)护理费 <p class="underline">
                    	<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.145']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.145']/n1:observation/n1:value/@value"/>;
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
                    (4)其他费 
                    <p class="underline">
                    	<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.146']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.146']/n1:observation/n1:value/@value"/>;
					</p>
				</div>
			</div>
			<!--2.诊断类-->
			<div class="row">
				<div class="col-md-3">
					<strong>2.诊断类</strong>
				</div>
				<div class="col-md-3">
                    (5)病理诊断费 <p class="underline">
                    	<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.121']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.121']/n1:observation/n1:value/@value"/>;
					</p>
				</div>
				<div class="col-md-3">
                    (6)实验室诊断费 <p class="underline">
                    	<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.123']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.123']/n1:observation/n1:value/@value"/>;
					</p>
				</div>
				<div class="col-md-3">
                    (7)影像学诊断费 <p class="underline">
                    	<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.124']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.124']/n1:observation/n1:value/@value"/>;
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
                    (8)临床诊断项目费<p class="underline">
						<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.122']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.122']/n1:observation/n1:value/@value"/>
					</p>
				</div>
			</div>
			<!--3.治疗类-->
			<div class="row">
				<div class="col-md-3">
					<strong>3.治疗类</strong>
				</div>
				<div class="col-md-9">
                    (9)非手术项目治疗费 ;
                    <p class="underline">
						<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.129']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.129']/n1:observation/n1:value/@value"/>(临床物理治疗费:
                     <xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:entryRelationship/n1:observation/n1:code/@code='HDSD00.11.130']/n1:organizer/n1:component[n1:observation/n1:entryRelationship/n1:observation/n1:code/@code='HDSD00.11.130']/n1:observation/n1:entryRelationship/n1:observation/n1:value/@value"/>
                    )</p>
				</div>
				<div class="col-md-12">
                    (10)手术治疗费 ;
                    <p class="underline">
						<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.131']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.131']/n1:observation/n1:value/@value"/>
					</p>
                    (麻醉费 ;
                    <p class="underline">
						<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:entryRelationship/n1:observation/n1:code/@code='HDSD00.11.132']/n1:organizer/n1:component[n1:observation/n1:entryRelationship/n1:observation/n1:code/@code='HDSD00.11.132']/n1:observation/n1:entryRelationship[n1:observation/n1:code/@code='HDSD00.11.132']/n1:observation/n1:value/@value"/>
					</p>)
                    (手术费 ;
                    <p class="underline">
						<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:entryRelationship/n1:observation/n1:code/@code='HDSD00.11.133']/n1:organizer/n1:component[n1:observation/n1:entryRelationship/n1:observation/n1:code/@code='HDSD00.11.133']/n1:observation/n1:entryRelationship[n1:observation/n1:code/@code='HDSD00.11.133']/n1:observation/n1:value/@value"/>
					</p>)
                </div>
			</div>
			<!--4.康复类-->
			<div class="row">
				<div class="col-md-3">
					<strong>4.康复类</strong>
				</div>
				<div class="col-md-9">
                    (11)康复费：<p class="underline">
                    	<xsl:value-of select="n1:entry[n1:observation/n1:code/@code='HDSD00.11.055']/n1:observation/n1:value/@value"/> ;
					</p>
				</div>
			</div>
			<!--5.中医类-->
			<div class="row">
				<div class="col-md-3">
					<strong>5.中医类</strong>
				</div>
				<div class="col-md-9">
                    (12)中医治疗费 <p class="underline">
                    	<xsl:value-of select="n1:entry[n1:observation/n1:code/@code='HDSD00.11.136']/n1:observation/n1:value/@value"/>;
					</p>
				</div>
			</div>
			<!--6.西药类-->
			<div class="row">
				<div class="col-md-3">
					<strong>6.西药类</strong>
				</div>
				<div class="col-md-9">(13)西药费 :
					<p class="underline">
						<xsl:value-of select="n1:entry[n1:observation/n1:code/@code='HDSD00.11.098']/n1:observation/n1:value/@value"/>
					</p>
					<p class="underline">
						(抗菌药物费用 :<xsl:value-of select="n1:entry[n1:observation/n1:entryRelationship/n1:observation/n1:code/@code='HDSD00.11.099']/n1:observation/n1:entryRelationship/n1:observation/n1:value/@value"/>)
					</p>
				</div>
			</div>
			<!--7.中药类-->
			<div class="row">
				<div class="col-md-3">
					<strong>7.中药类</strong>
				</div>
				<div class="col-md-3">
                    (14)中成药费 :<p class="underline">
						<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.135']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.135']/n1:observation/n1:value/@value"/>
					</p>
				</div>
				<div class="col-md-3">
                    (15)中草药费 :<p class="underline">
						<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.134']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.134']/n1:observation/n1:value/@value"/>
					</p>
				</div>
			</div>
			<!--8.血液及血液制品类-->
			<div class="row">
				<div class="col-md-3">
					<strong>8.血液及血液制品类</strong>
				</div>
				<div class="col-md-3">
                    (16)血费 <p class="underline">
                    	<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.115']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.115']/n1:observation/n1:value/@value"/>;
					</p>
				</div>
				<div class="col-md-3">
                    (17)白蛋白类制品费 ;<p class="underline">
						<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.113']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.113']/n1:observation/n1:value/@value"/>
					</p>
				</div>
				<div class="col-md-3">
                    (18)球蛋白类制品费 ;<p class="underline">
						<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.111']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.111']/n1:observation/n1:value/@value"/>
					</p>
				</div>
				<div class="col-md-3">
					<p class="underline">
						(19)凝血因子类制品费<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.112']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.112']/n1:observation/n1:value/@value"/> ;
					</p>
				</div>
				<div class="col-md-3">
					<p class="underline">
						(20)细胞因子类制品费 <xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.114']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.114']/n1:observation/n1:value/@value"/>;
					</p>
				</div>
			</div>
			<!--9.耗材类-->
			<div class="row">
				<div class="col-md-6">
					<strong>9.耗材类</strong>
				</div>
				<div class="col-md-6">
                    (21)检查用一次性医用制品费 ;<p class="underline">
						<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.038']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.038']/n1:observation/n1:value/@value"/>
					</p>
				</div>
				<div class="col-md-6">
                    (22)治疗用一次性医用制品费 ;<p class="underline">
						<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.040']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.040']/n1:observation/n1:value/@value"/>
					</p>
				</div>
				<div class="col-md-6">
                    (23)手术用一次性医用制品费 ;<p class="underline">
						<xsl:value-of select="n1:entry[n1:organizer/n1:component/n1:observation/n1:code/@code='HDSD00.11.039']/n1:organizer/n1:component[n1:observation/n1:code/@code='HDSD00.11.039']/n1:observation/n1:value/@value"/>
					</p>
				</div>
			</div>
			<!--10.其他类-->
			<div class="row">
				<div class="col-md-3">
					<strong>10.其他类</strong>
				</div>
				<div class="col-md-9">
                    (24)其他费 :
                    <p class="underline">
						<xsl:value-of select="n1:entry[n1:observation/n1:code/@code='HSDB05.10.130']/n1:observation/n1:value/@value"/>
					</p>
				</div>
			</div>
		</div>
	</xsl:template>
	<!--主要健康问题章节-->
	<xsl:template match="n1:component/n1:structuredBody/n1:component[n1:section/n1:code/@code='11450-4']/n1:section">
		<div class="container border_no_bottom padding">
			<div class="row">
				<div class="col-md-6 ">患者损伤和中毒外部原因:
                    <p class="underline">
						<xsl:value-of select="n1:entry[n1:observation/n1:code/@code='DE05.10.152.00']/n1:observation/n1:entryRelationship/n1:observation/n1:value/@displayName"/>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 ">颅脑损伤患者昏迷时间：入院前 ;
                    <p class="underline">
						<xsl:value-of select="n1:entry/n1:organizer[n1:code/@displayName='颅脑损伤患者入院前昏迷时间']/n1:component/n1:observation[n1:code/@code='DE05.10.138.01']/n1:value/@value"/>
					</p>天 ;
                    <p class="underline">
						<xsl:value-of select="n1:entry/n1:organizer[n1:code/@displayName='颅脑损伤患者入院前昏迷时间']/n1:component/n1:observation[n1:code/@code='DE05.10.138.02']/n1:value/@value"/>
					</p>小时 ;
                    <p class="underline">
						<xsl:value-of select="n1:entry/n1:organizer[n1:code/@displayName='颅脑损伤患者入院前昏迷时间']/n1:component/n1:observation[n1:code/@code='DE05.10.138.03']/n1:value/@value"/>
					</p>分钟
					</div>
				<div class="col-md-6 ">入院后 ;
                    <p class="underline">
						<xsl:value-of select="n1:entry/n1:organizer[n1:code/@displayName='颅脑损伤患者入院后昏迷时间']/n1:component/n1:observation[n1:code/@code='DE05.10.138.01']/n1:value/@value"/>
					</p>天 ;
                    <p class="underline">
						<xsl:value-of select="n1:entry/n1:organizer[n1:code/@displayName='颅脑损伤患者入院后昏迷时间']/n1:component/n1:observation[n1:code/@code='DE05.10.138.02']/n1:value/@value"/>
					</p>小时 ;
                    <p class="underline">
						<xsl:value-of select="n1:entry/n1:organizer[n1:code/@displayName='颅脑损伤患者入院后昏迷时间']/n1:component/n1:observation[n1:code/@code='DE05.10.138.03']/n1:value/@value"/>
					</p>分钟
                </div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
