/// 工具类用来导入schema
Class TRIP.JHFW.Tools Extends %RegisteredObject
{

ClassMethod load()
{

 set path="C:\My_SE+\99_SPEC\HL7v3\HL7V3MessageSchemas\multicacheschemas\"
 //旧规范列表
 set list=$lb("MCCI_IN000002UV01",
   "POOR_IN200901UV",
   "RCMR_IN000002UV02",
   "RCMR_IN000029UV01",
   "RCMR_IN000030UV01",
   "RCMR_IN000031UV01",
   "RCMR_IN000032UV01",
   "POLB_IN224000UV01",
   "PRPA_IN201304UV02",
   "PRPA_IN201305UV02",
   "PRPA_IN201306UV02",
   "PRPA_IN201311UV02",
   "PRPA_IN201314UV02",
   "PRPA_IN302011UV02",
   "PRPA_IN302012UV02",
   "PRPA_IN900300UV02",
   "PRPA_IN900350UV02",
   "PRPM_IN301010UV01",
   "PRPM_IN303010UV01",
   "PRPM_IN306010UV01",
   "PRPM_IN306011UV01",
   "PRPM_IN401030UV01",
   "PRPM_IN403010UV01",
   "PRPM_IN406010UV01",
   "PRPM_IN406110UV01",
   "PRSC_IN010101UV01",
   "PRSC_IN010201UV01",
   "QUMT_IN020030UV01",
   "QUMT_IN020040UV01",
   "ProvideAndRegisterDocumentSetRequest",
   "GetDocumentStroedInfoRequest",
   "RetrieveDocumentSetRequest"
   )
#; //以下是新规范的列表
#; set list=$lb("MCCI_IN000002UV01",
#;   "POOR_IN200901UV",
#;   "RCMR_IN000002UV02",
#;   "RCMR_IN000029UV01",
#;   "RCMR_IN000030UV01",
#;   "RCMR_IN000031UV01",
#;   "RCMR_IN000032UV01",
#;   "POLB_IN224000UV01",
#;   "PRPA_IN201304UV02",
#;   "PRPA_IN201305UV02",
#;   "PRPA_IN201306UV02",
#;   "PRPA_IN201311UV02",
#;   "PRPA_IN201314UV02",
#;   "PRPA_IN302011UV02",
#;   "PRPA_IN302012UV02",
#;   "PRPA_IN900300UV02",
#;   "PRPA_IN900350UV02",
#;   "PRPM_IN301010UV01",
#;   "PRPM_IN303010UV01",
#;   "PRPM_IN306010UV01",
#;   "PRPM_IN306011UV01",
#;   "PRPM_IN401030UV01",
#;   "PRPM_IN403010UV01",
#;   "PRPM_IN406010UV01",
#;   "PRPM_IN406110UV01",
#;   "PRSC_IN010101UV01",
#;   "PRSC_IN010201UV01",
#;   "QUMT_IN020030UV01",
#;   "QUMT_IN020040UV01")
 for i=1:1:$ll(list)
 {  set filename=$List(list,i)
  w filename, !
  set status=##class(EnsLib.EDI.XML.SchemaXSD).Import(path_filename_".xsd")
  if $$$ISERR(status){
     do $System.Status.DisplayError(status)
    }
 }
 
 //以下部分不成功， 第一个POLB就无法import, 从上面用的path可以,下面的path从页面也可以import, 就是执行命令不行
 //见了鬼了。
 
 #; set path="C:\My_SE+\99_SPEC\Edition2017_CD_1\Edition2017\processable\multicacheschemas\"
 s list=$lb( "POLB_IN224000UV01",
   "PRPA_IN400001UV02",
   "PRPA_IN400002UV02",
   "PRPA_IN400003UV02",
   "PRPA_IN410001UV02",
   "PRPA_IN410002UV02")
}

}
