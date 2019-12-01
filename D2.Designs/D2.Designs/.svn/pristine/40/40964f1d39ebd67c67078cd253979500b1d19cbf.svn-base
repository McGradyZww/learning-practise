using LD.Client.Commom;
using LD.Client.Contract;
using LDsdkDefine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{

    public static class BaseDataSync
    {
        //逻辑_公共_基础数据同步_查询新股信息表
        public static List<FuncpubL_28_101Model> GetFuncpubL_28_101Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_28_101Models = new List<FuncpubL_28_101Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_28_101Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.trade_code = packer.GetStrbyName("trade_code", i);
                reqCommand.target_code = packer.GetStrbyName("target_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.trade_code_no = packer.GetIntbyName("trade_code_no", i);
                reqCommand.target_code_no = packer.GetIntbyName("target_code_no", i);
                reqCommand.apply_date = packer.GetIntbyName("apply_date", i);
                reqCommand.apply_limit = packer.GetDoublebyName("apply_limit", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.issue_price = packer.GetDoublebyName("issue_price", i);
 
                FuncpubL_28_101Models.Add(reqCommand);
            }
            return FuncpubL_28_101Models;
        }
 
        //逻辑_公共_基础数据同步_查询新股信息表
        public static List<FuncpubL_28_101Model> GetFuncpubL_28_101Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_28_101Models = new List<FuncpubL_28_101Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_28_101Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    reqCommand.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    reqCommand.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    reqCommand.apply_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_DATE_INT);
                    reqCommand.apply_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_LIMIT_FLOAT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    FuncpubL_28_101Models.Add(reqCommand);
                }
            }
            return FuncpubL_28_101Models;
        }
 
        //逻辑_公共_基础数据同步_查询证券代码信息表
        public static List<FuncpubL_28_111Model> GetFuncpubL_28_111Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_28_111Models = new List<FuncpubL_28_111Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_28_111Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.pinyin_short = packer.GetStrbyName("pinyin_short", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.total_stock_issue = packer.GetDoublebyName("total_stock_issue", i);
                reqCommand.circl_stock_capit = packer.GetDoublebyName("circl_stock_capit", i);
                reqCommand.capit_reback_days = packer.GetIntbyName("capit_reback_days", i);
                reqCommand.posi_reback_days = packer.GetIntbyName("posi_reback_days", i);
                reqCommand.type_unit = packer.GetIntbyName("type_unit", i);
                reqCommand.report_unit = packer.GetIntbyName("report_unit", i);
                reqCommand.min_unit = packer.GetIntbyName("min_unit", i);
                reqCommand.max_qty = packer.GetDoublebyName("max_qty", i);
                reqCommand.min_qty = packer.GetDoublebyName("min_qty", i);
                reqCommand.is_order_dir_flag = packer.GetIntbyName("is_order_dir_flag", i);
                reqCommand.price_up = packer.GetDoublebyName("price_up", i);
                reqCommand.price_down = packer.GetDoublebyName("price_down", i);
                reqCommand.step_price = packer.GetDoublebyName("step_price", i);
                reqCommand.fair_price = packer.GetDoublebyName("fair_price", i);
                reqCommand.stop_status = packer.GetStrbyName("stop_status", i);
                reqCommand.hk_stock_flag = packer.GetIntbyName("hk_stock_flag", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_28_111Models.Add(reqCommand);
            }
            return FuncpubL_28_111Models;
        }
 
        //逻辑_公共_基础数据同步_查询证券代码信息表
        public static List<FuncpubL_28_111Model> GetFuncpubL_28_111Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_28_111Models = new List<FuncpubL_28_111Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_28_111Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.pinyin_short = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PINYIN_SHORT_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.total_stock_issue = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_FLOAT);
                    reqCommand.circl_stock_capit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_STOCK_CAPIT_FLOAT);
                    reqCommand.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    reqCommand.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    reqCommand.type_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TYPE_UNIT_INT);
                    reqCommand.report_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_UNIT_INT);
                    reqCommand.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    reqCommand.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    reqCommand.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    reqCommand.is_order_dir_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_ORDER_DIR_FLAG_INT);
                    reqCommand.price_up = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_UP_FLOAT);
                    reqCommand.price_down = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_DOWN_FLOAT);
                    reqCommand.step_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STEP_PRICE_FLOAT);
                    reqCommand.fair_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FAIR_PRICE_FLOAT);
                    reqCommand.stop_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_STATUS_STR);
                    reqCommand.hk_stock_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_STOCK_FLAG_INT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_28_111Models.Add(reqCommand);
                }
            }
            return FuncpubL_28_111Models;
        }
 
        //逻辑_公共_基础数据同步_查询债券属性信息表
        public static List<FuncpubL_28_121Model> GetFuncpubL_28_121Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_28_121Models = new List<FuncpubL_28_121Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_28_121Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.trade_code = packer.GetStrbyName("trade_code", i);
                reqCommand.target_code = packer.GetStrbyName("target_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.trade_code_no = packer.GetIntbyName("trade_code_no", i);
                reqCommand.target_code_no = packer.GetIntbyName("target_code_no", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.issue_date = packer.GetIntbyName("issue_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.value_date = packer.GetIntbyName("value_date", i);
                reqCommand.next_value_date = packer.GetIntbyName("next_value_date", i);
                reqCommand.begin_trade_date = packer.GetIntbyName("begin_trade_date", i);
                reqCommand.bond_limit = packer.GetDoublebyName("bond_limit", i);
                reqCommand.issue_price = packer.GetDoublebyName("issue_price", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.intrst_ratio = packer.GetDoublebyName("intrst_ratio", i);
                reqCommand.intrst_days = packer.GetIntbyName("intrst_days", i);
                reqCommand.pay_inteval = packer.GetIntbyName("pay_inteval", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.bond_rate_type = packer.GetIntbyName("bond_rate_type", i);
                reqCommand.inteval_days = packer.GetIntbyName("inteval_days", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.last_trade_date = packer.GetIntbyName("last_trade_date", i);
                reqCommand.rights_type = packer.GetIntbyName("rights_type", i);
                reqCommand.trans_begin_date = packer.GetIntbyName("trans_begin_date", i);
                reqCommand.trans_end_date = packer.GetIntbyName("trans_end_date", i);
                reqCommand.exec_begin_date = packer.GetIntbyName("exec_begin_date", i);
                reqCommand.exec_end_date = packer.GetIntbyName("exec_end_date", i);
                reqCommand.impawn_ratio = packer.GetDoublebyName("impawn_ratio", i);
                reqCommand.pay_intrst_flag = packer.GetIntbyName("pay_intrst_flag", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_28_121Models.Add(reqCommand);
            }
            return FuncpubL_28_121Models;
        }
 
        //逻辑_公共_基础数据同步_查询债券属性信息表
        public static List<FuncpubL_28_121Model> GetFuncpubL_28_121Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_28_121Models = new List<FuncpubL_28_121Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_28_121Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    reqCommand.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                    reqCommand.target_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_NO_INT);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.issue_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.value_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALUE_DATE_INT);
                    reqCommand.next_value_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NEXT_VALUE_DATE_INT);
                    reqCommand.begin_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TRADE_DATE_INT);
                    reqCommand.bond_limit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_LIMIT_FLOAT);
                    reqCommand.issue_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ISSUE_PRICE_FLOAT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.intrst_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_RATIO_FLOAT);
                    reqCommand.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    reqCommand.pay_inteval = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTEVAL_INT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                    reqCommand.inteval_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTEVAL_DAYS_INT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.last_trade_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TRADE_DATE_INT);
                    reqCommand.rights_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_TYPE_INT);
                    reqCommand.trans_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_BEGIN_DATE_INT);
                    reqCommand.trans_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_END_DATE_INT);
                    reqCommand.exec_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_BEGIN_DATE_INT);
                    reqCommand.exec_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_END_DATE_INT);
                    reqCommand.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    reqCommand.pay_intrst_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PAY_INTRST_FLAG_INT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_28_121Models.Add(reqCommand);
                }
            }
            return FuncpubL_28_121Models;
        }
 
        //逻辑_公共_基础数据同步_查询证券行情表
        public static List<FuncpubL_28_131Model> GetFuncpubL_28_131Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_28_131Models = new List<FuncpubL_28_131Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_28_131Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.up_limit_price = packer.GetDoublebyName("up_limit_price", i);
                reqCommand.down_limit_price = packer.GetDoublebyName("down_limit_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
                reqCommand.today_open_price = packer.GetDoublebyName("today_open_price", i);
                reqCommand.today_close_price = packer.GetDoublebyName("today_close_price", i);
                reqCommand.today_max_price = packer.GetDoublebyName("today_max_price", i);
                reqCommand.today_min_price = packer.GetDoublebyName("today_min_price", i);
                reqCommand.buy_price_1 = packer.GetDoublebyName("buy_price_1", i);
                reqCommand.buy_qty_1 = packer.GetDoublebyName("buy_qty_1", i);
                reqCommand.buy_price_2 = packer.GetDoublebyName("buy_price_2", i);
                reqCommand.buy_qty_2 = packer.GetDoublebyName("buy_qty_2", i);
                reqCommand.buy_price_3 = packer.GetDoublebyName("buy_price_3", i);
                reqCommand.buy_qty_3 = packer.GetDoublebyName("buy_qty_3", i);
                reqCommand.buy_price_4 = packer.GetDoublebyName("buy_price_4", i);
                reqCommand.buy_qty_4 = packer.GetDoublebyName("buy_qty_4", i);
                reqCommand.buy_price_5 = packer.GetDoublebyName("buy_price_5", i);
                reqCommand.buy_qty_5 = packer.GetDoublebyName("buy_qty_5", i);
                reqCommand.sell_price_1 = packer.GetDoublebyName("sell_price_1", i);
                reqCommand.sell_qty_1 = packer.GetDoublebyName("sell_qty_1", i);
                reqCommand.sell_price_2 = packer.GetDoublebyName("sell_price_2", i);
                reqCommand.sell_qty_2 = packer.GetDoublebyName("sell_qty_2", i);
                reqCommand.sell_price_3 = packer.GetDoublebyName("sell_price_3", i);
                reqCommand.sell_qty_3 = packer.GetDoublebyName("sell_qty_3", i);
                reqCommand.sell_price_4 = packer.GetDoublebyName("sell_price_4", i);
                reqCommand.sell_qty_4 = packer.GetDoublebyName("sell_qty_4", i);
                reqCommand.sell_price_5 = packer.GetDoublebyName("sell_price_5", i);
                reqCommand.sell_qty_5 = packer.GetDoublebyName("sell_qty_5", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.pe_ratio = packer.GetDoublebyName("pe_ratio", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_28_131Models.Add(reqCommand);
            }
            return FuncpubL_28_131Models;
        }
 
        //逻辑_公共_基础数据同步_查询证券行情表
        public static List<FuncpubL_28_131Model> GetFuncpubL_28_131Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_28_131Models = new List<FuncpubL_28_131Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_28_131Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    reqCommand.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    reqCommand.today_open_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_OPEN_PRICE_FLOAT);
                    reqCommand.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    reqCommand.today_max_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MAX_PRICE_FLOAT);
                    reqCommand.today_min_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MIN_PRICE_FLOAT);
                    reqCommand.buy_price_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_1_FLOAT);
                    reqCommand.buy_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_1_FLOAT);
                    reqCommand.buy_price_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_2_FLOAT);
                    reqCommand.buy_qty_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_2_FLOAT);
                    reqCommand.buy_price_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_3_FLOAT);
                    reqCommand.buy_qty_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_3_FLOAT);
                    reqCommand.buy_price_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_4_FLOAT);
                    reqCommand.buy_qty_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_4_FLOAT);
                    reqCommand.buy_price_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_5_FLOAT);
                    reqCommand.buy_qty_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_5_FLOAT);
                    reqCommand.sell_price_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_1_FLOAT);
                    reqCommand.sell_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_1_FLOAT);
                    reqCommand.sell_price_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_2_FLOAT);
                    reqCommand.sell_qty_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_2_FLOAT);
                    reqCommand.sell_price_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_3_FLOAT);
                    reqCommand.sell_qty_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_3_FLOAT);
                    reqCommand.sell_price_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_4_FLOAT);
                    reqCommand.sell_qty_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_4_FLOAT);
                    reqCommand.sell_price_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_5_FLOAT);
                    reqCommand.sell_qty_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_5_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.pe_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PE_RATIO_FLOAT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_28_131Models.Add(reqCommand);
                }
            }
            return FuncpubL_28_131Models;
        }
 
        //逻辑_公共_基础数据同步_查询代码映射表
        public static List<FuncpubL_28_141Model> GetFuncpubL_28_141Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_28_141Models = new List<FuncpubL_28_141Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_28_141Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.trade_code = packer.GetStrbyName("trade_code", i);
                reqCommand.target_code = packer.GetStrbyName("target_code", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_28_141Models.Add(reqCommand);
            }
            return FuncpubL_28_141Models;
        }
 
        //逻辑_公共_基础数据同步_查询代码映射表
        public static List<FuncpubL_28_141Model> GetFuncpubL_28_141Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_28_141Models = new List<FuncpubL_28_141Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_28_141Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.trade_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_STR);
                    reqCommand.target_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_CODE_STR);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_28_141Models.Add(reqCommand);
                }
            }
            return FuncpubL_28_141Models;
        }
 
        //逻辑_公共_基础数据同步_查询证券代码订单方向表
        public static List<FuncpubL_28_151Model> GetFuncpubL_28_151Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_28_151Models = new List<FuncpubL_28_151Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_28_151Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.cash_frozen_type = packer.GetIntbyName("cash_frozen_type", i);
                reqCommand.order_split_flag = packer.GetIntbyName("order_split_flag", i);
                reqCommand.min_unit = packer.GetIntbyName("min_unit", i);
                reqCommand.max_qty = packer.GetDoublebyName("max_qty", i);
                reqCommand.min_qty = packer.GetDoublebyName("min_qty", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_28_151Models.Add(reqCommand);
            }
            return FuncpubL_28_151Models;
        }
 
        //逻辑_公共_基础数据同步_查询证券代码订单方向表
        public static List<FuncpubL_28_151Model> GetFuncpubL_28_151Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_28_151Models = new List<FuncpubL_28_151Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_28_151Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.cash_frozen_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CASH_FROZEN_TYPE_INT);
                    reqCommand.order_split_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SPLIT_FLAG_INT);
                    reqCommand.min_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MIN_UNIT_INT);
                    reqCommand.max_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_QTY_FLOAT);
                    reqCommand.min_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MIN_QTY_FLOAT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_28_151Models.Add(reqCommand);
                }
            }
            return FuncpubL_28_151Models;
        }
 
        //逻辑_公共_基础数据同步_查询港股通汇率表
        public static List<FuncpubL_28_161Model> GetFuncpubL_28_161Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_28_161Models = new List<FuncpubL_28_161Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_28_161Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.for_crncy_type = packer.GetStrbyName("for_crncy_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.buy_ref_rate = packer.GetDoublebyName("buy_ref_rate", i);
                reqCommand.sell_ref_rate = packer.GetDoublebyName("sell_ref_rate", i);
                reqCommand.settle_buy_rate = packer.GetDoublebyName("settle_buy_rate", i);
                reqCommand.settle_sell_rate = packer.GetDoublebyName("settle_sell_rate", i);
                reqCommand.pboc_rate = packer.GetDoublebyName("pboc_rate", i);
 
                FuncpubL_28_161Models.Add(reqCommand);
            }
            return FuncpubL_28_161Models;
        }
 
        //逻辑_公共_基础数据同步_查询港股通汇率表
        public static List<FuncpubL_28_161Model> GetFuncpubL_28_161Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_28_161Models = new List<FuncpubL_28_161Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_28_161Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.for_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOR_CRNCY_TYPE_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_REF_RATE_FLOAT);
                    reqCommand.sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_REF_RATE_FLOAT);
                    reqCommand.settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETTLE_BUY_RATE_FLOAT);
                    reqCommand.settle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETTLE_SELL_RATE_FLOAT);
                    reqCommand.pboc_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PBOC_RATE_FLOAT);
                    FuncpubL_28_161Models.Add(reqCommand);
                }
            }
            return FuncpubL_28_161Models;
        }
 
        //逻辑_公共_基础数据同步_查询自动同步设置表
        public static List<FuncpubL_28_201Model> GetFuncpubL_28_201Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_28_201Models = new List<FuncpubL_28_201Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_28_201Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.auto_sync_type = packer.GetIntbyName("auto_sync_type", i);
                reqCommand.capital_batch_deal_range = packer.GetIntbyName("capital_batch_deal_range", i);
                reqCommand.posi_batch_deal_range = packer.GetIntbyName("posi_batch_deal_range", i);
                reqCommand.begin_time = packer.GetIntbyName("begin_time", i);
                reqCommand.end_time = packer.GetIntbyName("end_time", i);
                reqCommand.is_batch_deal = packer.GetIntbyName("is_batch_deal", i);
                reqCommand.auto_sync_deal_flag = packer.GetIntbyName("auto_sync_deal_flag", i);
                reqCommand.is_inner_check = packer.GetIntbyName("is_inner_check", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_28_201Models.Add(reqCommand);
            }
            return FuncpubL_28_201Models;
        }
 
        //逻辑_公共_基础数据同步_查询自动同步设置表
        public static List<FuncpubL_28_201Model> GetFuncpubL_28_201Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_28_201Models = new List<FuncpubL_28_201Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_28_201Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.auto_sync_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AUTO_SYNC_TYPE_INT);
                    reqCommand.capital_batch_deal_range = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPITAL_BATCH_DEAL_RANGE_INT);
                    reqCommand.posi_batch_deal_range = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_BATCH_DEAL_RANGE_INT);
                    reqCommand.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    reqCommand.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    reqCommand.is_batch_deal = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_BATCH_DEAL_INT);
                    reqCommand.auto_sync_deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AUTO_SYNC_DEAL_FLAG_INT);
                    reqCommand.is_inner_check = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_INNER_CHECK_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_28_201Models.Add(reqCommand);
                }
            }
            return FuncpubL_28_201Models;
        }
 
        //逻辑_公共_基础数据同步_查询自动同步日志表
        public static List<FuncpubL_28_106Model> GetFuncpubL_28_106Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_28_106Models = new List<FuncpubL_28_106Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_28_106Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.process_type_name = packer.GetStrbyName("process_type_name", i);
                reqCommand.process_name = packer.GetStrbyName("process_name", i);
                reqCommand.event_msg_content = packer.GetStrbyName("event_msg_content", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_28_106Models.Add(reqCommand);
            }
            return FuncpubL_28_106Models;
        }
 
        //逻辑_公共_基础数据同步_查询自动同步日志表
        public static List<FuncpubL_28_106Model> GetFuncpubL_28_106Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_28_106Models = new List<FuncpubL_28_106Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_28_106Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.process_type_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PROCESS_TYPE_NAME_STR);
                    reqCommand.process_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PROCESS_NAME_STR);
                    reqCommand.event_msg_content = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EVENT_MSG_CONTENT_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_28_106Models.Add(reqCommand);
                }
            }
            return FuncpubL_28_106Models;
        }
 
    }
}
