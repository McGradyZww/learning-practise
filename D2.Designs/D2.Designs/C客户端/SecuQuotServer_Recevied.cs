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

    public static class SecuQuotServer
    {
        //逻辑_公共_证券行情服务_初始化证券代码信息
        public static List<FuncpubL_16_1Model> GetFuncpubL_16_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_16_1Models = new List<FuncpubL_16_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_16_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncpubL_16_1Models.Add(reqCommand);
            }
            return FuncpubL_16_1Models;
        }
 
        //逻辑_公共_证券行情服务_初始化证券代码信息
        public static List<FuncpubL_16_1Model> GetFuncpubL_16_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_16_1Models = new List<FuncpubL_16_1Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_16_1Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FuncpubL_16_1Models.Add(reqCommand);
            }
            return FuncpubL_16_1Models;
        }
 
        //逻辑_公共_证券行情服务_请求有效均价
        public static List<FuncpubL_16_3Model> GetFuncpubL_16_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_16_3Models = new List<FuncpubL_16_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_16_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.comm_limit_price = packer.GetDoublebyName("comm_limit_price", i);
                reqCommand.ask_exec_qty = packer.GetDoublebyName("ask_exec_qty", i);
                reqCommand.ask_exec_qty1 = packer.GetDoublebyName("ask_exec_qty1", i);
                reqCommand.ask_exec_qty2 = packer.GetDoublebyName("ask_exec_qty2", i);
                reqCommand.ask_exec_qty3 = packer.GetDoublebyName("ask_exec_qty3", i);
                reqCommand.ask_exec_qty4 = packer.GetDoublebyName("ask_exec_qty4", i);
                reqCommand.ask_avg_price1 = packer.GetDoublebyName("ask_avg_price1", i);
                reqCommand.ask_avg_price2 = packer.GetDoublebyName("ask_avg_price2", i);
 
                FuncpubL_16_3Models.Add(reqCommand);
            }
            return FuncpubL_16_3Models;
        }
 
        //逻辑_公共_证券行情服务_请求有效均价
        public static List<FuncpubL_16_3Model> GetFuncpubL_16_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_16_3Models = new List<FuncpubL_16_3Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_16_3Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                reqCommand.ask_exec_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY_FLOAT);
                reqCommand.ask_exec_qty1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY1_FLOAT);
                reqCommand.ask_exec_qty2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY2_FLOAT);
                reqCommand.ask_exec_qty3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY3_FLOAT);
                reqCommand.ask_exec_qty4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY4_FLOAT);
                reqCommand.ask_avg_price1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_AVG_PRICE1_FLOAT);
                reqCommand.ask_avg_price2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_AVG_PRICE2_FLOAT);
                FuncpubL_16_3Models.Add(reqCommand);
            }
            return FuncpubL_16_3Models;
        }
 
        //逻辑_公共_证券行情服务_请求个股行情
        public static List<FuncpubL_16_4Model> GetFuncpubL_16_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_16_4Models = new List<FuncpubL_16_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_16_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.quot_price_info = packer.GetStrbyName("quot_price_info", i);
 
                FuncpubL_16_4Models.Add(reqCommand);
            }
            return FuncpubL_16_4Models;
        }
 
        //逻辑_公共_证券行情服务_请求个股行情
        public static List<FuncpubL_16_4Model> GetFuncpubL_16_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_16_4Models = new List<FuncpubL_16_4Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_16_4Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.quot_price_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_PRICE_INFO_STR);
                FuncpubL_16_4Models.Add(reqCommand);
            }
            return FuncpubL_16_4Models;
        }
 
        //逻辑_公共_证券行情服务_请求上海个股行情
        public static List<FuncpubL_16_11Model> GetFuncpubL_16_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_16_11Models = new List<FuncpubL_16_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_16_11Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.quot_price_info = packer.GetStrbyName("quot_price_info", i);
 
                FuncpubL_16_11Models.Add(reqCommand);
            }
            return FuncpubL_16_11Models;
        }
 
        //逻辑_公共_证券行情服务_请求上海个股行情
        public static List<FuncpubL_16_11Model> GetFuncpubL_16_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_16_11Models = new List<FuncpubL_16_11Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_16_11Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.quot_price_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_PRICE_INFO_STR);
                FuncpubL_16_11Models.Add(reqCommand);
            }
            return FuncpubL_16_11Models;
        }
 
        //逻辑_公共_证券行情服务_请求深圳个股行情
        public static List<FuncpubL_16_12Model> GetFuncpubL_16_12Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_16_12Models = new List<FuncpubL_16_12Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_16_12Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.quot_price_info = packer.GetStrbyName("quot_price_info", i);
 
                FuncpubL_16_12Models.Add(reqCommand);
            }
            return FuncpubL_16_12Models;
        }
 
        //逻辑_公共_证券行情服务_请求深圳个股行情
        public static List<FuncpubL_16_12Model> GetFuncpubL_16_12Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_16_12Models = new List<FuncpubL_16_12Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_16_12Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.quot_price_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_PRICE_INFO_STR);
                FuncpubL_16_12Models.Add(reqCommand);
            }
            return FuncpubL_16_12Models;
        }
 
        //逻辑_公共_证券行情服务_批量请求个股行情
        public static List<FuncpubL_16_15Model> GetFuncpubL_16_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_16_15Models = new List<FuncpubL_16_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_16_15Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.quot_price_info = packer.GetStrbyName("quot_price_info", i);
 
                FuncpubL_16_15Models.Add(reqCommand);
            }
            return FuncpubL_16_15Models;
        }
 
        //逻辑_公共_证券行情服务_批量请求个股行情
        public static List<FuncpubL_16_15Model> GetFuncpubL_16_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_16_15Models = new List<FuncpubL_16_15Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_16_15Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.quot_price_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_PRICE_INFO_STR);
                    FuncpubL_16_15Models.Add(reqCommand);
                }
            }
            return FuncpubL_16_15Models;
        }
 
        //逻辑_公共_证券行情服务_请求多日有效均价
        public static List<FuncpubL_16_16Model> GetFuncpubL_16_16Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_16_16Models = new List<FuncpubL_16_16Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_16_16Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.comm_limit_price = packer.GetDoublebyName("comm_limit_price", i);
                reqCommand.ask_exec_qty = packer.GetDoublebyName("ask_exec_qty", i);
                reqCommand.ask_exec_qty1 = packer.GetDoublebyName("ask_exec_qty1", i);
                reqCommand.ask_exec_qty2 = packer.GetDoublebyName("ask_exec_qty2", i);
                reqCommand.ask_exec_qty3 = packer.GetDoublebyName("ask_exec_qty3", i);
                reqCommand.ask_exec_qty4 = packer.GetDoublebyName("ask_exec_qty4", i);
                reqCommand.ask_avg_price1 = packer.GetDoublebyName("ask_avg_price1", i);
                reqCommand.ask_avg_price2 = packer.GetDoublebyName("ask_avg_price2", i);
 
                FuncpubL_16_16Models.Add(reqCommand);
            }
            return FuncpubL_16_16Models;
        }
 
        //逻辑_公共_证券行情服务_请求多日有效均价
        public static List<FuncpubL_16_16Model> GetFuncpubL_16_16Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_16_16Models = new List<FuncpubL_16_16Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_16_16Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                reqCommand.ask_exec_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY_FLOAT);
                reqCommand.ask_exec_qty1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY1_FLOAT);
                reqCommand.ask_exec_qty2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY2_FLOAT);
                reqCommand.ask_exec_qty3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY3_FLOAT);
                reqCommand.ask_exec_qty4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY4_FLOAT);
                reqCommand.ask_avg_price1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_AVG_PRICE1_FLOAT);
                reqCommand.ask_avg_price2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_AVG_PRICE2_FLOAT);
                FuncpubL_16_16Models.Add(reqCommand);
            }
            return FuncpubL_16_16Models;
        }
 
        //逻辑_公共_证券行情服务_批量请求港股行情
        public static List<FuncpubL_16_18Model> GetFuncpubL_16_18Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_16_18Models = new List<FuncpubL_16_18Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_16_18Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.quot_price_info = packer.GetStrbyName("quot_price_info", i);
 
                FuncpubL_16_18Models.Add(reqCommand);
            }
            return FuncpubL_16_18Models;
        }
 
        //逻辑_公共_证券行情服务_批量请求港股行情
        public static List<FuncpubL_16_18Model> GetFuncpubL_16_18Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_16_18Models = new List<FuncpubL_16_18Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_16_18Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.quot_price_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_PRICE_INFO_STR);
                    FuncpubL_16_18Models.Add(reqCommand);
                }
            }
            return FuncpubL_16_18Models;
        }
 
        //逻辑_公共_证券行情服务_测试后台服务
        public static List<FuncpubL_16_19Model> GetFuncpubL_16_19Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_16_19Models = new List<FuncpubL_16_19Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_16_19Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.comm_limit_price = packer.GetDoublebyName("comm_limit_price", i);
                reqCommand.ask_exec_qty = packer.GetDoublebyName("ask_exec_qty", i);
                reqCommand.ask_exec_qty1 = packer.GetDoublebyName("ask_exec_qty1", i);
                reqCommand.ask_exec_qty2 = packer.GetDoublebyName("ask_exec_qty2", i);
                reqCommand.ask_exec_qty3 = packer.GetDoublebyName("ask_exec_qty3", i);
                reqCommand.ask_exec_qty4 = packer.GetDoublebyName("ask_exec_qty4", i);
                reqCommand.ask_avg_price1 = packer.GetDoublebyName("ask_avg_price1", i);
                reqCommand.ask_avg_price2 = packer.GetDoublebyName("ask_avg_price2", i);
 
                FuncpubL_16_19Models.Add(reqCommand);
            }
            return FuncpubL_16_19Models;
        }
 
        //逻辑_公共_证券行情服务_测试后台服务
        public static List<FuncpubL_16_19Model> GetFuncpubL_16_19Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_16_19Models = new List<FuncpubL_16_19Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_16_19Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                reqCommand.ask_exec_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY_FLOAT);
                reqCommand.ask_exec_qty1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY1_FLOAT);
                reqCommand.ask_exec_qty2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY2_FLOAT);
                reqCommand.ask_exec_qty3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY3_FLOAT);
                reqCommand.ask_exec_qty4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_EXEC_QTY4_FLOAT);
                reqCommand.ask_avg_price1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_AVG_PRICE1_FLOAT);
                reqCommand.ask_avg_price2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASK_AVG_PRICE2_FLOAT);
                FuncpubL_16_19Models.Add(reqCommand);
            }
            return FuncpubL_16_19Models;
        }
 
    }
}
