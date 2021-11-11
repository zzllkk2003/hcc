/// Author: QP
/// Version: 1.0
/// Date: 2021/08/04
/// base class of WS VS code
Class WS.VS.Base Extends (%Persistent, %XML.Adaptor, %JSON.Adaptor) [ Abstract, Language = objectscript, NoExtent ]
{

Property Code As %String;

Property Display As %String;

Property Description As %String;

Index Idkey On Code [ IdKey ];

Parameter OID;

}
