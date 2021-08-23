/// Author: QP
/// Version: 1.0
/// Date:2021/08
/// HCC 标准设置
Class HCC.Setting Extends %RegisteredObject
{

/// ^HCC用于设置HCC系统级参数
/// ^HCC("HostFacility")=$lb("H123456","系联总医院")
/// ^HCC("XSLFilePath")="C:\HCC\XSLT"
/// ^HCC("DocGenTask")=0 关闭后台产生SQL互联互通文档的任务
/// ^HCC("Debug")=1 Debug模式，该模式会输出SQL XML文档
/// ^WS.Setting.Validation设置WS标准的bit串
/// 其第一位为0，表示跳过值集检查。值集检查由WS.DT.CodedString执行；
/// 其第二位为0，表示跳过数据元必要性约束检查。
/// 其第三位为0，表示跳过章节必要性检查。
ClassMethod Init()
{
    Set ^HCC("HostFacility")=$lb("H123456","系联总医院")
    Set ^HCC("XSLFilePath")="C:\HCC\XSLT"
    Set ^HCC("Debug")=1
    Set $bit(^WS.Setting.Validation,1)=1
    Set $bit(^WS.Setting.Validation,2)=1
    Set $bit(^WS.Setting.Validation,3)=1
}

/// 获得部署医疗机构信息
ClassMethod GetHostFacility() As %String
{
    Return $G(^HCC("HostFacility"))
}

/// 禁用值集检查
ClassMethod DisableVSValid()
{
    Set $bit(^WS.Setting.Validation,1)=0
}

}
