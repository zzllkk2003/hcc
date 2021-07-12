Class HCC.Utils.SharedDocTransfer Extends %RegisteredObject
{

/// 将共享文档主库对象，转换为总表对象
ClassMethod LatestDocToAllDoc(gxwdDoc As HCC.DocRepository.LatestDocs) As HCC.DocRepository.AllDocs [ Language = objectscript ]
{
	Set model =##class(HCC.DocRepository.AllDocs).%New()
	set model.MsgCreatTime=gxwdDoc.MsgCreatTime
	set model.SenderId=gxwdDoc.SenderId
	set model.DocId=gxwdDoc.DocId
	set model.DocCode=gxwdDoc.DocCode
	set model.DocName=gxwdDoc.DocName
	set model.DocCreatTime=gxwdDoc.DocCreatTime
	set model.VersionNumber=gxwdDoc.VersionNumber
	set model.Content=gxwdDoc.Content
	set model.PatId=gxwdDoc.PatId
	set model.PatInHosCode=gxwdDoc.PatInHosCode
	set model.PatInHosCount=gxwdDoc.PatInHosCount
	set model.PatOutHosCode=gxwdDoc.PatOutHosCode
	set model.PatEffectiveLowTime=gxwdDoc.PatEffectiveLowTime
	set model.PatEffectiveHighTime=gxwdDoc.PatEffectiveHighTime
	set model.PatCardId=gxwdDoc.PatCardId
	set model.PatName=gxwdDoc.PatName
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
