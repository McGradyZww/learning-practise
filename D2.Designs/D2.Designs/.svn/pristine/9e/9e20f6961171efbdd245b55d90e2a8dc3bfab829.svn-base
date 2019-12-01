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
    public class tdsecuL_1_1_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_1_Response()
        {
            this.tdsecuL_1_1_InfoList = new ObservableCollection<tdsecuL_1_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_1_Info> tdsecuL_1_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_1_Info info = new tdsecuL_1_1_Info();
            tdsecuL_1_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_1_InfoList.Add((tdsecuL_1_1_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_更新报盘机状态
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_1_Info();
                tdsecuL_1_1_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_11_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_11_Response()
        {
            this.tdsecuL_1_11_InfoList = new ObservableCollection<tdsecuL_1_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_11_Info> tdsecuL_1_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_11_Info info = new tdsecuL_1_11_Info();
            info.basket_id = unpacker.GetInt64("basket_id");
            tdsecuL_1_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_11_InfoList.Add((tdsecuL_1_11_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_新增篮子
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_11_Info();
                info.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                tdsecuL_1_11_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_12_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_12_Response()
        {
            this.tdsecuL_1_12_InfoList = new ObservableCollection<tdsecuL_1_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_12_Info> tdsecuL_1_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_12_Info info = new tdsecuL_1_12_Info();
            tdsecuL_1_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_12_InfoList.Add((tdsecuL_1_12_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_修改篮子
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_12_Info();
                tdsecuL_1_12_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_13_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_13_Response()
        {
            this.tdsecuL_1_13_InfoList = new ObservableCollection<tdsecuL_1_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_13_Info> tdsecuL_1_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_13_Info info = new tdsecuL_1_13_Info();
            tdsecuL_1_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_13_InfoList.Add((tdsecuL_1_13_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_删除篮子
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_13_Info();
                tdsecuL_1_13_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_14_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_14_Response()
        {
            this.tdsecuL_1_14_InfoList = new ObservableCollection<tdsecuL_1_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_14_Info> tdsecuL_1_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_14_Info info = new tdsecuL_1_14_Info();
            info.basket_name = unpacker.GetStr("basket_name");
            info.weight_type = unpacker.GetInt("weight_type");
            info.is_public = unpacker.GetInt("is_public");
            info.compos_count = unpacker.GetInt("compos_count");
            info.basket_status = unpacker.GetStr("basket_status");
            info.basket_id = unpacker.GetInt64("basket_id");
            info.opor_no = unpacker.GetInt("opor_no");
            info.cash_replace_amt = unpacker.GetDouble("cash_replace_amt");
            tdsecuL_1_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_14_InfoList.Add((tdsecuL_1_14_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_查询篮子
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_1_14_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.basket_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_NAME_STR);
                    info.weight_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_TYPE_INT);
                    info.is_public = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_PUBLIC_INT);
                    info.compos_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPOS_COUNT_INT);
                    info.basket_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_STATUS_STR);
                    info.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.cash_replace_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_REPLACE_AMT_FLOAT);
                    tdsecuL_1_14_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_1_21_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_21_Response()
        {
            this.tdsecuL_1_21_InfoList = new ObservableCollection<tdsecuL_1_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_21_Info> tdsecuL_1_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_21_Info info = new tdsecuL_1_21_Info();
            info.row_id = unpacker.GetInt64("row_id");
            tdsecuL_1_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_21_InfoList.Add((tdsecuL_1_21_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_新增篮子成份
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_21_Info();
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                tdsecuL_1_21_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_22_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_22_Response()
        {
            this.tdsecuL_1_22_InfoList = new ObservableCollection<tdsecuL_1_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_22_Info> tdsecuL_1_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_22_Info info = new tdsecuL_1_22_Info();
            tdsecuL_1_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_22_InfoList.Add((tdsecuL_1_22_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_修改篮子成份
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_22_Info();
                tdsecuL_1_22_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_23_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_23_Response()
        {
            this.tdsecuL_1_23_InfoList = new ObservableCollection<tdsecuL_1_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_23_Info> tdsecuL_1_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_23_Info info = new tdsecuL_1_23_Info();
            tdsecuL_1_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_23_InfoList.Add((tdsecuL_1_23_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_删除篮子成份
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_23_Info();
                tdsecuL_1_23_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_24_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_24_Response()
        {
            this.tdsecuL_1_24_InfoList = new ObservableCollection<tdsecuL_1_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_24_Info> tdsecuL_1_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_24_Info info = new tdsecuL_1_24_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.basket_id = unpacker.GetInt64("basket_id");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.compos_qty = unpacker.GetDouble("compos_qty");
            info.compos_ratio = unpacker.GetDouble("compos_ratio");
            info.repl_stock_code_no = unpacker.GetInt("repl_stock_code_no");
            info.repl_qty = unpacker.GetDouble("repl_qty");
            tdsecuL_1_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_24_InfoList.Add((tdsecuL_1_24_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_查询篮子成份
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_1_24_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.compos_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMPOS_QTY_FLOAT);
                    info.compos_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMPOS_RATIO_FLOAT);
                    info.repl_stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPL_STOCK_CODE_NO_INT);
                    info.repl_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPL_QTY_FLOAT);
                    tdsecuL_1_24_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_1_51_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_51_Response()
        {
            this.tdsecuL_1_51_InfoList = new ObservableCollection<tdsecuL_1_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_51_Info> tdsecuL_1_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_51_Info info = new tdsecuL_1_51_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            tdsecuL_1_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_51_InfoList.Add((tdsecuL_1_51_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_数据归历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_51_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                tdsecuL_1_51_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_54_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_54_Response()
        {
            this.tdsecuL_1_54_InfoList = new ObservableCollection<tdsecuL_1_54_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_54_Info> tdsecuL_1_54_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_54_Info info = new tdsecuL_1_54_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            tdsecuL_1_54_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_54_InfoList.Add((tdsecuL_1_54_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_数据归档
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_54_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                tdsecuL_1_54_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_901_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_901_Response()
        {
            this.tdsecuL_1_901_InfoList = new ObservableCollection<tdsecuL_1_901_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_901_Info> tdsecuL_1_901_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_901_Info info = new tdsecuL_1_901_Info();
            info.curr_no = unpacker.GetInt64("curr_no");
            tdsecuL_1_901_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_901_InfoList.Add((tdsecuL_1_901_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_获取业务记录编号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_901_Info();
                info.curr_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CURR_NO_INT64);
                tdsecuL_1_901_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_31_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_31_Response()
        {
            this.tdsecuL_1_31_InfoList = new ObservableCollection<tdsecuL_1_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_31_Info> tdsecuL_1_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_31_Info info = new tdsecuL_1_31_Info();
            info.combo_id = unpacker.GetInt64("combo_id");
            tdsecuL_1_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_31_InfoList.Add((tdsecuL_1_31_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_新增组合
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_31_Info();
                info.combo_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_ID_INT64);
                tdsecuL_1_31_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_32_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_32_Response()
        {
            this.tdsecuL_1_32_InfoList = new ObservableCollection<tdsecuL_1_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_32_Info> tdsecuL_1_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_32_Info info = new tdsecuL_1_32_Info();
            tdsecuL_1_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_32_InfoList.Add((tdsecuL_1_32_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_修改组合
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_32_Info();
                tdsecuL_1_32_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_33_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_33_Response()
        {
            this.tdsecuL_1_33_InfoList = new ObservableCollection<tdsecuL_1_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_33_Info> tdsecuL_1_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_33_Info info = new tdsecuL_1_33_Info();
            tdsecuL_1_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_33_InfoList.Add((tdsecuL_1_33_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_删除组合
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_33_Info();
                tdsecuL_1_33_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_34_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_34_Response()
        {
            this.tdsecuL_1_34_InfoList = new ObservableCollection<tdsecuL_1_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_34_Info> tdsecuL_1_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_34_Info info = new tdsecuL_1_34_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.combo_code = unpacker.GetStr("combo_code");
            info.comb_name = unpacker.GetStr("comb_name");
            info.is_public = unpacker.GetInt("is_public");
            info.create_failure_validity_date = unpacker.GetInt("create_failure_validity_date");
            info.create_end_validity_date = unpacker.GetInt("create_end_validity_date");
            info.rebalance_failure_validity_date = unpacker.GetInt("rebalance_failure_validity_date");
            info.rebalance_end_validity_date = unpacker.GetInt("rebalance_end_validity_date");
            info.repair_failure_validity_date = unpacker.GetInt("repair_failure_validity_date");
            info.repair_end_validity_date = unpacker.GetInt("repair_end_validity_date");
            info.broke_validity_date = unpacker.GetInt("broke_validity_date");
            info.remark_info = unpacker.GetStr("remark_info");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_1_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_34_InfoList.Add((tdsecuL_1_34_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_查询组合
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_1_34_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.comb_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_NAME_STR);
                    info.is_public = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_PUBLIC_INT);
                    info.create_failure_validity_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_FAILURE_VALIDITY_DATE_INT);
                    info.create_end_validity_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_END_VALIDITY_DATE_INT);
                    info.rebalance_failure_validity_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REBALANCE_FAILURE_VALIDITY_DATE_INT);
                    info.rebalance_end_validity_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REBALANCE_END_VALIDITY_DATE_INT);
                    info.repair_failure_validity_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPAIR_FAILURE_VALIDITY_DATE_INT);
                    info.repair_end_validity_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPAIR_END_VALIDITY_DATE_INT);
                    info.broke_validity_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BROKE_VALIDITY_DATE_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_1_34_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_1_35_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_35_Response()
        {
            this.tdsecuL_1_35_InfoList = new ObservableCollection<tdsecuL_1_35_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_35_Info> tdsecuL_1_35_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_35_Info info = new tdsecuL_1_35_Info();
            info.combo_stock_id = unpacker.GetInt64("combo_stock_id");
            tdsecuL_1_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_35_InfoList.Add((tdsecuL_1_35_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_新增组合证券
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_35_Info();
                info.combo_stock_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_STOCK_ID_INT64);
                tdsecuL_1_35_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_36_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_36_Response()
        {
            this.tdsecuL_1_36_InfoList = new ObservableCollection<tdsecuL_1_36_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_36_Info> tdsecuL_1_36_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_36_Info info = new tdsecuL_1_36_Info();
            tdsecuL_1_36_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_36_InfoList.Add((tdsecuL_1_36_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_修改组合证券
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_36_Info();
                tdsecuL_1_36_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_37_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_37_Response()
        {
            this.tdsecuL_1_37_InfoList = new ObservableCollection<tdsecuL_1_37_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_37_Info> tdsecuL_1_37_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_37_Info info = new tdsecuL_1_37_Info();
            tdsecuL_1_37_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_37_InfoList.Add((tdsecuL_1_37_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_删除组合证券
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_37_Info();
                tdsecuL_1_37_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_38_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_38_Response()
        {
            this.tdsecuL_1_38_InfoList = new ObservableCollection<tdsecuL_1_38_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_38_Info> tdsecuL_1_38_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_38_Info info = new tdsecuL_1_38_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.combo_code = unpacker.GetStr("combo_code");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.combo_ratio = unpacker.GetDouble("combo_ratio");
            info.combo_qty = unpacker.GetDouble("combo_qty");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_1_38_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_38_InfoList.Add((tdsecuL_1_38_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_查询组合证券
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_1_38_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.combo_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_RATIO_FLOAT);
                    info.combo_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_QTY_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_1_38_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_1_39_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_39_Response()
        {
            this.tdsecuL_1_39_InfoList = new ObservableCollection<tdsecuL_1_39_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_39_Info> tdsecuL_1_39_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_39_Info info = new tdsecuL_1_39_Info();
            tdsecuL_1_39_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_39_InfoList.Add((tdsecuL_1_39_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_计算组合市值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_39_Info();
                tdsecuL_1_39_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_56_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_56_Response()
        {
            this.tdsecuL_1_56_InfoList = new ObservableCollection<tdsecuL_1_56_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_56_Info> tdsecuL_1_56_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_56_Info info = new tdsecuL_1_56_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            tdsecuL_1_56_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_56_InfoList.Add((tdsecuL_1_56_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_转入产品证券负债明细记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_56_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                tdsecuL_1_56_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_40_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_40_Response()
        {
            this.tdsecuL_1_40_InfoList = new ObservableCollection<tdsecuL_1_40_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_40_Info> tdsecuL_1_40_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_40_Info info = new tdsecuL_1_40_Info();
            info.row_id = unpacker.GetInt64("row_id");
            tdsecuL_1_40_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_40_InfoList.Add((tdsecuL_1_40_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_新增指令自动分发规则
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_40_Info();
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                tdsecuL_1_40_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_41_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_41_Response()
        {
            this.tdsecuL_1_41_InfoList = new ObservableCollection<tdsecuL_1_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_41_Info> tdsecuL_1_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_41_Info info = new tdsecuL_1_41_Info();
            tdsecuL_1_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_41_InfoList.Add((tdsecuL_1_41_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_修改指令自动分发规则
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_41_Info();
                tdsecuL_1_41_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_42_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_42_Response()
        {
            this.tdsecuL_1_42_InfoList = new ObservableCollection<tdsecuL_1_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_42_Info> tdsecuL_1_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_42_Info info = new tdsecuL_1_42_Info();
            tdsecuL_1_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_42_InfoList.Add((tdsecuL_1_42_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_删除指令自动分发规则
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_42_Info();
                tdsecuL_1_42_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_43_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_43_Response()
        {
            this.tdsecuL_1_43_InfoList = new ObservableCollection<tdsecuL_1_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_43_Info> tdsecuL_1_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_43_Info info = new tdsecuL_1_43_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.rule_name = unpacker.GetStr("rule_name");
            info.prior_type = unpacker.GetInt("prior_type");
            info.exch_group_no_str = unpacker.GetStr("exch_group_no_str");
            info.exch_no_str = unpacker.GetStr("exch_no_str");
            info.stock_type_str = unpacker.GetStr("stock_type_str");
            info.stock_code_str = unpacker.GetStr("stock_code_str");
            info.opor_no_str = unpacker.GetStr("opor_no_str");
            info.distribute_last_trader = unpacker.GetInt("distribute_last_trader");
            info.distribute_by_jobs = unpacker.GetInt("distribute_by_jobs");
            info.remark_info = unpacker.GetStr("remark_info");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_1_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_43_InfoList.Add((tdsecuL_1_43_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_查询指令自动分发规则
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_1_43_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.rule_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RULE_NAME_STR);
                    info.prior_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRIOR_TYPE_INT);
                    info.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                    info.exch_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR);
                    info.stock_type_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR);
                    info.stock_code_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR);
                    info.opor_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_STR_STR);
                    info.distribute_last_trader = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTE_LAST_TRADER_INT);
                    info.distribute_by_jobs = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIBUTE_BY_JOBS_INT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_1_43_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_1_60_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_60_Response()
        {
            this.tdsecuL_1_60_InfoList = new ObservableCollection<tdsecuL_1_60_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_60_Info> tdsecuL_1_60_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_60_Info info = new tdsecuL_1_60_Info();
            tdsecuL_1_60_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_60_InfoList.Add((tdsecuL_1_60_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_融资融券归档
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_60_Info();
                tdsecuL_1_60_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_61_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_61_Response()
        {
            this.tdsecuL_1_61_InfoList = new ObservableCollection<tdsecuL_1_61_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_61_Info> tdsecuL_1_61_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_61_Info info = new tdsecuL_1_61_Info();
            tdsecuL_1_61_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_61_InfoList.Add((tdsecuL_1_61_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_组合归档
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_61_Info();
                tdsecuL_1_61_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_62_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_62_Response()
        {
            this.tdsecuL_1_62_InfoList = new ObservableCollection<tdsecuL_1_62_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_62_Info> tdsecuL_1_62_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_62_Info info = new tdsecuL_1_62_Info();
            tdsecuL_1_62_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_62_InfoList.Add((tdsecuL_1_62_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_策略归档
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_62_Info();
                tdsecuL_1_62_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_63_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_63_Response()
        {
            this.tdsecuL_1_63_InfoList = new ObservableCollection<tdsecuL_1_63_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_63_Info> tdsecuL_1_63_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_63_Info info = new tdsecuL_1_63_Info();
            tdsecuL_1_63_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_63_InfoList.Add((tdsecuL_1_63_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_T0归档
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_63_Info();
                tdsecuL_1_63_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_64_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_64_Response()
        {
            this.tdsecuL_1_64_InfoList = new ObservableCollection<tdsecuL_1_64_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_64_Info> tdsecuL_1_64_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_64_Info info = new tdsecuL_1_64_Info();
            tdsecuL_1_64_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_64_InfoList.Add((tdsecuL_1_64_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_资金持仓归档
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_64_Info();
                tdsecuL_1_64_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_65_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_65_Response()
        {
            this.tdsecuL_1_65_InfoList = new ObservableCollection<tdsecuL_1_65_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_65_Info> tdsecuL_1_65_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_65_Info info = new tdsecuL_1_65_Info();
            tdsecuL_1_65_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_65_InfoList.Add((tdsecuL_1_65_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_成交归档
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_65_Info();
                tdsecuL_1_65_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_66_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_66_Response()
        {
            this.tdsecuL_1_66_InfoList = new ObservableCollection<tdsecuL_1_66_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_66_Info> tdsecuL_1_66_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_66_Info info = new tdsecuL_1_66_Info();
            tdsecuL_1_66_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_66_InfoList.Add((tdsecuL_1_66_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_订单归档
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_66_Info();
                tdsecuL_1_66_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_1_67_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_1_67_Response()
        {
            this.tdsecuL_1_67_InfoList = new ObservableCollection<tdsecuL_1_67_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_1_67_Info> tdsecuL_1_67_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_1_67_Info info = new tdsecuL_1_67_Info();
            tdsecuL_1_67_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_1_67_InfoList.Add((tdsecuL_1_67_Info)info);
        }
        #endregion

        //逻辑_交易证券_公用_指令归档
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_1_67_Info();
                tdsecuL_1_67_InfoList.Add(info);
            }
        }
    }

}
