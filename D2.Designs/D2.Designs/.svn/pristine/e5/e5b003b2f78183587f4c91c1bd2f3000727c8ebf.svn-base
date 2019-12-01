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

    public static class TrdSecuZt
    {
        //逻辑_交易证券_中泰_新增组合指令
        public static List<FunctdsecuL_7_2Model> GetFunctdsecuL_7_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_7_2Models = new List<FunctdsecuL_7_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_7_2Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_statn = packer.GetStrbyName("oper_statn", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_id_str = packer.GetStrbyName("order_id_str", i);
                reqCommand.order_status_str = packer.GetStrbyName("order_status_str", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
 
                FunctdsecuL_7_2Models.Add(reqCommand);
            }
            return FunctdsecuL_7_2Models;
        }
 
        //逻辑_交易证券_中泰_新增组合指令
        public static List<FunctdsecuL_7_2Model> GetFunctdsecuL_7_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_7_2Models = new List<FunctdsecuL_7_2Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_7_2Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                reqCommand.oper_statn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_STATN_STR);
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                reqCommand.order_id_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_STR_STR);
                reqCommand.order_status_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR_STR);
                reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                FunctdsecuL_7_2Models.Add(reqCommand);
            }
            return FunctdsecuL_7_2Models;
        }
 
        //逻辑_交易证券_中泰_新增组合订单
        public static List<FunctdsecuL_7_3Model> GetFunctdsecuL_7_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_7_3Models = new List<FunctdsecuL_7_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_7_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_statn = packer.GetStrbyName("oper_statn", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_id_str = packer.GetStrbyName("order_id_str", i);
                reqCommand.order_status_str = packer.GetStrbyName("order_status_str", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
 
                FunctdsecuL_7_3Models.Add(reqCommand);
            }
            return FunctdsecuL_7_3Models;
        }
 
        //逻辑_交易证券_中泰_新增组合订单
        public static List<FunctdsecuL_7_3Model> GetFunctdsecuL_7_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_7_3Models = new List<FunctdsecuL_7_3Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_7_3Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                reqCommand.oper_statn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_STATN_STR);
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                reqCommand.order_id_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_STR_STR);
                reqCommand.order_status_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR_STR);
                reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                FunctdsecuL_7_3Models.Add(reqCommand);
            }
            return FunctdsecuL_7_3Models;
        }
 
        //逻辑_交易证券_中泰_撤销订单
        public static List<FunctdsecuL_7_4Model> GetFunctdsecuL_7_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_7_4Models = new List<FunctdsecuL_7_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_7_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.wtdraw_id = packer.GetInt64byName("wtdraw_id", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.wtdraw_status = packer.GetStrbyName("wtdraw_status", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
 
                FunctdsecuL_7_4Models.Add(reqCommand);
            }
            return FunctdsecuL_7_4Models;
        }
 
        //逻辑_交易证券_中泰_撤销订单
        public static List<FunctdsecuL_7_4Model> GetFunctdsecuL_7_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_7_4Models = new List<FunctdsecuL_7_4Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_7_4Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                reqCommand.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                FunctdsecuL_7_4Models.Add(reqCommand);
            }
            return FunctdsecuL_7_4Models;
        }
 
        //逻辑_交易证券_中泰_新增改单
        public static List<FunctdsecuL_7_5Model> GetFunctdsecuL_7_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_7_5Models = new List<FunctdsecuL_7_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_7_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.modi_order_id = packer.GetInt64byName("modi_order_id", i);
                reqCommand.new_order_id = packer.GetInt64byName("new_order_id", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.wtdraw_id = packer.GetInt64byName("wtdraw_id", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.wtdraw_status = packer.GetStrbyName("wtdraw_status", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
                reqCommand.old_order_status = packer.GetStrbyName("old_order_status", i);
                reqCommand.new_order_status = packer.GetStrbyName("new_order_status", i);
 
                FunctdsecuL_7_5Models.Add(reqCommand);
            }
            return FunctdsecuL_7_5Models;
        }
 
        //逻辑_交易证券_中泰_新增改单
        public static List<FunctdsecuL_7_5Model> GetFunctdsecuL_7_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_7_5Models = new List<FunctdsecuL_7_5Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_7_5Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                reqCommand.modi_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_ID_INT64);
                reqCommand.new_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_NEW_ORDER_ID_INT64);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                reqCommand.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                reqCommand.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                reqCommand.old_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OLD_ORDER_STATUS_STR);
                reqCommand.new_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NEW_ORDER_STATUS_STR);
                FunctdsecuL_7_5Models.Add(reqCommand);
            }
            return FunctdsecuL_7_5Models;
        }
 
    }
}
