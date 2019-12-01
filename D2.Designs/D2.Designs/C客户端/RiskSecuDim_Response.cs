using LdNet.ClientSdk.Model;
using LdNet.ClientCore.Sdk;
using LdNet.Communication;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using LDsdkDefineEx;

namespace LdNet.ClientSdk.Response
{
    public class rksecuL_3_1_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_1_Response()
        {
            this.rksecuL_3_1_InfoList = new ObservableCollection<rksecuL_3_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_1_Info> rksecuL_3_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_1_Info info = new rksecuL_3_1_Info();
            info.index_no = unpacker.GetInt("index_no");
            info.index_code = unpacker.GetStr("index_code");
            info.index_name = unpacker.GetStr("index_name");
            info.index_build_orgn = unpacker.GetStr("index_build_orgn");
            info.weight_type = unpacker.GetInt("weight_type");
            info.remark_info = unpacker.GetStr("remark_info");
            rksecuL_3_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_1_InfoList.Add((rksecuL_3_1_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_查询指数类型
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_3_1_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.index_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_NO_INT);
                    info.index_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_CODE_STR);
                    info.index_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_NAME_STR);
                    info.index_build_orgn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_BUILD_ORGN_STR);
                    info.weight_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_TYPE_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rksecuL_3_1_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_3_2_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_2_Response()
        {
            this.rksecuL_3_2_InfoList = new ObservableCollection<rksecuL_3_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_2_Info> rksecuL_3_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_2_Info info = new rksecuL_3_2_Info();
            info.index_no = unpacker.GetInt("index_no");
            info.index_code = unpacker.GetStr("index_code");
            info.index_name = unpacker.GetStr("index_name");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_type = unpacker.GetInt("stock_type");
            info.weight_value = unpacker.GetDouble("weight_value");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            info.remark_info = unpacker.GetStr("remark_info");
            rksecuL_3_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_2_InfoList.Add((rksecuL_3_2_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_查询指数证券代码
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_3_2_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.index_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_NO_INT);
                    info.index_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_CODE_STR);
                    info.index_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_NAME_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.weight_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_VALUE_FLOAT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rksecuL_3_2_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_3_3_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_3_Response()
        {
            this.rksecuL_3_3_InfoList = new ObservableCollection<rksecuL_3_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_3_Info> rksecuL_3_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_3_Info info = new rksecuL_3_3_Info();
            info.indu_type_no = unpacker.GetInt("indu_type_no");
            info.indu_type_name = unpacker.GetStr("indu_type_name");
            info.indu_bulid_orgn = unpacker.GetStr("indu_bulid_orgn");
            info.indu_level_total = unpacker.GetInt("indu_level_total");
            info.weight_type = unpacker.GetInt("weight_type");
            info.remark_info = unpacker.GetStr("remark_info");
            rksecuL_3_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_3_InfoList.Add((rksecuL_3_3_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_查询行业类型
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_3_3_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.indu_type_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDU_TYPE_NO_INT);
                    info.indu_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_TYPE_NAME_STR);
                    info.indu_bulid_orgn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_BULID_ORGN_STR);
                    info.indu_level_total = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDU_LEVEL_TOTAL_INT);
                    info.weight_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_TYPE_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rksecuL_3_3_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_3_4_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_4_Response()
        {
            this.rksecuL_3_4_InfoList = new ObservableCollection<rksecuL_3_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_4_Info> rksecuL_3_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_4_Info info = new rksecuL_3_4_Info();
            info.indu_type_no = unpacker.GetInt("indu_type_no");
            info.indu_code = unpacker.GetStr("indu_code");
            info.indu_name = unpacker.GetStr("indu_name");
            info.indu_level_total = unpacker.GetInt("indu_level_total");
            info.indu_level = unpacker.GetInt("indu_level");
            info.highup_indu_code = unpacker.GetStr("highup_indu_code");
            info.weight_type = unpacker.GetInt("weight_type");
            info.weight_value = unpacker.GetDouble("weight_value");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            info.remark_info = unpacker.GetStr("remark_info");
            rksecuL_3_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_4_InfoList.Add((rksecuL_3_4_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_查询行业层级
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_3_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.indu_type_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDU_TYPE_NO_INT);
                    info.indu_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_CODE_STR);
                    info.indu_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_NAME_STR);
                    info.indu_level_total = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDU_LEVEL_TOTAL_INT);
                    info.indu_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDU_LEVEL_INT);
                    info.highup_indu_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_HIGHUP_INDU_CODE_STR);
                    info.weight_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_TYPE_INT);
                    info.weight_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_VALUE_FLOAT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rksecuL_3_4_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_3_5_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_5_Response()
        {
            this.rksecuL_3_5_InfoList = new ObservableCollection<rksecuL_3_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_5_Info> rksecuL_3_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_5_Info info = new rksecuL_3_5_Info();
            info.indu_type_no = unpacker.GetInt("indu_type_no");
            info.indu_code = unpacker.GetStr("indu_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_type = unpacker.GetInt("stock_type");
            info.stock_name = unpacker.GetStr("stock_name");
            info.weight_value = unpacker.GetDouble("weight_value");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            info.remark_info = unpacker.GetStr("remark_info");
            rksecuL_3_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_5_InfoList.Add((rksecuL_3_5_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_查询行业证券代码
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_3_5_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.indu_type_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDU_TYPE_NO_INT);
                    info.indu_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_INDU_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.weight_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_VALUE_FLOAT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rksecuL_3_5_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_3_6_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_6_Response()
        {
            this.rksecuL_3_6_InfoList = new ObservableCollection<rksecuL_3_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_6_Info> rksecuL_3_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_6_Info info = new rksecuL_3_6_Info();
            info.dime_type_code = unpacker.GetStr("dime_type_code");
            info.dime_type_name = unpacker.GetStr("dime_type_name");
            info.remark_info = unpacker.GetStr("remark_info");
            rksecuL_3_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_6_InfoList.Add((rksecuL_3_6_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_查询自定义维度类型
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_3_6_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.dime_type_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_CODE_STR);
                    info.dime_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_NAME_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rksecuL_3_6_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_3_7_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_7_Response()
        {
            this.rksecuL_3_7_InfoList = new ObservableCollection<rksecuL_3_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_7_Info> rksecuL_3_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_7_Info info = new rksecuL_3_7_Info();
            info.dime_type_code = unpacker.GetStr("dime_type_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_type = unpacker.GetInt("stock_type");
            info.weight_value = unpacker.GetDouble("weight_value");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            info.remark_info = unpacker.GetStr("remark_info");
            rksecuL_3_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_7_InfoList.Add((rksecuL_3_7_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_查询自定义维度证券代码
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_3_7_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.dime_type_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.weight_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_VALUE_FLOAT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rksecuL_3_7_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_3_8_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_8_Response()
        {
            this.rksecuL_3_8_InfoList = new ObservableCollection<rksecuL_3_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_8_Info> rksecuL_3_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_8_Info info = new rksecuL_3_8_Info();
            rksecuL_3_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_8_InfoList.Add((rksecuL_3_8_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_新增机构维度类型
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_3_8_Info();
                rksecuL_3_8_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_3_9_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_9_Response()
        {
            this.rksecuL_3_9_InfoList = new ObservableCollection<rksecuL_3_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_9_Info> rksecuL_3_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_9_Info info = new rksecuL_3_9_Info();
            rksecuL_3_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_9_InfoList.Add((rksecuL_3_9_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_修改机构维度类型
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_3_9_Info();
                rksecuL_3_9_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_3_10_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_10_Response()
        {
            this.rksecuL_3_10_InfoList = new ObservableCollection<rksecuL_3_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_10_Info> rksecuL_3_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_10_Info info = new rksecuL_3_10_Info();
            rksecuL_3_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_10_InfoList.Add((rksecuL_3_10_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_删除机构维度类型
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_3_10_Info();
                rksecuL_3_10_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_3_11_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_11_Response()
        {
            this.rksecuL_3_11_InfoList = new ObservableCollection<rksecuL_3_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_11_Info> rksecuL_3_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_11_Info info = new rksecuL_3_11_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.user_dim_type = unpacker.GetInt("user_dim_type");
            info.dime_type_code = unpacker.GetStr("dime_type_code");
            info.dime_type_name = unpacker.GetStr("dime_type_name");
            info.weight_type = unpacker.GetInt("weight_type");
            info.remark_info = unpacker.GetStr("remark_info");
            rksecuL_3_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_11_InfoList.Add((rksecuL_3_11_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_查询机构维度类型
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_3_11_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.user_dim_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_USER_DIM_TYPE_INT);
                    info.dime_type_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_CODE_STR);
                    info.dime_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_NAME_STR);
                    info.weight_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_TYPE_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rksecuL_3_11_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_3_12_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_12_Response()
        {
            this.rksecuL_3_12_InfoList = new ObservableCollection<rksecuL_3_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_12_Info> rksecuL_3_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_12_Info info = new rksecuL_3_12_Info();
            rksecuL_3_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_12_InfoList.Add((rksecuL_3_12_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_新增机构维度证券代码
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_3_12_Info();
                rksecuL_3_12_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_3_13_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_13_Response()
        {
            this.rksecuL_3_13_InfoList = new ObservableCollection<rksecuL_3_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_13_Info> rksecuL_3_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_13_Info info = new rksecuL_3_13_Info();
            rksecuL_3_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_13_InfoList.Add((rksecuL_3_13_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_删除机构维度证券代码
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_3_13_Info();
                rksecuL_3_13_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_3_14_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_14_Response()
        {
            this.rksecuL_3_14_InfoList = new ObservableCollection<rksecuL_3_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_14_Info> rksecuL_3_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_14_Info info = new rksecuL_3_14_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.dime_type_code = unpacker.GetStr("dime_type_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_type = unpacker.GetInt("stock_type");
            info.weight_value = unpacker.GetDouble("weight_value");
            info.weight_ratio = unpacker.GetDouble("weight_ratio");
            info.remark_info = unpacker.GetStr("remark_info");
            info.create_date = unpacker.GetInt("create_date");
            rksecuL_3_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_14_InfoList.Add((rksecuL_3_14_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_查询机构维度证券代码
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_3_14_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.dime_type_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.weight_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_VALUE_FLOAT);
                    info.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    rksecuL_3_14_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_3_15_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_15_Response()
        {
            this.rksecuL_3_15_InfoList = new ObservableCollection<rksecuL_3_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_15_Info> rksecuL_3_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_15_Info info = new rksecuL_3_15_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.dime_type = unpacker.GetInt("dime_type");
            info.ctrl_cond_dim_code_str = unpacker.GetStr("ctrl_cond_dim_code_str");
            rksecuL_3_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_15_InfoList.Add((rksecuL_3_15_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_维度序号获取维度编码
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_3_15_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.dime_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_INT);
                    info.ctrl_cond_dim_code_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CTRL_COND_DIM_CODE_STR_STR);
                    rksecuL_3_15_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_3_16_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_16_Response()
        {
            this.rksecuL_3_16_InfoList = new ObservableCollection<rksecuL_3_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_16_Info> rksecuL_3_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_16_Info info = new rksecuL_3_16_Info();
            info.dime_id = unpacker.GetInt64("dime_id");
            rksecuL_3_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_16_InfoList.Add((rksecuL_3_16_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_维度编码获取维度序号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_3_16_Info();
                info.dime_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64);
                rksecuL_3_16_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_3_17_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_17_Response()
        {
            this.rksecuL_3_17_InfoList = new ObservableCollection<rksecuL_3_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_17_Info> rksecuL_3_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_17_Info info = new rksecuL_3_17_Info();
            rksecuL_3_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_17_InfoList.Add((rksecuL_3_17_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_生成自定义维度代码
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_3_17_Info();
                rksecuL_3_17_InfoList.Add(info);
            }
        }
    }

    public class rksecuL_3_24_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_24_Response()
        {
            this.rksecuL_3_24_InfoList = new ObservableCollection<rksecuL_3_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_24_Info> rksecuL_3_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_24_Info info = new rksecuL_3_24_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.remark_info = unpacker.GetStr("remark_info");
            rksecuL_3_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_24_InfoList.Add((rksecuL_3_24_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_查询证券代码股票池
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rksecuL_3_24_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rksecuL_3_24_InfoList.Add(info);
                }
            }
        }
    }

    public class rksecuL_3_25_Response : IResponse
    {
        #region 构造函数
        public rksecuL_3_25_Response()
        {
            this.rksecuL_3_25_InfoList = new ObservableCollection<rksecuL_3_25_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rksecuL_3_25_Info> rksecuL_3_25_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rksecuL_3_25_Info info = new rksecuL_3_25_Info();
            rksecuL_3_25_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rksecuL_3_25_InfoList.Add((rksecuL_3_25_Info)info);
        }
        #endregion

        //逻辑_风控证券_维度_清空并新增指数证券代码
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rksecuL_3_25_Info();
                rksecuL_3_25_InfoList.Add(info);
            }
        }
    }

}
