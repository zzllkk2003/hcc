/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 创建Code Table, load CV and GBT code to Ensemble
Class WS.Tools.CreateWSCode Extends %RegisteredObject
{

/// 读每一种CV的多行， 生成class, 然后load该class的数据
/// CVList如下
/// CV02.01.101,身份证件类别代码表,1,居民身份证
/// CV02.01.101,身份证件类别代码表,2,居民户口簿
/// CV02.01.101,身份证件类别代码表,3,护照
/// CV02.01.101,身份证件类别代码表,4,军官证
/// CV02.01.101,身份证件类别代码表,5,驾驶证
/// CV02.01.101,身份证件类别代码表,6,港澳居民来往内地通行证
/// CV02.01.101,身份证件类别代码表,7,台湾居民来往内地通行证
/// CV02.01.101,身份证件类别代码表,99,其他法定有效证件
/// CV02.01.102,出生(分娩)地点类别代码表,1,医院
/// CV02.01.102,出生(分娩)地点类别代码表,11,省(市)级医院
/// CV02.01.102,出生(分娩)地点类别代码表,12,县(区)级医院
/// CV02.01.102,出生(分娩)地点类别代码表,2,妇幼保健院
/// ...
/// 07/18增加了RH血型和医保付费类型两个表， 还没有load,还要查查有没有其他表没有
ClassMethod loadCV()
{
    Set stream=##class(%Stream.FileCharacter).%New()
    Set sc=stream.LinkToFile("D:\Interconnection\working\Resource\CVlist2.csv")
    Set stream.TranslateTable = "UTF8"
    
    set lineNumber=1
    set previousCV=""
    
    While 'stream.AtEnd 
    {
        Set line=stream.ReadLine()
        set cv=$p(line,",",1)
        set desc=$p(line,",",2)
            set code=$p(line,",",3)
            set displayName=$p(line,",",4)
            w cv_"^"_previousCV,!
            if (cv'=previousCV)
            {   
                w lineNumber,!
                set previousCV=cv
                //Create new class
                set tClassName="WS.Code."_$REPLACE(cv,".","")
                if ..IsClassExist(tClassName) quit
                w tClassName, !
            Set tClass=##class(%Dictionary.ClassDefinition).%New(tClassName)
            Set tClass.Super="%Persistent,WS.Code.Abstract"
            set tClass.Inheritance="left"
            set tClass.Description=desc
            do tClass.%Save()
            Do $System.OBJ.Compile(tClassName,"-d")
            }
            w lineNumber_"^"_tClassName,!   
            set newRecord=##class(%SYSTEM.OBJ).New(tClassName)
        set newRecord.code=code
        set newRecord.displayName=displayName
        set status=newRecord.%Save()
        if $$$ISERR(status){
            do $System.Status.DisplayError(status)
        }
        set lineNumber=lineNumber+1
        }
}

/// 虽然有完整的GBTlist, 但电子病历数据集只用到以下的部分,手工添加，不用code
/// GB/T 2261.1-2003* 性别
/// GB/T 2261.2-2003*  婚姻状况
/// GB/T 2261.4-2003* 职业
/// GB/T 2659-2000 国籍
/// GB/T 4658-1984* 学历
/// GB/T 4761-2008 代理人和患者关系
/// GB/T 16751.3-1997  中医治则治法
/// GB/T 15657-1995 * 中医病名，病症代码二合一/
/// GB 3304-1991 民族
/// GB/T 2261.4（从业状况代码表）
/// GB/T 4761（家庭关系代码表）
ClassMethod loadGBT()
{
    // GB/T 2261.1-2003* 性别
    Set ^WS.VS.GBT22611(0)="未知的性别"
    Set ^WS.VS.GBT22611(1)="男性"
    Set ^WS.VS.GBT22611(2)="女性"
    Set ^WS.VS.GBT22611(9)="未说明的性别"
    // GB/T 2261.2-2003*  婚姻状况
    Set ^WS.VS.GBT22612(10)="未婚"
    Set ^WS.VS.GBT22612(20)="已婚"
    Set ^WS.VS.GBT22612(21)="初婚"
    Set ^WS.VS.GBT22612(22)="再婚"
    Set ^WS.VS.GBT22612(23)="复婚"
    Set ^WS.VS.GBT22612(30)="丧偶"
    Set ^WS.VS.GBT22612(40)="离婚"
    Set ^WS.VS.GBT22612(90)="未说明的婚姻状况"
    // GB 3304-1991 民族
    Set ^WS.VS.GBT3304("01")="汉族"
    Set ^WS.VS.GBT3304("02")="蒙古族"
    Set ^WS.VS.GBT3304("03")="回族"
    Set ^WS.VS.GBT3304("04")="藏族"
    Set ^WS.VS.GBT3304("05")="维吾尔族"
    Set ^WS.VS.GBT3304("06")="苗族"
    Set ^WS.VS.GBT3304("07")="彝族"
    Set ^WS.VS.GBT3304("08")="壮族"
    Set ^WS.VS.GBT3304("09")="布依族"
    Set ^WS.VS.GBT3304(10)="朝鲜族"
    Set ^WS.VS.GBT3304(11)="满族"
    Set ^WS.VS.GBT3304(12)="侗族"
    Set ^WS.VS.GBT3304(13)="瑶族"
    Set ^WS.VS.GBT3304(14)="白族"
    Set ^WS.VS.GBT3304(15)="土家族"
    Set ^WS.VS.GBT3304(16)="哈尼族"
    Set ^WS.VS.GBT3304(17)="哈萨克族"
    Set ^WS.VS.GBT3304(18)="傣族"
    Set ^WS.VS.GBT3304(19)="黎族"
    Set ^WS.VS.GBT3304(20)="傈僳族"
    Set ^WS.VS.GBT3304(21)="佤族"
    Set ^WS.VS.GBT3304(22)="畲族"
    Set ^WS.VS.GBT3304(23)="高山族"
    Set ^WS.VS.GBT3304(24)="拉祜族"
    Set ^WS.VS.GBT3304(25)="水族"
    Set ^WS.VS.GBT3304(26)="东乡族"
    Set ^WS.VS.GBT3304(27)="纳西族"
    Set ^WS.VS.GBT3304(28)="景颇族"
    Set ^WS.VS.GBT3304(29)="柯尔克孜族"
    Set ^WS.VS.GBT3304(30)="土族"
    Set ^WS.VS.GBT3304(31)="达斡尔族"
    Set ^WS.VS.GBT3304(32)="仫佬族"
    Set ^WS.VS.GBT3304(33)="羌族"
    Set ^WS.VS.GBT3304(34)="布朗族"
    Set ^WS.VS.GBT3304(35)="撒拉族"
    Set ^WS.VS.GBT3304(36)="毛难族"
    Set ^WS.VS.GBT3304(37)="仡佬族"
    Set ^WS.VS.GBT3304(38)="锡伯族"
    Set ^WS.VS.GBT3304(39)="阿昌族"
    Set ^WS.VS.GBT3304(40)="普米族"
    Set ^WS.VS.GBT3304(41)="塔吉克族"
    Set ^WS.VS.GBT3304(42)="怒族"
    Set ^WS.VS.GBT3304(43)="乌孜别克族"
    Set ^WS.VS.GBT3304(44)="俄罗斯族"
    Set ^WS.VS.GBT3304(45)="鄂温克族"
    Set ^WS.VS.GBT3304(46)="德昂族"
    Set ^WS.VS.GBT3304(47)="保安族"
    Set ^WS.VS.GBT3304(48)="裕固族"
    Set ^WS.VS.GBT3304(49)="京族"
    Set ^WS.VS.GBT3304(50)="塔塔尔族"
    Set ^WS.VS.GBT3304(51)="独龙族"
    Set ^WS.VS.GBT3304(52)="鄂伦春族"
    Set ^WS.VS.GBT3304(53)="赫哲族"
    Set ^WS.VS.GBT3304(54)="门巴族"
    Set ^WS.VS.GBT3304(55)="珞巴族"
    Set ^WS.VS.GBT3304(56)="基诺族"
    //GB/T 2261.4（从业状况代码表）
    Set ^WS.VS.GBT22614(11)="国家公务员"
    Set ^WS.VS.GBT22614(13)="专业技术人员"
    Set ^WS.VS.GBT22614(17)="职员"
    Set ^WS.VS.GBT22614(21)="企业管理人员"
    Set ^WS.VS.GBT22614(24)="工人"
    Set ^WS.VS.GBT22614(27)="农民"
    Set ^WS.VS.GBT22614(31)="学生"
    Set ^WS.VS.GBT22614(37)="现役军人"
    Set ^WS.VS.GBT22614(51)="自由职业者"
    Set ^WS.VS.GBT22614(54)="个体经营者"
    Set ^WS.VS.GBT22614(70)="无业人员"
    Set ^WS.VS.GBT22614(80)="离(退)休人员"
    Set ^WS.VS.GBT22614(90)="其他"
    //GB/T 4761（家庭关系代码表）
    Set ^WS.VS.GBT4761(0)="本人或户主"
    Set ^WS.VS.GBT4761(1)="配偶"
    Set ^WS.VS.GBT4761(2)="子"
    Set ^WS.VS.GBT4761(3)="女"
    Set ^WS.VS.GBT4761(4)="孙子、孙女、外孙子、外孙女"
    Set ^WS.VS.GBT4761(5)="父母"
    Set ^WS.VS.GBT4761(6)="祖父母、外祖父母"
    Set ^WS.VS.GBT4761(7)="兄、弟、姐、妹"
    Set ^WS.VS.GBT4761(8)="其他"
    
    /// 1.急诊;2.门诊;3.其他医疗机构转入;9.其他;
    Set ^WS.VS.CV0900403(1)="急诊"
    Set ^WS.VS.CV0900403(2)="门诊"
    Set ^WS.VS.CV0900403(3)="其他医疗机构转入"
    Set ^WS.VS.CV0900403(9)="其他"
    
    Set ^WS.VS.WJF2002108Category("01")="尘肺"
    Set ^WS.VS.WJF2002108Category("02")="职业性放射性疾病"
    Set ^WS.VS.WJF2002108Category("03")="职业中毒"
    Set ^WS.VS.WJF2002108Category("04")="物理因素所致职业病"
    Set ^WS.VS.WJF2002108Category("05")="生物因素所致职业病"
    Set ^WS.VS.WJF2002108Category("06")="职业性皮肤病"
    Set ^WS.VS.WJF2002108Category("07")="职业性眼病"
    Set ^WS.VS.WJF2002108Category("08")="职业性耳鼻喉口腔疾病"
    Set ^WS.VS.WJF2002108Category("09")="职业性肿瘤"
    Set ^WS.VS.WJF2002108Category(10)="其他职业病"
    
    Set ^WS.VS.WJF2002108Pneumoconiosis("1")="矽肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("2")="煤工尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("3")="石墨尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("4")="碳黑尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("5")="石棉肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("6")="滑石尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("7")="水泥尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("8")="云母尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("9")="陶工尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("10")="铝尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("11")="电焊工尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("12")="铸工尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("13")="根据《尘肺病诊断标准》和《尘肺病理诊断标准》可以诊断的其他尘肺"
}

ClassMethod Test()
{
    Set ^WS.VS.WJF2002108Category("01")="尘肺"
    Set ^WS.VS.WJF2002108Category("02")="职业性放射性疾病"
    Set ^WS.VS.WJF2002108Category("03")="职业中毒"
    Set ^WS.VS.WJF2002108Category("04")="物理因素所致职业病"
    Set ^WS.VS.WJF2002108Category("05")="生物因素所致职业病"
    Set ^WS.VS.WJF2002108Category("06")="职业性皮肤病"
    Set ^WS.VS.WJF2002108Category("07")="职业性眼病"
    Set ^WS.VS.WJF2002108Category("08")="职业性耳鼻喉口腔疾病"
    Set ^WS.VS.WJF2002108Category("09")="职业性肿瘤"
    Set ^WS.VS.WJF2002108Category(10)="其他职业病"
    
    Set ^WS.VS.WJF2002108Pneumoconiosis("1")="矽肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("2")="煤工尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("3")="石墨尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("4")="碳黑尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("5")="石棉肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("6")="滑石尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("7")="水泥尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("8")="云母尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("9")="陶工尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("10")="铝尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("11")="电焊工尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("12")="铸工尘肺"
    Set ^WS.VS.WJF2002108Pneumoconiosis("13")="根据《尘肺病诊断标准》和《尘肺病理诊断标准》可以诊断的其他尘肺"
}

/// 导入ICD10
ClassMethod InitICD()
{
    s tSub=$O(^ICD.ICD10D(""))
    While tSub '=""
    {
        s ^WS.VS.ICD10($LG(^ICD.ICD10D(tSub),2))=$LG(^ICD.ICD10D(tSub),3)
        s tSub=$O(^ICD.ICD10D(tSub))
    }
    
    s ^WS.VS.DE090010400(1)="有明确诊断"
    s ^WS.VS.DE090010400(2)="临床未确定"
    s ^WS.VS.DE090010400(3)="情况不明"
    s ^WS.VS.DE090010400(4)="无法确定"
    
    s ^WS.VS.DE090010300(1)="甲"
    s ^WS.VS.DE090010300(2)="乙"
    s ^WS.VS.DE090010300(3)="丙"
}

/// 待导入
ClassMethod InitICD9CM()
{
}

/// 待导入
ClassMethod InitICDO3()
{
}

ClassMethod IsClassExist(sClassName As %String) As %Boolean
{
    Set bRet=0
    if ##class(%Dictionary.ClassDefinition).%ExistsId(sClassName) Set bRet=1
    quit bRet
}

}
