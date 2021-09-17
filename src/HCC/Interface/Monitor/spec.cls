Class HCC.Interface.Monitor.spec Extends %REST.Spec [ ProcedureBlock ]
{

Parameter HandleCorsRequest = 1;

XData OpenAPI [ MimeType = application/json ]
{
{
  "swagger": "2.0",
  "info": {
    "title": "hcc api",
    "version": "1.0.0",
    "description": "HealthConnect消息及服务的一些统计示例"
  },
  "basePath": "/hcc/monitor",
  "consumes": [
    "application/x-www-form-urlencoded",
    "multipart/form-data"
  ],
  "schemes": [
    "http",
    "https"
  ],
  "paths": {
    "/services": {
      "get": {
        "summary": "获取所有命名空间的服务列表",
        "description": "服务列表",
        "tags": [
          "服务列表"
        ],
        "operationId": "getServices",
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "$ref": "#/definitions/services"
            }
          },
          "500": {
            "$ref": "#/responses/Standard500ErrorResponse"
          }
        }
      }
    },
    "/hccServiceStatistic": {
      "get": {
        "summary": "获取互联互通服务中各种类型调用的统计数据，",
        "description": "包括总数，成功数（返回AA的数字），失败（返回AE），错误（内部错误，BS向web application返回500）。统计的时长为。。。",
        "tags": [
          "HCC统计"
        ],
        "operationId": "getHCCServiceStatistic",
        "parameters": [
          {
            "$ref": "#/parameters/action"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "$ref": "#/definitions/hccservicestatistic"
            }
          },
          "500": {
            "$ref": "#/responses/Standard500ErrorResponse"
          }
        }
      }
    },
    "/{namespace}/services": {
      "get": {
        "summary": "获取单一命名空间的服务列表",
        "description": "关于什么是服务暂时定义为：1. running production里的BS,2. REST服务，没在produciton中的SOAP暂时不考虑。输出为service名字，类型(BS或者REST),如果是REST打印url",
        "tags": [
          "服务列表"
        ],
        "operationId": "getOneNamespaceServices",
        "parameters": [
          {
            "$ref": "#/parameters/namespace"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "$ref": "#/definitions/services"
            }
          },
          "500": {
            "$ref": "#/responses/Standard500ErrorResponse"
          }
        }
      }
    },
    "/{namespace}/hosts": {
      "get": {
        "summary": "业务组件信息",
        "description": "获取单一命名空间正在运行的production的业务组件信息",
        "tags": [
          "业务组件信息"
        ],
        "operationId": "getBusinessHostInfo",
        "parameters": [
          {
            "$ref": "#/parameters/namespace"
          }
        ],
        "responses": {
          "200": {
            "description": "running businesshosts info",
            "schema": {
              "type": "array",
              "items": {
                "properties": {
                  "entry": {
                    "type": "string",
                    "maxLength": 500
                  }
                }
              }
            }
          },
          "500": {
            "$ref": "#/responses/Standard500ErrorResponse"
          }
        }
      }
    },
    "/{namespace}/activitydata": {
      "get": {
        "summary": "业务量统计",
        "description": "统计当天（从零点到当前时间）各个组件的消息计数，或者当给定时间间隔，统计时间间隔内的消息计算",
        "tags": [
          "业务量统计"
        ],
        "operationId": "getActivityData",
        "parameters": [
          {
            "$ref": "#/parameters/namespace"
          },
          {
            "$ref": "#/parameters/action"
          },
          {
            "$ref": "#/parameters/beginTime"
          },
          {
            "$ref": "#/parameters/endTime"
          }
        ],
        "responses": {
          "200": {
            "$ref": "#/responses/activityDataResponse"
          },
          "500": {
            "$ref": "#/responses/Standard500ErrorResponse"
          }
        }
      }
    },
    "/{namespace}/eventLog": {
      "get": {
        "summary": "Event Log列表",
        "description": "通过level参数返回所有的entry或者只返回warning以上级别的记录",
        "tags": [
          "日志和警告"
        ],
        "operationId": "getEventLog",
        "parameters": [
          {
            "name": "namespace",
            "in": "path",
            "required": true,
            "type": "string"
          },
          {
            "name": "level",
            "in": "query",
            "required": false,
            "type": "string",
            "enum": [
              "all",
              "error"
            ]
          },
          {
            "$ref": "#/parameters/beginTime"
          },
          {
            "$ref": "#/parameters/endTime"
          }
        ],
        "responses": {
          "200": {
            "description": "返回EventLog列表",
            "schema": {
              "$ref": "#/definitions/businesshosts"
            }
          },
          "500": {
            "$ref": "#/responses/Standard500ErrorResponse"
          }
        }
      }
    }
  },
  "definitions": {
    "service": {
      "required": [
        "name",
        "type"
      ],
      "properties": {
        "name": {
          "type": "string"
        },
        "type": {
          "type": "string"
        },
        "url": {
          "type": "string"
        }
      }
    },
    "services": {
      "type": "array",
      "items": {
        "$ref": "#/definitions/service"
      }
    },
    "hccservicestatistic": {
      "required": [
        "action",
        "success"
      ],
      "properties": {
        "action": {
          "type": "string"
        },
        "AA": {
          "type": "integer"
        },
        "AE": {
          "type": "integer"
        },
        "InternalError": {
          "type": "integer"
        }
      }
    },
    "error": {
      "properties": {
        "code": {
          "type": "string"
        },
        "message": {
          "type": "string"
        }
      }
    },
    "businesshost": {
      "required": [
        "configName",
        "businesshostType"
      ],
      "properties": {
        "configName": {
          "type": "string"
        },
        "businesshostType": {
          "type": "string",
          "enum": [
            "BS",
            "BP",
            "BO"
          ]
        },
        "businesshostStatus": {
          "type": "string"
        }
      }
    },
    "businesshosts": {
      "type": "array",
      "items": {
        "$ref": "#/definitions/businesshost"
      }
    }
  },
  "responses": {
    "Standard500ErrorResponse": {
      "description": "标准500错误响应",
      "schema": {
        "$ref": "#/definitions/error"
      }
    },
    "activityDataResponse": {
      "description": "activityData的响应消息",
      "schema": {
        "properties": {
          "hostname": {
            "type": "string"
          },
          "totalCount": {
            "type": "integer"
          }
        }
      }
    }
  },
  "parameters": {
    "namespace": {
      "name": "namespace",
      "in": "path",
      "required": true,
      "type": "string"
    },
    "hostname": {
      "name": "hostname",
      "in": "formData",
      "description": "hostname",
      "type": "string"
    },
    "pageSize": {
      "name": "pageSize",
      "in": "query",
      "description": "单页返回的记录数量",
      "type": "string"
    },
    "pageNumber": {
      "name": "pageNumber",
      "in": "query",
      "description": "Page Number",
      "type": "integer"
    },
    "beginTime": {
      "name": "beginTime",
      "in": "formData",
      "description": "begin time",
      "type": "string",
      "format": "dateTime"
    },
    "endTime": {
      "name": "endTime",
      "in": "formData",
      "description": "end time",
      "type": "string",
      "format": "dateTime"
    },
    "action": {
      "name": "action",
      "in": "formData",
      "description": "action",
      "type": "string"
    }
  }
}
}

}
