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

    public static class Permission
    {
        //逻辑_公共_权限_查询角色列表
        public static List<FuncpubL_7_5Model> GetFuncpubL_7_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_7_5Models = new List<FuncpubL_7_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_7_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.role_no = packer.GetIntbyName("role_no", i);
                reqCommand.role_code = packer.GetStrbyName("role_code", i);
                reqCommand.role_name = packer.GetStrbyName("role_name", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.role_type = packer.GetIntbyName("role_type", i);
 
                FuncpubL_7_5Models.Add(reqCommand);
            }
            return FuncpubL_7_5Models;
        }
 
        //逻辑_公共_权限_查询角色列表
        public static List<FuncpubL_7_5Model> GetFuncpubL_7_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_7_5Models = new List<FuncpubL_7_5Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_7_5Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.role_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT);
                    reqCommand.role_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_CODE_STR);
                    reqCommand.role_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NAME_STR);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.role_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_TYPE_INT);
                    FuncpubL_7_5Models.Add(reqCommand);
                }
            }
            return FuncpubL_7_5Models;
        }
 
        //逻辑_公共_权限_检查角色存在
        public static List<FuncpubL_7_6Model> GetFuncpubL_7_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_7_6Models = new List<FuncpubL_7_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_7_6Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.record_count = packer.GetIntbyName("record_count", i);
 
                FuncpubL_7_6Models.Add(reqCommand);
            }
            return FuncpubL_7_6Models;
        }
 
        //逻辑_公共_权限_检查角色存在
        public static List<FuncpubL_7_6Model> GetFuncpubL_7_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_7_6Models = new List<FuncpubL_7_6Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_7_6Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                FuncpubL_7_6Models.Add(reqCommand);
            }
            return FuncpubL_7_6Models;
        }
 
        //逻辑_公共_权限_查询角色菜单功能列表
        public static List<FuncpubL_7_15Model> GetFuncpubL_7_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_7_15Models = new List<FuncpubL_7_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_7_15Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.role_no = packer.GetIntbyName("role_no", i);
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
                reqCommand.busi_func_code = packer.GetStrbyName("busi_func_code", i);
 
                FuncpubL_7_15Models.Add(reqCommand);
            }
            return FuncpubL_7_15Models;
        }
 
        //逻辑_公共_权限_查询角色菜单功能列表
        public static List<FuncpubL_7_15Model> GetFuncpubL_7_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_7_15Models = new List<FuncpubL_7_15Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_7_15Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.role_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT);
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    reqCommand.busi_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR);
                    FuncpubL_7_15Models.Add(reqCommand);
                }
            }
            return FuncpubL_7_15Models;
        }
 
        //逻辑_公共_权限_查询操作员可用角色列表
        public static List<FuncpubL_7_21Model> GetFuncpubL_7_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_7_21Models = new List<FuncpubL_7_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_7_21Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.role_no = packer.GetIntbyName("role_no", i);
                reqCommand.role_name = packer.GetStrbyName("role_name", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
 
                FuncpubL_7_21Models.Add(reqCommand);
            }
            return FuncpubL_7_21Models;
        }
 
        //逻辑_公共_权限_查询操作员可用角色列表
        public static List<FuncpubL_7_21Model> GetFuncpubL_7_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_7_21Models = new List<FuncpubL_7_21Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_7_21Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.role_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT);
                    reqCommand.role_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NAME_STR);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    FuncpubL_7_21Models.Add(reqCommand);
                }
            }
            return FuncpubL_7_21Models;
        }
 
        //逻辑_公共_权限_查询操作员角色列表
        public static List<FuncpubL_7_24Model> GetFuncpubL_7_24Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_7_24Models = new List<FuncpubL_7_24Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_7_24Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.role_no = packer.GetIntbyName("role_no", i);
 
                FuncpubL_7_24Models.Add(reqCommand);
            }
            return FuncpubL_7_24Models;
        }
 
        //逻辑_公共_权限_查询操作员角色列表
        public static List<FuncpubL_7_24Model> GetFuncpubL_7_24Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_7_24Models = new List<FuncpubL_7_24Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_7_24Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.role_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT);
                    FuncpubL_7_24Models.Add(reqCommand);
                }
            }
            return FuncpubL_7_24Models;
        }
 
        //逻辑_公共_权限_查询全部菜单
        public static List<FuncpubL_7_33Model> GetFuncpubL_7_33Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_7_33Models = new List<FuncpubL_7_33Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_7_33Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
                reqCommand.menu_name = packer.GetStrbyName("menu_name", i);
                reqCommand.menu_parent = packer.GetIntbyName("menu_parent", i);
                reqCommand.menu_child = packer.GetIntbyName("menu_child", i);
                reqCommand.menu_path = packer.GetStrbyName("menu_path", i);
                reqCommand.menu_image = packer.GetStrbyName("menu_image", i);
 
                FuncpubL_7_33Models.Add(reqCommand);
            }
            return FuncpubL_7_33Models;
        }
 
        //逻辑_公共_权限_查询全部菜单
        public static List<FuncpubL_7_33Model> GetFuncpubL_7_33Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_7_33Models = new List<FuncpubL_7_33Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_7_33Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    reqCommand.menu_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NAME_STR);
                    reqCommand.menu_parent = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_PARENT_INT);
                    reqCommand.menu_child = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_CHILD_INT);
                    reqCommand.menu_path = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MENU_PATH_STR);
                    reqCommand.menu_image = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MENU_IMAGE_STR);
                    FuncpubL_7_33Models.Add(reqCommand);
                }
            }
            return FuncpubL_7_33Models;
        }
 
        //逻辑_公共_权限_查询全部菜单功能
        public static List<FuncpubL_7_34Model> GetFuncpubL_7_34Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_7_34Models = new List<FuncpubL_7_34Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_7_34Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
                reqCommand.busi_func_code = packer.GetStrbyName("busi_func_code", i);
                reqCommand.func_name = packer.GetStrbyName("func_name", i);
 
                FuncpubL_7_34Models.Add(reqCommand);
            }
            return FuncpubL_7_34Models;
        }
 
        //逻辑_公共_权限_查询全部菜单功能
        public static List<FuncpubL_7_34Model> GetFuncpubL_7_34Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_7_34Models = new List<FuncpubL_7_34Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_7_34Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    reqCommand.busi_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR);
                    reqCommand.func_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_NAME_STR);
                    FuncpubL_7_34Models.Add(reqCommand);
                }
            }
            return FuncpubL_7_34Models;
        }
 
        //逻辑_公共_权限_查询操作员普通菜单
        public static List<FuncpubL_7_29Model> GetFuncpubL_7_29Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_7_29Models = new List<FuncpubL_7_29Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_7_29Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
 
                FuncpubL_7_29Models.Add(reqCommand);
            }
            return FuncpubL_7_29Models;
        }
 
        //逻辑_公共_权限_查询操作员普通菜单
        public static List<FuncpubL_7_29Model> GetFuncpubL_7_29Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_7_29Models = new List<FuncpubL_7_29Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_7_29Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    FuncpubL_7_29Models.Add(reqCommand);
                }
            }
            return FuncpubL_7_29Models;
        }
 
        //逻辑_公共_权限_查询操作员特殊菜单
        public static List<FuncpubL_7_30Model> GetFuncpubL_7_30Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_7_30Models = new List<FuncpubL_7_30Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_7_30Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
 
                FuncpubL_7_30Models.Add(reqCommand);
            }
            return FuncpubL_7_30Models;
        }
 
        //逻辑_公共_权限_查询操作员特殊菜单
        public static List<FuncpubL_7_30Model> GetFuncpubL_7_30Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_7_30Models = new List<FuncpubL_7_30Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_7_30Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    FuncpubL_7_30Models.Add(reqCommand);
                }
            }
            return FuncpubL_7_30Models;
        }
 
        //逻辑_公共_权限_查询操作员普通菜单功能
        public static List<FuncpubL_7_31Model> GetFuncpubL_7_31Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_7_31Models = new List<FuncpubL_7_31Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_7_31Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
                reqCommand.busi_func_code = packer.GetStrbyName("busi_func_code", i);
 
                FuncpubL_7_31Models.Add(reqCommand);
            }
            return FuncpubL_7_31Models;
        }
 
        //逻辑_公共_权限_查询操作员普通菜单功能
        public static List<FuncpubL_7_31Model> GetFuncpubL_7_31Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_7_31Models = new List<FuncpubL_7_31Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_7_31Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    reqCommand.busi_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR);
                    FuncpubL_7_31Models.Add(reqCommand);
                }
            }
            return FuncpubL_7_31Models;
        }
 
        //逻辑_公共_权限_查询操作员特殊菜单功能
        public static List<FuncpubL_7_32Model> GetFuncpubL_7_32Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_7_32Models = new List<FuncpubL_7_32Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_7_32Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
                reqCommand.busi_func_code = packer.GetStrbyName("busi_func_code", i);
 
                FuncpubL_7_32Models.Add(reqCommand);
            }
            return FuncpubL_7_32Models;
        }
 
        //逻辑_公共_权限_查询操作员特殊菜单功能
        public static List<FuncpubL_7_32Model> GetFuncpubL_7_32Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_7_32Models = new List<FuncpubL_7_32Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_7_32Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    reqCommand.busi_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR);
                    FuncpubL_7_32Models.Add(reqCommand);
                }
            }
            return FuncpubL_7_32Models;
        }
 
    }
}
