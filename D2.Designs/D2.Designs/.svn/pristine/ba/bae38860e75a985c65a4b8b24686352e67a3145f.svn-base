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

    public static class PublicIF
    {
        //逻辑_公共_公共接口_获取上一交易日期
        public static List<FuncpubL_24_1Model> GetFuncpubL_24_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_24_1Models = new List<FuncpubL_24_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_24_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.last_init_date = packer.GetIntbyName("last_init_date", i);
 
                FuncpubL_24_1Models.Add(reqCommand);
            }
            return FuncpubL_24_1Models;
        }
 
        //逻辑_公共_公共接口_获取上一交易日期
        public static List<FuncpubL_24_1Model> GetFuncpubL_24_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_24_1Models = new List<FuncpubL_24_1Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_24_1Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.last_init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_INIT_DATE_INT);
                FuncpubL_24_1Models.Add(reqCommand);
            }
            return FuncpubL_24_1Models;
        }
 
        //逻辑_公共_公共接口_获取操作员操作权限串
        public static List<FuncpubL_24_2Model> GetFuncpubL_24_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_24_2Models = new List<FuncpubL_24_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_24_2Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no_rights_str = packer.GetStrbyName("co_no_rights_str", i);
                reqCommand.pd_no_rights_str = packer.GetStrbyName("pd_no_rights_str", i);
                reqCommand.exch_group_no_rights_str = packer.GetStrbyName("exch_group_no_rights_str", i);
 
                FuncpubL_24_2Models.Add(reqCommand);
            }
            return FuncpubL_24_2Models;
        }
 
        //逻辑_公共_公共接口_获取操作员操作权限串
        public static List<FuncpubL_24_2Model> GetFuncpubL_24_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_24_2Models = new List<FuncpubL_24_2Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_24_2Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.co_no_rights_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_RIGHTS_STR_STR);
                reqCommand.pd_no_rights_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_RIGHTS_STR_STR);
                reqCommand.exch_group_no_rights_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR);
                FuncpubL_24_2Models.Add(reqCommand);
            }
            return FuncpubL_24_2Models;
        }
 
    }
}
