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
    public class pubL_29_1_Response : IResponse
    {
        #region 构造函数
        public pubL_29_1_Response()
        {
            this.pubL_29_1_InfoList = new ObservableCollection<pubL_29_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_1_Info> pubL_29_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_1_Info info = new pubL_29_1_Info();
            info.row_id = unpacker.GetInt64("row_id");
            pubL_29_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_1_InfoList.Add((pubL_29_1_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_新增可冲抵保证金证券表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_1_Info();
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                pubL_29_1_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_2_Response : IResponse
    {
        #region 构造函数
        public pubL_29_2_Response()
        {
            this.pubL_29_2_InfoList = new ObservableCollection<pubL_29_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_2_Info> pubL_29_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_2_Info info = new pubL_29_2_Info();
            pubL_29_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_2_InfoList.Add((pubL_29_2_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_修改可冲抵保证金证券表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_2_Info();
                pubL_29_2_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_3_Response : IResponse
    {
        #region 构造函数
        public pubL_29_3_Response()
        {
            this.pubL_29_3_InfoList = new ObservableCollection<pubL_29_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_3_Info> pubL_29_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_3_Info info = new pubL_29_3_Info();
            pubL_29_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_3_InfoList.Add((pubL_29_3_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_删除可冲抵保证金证券表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_3_Info();
                pubL_29_3_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_4_Response : IResponse
    {
        #region 构造函数
        public pubL_29_4_Response()
        {
            this.pubL_29_4_InfoList = new ObservableCollection<pubL_29_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_4_Info> pubL_29_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_4_Info info = new pubL_29_4_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.pass_no = unpacker.GetInt("pass_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.discount_rate = unpacker.GetDouble("discount_rate");
            info.offset_status = unpacker.GetInt("offset_status");
            pubL_29_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_4_InfoList.Add((pubL_29_4_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_查询可冲抵保证金证券表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_29_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.discount_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DISCOUNT_RATE_FLOAT);
                    info.offset_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OFFSET_STATUS_INT);
                    pubL_29_4_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_29_5_Response : IResponse
    {
        #region 构造函数
        public pubL_29_5_Response()
        {
            this.pubL_29_5_InfoList = new ObservableCollection<pubL_29_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_5_Info> pubL_29_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_5_Info info = new pubL_29_5_Info();
            info.row_id = unpacker.GetInt64("row_id");
            pubL_29_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_5_InfoList.Add((pubL_29_5_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_新增融资融券配置表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_5_Info();
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                pubL_29_5_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_6_Response : IResponse
    {
        #region 构造函数
        public pubL_29_6_Response()
        {
            this.pubL_29_6_InfoList = new ObservableCollection<pubL_29_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_6_Info> pubL_29_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_6_Info info = new pubL_29_6_Info();
            pubL_29_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_6_InfoList.Add((pubL_29_6_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_修改融资融券配置表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_6_Info();
                pubL_29_6_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_7_Response : IResponse
    {
        #region 构造函数
        public pubL_29_7_Response()
        {
            this.pubL_29_7_InfoList = new ObservableCollection<pubL_29_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_7_Info> pubL_29_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_7_Info info = new pubL_29_7_Info();
            pubL_29_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_7_InfoList.Add((pubL_29_7_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_删除融资融券配置表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_7_Info();
                pubL_29_7_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_8_Response : IResponse
    {
        #region 构造函数
        public pubL_29_8_Response()
        {
            this.pubL_29_8_InfoList = new ObservableCollection<pubL_29_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_8_Info> pubL_29_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_8_Info info = new pubL_29_8_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.pass_no = unpacker.GetInt("pass_no");
            info.co_no = unpacker.GetInt("co_no");
            info.fina_year_intrst_rate = unpacker.GetDouble("fina_year_intrst_rate");
            info.secu_loan_year_intrst_rate = unpacker.GetDouble("secu_loan_year_intrst_rate");
            info.fina_pen_intrst_rate = unpacker.GetDouble("fina_pen_intrst_rate");
            info.secu_loan_pen_intrst_rate = unpacker.GetDouble("secu_loan_pen_intrst_rate");
            info.intrst_sett_day = unpacker.GetInt("intrst_sett_day");
            pubL_29_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_8_InfoList.Add((pubL_29_8_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_查询融资融券配置表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_29_8_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.fina_year_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_YEAR_INTRST_RATE_FLOAT);
                    info.secu_loan_year_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_YEAR_INTRST_RATE_FLOAT);
                    info.fina_pen_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_PEN_INTRST_RATE_FLOAT);
                    info.secu_loan_pen_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_PEN_INTRST_RATE_FLOAT);
                    info.intrst_sett_day = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_SETT_DAY_INT);
                    pubL_29_8_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_29_9_Response : IResponse
    {
        #region 构造函数
        public pubL_29_9_Response()
        {
            this.pubL_29_9_InfoList = new ObservableCollection<pubL_29_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_9_Info> pubL_29_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_9_Info info = new pubL_29_9_Info();
            info.row_id = unpacker.GetInt64("row_id");
            pubL_29_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_9_InfoList.Add((pubL_29_9_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_新增融资融券标的证券表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_9_Info();
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                pubL_29_9_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_10_Response : IResponse
    {
        #region 构造函数
        public pubL_29_10_Response()
        {
            this.pubL_29_10_InfoList = new ObservableCollection<pubL_29_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_10_Info> pubL_29_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_10_Info info = new pubL_29_10_Info();
            pubL_29_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_10_InfoList.Add((pubL_29_10_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_修改融资融券标的证券表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_10_Info();
                pubL_29_10_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_11_Response : IResponse
    {
        #region 构造函数
        public pubL_29_11_Response()
        {
            this.pubL_29_11_InfoList = new ObservableCollection<pubL_29_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_11_Info> pubL_29_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_11_Info info = new pubL_29_11_Info();
            pubL_29_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_11_InfoList.Add((pubL_29_11_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_删除融资融券标的证券表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_11_Info();
                pubL_29_11_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_12_Response : IResponse
    {
        #region 构造函数
        public pubL_29_12_Response()
        {
            this.pubL_29_12_InfoList = new ObservableCollection<pubL_29_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_12_Info> pubL_29_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_12_Info info = new pubL_29_12_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.fina_status = unpacker.GetStr("fina_status");
            info.secu_loan_status = unpacker.GetStr("secu_loan_status");
            pubL_29_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_12_InfoList.Add((pubL_29_12_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_查询融资融券标的证券表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_29_12_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.fina_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_STATUS_STR);
                    info.secu_loan_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_STATUS_STR);
                    pubL_29_12_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_29_13_Response : IResponse
    {
        #region 构造函数
        public pubL_29_13_Response()
        {
            this.pubL_29_13_InfoList = new ObservableCollection<pubL_29_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_13_Info> pubL_29_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_13_Info info = new pubL_29_13_Info();
            info.row_id = unpacker.GetInt64("row_id");
            pubL_29_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_13_InfoList.Add((pubL_29_13_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_新增融资融券券商禁止标的证券表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_13_Info();
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                pubL_29_13_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_14_Response : IResponse
    {
        #region 构造函数
        public pubL_29_14_Response()
        {
            this.pubL_29_14_InfoList = new ObservableCollection<pubL_29_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_14_Info> pubL_29_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_14_Info info = new pubL_29_14_Info();
            pubL_29_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_14_InfoList.Add((pubL_29_14_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_修改融资融券券商禁止标的证券表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_14_Info();
                pubL_29_14_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_15_Response : IResponse
    {
        #region 构造函数
        public pubL_29_15_Response()
        {
            this.pubL_29_15_InfoList = new ObservableCollection<pubL_29_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_15_Info> pubL_29_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_15_Info info = new pubL_29_15_Info();
            pubL_29_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_15_InfoList.Add((pubL_29_15_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_删除融资融券券商禁止标的证券表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_15_Info();
                pubL_29_15_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_16_Response : IResponse
    {
        #region 构造函数
        public pubL_29_16_Response()
        {
            this.pubL_29_16_InfoList = new ObservableCollection<pubL_29_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_16_Info> pubL_29_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_16_Info info = new pubL_29_16_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.pass_no = unpacker.GetInt("pass_no");
            info.co_no = unpacker.GetInt("co_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.fina_status = unpacker.GetStr("fina_status");
            info.secu_loan_status = unpacker.GetStr("secu_loan_status");
            pubL_29_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_16_InfoList.Add((pubL_29_16_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_查询融资融券券商禁止标的证券表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_29_16_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.fina_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_STATUS_STR);
                    info.secu_loan_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_STATUS_STR);
                    pubL_29_16_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_29_17_Response : IResponse
    {
        #region 构造函数
        public pubL_29_17_Response()
        {
            this.pubL_29_17_InfoList = new ObservableCollection<pubL_29_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_17_Info> pubL_29_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_17_Info info = new pubL_29_17_Info();
            info.row_id = unpacker.GetInt64("row_id");
            pubL_29_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_17_InfoList.Add((pubL_29_17_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_新增融资融券保证金比例配置表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_17_Info();
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                pubL_29_17_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_18_Response : IResponse
    {
        #region 构造函数
        public pubL_29_18_Response()
        {
            this.pubL_29_18_InfoList = new ObservableCollection<pubL_29_18_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_18_Info> pubL_29_18_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_18_Info info = new pubL_29_18_Info();
            pubL_29_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_18_InfoList.Add((pubL_29_18_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_修改融资融券保证金比例配置表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_18_Info();
                pubL_29_18_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_19_Response : IResponse
    {
        #region 构造函数
        public pubL_29_19_Response()
        {
            this.pubL_29_19_InfoList = new ObservableCollection<pubL_29_19_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_19_Info> pubL_29_19_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_19_Info info = new pubL_29_19_Info();
            pubL_29_19_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_19_InfoList.Add((pubL_29_19_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_删除融资融券保证金比例配置表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_19_Info();
                pubL_29_19_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_20_Response : IResponse
    {
        #region 构造函数
        public pubL_29_20_Response()
        {
            this.pubL_29_20_InfoList = new ObservableCollection<pubL_29_20_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_20_Info> pubL_29_20_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_20_Info info = new pubL_29_20_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.pass_no = unpacker.GetInt("pass_no");
            info.co_no = unpacker.GetInt("co_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.fina_marg_ratio = unpacker.GetDouble("fina_marg_ratio");
            info.secu_loan_marg_ratio = unpacker.GetDouble("secu_loan_marg_ratio");
            info.secu_loan_price_limit = unpacker.GetDouble("secu_loan_price_limit");
            pubL_29_20_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_20_InfoList.Add((pubL_29_20_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_查询融资融券保证金比例配置表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_29_20_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.fina_marg_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_MARG_RATIO_FLOAT);
                    info.secu_loan_marg_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_MARG_RATIO_FLOAT);
                    info.secu_loan_price_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_PRICE_LIMIT_FLOAT);
                    pubL_29_20_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_29_21_Response : IResponse
    {
        #region 构造函数
        public pubL_29_21_Response()
        {
            this.pubL_29_21_InfoList = new ObservableCollection<pubL_29_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_21_Info> pubL_29_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_21_Info info = new pubL_29_21_Info();
            info.fina_marg_ratio = unpacker.GetDouble("fina_marg_ratio");
            info.secu_loan_marg_ratio = unpacker.GetDouble("secu_loan_marg_ratio");
            info.secu_loan_price_limit = unpacker.GetDouble("secu_loan_price_limit");
            pubL_29_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_21_InfoList.Add((pubL_29_21_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_获取融资融券保证金比例配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_21_Info();
                info.fina_marg_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_MARG_RATIO_FLOAT);
                info.secu_loan_marg_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_MARG_RATIO_FLOAT);
                info.secu_loan_price_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_PRICE_LIMIT_FLOAT);
                pubL_29_21_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_22_Response : IResponse
    {
        #region 构造函数
        public pubL_29_22_Response()
        {
            this.pubL_29_22_InfoList = new ObservableCollection<pubL_29_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_22_Info> pubL_29_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_22_Info info = new pubL_29_22_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.pass_no = unpacker.GetInt("pass_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.discount_rate = unpacker.GetDouble("discount_rate");
            info.offset_status = unpacker.GetInt("offset_status");
            pubL_29_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_22_InfoList.Add((pubL_29_22_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_获取可冲抵保证金证券表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_29_22_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.discount_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DISCOUNT_RATE_FLOAT);
                    info.offset_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OFFSET_STATUS_INT);
                    pubL_29_22_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_29_23_Response : IResponse
    {
        #region 构造函数
        public pubL_29_23_Response()
        {
            this.pubL_29_23_InfoList = new ObservableCollection<pubL_29_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_23_Info> pubL_29_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_23_Info info = new pubL_29_23_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.pass_no = unpacker.GetInt("pass_no");
            info.co_no = unpacker.GetInt("co_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.fina_marg_ratio = unpacker.GetDouble("fina_marg_ratio");
            info.secu_loan_marg_ratio = unpacker.GetDouble("secu_loan_marg_ratio");
            info.secu_loan_price_limit = unpacker.GetDouble("secu_loan_price_limit");
            pubL_29_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_23_InfoList.Add((pubL_29_23_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_查询机构融资融券保证金比例
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_29_23_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.fina_marg_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_MARG_RATIO_FLOAT);
                    info.secu_loan_marg_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_MARG_RATIO_FLOAT);
                    info.secu_loan_price_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_PRICE_LIMIT_FLOAT);
                    pubL_29_23_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_29_24_Response : IResponse
    {
        #region 构造函数
        public pubL_29_24_Response()
        {
            this.pubL_29_24_InfoList = new ObservableCollection<pubL_29_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_24_Info> pubL_29_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_24_Info info = new pubL_29_24_Info();
            pubL_29_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_24_InfoList.Add((pubL_29_24_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_可冲抵保证金证券导入
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_24_Info();
                pubL_29_24_InfoList.Add(info);
            }
        }
    }

    public class pubL_29_25_Response : IResponse
    {
        #region 构造函数
        public pubL_29_25_Response()
        {
            this.pubL_29_25_InfoList = new ObservableCollection<pubL_29_25_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_29_25_Info> pubL_29_25_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_29_25_Info info = new pubL_29_25_Info();
            pubL_29_25_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_29_25_InfoList.Add((pubL_29_25_Info)info);
        }
        #endregion

        //逻辑_公共_融资融券基础数据_融资融券标的证券导入
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_29_25_Info();
                pubL_29_25_InfoList.Add(info);
            }
        }
    }

}
