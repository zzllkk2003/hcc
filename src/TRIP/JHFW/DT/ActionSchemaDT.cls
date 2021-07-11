Class TRIP.JHFW.DT.ActionSchemaDT Extends Ens.DataTransformDTL [ DependsOn = TRIP.JHFW.Message.JiaoHuMsgRequest ]
{

/// DTL Definition.
XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform targetClass='TRIP.JHFW.Message.JiaoHuMsgRequest' targetDocType='' sourceClass='TRIP.JHFW.Message.JiaoHuMsgRequest' sourceDocType='' create='new' language='objectscript'>
</transform>
}

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

}
