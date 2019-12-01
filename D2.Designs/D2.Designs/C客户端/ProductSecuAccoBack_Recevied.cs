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

    public static class ProductSecuAccoBack
    {
        //逻辑_产品证券_账户运维_查询全部证券账户
        public static List<FuncpdsecuL_7_1Model> GetFuncpdsecuL_7_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_7_1Models = new List<FuncpdsecuL_7_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_7_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_acco_name = packer.GetStrbyName("stock_acco_name", i);
                reqCommand.stock_acco_status = packer.GetStrbyName("stock_acco_status", i);
                reqCommand.stock_acco_apoint_status = packer.GetStrbyName("stock_acco_apoint_status", i);
 
                FuncpdsecuL_7_1Models.Add(reqCommand);
            }
            return FuncpdsecuL_7_1Models;
        }
 
        //逻辑_产品证券_账户运维_查询全部证券账户
        public static List<FuncpdsecuL_7_1Model> GetFuncpdsecuL_7_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_7_1Models = new List<FuncpdsecuL_7_1Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdsecuL_7_1Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.stock_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NAME_STR);
                    reqCommand.stock_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STATUS_STR);
                    reqCommand.stock_acco_apoint_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_APOINT_STATUS_STR);
                    FuncpdsecuL_7_1Models.Add(reqCommand);
                }
            }
            return FuncpdsecuL_7_1Models;
        }
 
        //逻辑_产品证券_账户运维_新增证券账户信息
        public static List<FuncpdsecuL_7_18Model> GetFuncpdsecuL_7_18Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_7_18Models = new List<FuncpdsecuL_7_18Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_7_18Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
 
                FuncpdsecuL_7_18Models.Add(reqCommand);
            }
            return FuncpdsecuL_7_18Models;
        }
 
        //逻辑_产品证券_账户运维_新增证券账户信息
        public static List<FuncpdsecuL_7_18Model> GetFuncpdsecuL_7_18Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_7_18Models = new List<FuncpdsecuL_7_18Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpdsecuL_7_18Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                FuncpdsecuL_7_18Models.Add(reqCommand);
            }
            return FuncpdsecuL_7_18Models;
        }
 
        //逻辑_产品证券_账户运维_查询证券账户信息
        public static List<FuncpdsecuL_7_19Model> GetFuncpdsecuL_7_19Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_7_19Models = new List<FuncpdsecuL_7_19Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_7_19Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_acco_name = packer.GetStrbyName("stock_acco_name", i);
                reqCommand.stock_acco_status = packer.GetStrbyName("stock_acco_status", i);
                reqCommand.stock_acco_apoint_status = packer.GetStrbyName("stock_acco_apoint_status", i);
                reqCommand.allow_stock_type = packer.GetStrbyName("allow_stock_type", i);
                reqCommand.busi_limit_str = packer.GetStrbyName("busi_limit_str", i);
                reqCommand.registration_agency = packer.GetStrbyName("registration_agency", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpdsecuL_7_19Models.Add(reqCommand);
            }
            return FuncpdsecuL_7_19Models;
        }
 
        //逻辑_产品证券_账户运维_查询证券账户信息
        public static List<FuncpdsecuL_7_19Model> GetFuncpdsecuL_7_19Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_7_19Models = new List<FuncpdsecuL_7_19Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdsecuL_7_19Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.stock_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NAME_STR);
                    reqCommand.stock_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STATUS_STR);
                    reqCommand.stock_acco_apoint_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_APOINT_STATUS_STR);
                    reqCommand.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    reqCommand.busi_limit_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_LIMIT_STR_STR);
                    reqCommand.registration_agency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REGISTRATION_AGENCY_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpdsecuL_7_19Models.Add(reqCommand);
                }
            }
            return FuncpdsecuL_7_19Models;
        }
 
    }
}
