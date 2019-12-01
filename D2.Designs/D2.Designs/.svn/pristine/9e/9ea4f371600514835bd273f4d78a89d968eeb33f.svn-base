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
    public class pubL_7_1_Response : IResponse
    {
        #region 构造函数
        public pubL_7_1_Response()
        {
            this.pubL_7_1_InfoList = new ObservableCollection<pubL_7_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_1_Info> pubL_7_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_1_Info info = new pubL_7_1_Info();
            pubL_7_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_1_InfoList.Add((pubL_7_1_Info)info);
        }
        #endregion

        //逻辑_公共_权限_新增角色
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_7_1_Info();
                pubL_7_1_InfoList.Add(info);
            }
        }
    }

    public class pubL_7_2_Response : IResponse
    {
        #region 构造函数
        public pubL_7_2_Response()
        {
            this.pubL_7_2_InfoList = new ObservableCollection<pubL_7_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_2_Info> pubL_7_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_2_Info info = new pubL_7_2_Info();
            pubL_7_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_2_InfoList.Add((pubL_7_2_Info)info);
        }
        #endregion

        //逻辑_公共_权限_修改角色
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_7_2_Info();
                pubL_7_2_InfoList.Add(info);
            }
        }
    }

    public class pubL_7_3_Response : IResponse
    {
        #region 构造函数
        public pubL_7_3_Response()
        {
            this.pubL_7_3_InfoList = new ObservableCollection<pubL_7_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_3_Info> pubL_7_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_3_Info info = new pubL_7_3_Info();
            pubL_7_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_3_InfoList.Add((pubL_7_3_Info)info);
        }
        #endregion

        //逻辑_公共_权限_删除角色
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_7_3_Info();
                pubL_7_3_InfoList.Add(info);
            }
        }
    }

    public class pubL_7_4_Response : IResponse
    {
        #region 构造函数
        public pubL_7_4_Response()
        {
            this.pubL_7_4_InfoList = new ObservableCollection<pubL_7_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_4_Info> pubL_7_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_4_Info info = new pubL_7_4_Info();
            pubL_7_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_4_InfoList.Add((pubL_7_4_Info)info);
        }
        #endregion

        //逻辑_公共_权限_复制角色
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_7_4_Info();
                pubL_7_4_InfoList.Add(info);
            }
        }
    }

    public class pubL_7_5_Response : IResponse
    {
        #region 构造函数
        public pubL_7_5_Response()
        {
            this.pubL_7_5_InfoList = new ObservableCollection<pubL_7_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_5_Info> pubL_7_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_5_Info info = new pubL_7_5_Info();
            info.role_no = unpacker.GetInt("role_no");
            info.role_code = unpacker.GetStr("role_code");
            info.role_name = unpacker.GetStr("role_name");
            info.co_no = unpacker.GetInt("co_no");
            info.role_type = unpacker.GetInt("role_type");
            pubL_7_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_5_InfoList.Add((pubL_7_5_Info)info);
        }
        #endregion

        //逻辑_公共_权限_查询角色列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_7_5_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.role_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT);
                    info.role_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_CODE_STR);
                    info.role_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NAME_STR);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.role_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_TYPE_INT);
                    pubL_7_5_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_7_6_Response : IResponse
    {
        #region 构造函数
        public pubL_7_6_Response()
        {
            this.pubL_7_6_InfoList = new ObservableCollection<pubL_7_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_6_Info> pubL_7_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_6_Info info = new pubL_7_6_Info();
            info.record_count = unpacker.GetInt("record_count");
            pubL_7_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_6_InfoList.Add((pubL_7_6_Info)info);
        }
        #endregion

        //逻辑_公共_权限_检查角色存在
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_7_6_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                pubL_7_6_InfoList.Add(info);
            }
        }
    }

    public class pubL_7_13_Response : IResponse
    {
        #region 构造函数
        public pubL_7_13_Response()
        {
            this.pubL_7_13_InfoList = new ObservableCollection<pubL_7_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_13_Info> pubL_7_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_13_Info info = new pubL_7_13_Info();
            pubL_7_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_13_InfoList.Add((pubL_7_13_Info)info);
        }
        #endregion

        //逻辑_公共_权限_批量新增角色菜单功能
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_7_13_Info();
                pubL_7_13_InfoList.Add(info);
            }
        }
    }

    public class pubL_7_14_Response : IResponse
    {
        #region 构造函数
        public pubL_7_14_Response()
        {
            this.pubL_7_14_InfoList = new ObservableCollection<pubL_7_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_14_Info> pubL_7_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_14_Info info = new pubL_7_14_Info();
            pubL_7_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_14_InfoList.Add((pubL_7_14_Info)info);
        }
        #endregion

        //逻辑_公共_权限_批量删除角色菜单功能
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_7_14_Info();
                pubL_7_14_InfoList.Add(info);
            }
        }
    }

    public class pubL_7_15_Response : IResponse
    {
        #region 构造函数
        public pubL_7_15_Response()
        {
            this.pubL_7_15_InfoList = new ObservableCollection<pubL_7_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_15_Info> pubL_7_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_15_Info info = new pubL_7_15_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.role_no = unpacker.GetInt("role_no");
            info.busi_menu_no = unpacker.GetInt("busi_menu_no");
            info.busi_func_code = unpacker.GetStr("busi_func_code");
            pubL_7_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_15_InfoList.Add((pubL_7_15_Info)info);
        }
        #endregion

        //逻辑_公共_权限_查询角色菜单功能列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_7_15_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.role_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT);
                    info.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    info.busi_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR);
                    pubL_7_15_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_7_21_Response : IResponse
    {
        #region 构造函数
        public pubL_7_21_Response()
        {
            this.pubL_7_21_InfoList = new ObservableCollection<pubL_7_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_21_Info> pubL_7_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_21_Info info = new pubL_7_21_Info();
            info.role_no = unpacker.GetInt("role_no");
            info.role_name = unpacker.GetStr("role_name");
            info.co_no = unpacker.GetInt("co_no");
            pubL_7_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_21_InfoList.Add((pubL_7_21_Info)info);
        }
        #endregion

        //逻辑_公共_权限_查询操作员可用角色列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_7_21_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.role_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT);
                    info.role_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NAME_STR);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    pubL_7_21_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_7_22_Response : IResponse
    {
        #region 构造函数
        public pubL_7_22_Response()
        {
            this.pubL_7_22_InfoList = new ObservableCollection<pubL_7_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_22_Info> pubL_7_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_22_Info info = new pubL_7_22_Info();
            pubL_7_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_22_InfoList.Add((pubL_7_22_Info)info);
        }
        #endregion

        //逻辑_公共_权限_新增操作员角色
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_7_22_Info();
                pubL_7_22_InfoList.Add(info);
            }
        }
    }

    public class pubL_7_23_Response : IResponse
    {
        #region 构造函数
        public pubL_7_23_Response()
        {
            this.pubL_7_23_InfoList = new ObservableCollection<pubL_7_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_23_Info> pubL_7_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_23_Info info = new pubL_7_23_Info();
            pubL_7_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_23_InfoList.Add((pubL_7_23_Info)info);
        }
        #endregion

        //逻辑_公共_权限_删除操作员角色
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_7_23_Info();
                pubL_7_23_InfoList.Add(info);
            }
        }
    }

    public class pubL_7_24_Response : IResponse
    {
        #region 构造函数
        public pubL_7_24_Response()
        {
            this.pubL_7_24_InfoList = new ObservableCollection<pubL_7_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_24_Info> pubL_7_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_24_Info info = new pubL_7_24_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.role_no = unpacker.GetInt("role_no");
            pubL_7_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_24_InfoList.Add((pubL_7_24_Info)info);
        }
        #endregion

        //逻辑_公共_权限_查询操作员角色列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_7_24_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.role_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROLE_NO_INT);
                    pubL_7_24_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_7_27_Response : IResponse
    {
        #region 构造函数
        public pubL_7_27_Response()
        {
            this.pubL_7_27_InfoList = new ObservableCollection<pubL_7_27_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_27_Info> pubL_7_27_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_27_Info info = new pubL_7_27_Info();
            pubL_7_27_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_27_InfoList.Add((pubL_7_27_Info)info);
        }
        #endregion

        //逻辑_公共_权限_批量新增操作员特殊菜单功能
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_7_27_Info();
                pubL_7_27_InfoList.Add(info);
            }
        }
    }

    public class pubL_7_28_Response : IResponse
    {
        #region 构造函数
        public pubL_7_28_Response()
        {
            this.pubL_7_28_InfoList = new ObservableCollection<pubL_7_28_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_28_Info> pubL_7_28_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_28_Info info = new pubL_7_28_Info();
            pubL_7_28_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_28_InfoList.Add((pubL_7_28_Info)info);
        }
        #endregion

        //逻辑_公共_权限_批量删除操作员特殊菜单功能
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_7_28_Info();
                pubL_7_28_InfoList.Add(info);
            }
        }
    }

    public class pubL_7_33_Response : IResponse
    {
        #region 构造函数
        public pubL_7_33_Response()
        {
            this.pubL_7_33_InfoList = new ObservableCollection<pubL_7_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_33_Info> pubL_7_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_33_Info info = new pubL_7_33_Info();
            info.busi_menu_no = unpacker.GetInt("busi_menu_no");
            info.menu_name = unpacker.GetStr("menu_name");
            info.menu_parent = unpacker.GetInt("menu_parent");
            info.menu_child = unpacker.GetInt("menu_child");
            info.menu_path = unpacker.GetStr("menu_path");
            info.menu_image = unpacker.GetStr("menu_image");
            pubL_7_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_33_InfoList.Add((pubL_7_33_Info)info);
        }
        #endregion

        //逻辑_公共_权限_查询全部菜单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_7_33_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    info.menu_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NAME_STR);
                    info.menu_parent = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_PARENT_INT);
                    info.menu_child = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_CHILD_INT);
                    info.menu_path = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MENU_PATH_STR);
                    info.menu_image = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MENU_IMAGE_STR);
                    pubL_7_33_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_7_34_Response : IResponse
    {
        #region 构造函数
        public pubL_7_34_Response()
        {
            this.pubL_7_34_InfoList = new ObservableCollection<pubL_7_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_34_Info> pubL_7_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_34_Info info = new pubL_7_34_Info();
            info.busi_menu_no = unpacker.GetInt("busi_menu_no");
            info.busi_func_code = unpacker.GetStr("busi_func_code");
            info.func_name = unpacker.GetStr("func_name");
            pubL_7_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_34_InfoList.Add((pubL_7_34_Info)info);
        }
        #endregion

        //逻辑_公共_权限_查询全部菜单功能
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_7_34_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    info.busi_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR);
                    info.func_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_NAME_STR);
                    pubL_7_34_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_7_29_Response : IResponse
    {
        #region 构造函数
        public pubL_7_29_Response()
        {
            this.pubL_7_29_InfoList = new ObservableCollection<pubL_7_29_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_29_Info> pubL_7_29_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_29_Info info = new pubL_7_29_Info();
            info.busi_menu_no = unpacker.GetInt("busi_menu_no");
            pubL_7_29_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_29_InfoList.Add((pubL_7_29_Info)info);
        }
        #endregion

        //逻辑_公共_权限_查询操作员普通菜单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_7_29_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    pubL_7_29_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_7_30_Response : IResponse
    {
        #region 构造函数
        public pubL_7_30_Response()
        {
            this.pubL_7_30_InfoList = new ObservableCollection<pubL_7_30_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_30_Info> pubL_7_30_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_30_Info info = new pubL_7_30_Info();
            info.busi_menu_no = unpacker.GetInt("busi_menu_no");
            pubL_7_30_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_30_InfoList.Add((pubL_7_30_Info)info);
        }
        #endregion

        //逻辑_公共_权限_查询操作员特殊菜单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_7_30_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    pubL_7_30_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_7_31_Response : IResponse
    {
        #region 构造函数
        public pubL_7_31_Response()
        {
            this.pubL_7_31_InfoList = new ObservableCollection<pubL_7_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_31_Info> pubL_7_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_31_Info info = new pubL_7_31_Info();
            info.busi_menu_no = unpacker.GetInt("busi_menu_no");
            info.busi_func_code = unpacker.GetStr("busi_func_code");
            pubL_7_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_31_InfoList.Add((pubL_7_31_Info)info);
        }
        #endregion

        //逻辑_公共_权限_查询操作员普通菜单功能
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_7_31_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    info.busi_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR);
                    pubL_7_31_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_7_32_Response : IResponse
    {
        #region 构造函数
        public pubL_7_32_Response()
        {
            this.pubL_7_32_InfoList = new ObservableCollection<pubL_7_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_32_Info> pubL_7_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_32_Info info = new pubL_7_32_Info();
            info.busi_menu_no = unpacker.GetInt("busi_menu_no");
            info.busi_func_code = unpacker.GetStr("busi_func_code");
            pubL_7_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_32_InfoList.Add((pubL_7_32_Info)info);
        }
        #endregion

        //逻辑_公共_权限_查询操作员特殊菜单功能
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_7_32_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    info.busi_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR);
                    pubL_7_32_InfoList.Add(info);
                }
            }
        }
    }

    public class pubL_7_51_Response : IResponse
    {
        #region 构造函数
        public pubL_7_51_Response()
        {
            this.pubL_7_51_InfoList = new ObservableCollection<pubL_7_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_51_Info> pubL_7_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_51_Info info = new pubL_7_51_Info();
            pubL_7_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_51_InfoList.Add((pubL_7_51_Info)info);
        }
        #endregion

        //逻辑_公共_权限_回收菜单功能权限
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_7_51_Info();
                pubL_7_51_InfoList.Add(info);
            }
        }
    }

    public class pubL_7_52_Response : IResponse
    {
        #region 构造函数
        public pubL_7_52_Response()
        {
            this.pubL_7_52_InfoList = new ObservableCollection<pubL_7_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_7_52_Info> pubL_7_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_7_52_Info info = new pubL_7_52_Info();
            pubL_7_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_7_52_InfoList.Add((pubL_7_52_Info)info);
        }
        #endregion

        //逻辑_公共_权限_主推密码权限校验
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_7_52_Info();
                pubL_7_52_InfoList.Add(info);
            }
        }
    }

}
