/// 
/// Author: Jeff Liu
/// Date: 2021-07-15 09:58:06
/// LastEditTime: 2021-07-16 14:27:21
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/src/HCC/Utils/SharedDocTransfer.cls
/// Jeff.liu@intersytems.com
/// 
Class HCC.Utils.SharedDocTransfer Extends %RegisteredObject
{

/// 将共享文档主库对象，转换为总表对象
ClassMethod AllDocToLatestDoc(gxwdDoc As HCC.DocRepository.AllDocs) As HCC.DocRepository.LatestDocs [ Language = objectscript ]
{
	Set model =##class(HCC.DocRepository.LatestDocs).%New()
	set model.MsgCreatTime=gxwdDoc.MsgCreatTime
	set model.SenderId=gxwdDoc.SenderId
	set model.DocId=gxwdDoc.DocId
	set model.DocCode=gxwdDoc.DocCode
	set model.DocName=gxwdDoc.DocName
	set model.DocCreatTime=gxwdDoc.DocCreatTime
	set model.VersionNumber=gxwdDoc.VersionNumber
	set model.Content=gxwdDoc.Content
	//set model.PatId=gxwdDoc.PatId
	set model.PatInHosCode=gxwdDoc.PatInHosCode
	//set model.PatInHosCount=gxwdDoc.PatInHosCount
	set model.PatOutHosCode=gxwdDoc.PatOutHosCode
	set model.PatEffectiveLowTime=gxwdDoc.PatEffectiveLowTime
	set model.PatEffectiveHighTime=gxwdDoc.PatEffectiveHighTime
	//set model.PatCardId=gxwdDoc.PatCardId
	//set model.PatName=gxwdDoc.PatName
	set model.Patient =gxwdDoc.Patient
	set model.ProHosCode=gxwdDoc.ProHosCode
	set model.ProHosName=gxwdDoc.ProHosName
	set model.DeptCode=gxwdDoc.DeptCode
	set model.DocUserCode=gxwdDoc.DocUserCode
	set model.DocUserName=gxwdDoc.DocUserName
	set model.RepHosCode=gxwdDoc.RepHosCode
	set model.RepHosName=gxwdDoc.RepHosName
	set model.AddDate=gxwdDoc.AddDate
	quit model
}

}
