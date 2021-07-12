Class EMR.MSG.PatientReq Extends (%RegisteredObject, %XML.Adaptor)
{

Property Message As %Stream.GlobalCharacter(XMLSTREAMMODE = "LINE");

/// 服务代码
Property Action As %String;

}
