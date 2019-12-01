/**
 *源程序名称:tag_def.h
 *模块名称:FAST解析		定义中间件内部使用到的tag（业务tag定义在biz_tag_def.h中）
 *功能说明:定义FAST相关常量
 *           (1)整数域，即Int域，数字字符串；
 *           (2)字符串域，即String域，任意可见字符串；
 *           (3)二进制域，即RawData域，可以为任意字符组成；该域前，必须有一个整数型的 TAG_RAWDATALEN 域来表示该二进制域长度；
 *           (4)数组域，即Array域，可以为任意字符组成；该域前，必须有一个整数型的 TAG_ARRAYLEN 域来表示该数组大小。
 *开发日期:2017/5/5 13:21:01
 */

#ifndef _TAG_DEF_H
#define _TAG_DEF_H


/*****************消息域定义*******************/
const int MAX_TAG_IN_HEAD = 99;
const int MAX_INTERNAL_TAGID = 9;



const int LDTAG_NOINTERNAL_ROUTE=1;
const int LDTAG_NOINTERNAL_SENDER_PATH=2;
///域名：功能号  数据类型：string
const int LDTAG_FUNCID = 11;
///域名：系统编号  数据类型：int32
const int LDTAG_SYSTEMNO = 12;
///域名：机构编号  数据类型：uint32
const int LDTAG_COMPID = 13;
///域名：报号  数据类型：uint32
const int LDTAG_PACKETID = 14;
///域名：生存期  数据类型：uint16
const int LDTAG_TTL = 15;
///域名：发送者  数据类型：uint32
const int LDTAG_SENDERID = 16;
///域名：错误号  数据类型：int32
const int LDTAG_ERRORNO = 17;
///域名：错误信息  数据类型：bytevector
const int LDTAG_ERRORINFO = 18;
///域名：发送者信息  数据类型：sequence
const int LDTAG_NOSENDERPATH = 19;
///域名：路由信息  数据类型：sequence
const int LDTAG_NOROUTEINFO = 20;
///域名：报文类型  数据类型：uint8
const int LDTAG_PACKETTYPE = 21;
    const int REQUEST = 0;//请求
    const int ANSWER = 1;//应答
    const int INTERNAL_REQUEST = 2;//内部请求
    const int INTERNAL_ANSWER = 3;//内部应答
///域名：报文版本  数据类型：uint32
const int LDTAG_VER = 22;
///域名：用户自定数据重复组  数据类型：sequence
const int LDTAG_NOUSERDEFINE = 23;
///域名：用户自定数据  数据类型：string
const int LDTAG_USERDEFINEDATA = 24;
///域名：时间戳统计信息  数据类型：sequence
const int LDTAG_NOTIMESTAMPINFO = 25;
///域名：时间戳  数据类型：int32
const int LDTAG_TIMESTAMP = 26;
///域名：时间戳描述  数据类型：bytevector
const int LDTAG_TIMEINFO = 27;
///域名：节点名称  数据类型：bytevector
const int LDTAG_NODENAME = 28;
///域名：服务名称  数据类型：bytevector
const int LDTAG_SVRNAME = 29;
///域名：模块名称  数据类型：bytevector
const int LDTAG_MODULENAME = 30;
///域名：通道编号  数据类型：uint32
const int LDTAG_CHANNELID = 31;
///域名：连接号  数据类型：uint32
const int LDTAG_CONNECTID = 32;
///域名：串行化标志  数据类型：uint8
const int LDTAG_SERIALFLAG = 33;
///域名：报盘通道  数据类型：string
const int LDTAG_BP_CHANNEL = 34;
const int LDTAG_INSTRUMENT_ID = 35;
const int LDTAG_SYN_FLAG = 36;
const int LDTAG_PRIORITY = 37;
const int LDTAG_LIVING_TIMES = 38;
const int LDTAG_INQ_TIME = 39;

const int LDTAG_MANAGER_NO_NAME = 100;
const int LDTAG_MANAGER_NO_VALUE = 200;

const int LDTAG_CHANGE_FLAG=300;
const int LDTAG_NBR_FLAG=301;
const int LDTAG_OSPFPACK=302;
const int LDTAG_MANAGER_FUNC_INDEX=303;

const int LDTAG_NO_RESULTSET = 1000;


const int LDTAG_TOPIC_NAME=400;
const int LDTAG_FILTER_FIELD_ID=401;
const int LDTAG_FILTER_FIELD_VALUE=402;
const int LDTAG_NO_FILTERS=403;
const int LDTAG_PUBLISH_DATA=405;
const int LDTAG_SUBER_NAME=406;
const int LDTAG_PUBLISH_INTERVAL=407;
const int LDTAG_ORG_FUNCID=408;
const int LDTAG_R_LEVEL=409;
const int LDTAG_NO_SUBITEM=411;
const int LDTAG_SUB_TYPE=412;
const int LDTAG_SUB_STATUS=413;
const int LDTAG_POS_DUP=414;
const int LDTAG_ORG_TYPE=415;
#endif

