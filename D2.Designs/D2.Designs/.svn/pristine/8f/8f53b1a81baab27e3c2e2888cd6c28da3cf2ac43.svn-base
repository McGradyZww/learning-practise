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
    public class pdsecuL_7_1_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_1_Response()
        {
            this.pdsecuL_7_1_InfoList = new ObservableCollection<pdsecuL_7_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_1_Info> pdsecuL_7_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_1_Info info = new pdsecuL_7_1_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_acco_name = unpacker.GetStr("stock_acco_name");
            info.stock_acco_status = unpacker.GetStr("stock_acco_status");
            info.stock_acco_apoint_status = unpacker.GetStr("stock_acco_apoint_status");
            pdsecuL_7_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_1_InfoList.Add((pdsecuL_7_1_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_查询全部证券账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_7_1_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NAME_STR);
                    info.stock_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STATUS_STR);
                    info.stock_acco_apoint_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_APOINT_STATUS_STR);
                    pdsecuL_7_1_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_7_11_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_11_Response()
        {
            this.pdsecuL_7_11_InfoList = new ObservableCollection<pdsecuL_7_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_11_Info> pdsecuL_7_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_11_Info info = new pdsecuL_7_11_Info();
            pdsecuL_7_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_11_InfoList.Add((pdsecuL_7_11_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_归档产品证券数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_7_11_Info();
                pdsecuL_7_11_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_7_12_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_12_Response()
        {
            this.pdsecuL_7_12_InfoList = new ObservableCollection<pdsecuL_7_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_12_Info> pdsecuL_7_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_12_Info info = new pdsecuL_7_12_Info();
            pdsecuL_7_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_12_InfoList.Add((pdsecuL_7_12_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_初始化产品证券数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_7_12_Info();
                pdsecuL_7_12_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_7_13_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_13_Response()
        {
            this.pdsecuL_7_13_InfoList = new ObservableCollection<pdsecuL_7_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_13_Info> pdsecuL_7_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_13_Info info = new pdsecuL_7_13_Info();
            pdsecuL_7_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_13_InfoList.Add((pdsecuL_7_13_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_更新港股通待入账记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_7_13_Info();
                pdsecuL_7_13_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_7_14_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_14_Response()
        {
            this.pdsecuL_7_14_InfoList = new ObservableCollection<pdsecuL_7_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_14_Info> pdsecuL_7_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_14_Info info = new pdsecuL_7_14_Info();
            pdsecuL_7_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_14_InfoList.Add((pdsecuL_7_14_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_更新估值资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_7_14_Info();
                pdsecuL_7_14_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_7_15_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_15_Response()
        {
            this.pdsecuL_7_15_InfoList = new ObservableCollection<pdsecuL_7_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_15_Info> pdsecuL_7_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_15_Info info = new pdsecuL_7_15_Info();
            pdsecuL_7_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_15_InfoList.Add((pdsecuL_7_15_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_更新港股通结算汇率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_7_15_Info();
                pdsecuL_7_15_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_7_16_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_16_Response()
        {
            this.pdsecuL_7_16_InfoList = new ObservableCollection<pdsecuL_7_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_16_Info> pdsecuL_7_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_16_Info info = new pdsecuL_7_16_Info();
            pdsecuL_7_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_16_InfoList.Add((pdsecuL_7_16_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_同步产品信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_7_16_Info();
                pdsecuL_7_16_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_7_17_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_17_Response()
        {
            this.pdsecuL_7_17_InfoList = new ObservableCollection<pdsecuL_7_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_17_Info> pdsecuL_7_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_17_Info info = new pdsecuL_7_17_Info();
            pdsecuL_7_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_17_InfoList.Add((pdsecuL_7_17_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_同步资产所需证券代码信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_7_17_Info();
                pdsecuL_7_17_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_7_18_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_18_Response()
        {
            this.pdsecuL_7_18_InfoList = new ObservableCollection<pdsecuL_7_18_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_18_Info> pdsecuL_7_18_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_18_Info info = new pdsecuL_7_18_Info();
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            pdsecuL_7_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_18_InfoList.Add((pdsecuL_7_18_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_新增证券账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_7_18_Info();
                info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                pdsecuL_7_18_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_7_19_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_19_Response()
        {
            this.pdsecuL_7_19_InfoList = new ObservableCollection<pdsecuL_7_19_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_19_Info> pdsecuL_7_19_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_19_Info info = new pdsecuL_7_19_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_acco_name = unpacker.GetStr("stock_acco_name");
            info.stock_acco_status = unpacker.GetStr("stock_acco_status");
            info.stock_acco_apoint_status = unpacker.GetStr("stock_acco_apoint_status");
            info.allow_stock_type = unpacker.GetStr("allow_stock_type");
            info.busi_limit_str = unpacker.GetStr("busi_limit_str");
            info.registration_agency = unpacker.GetStr("registration_agency");
            info.remark_info = unpacker.GetStr("remark_info");
            pdsecuL_7_19_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_19_InfoList.Add((pdsecuL_7_19_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_查询证券账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pdsecuL_7_19_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NAME_STR);
                    info.stock_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STATUS_STR);
                    info.stock_acco_apoint_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_APOINT_STATUS_STR);
                    info.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    info.busi_limit_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_LIMIT_STR_STR);
                    info.registration_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    pdsecuL_7_19_InfoList.Add(info);
                }
            }
        }
    }

    public class pdsecuL_7_20_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_20_Response()
        {
            this.pdsecuL_7_20_InfoList = new ObservableCollection<pdsecuL_7_20_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_20_Info> pdsecuL_7_20_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_20_Info info = new pdsecuL_7_20_Info();
            pdsecuL_7_20_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_20_InfoList.Add((pdsecuL_7_20_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_注销资产账户和证券账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_7_20_Info();
                pdsecuL_7_20_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_7_21_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_21_Response()
        {
            this.pdsecuL_7_21_InfoList = new ObservableCollection<pdsecuL_7_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_21_Info> pdsecuL_7_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_21_Info info = new pdsecuL_7_21_Info();
            pdsecuL_7_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_21_InfoList.Add((pdsecuL_7_21_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_冻结证券账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_7_21_Info();
                pdsecuL_7_21_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_7_22_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_22_Response()
        {
            this.pdsecuL_7_22_InfoList = new ObservableCollection<pdsecuL_7_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_22_Info> pdsecuL_7_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_22_Info info = new pdsecuL_7_22_Info();
            pdsecuL_7_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_22_InfoList.Add((pdsecuL_7_22_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_恢复证券账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_7_22_Info();
                pdsecuL_7_22_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_7_23_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_23_Response()
        {
            this.pdsecuL_7_23_InfoList = new ObservableCollection<pdsecuL_7_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_23_Info> pdsecuL_7_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_23_Info info = new pdsecuL_7_23_Info();
            pdsecuL_7_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_23_InfoList.Add((pdsecuL_7_23_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_注销证券账户
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_7_23_Info();
                pdsecuL_7_23_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_7_25_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_25_Response()
        {
            this.pdsecuL_7_25_InfoList = new ObservableCollection<pdsecuL_7_25_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_25_Info> pdsecuL_7_25_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_25_Info info = new pdsecuL_7_25_Info();
            pdsecuL_7_25_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_25_InfoList.Add((pdsecuL_7_25_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_修改证券账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_7_25_Info();
                pdsecuL_7_25_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_7_26_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_26_Response()
        {
            this.pdsecuL_7_26_InfoList = new ObservableCollection<pdsecuL_7_26_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_26_Info> pdsecuL_7_26_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_26_Info info = new pdsecuL_7_26_Info();
            pdsecuL_7_26_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_26_InfoList.Add((pdsecuL_7_26_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_删除证券账户信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_7_26_Info();
                pdsecuL_7_26_InfoList.Add(info);
            }
        }
    }

    public class pdsecuL_7_27_Response : IResponse
    {
        #region 构造函数
        public pdsecuL_7_27_Response()
        {
            this.pdsecuL_7_27_InfoList = new ObservableCollection<pdsecuL_7_27_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pdsecuL_7_27_Info> pdsecuL_7_27_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_7_27_Info info = new pdsecuL_7_27_Info();
            pdsecuL_7_27_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_7_27_InfoList.Add((pdsecuL_7_27_Info)info);
        }
        #endregion

        //逻辑_产品证券_账户运维_注销交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_7_27_Info();
                pdsecuL_7_27_InfoList.Add(info);
            }
        }
    }

}
