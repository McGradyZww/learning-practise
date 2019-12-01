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

    public static class PermissionClient
    {
        //逻辑_公共_权限客户端_查询角色列表
        public static List<FuncpubL_21_5Model> GetFuncpubL_21_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_21_5Models = new List<FuncpubL_21_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_21_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.role_no = packer.GetIntbyName("role_no", i);
                reqCommand.role_code = packer.GetStrbyName("role_code", i);
                reqCommand.role_name = packer.GetStrbyName("role_name", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.role_type = packer.GetIntbyName("role_type", i);
 
                FuncpubL_21_5Models.Add(reqCommand);
            }
            return FuncpubL_21_5Models;
        }
 
        //逻辑_公共_权限客户端_查询角色列表
        public static List<FuncpubL_21_5Model> GetFuncpubL_21_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_21_5Models = new List<FuncpubL_21_5Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_21_5Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.role_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT);
                    reqCommand.role_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_CODE_STR);
                    reqCommand.role_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NAME_STR);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.role_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_TYPE_INT);
                    FuncpubL_21_5Models.Add(reqCommand);
                }
            }
            return FuncpubL_21_5Models;
        }
 
        //逻辑_公共_权限客户端_查询角色菜单功能列表
        public static List<FuncpubL_21_15Model> GetFuncpubL_21_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_21_15Models = new List<FuncpubL_21_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_21_15Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.role_no = packer.GetIntbyName("role_no", i);
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
                reqCommand.busi_func_code = packer.GetStrbyName("busi_func_code", i);
 
                FuncpubL_21_15Models.Add(reqCommand);
            }
            return FuncpubL_21_15Models;
        }
 
        //逻辑_公共_权限客户端_查询角色菜单功能列表
        public static List<FuncpubL_21_15Model> GetFuncpubL_21_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_21_15Models = new List<FuncpubL_21_15Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_21_15Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.role_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT);
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    reqCommand.busi_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR);
                    FuncpubL_21_15Models.Add(reqCommand);
                }
            }
            return FuncpubL_21_15Models;
        }
 
        //逻辑_公共_权限客户端_查询操作员可用角色列表
        public static List<FuncpubL_21_21Model> GetFuncpubL_21_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_21_21Models = new List<FuncpubL_21_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_21_21Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.role_no = packer.GetIntbyName("role_no", i);
                reqCommand.role_name = packer.GetStrbyName("role_name", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
 
                FuncpubL_21_21Models.Add(reqCommand);
            }
            return FuncpubL_21_21Models;
        }
 
        //逻辑_公共_权限客户端_查询操作员可用角色列表
        public static List<FuncpubL_21_21Model> GetFuncpubL_21_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_21_21Models = new List<FuncpubL_21_21Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_21_21Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.role_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT);
                    reqCommand.role_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NAME_STR);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    FuncpubL_21_21Models.Add(reqCommand);
                }
            }
            return FuncpubL_21_21Models;
        }
 
        //逻辑_公共_权限客户端_查询操作员角色列表
        public static List<FuncpubL_21_24Model> GetFuncpubL_21_24Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_21_24Models = new List<FuncpubL_21_24Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_21_24Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.role_no = packer.GetIntbyName("role_no", i);
 
                FuncpubL_21_24Models.Add(reqCommand);
            }
            return FuncpubL_21_24Models;
        }
 
        //逻辑_公共_权限客户端_查询操作员角色列表
        public static List<FuncpubL_21_24Model> GetFuncpubL_21_24Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_21_24Models = new List<FuncpubL_21_24Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_21_24Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.role_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT);
                    FuncpubL_21_24Models.Add(reqCommand);
                }
            }
            return FuncpubL_21_24Models;
        }
 
        //逻辑_公共_权限客户端_查询操作员普通菜单
        public static List<FuncpubL_21_29Model> GetFuncpubL_21_29Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_21_29Models = new List<FuncpubL_21_29Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_21_29Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
 
                FuncpubL_21_29Models.Add(reqCommand);
            }
            return FuncpubL_21_29Models;
        }
 
        //逻辑_公共_权限客户端_查询操作员普通菜单
        public static List<FuncpubL_21_29Model> GetFuncpubL_21_29Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_21_29Models = new List<FuncpubL_21_29Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_21_29Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    FuncpubL_21_29Models.Add(reqCommand);
                }
            }
            return FuncpubL_21_29Models;
        }
 
        //逻辑_公共_权限客户端_查询操作员特殊菜单
        public static List<FuncpubL_21_30Model> GetFuncpubL_21_30Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_21_30Models = new List<FuncpubL_21_30Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_21_30Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
 
                FuncpubL_21_30Models.Add(reqCommand);
            }
            return FuncpubL_21_30Models;
        }
 
        //逻辑_公共_权限客户端_查询操作员特殊菜单
        public static List<FuncpubL_21_30Model> GetFuncpubL_21_30Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_21_30Models = new List<FuncpubL_21_30Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_21_30Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    FuncpubL_21_30Models.Add(reqCommand);
                }
            }
            return FuncpubL_21_30Models;
        }
 
        //逻辑_公共_权限客户端_查询操作员普通菜单功能
        public static List<FuncpubL_21_31Model> GetFuncpubL_21_31Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_21_31Models = new List<FuncpubL_21_31Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_21_31Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
                reqCommand.busi_func_code = packer.GetStrbyName("busi_func_code", i);
 
                FuncpubL_21_31Models.Add(reqCommand);
            }
            return FuncpubL_21_31Models;
        }
 
        //逻辑_公共_权限客户端_查询操作员普通菜单功能
        public static List<FuncpubL_21_31Model> GetFuncpubL_21_31Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_21_31Models = new List<FuncpubL_21_31Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_21_31Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    reqCommand.busi_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR);
                    FuncpubL_21_31Models.Add(reqCommand);
                }
            }
            return FuncpubL_21_31Models;
        }
 
        //逻辑_公共_权限客户端_查询操作员特殊菜单功能
        public static List<FuncpubL_21_32Model> GetFuncpubL_21_32Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_21_32Models = new List<FuncpubL_21_32Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_21_32Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
                reqCommand.busi_func_code = packer.GetStrbyName("busi_func_code", i);
 
                FuncpubL_21_32Models.Add(reqCommand);
            }
            return FuncpubL_21_32Models;
        }
 
        //逻辑_公共_权限客户端_查询操作员特殊菜单功能
        public static List<FuncpubL_21_32Model> GetFuncpubL_21_32Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_21_32Models = new List<FuncpubL_21_32Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_21_32Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    reqCommand.busi_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR);
                    FuncpubL_21_32Models.Add(reqCommand);
                }
            }
            return FuncpubL_21_32Models;
        }
 
        //逻辑_公共_权限客户端_查询全部菜单
        public static List<FuncpubL_21_33Model> GetFuncpubL_21_33Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_21_33Models = new List<FuncpubL_21_33Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_21_33Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
                reqCommand.menu_name = packer.GetStrbyName("menu_name", i);
                reqCommand.menu_parent = packer.GetIntbyName("menu_parent", i);
                reqCommand.menu_child = packer.GetIntbyName("menu_child", i);
                reqCommand.menu_path = packer.GetStrbyName("menu_path", i);
                reqCommand.menu_image = packer.GetStrbyName("menu_image", i);
 
                FuncpubL_21_33Models.Add(reqCommand);
            }
            return FuncpubL_21_33Models;
        }
 
        //逻辑_公共_权限客户端_查询全部菜单
        public static List<FuncpubL_21_33Model> GetFuncpubL_21_33Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_21_33Models = new List<FuncpubL_21_33Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_21_33Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    reqCommand.menu_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NAME_STR);
                    reqCommand.menu_parent = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_PARENT_INT);
                    reqCommand.menu_child = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_CHILD_INT);
                    reqCommand.menu_path = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MENU_PATH_STR);
                    reqCommand.menu_image = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MENU_IMAGE_STR);
                    FuncpubL_21_33Models.Add(reqCommand);
                }
            }
            return FuncpubL_21_33Models;
        }
 
    }
}
