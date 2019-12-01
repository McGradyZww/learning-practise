using LD.Client.Commom;
using LD.Client.Commom.Enums;
using LD.Client.Commom.Utility;
using LDsdkDefine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
    //逻辑_独立估值_查询核对_新增估值表邮箱配置
    public class ReqFuncvalL_4_1DTO : ReqBaseDTO
    {
        public ReqFuncvalL_4_1DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "valL.4.1";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            mail_server = " ";
            server_type = 0;
            mail_server_protocol = " ";
            mail_server_port = 0;
            mail_server_username = " ";
            mail_server_password = " ";
            ssl_type = 0;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 邮件服务器
        /// </summary>
        public String mail_server { get; set; }
 
        /// <summary>
        /// 服务器类型
        /// </summary>
        public int server_type { get; set; }
 
        /// <summary>
        /// 邮件服务器协议
        /// </summary>
        public String mail_server_protocol { get; set; }
 
        /// <summary>
        /// 邮件服务器端口
        /// </summary>
        public int mail_server_port { get; set; }
 
        /// <summary>
        /// 邮件服务器用户名
        /// </summary>
        public String mail_server_username { get; set; }
 
        /// <summary>
        /// 邮件服务器密码
        /// </summary>
        public String mail_server_password { get; set; }
 
        /// <summary>
        /// SSL标志
        /// </summary>
        public int ssl_type { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("mail_server", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("server_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("mail_server_protocol", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("mail_server_port", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("mail_server_username", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("mail_server_password", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("ssl_type", ELDDATATYPE.LD_DATATYPE_INT);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddStr(mail_server);
            packer.AddInt(server_type);
            packer.AddStr(mail_server_protocol);
            packer.AddInt(mail_server_port);
            packer.AddStr(mail_server_username);
            packer.AddStr(mail_server_password);
            packer.AddInt(ssl_type);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_STR,mail_server);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SERVER_TYPE_INT,server_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PROTOCOL_STR,mail_server_protocol);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PORT_INT,mail_server_port);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_USERNAME_STR,mail_server_username);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PASSWORD_STR,mail_server_password);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SSL_TYPE_INT,ssl_type);
 
            return fastMsg;
        }
    }

    //逻辑_独立估值_查询核对_修改估值表邮箱配置
    public class ReqFuncvalL_4_2DTO : ReqBaseDTO
    {
        public ReqFuncvalL_4_2DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "valL.4.2";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
            co_no = 0;
            mail_server = " ";
            server_type = 0;
            mail_server_protocol = " ";
            mail_server_port = 0;
            mail_server_username = " ";
            mail_server_password = " ";
            ssl_type = 0;
            rule_flag = 0;
        }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 邮件服务器
        /// </summary>
        public String mail_server { get; set; }
 
        /// <summary>
        /// 服务器类型
        /// </summary>
        public int server_type { get; set; }
 
        /// <summary>
        /// 邮件服务器协议
        /// </summary>
        public String mail_server_protocol { get; set; }
 
        /// <summary>
        /// 邮件服务器端口
        /// </summary>
        public int mail_server_port { get; set; }
 
        /// <summary>
        /// 邮件服务器用户名
        /// </summary>
        public String mail_server_username { get; set; }
 
        /// <summary>
        /// 邮件服务器密码
        /// </summary>
        public String mail_server_password { get; set; }
 
        /// <summary>
        /// SSL标志
        /// </summary>
        public int ssl_type { get; set; }
 
        /// <summary>
        /// 启用标志
        /// </summary>
        public int rule_flag { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("mail_server", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("server_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("mail_server_protocol", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("mail_server_port", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("mail_server_username", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("mail_server_password", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("ssl_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("rule_flag", ELDDATATYPE.LD_DATATYPE_INT);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt64(row_id);
            packer.AddInt(co_no);
            packer.AddStr(mail_server);
            packer.AddInt(server_type);
            packer.AddStr(mail_server_protocol);
            packer.AddInt(mail_server_port);
            packer.AddStr(mail_server_username);
            packer.AddStr(mail_server_password);
            packer.AddInt(ssl_type);
            packer.AddInt(rule_flag);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_STR,mail_server);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SERVER_TYPE_INT,server_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PROTOCOL_STR,mail_server_protocol);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PORT_INT,mail_server_port);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_USERNAME_STR,mail_server_username);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MAIL_SERVER_PASSWORD_STR,mail_server_password);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SSL_TYPE_INT,ssl_type);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT,rule_flag);
 
            return fastMsg;
        }
    }

    //逻辑_独立估值_查询核对_查询估值表邮箱配置
    public class ReqFuncvalL_4_3DTO : ReqBaseDTO
    {
        public ReqFuncvalL_4_3DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "valL.4.3";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            rule_flag = 0;
            row_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 启用标志
        /// </summary>
        public int rule_flag { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 指定行数
        /// </summary>
        public int row_count { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("rule_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("row_count", ELDDATATYPE.LD_DATATYPE_INT);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddInt(rule_flag);
            packer.AddInt64(row_id);
            packer.AddInt(row_count);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT,rule_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_独立估值_查询核对_新增托管估值表配置
    public class ReqFuncvalL_4_11DTO : ReqBaseDTO
    {
        public ReqFuncvalL_4_11DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "valL.4.11";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            file_name = " ";
            netvalue_date_posi = " ";
            valtable_begin_row = 0;
            fina_acco_code = " ";
            fina_acco_name = " ";
            crncy_type = "CNY";
            amount = " ";
            unit_cost = " ";
            prime_cost_original = " ";
            prime_cost_crncy = " ";
            cost_net_ratio = " ";
            market_price = " ";
            market_value_original = " ";
            market_value_crncy = " ";
            market_net_ratio = " ";
            evalu_add_original = " ";
            evalu_add_crncy = " ";
            stop_info = " ";
            rights_info = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 文件名称
        /// </summary>
        public String file_name { get; set; }
 
        /// <summary>
        /// 净值日期位置
        /// </summary>
        public String netvalue_date_posi { get; set; }
 
        /// <summary>
        /// 估值表起始行号
        /// </summary>
        public int valtable_begin_row { get; set; }
 
        /// <summary>
        /// 科目代码
        /// </summary>
        public String fina_acco_code { get; set; }
 
        /// <summary>
        /// 科目名称
        /// </summary>
        public String fina_acco_name { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 数量
        /// </summary>
        public String amount { get; set; }
 
        /// <summary>
        /// 单位成本
        /// </summary>
        public String unit_cost { get; set; }
 
        /// <summary>
        /// 成本原币
        /// </summary>
        public String prime_cost_original { get; set; }
 
        /// <summary>
        /// 成本本币
        /// </summary>
        public String prime_cost_crncy { get; set; }
 
        /// <summary>
        /// 成本占净值
        /// </summary>
        public String cost_net_ratio { get; set; }
 
        /// <summary>
        /// 市价
        /// </summary>
        public String market_price { get; set; }
 
        /// <summary>
        /// 市值原币
        /// </summary>
        public String market_value_original { get; set; }
 
        /// <summary>
        /// 市值本币
        /// </summary>
        public String market_value_crncy { get; set; }
 
        /// <summary>
        /// 市值占净值
        /// </summary>
        public String market_net_ratio { get; set; }
 
        /// <summary>
        /// 估值增值原币
        /// </summary>
        public String evalu_add_original { get; set; }
 
        /// <summary>
        /// 估值增值本币
        /// </summary>
        public String evalu_add_crncy { get; set; }
 
        /// <summary>
        /// 停牌信息
        /// </summary>
        public String stop_info { get; set; }
 
        /// <summary>
        /// 权益信息
        /// </summary>
        public String rights_info { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("file_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("netvalue_date_posi", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("valtable_begin_row", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fina_acco_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("fina_acco_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("amount", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("unit_cost", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("prime_cost_original", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("prime_cost_crncy", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("cost_net_ratio", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("market_price", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("market_value_original", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("market_value_crncy", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("market_net_ratio", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("evalu_add_original", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("evalu_add_crncy", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stop_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("rights_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddStr(file_name);
            packer.AddStr(netvalue_date_posi);
            packer.AddInt(valtable_begin_row);
            packer.AddStr(fina_acco_code);
            packer.AddStr(fina_acco_name);
            packer.AddStr(crncy_type);
            packer.AddStr(amount);
            packer.AddStr(unit_cost);
            packer.AddStr(prime_cost_original);
            packer.AddStr(prime_cost_crncy);
            packer.AddStr(cost_net_ratio);
            packer.AddStr(market_price);
            packer.AddStr(market_value_original);
            packer.AddStr(market_value_crncy);
            packer.AddStr(market_net_ratio);
            packer.AddStr(evalu_add_original);
            packer.AddStr(evalu_add_crncy);
            packer.AddStr(stop_info);
            packer.AddStr(rights_info);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FILE_NAME_STR,file_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_NETVALUE_DATE_POSI_STR,netvalue_date_posi);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALTABLE_BEGIN_ROW_INT,valtable_begin_row);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR,fina_acco_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR,fina_acco_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_AMOUNT_STR,amount);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_COST_STR,unit_cost);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_ORIGINAL_STR,prime_cost_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_CRNCY_STR,prime_cost_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COST_NET_RATIO_STR,cost_net_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_STR,market_price);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_ORIGINAL_STR,market_value_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_CRNCY_STR,market_value_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_NET_RATIO_STR,market_net_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_ORIGINAL_STR,evalu_add_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_CRNCY_STR,evalu_add_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_INFO_STR,stop_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_INFO_STR,rights_info);
 
            return fastMsg;
        }
    }

    //逻辑_独立估值_查询核对_修改托管估值表配置
    public class ReqFuncvalL_4_12DTO : ReqBaseDTO
    {
        public ReqFuncvalL_4_12DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "valL.4.12";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            file_name = " ";
            netvalue_date_posi = " ";
            valtable_begin_row = 0;
            fina_acco_code = " ";
            fina_acco_name = " ";
            crncy_type = "CNY";
            amount = " ";
            unit_cost = " ";
            prime_cost_original = " ";
            prime_cost_crncy = " ";
            cost_net_ratio = " ";
            market_price = " ";
            market_value_original = " ";
            market_value_crncy = " ";
            market_net_ratio = " ";
            evalu_add_original = " ";
            evalu_add_crncy = " ";
            stop_info = " ";
            rights_info = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 文件名称
        /// </summary>
        public String file_name { get; set; }
 
        /// <summary>
        /// 净值日期位置
        /// </summary>
        public String netvalue_date_posi { get; set; }
 
        /// <summary>
        /// 估值表起始行号
        /// </summary>
        public int valtable_begin_row { get; set; }
 
        /// <summary>
        /// 科目代码
        /// </summary>
        public String fina_acco_code { get; set; }
 
        /// <summary>
        /// 科目名称
        /// </summary>
        public String fina_acco_name { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 数量
        /// </summary>
        public String amount { get; set; }
 
        /// <summary>
        /// 单位成本
        /// </summary>
        public String unit_cost { get; set; }
 
        /// <summary>
        /// 成本原币
        /// </summary>
        public String prime_cost_original { get; set; }
 
        /// <summary>
        /// 成本本币
        /// </summary>
        public String prime_cost_crncy { get; set; }
 
        /// <summary>
        /// 成本占净值
        /// </summary>
        public String cost_net_ratio { get; set; }
 
        /// <summary>
        /// 市价
        /// </summary>
        public String market_price { get; set; }
 
        /// <summary>
        /// 市值原币
        /// </summary>
        public String market_value_original { get; set; }
 
        /// <summary>
        /// 市值本币
        /// </summary>
        public String market_value_crncy { get; set; }
 
        /// <summary>
        /// 市值占净值
        /// </summary>
        public String market_net_ratio { get; set; }
 
        /// <summary>
        /// 估值增值原币
        /// </summary>
        public String evalu_add_original { get; set; }
 
        /// <summary>
        /// 估值增值本币
        /// </summary>
        public String evalu_add_crncy { get; set; }
 
        /// <summary>
        /// 停牌信息
        /// </summary>
        public String stop_info { get; set; }
 
        /// <summary>
        /// 权益信息
        /// </summary>
        public String rights_info { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("file_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("netvalue_date_posi", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("valtable_begin_row", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fina_acco_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("fina_acco_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("amount", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("unit_cost", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("prime_cost_original", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("prime_cost_crncy", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("cost_net_ratio", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("market_price", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("market_value_original", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("market_value_crncy", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("market_net_ratio", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("evalu_add_original", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("evalu_add_crncy", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stop_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("rights_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddStr(file_name);
            packer.AddStr(netvalue_date_posi);
            packer.AddInt(valtable_begin_row);
            packer.AddStr(fina_acco_code);
            packer.AddStr(fina_acco_name);
            packer.AddStr(crncy_type);
            packer.AddStr(amount);
            packer.AddStr(unit_cost);
            packer.AddStr(prime_cost_original);
            packer.AddStr(prime_cost_crncy);
            packer.AddStr(cost_net_ratio);
            packer.AddStr(market_price);
            packer.AddStr(market_value_original);
            packer.AddStr(market_value_crncy);
            packer.AddStr(market_net_ratio);
            packer.AddStr(evalu_add_original);
            packer.AddStr(evalu_add_crncy);
            packer.AddStr(stop_info);
            packer.AddStr(rights_info);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FILE_NAME_STR,file_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_NETVALUE_DATE_POSI_STR,netvalue_date_posi);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALTABLE_BEGIN_ROW_INT,valtable_begin_row);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR,fina_acco_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR,fina_acco_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_AMOUNT_STR,amount);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_COST_STR,unit_cost);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_ORIGINAL_STR,prime_cost_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_CRNCY_STR,prime_cost_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COST_NET_RATIO_STR,cost_net_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_STR,market_price);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_ORIGINAL_STR,market_value_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_CRNCY_STR,market_value_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_NET_RATIO_STR,market_net_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_ORIGINAL_STR,evalu_add_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_CRNCY_STR,evalu_add_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_INFO_STR,stop_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_INFO_STR,rights_info);
 
            return fastMsg;
        }
    }

    //逻辑_独立估值_查询核对_查询托管估值表配置
    public class ReqFuncvalL_4_13DTO : ReqBaseDTO
    {
        public ReqFuncvalL_4_13DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "valL.4.13";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            row_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 指定行数
        /// </summary>
        public int row_count { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("row_count", ELDDATATYPE.LD_DATATYPE_INT);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt64(row_id);
            packer.AddInt(row_count);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_独立估值_查询核对_新增托管估值表
    public class ReqFuncvalL_4_21DTO : ReqBaseDTO
    {
        public ReqFuncvalL_4_21DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "valL.4.21";
            CommonDTO.func_code = CommonDTO.function_code;
            evalu_date = 0;
            co_no = 0;
            pd_no = 0;
            valtable_no = 0;
            fina_acco_code = " ";
            fina_acco_name = " ";
            crncy_type = "CNY";
            amount = " ";
            unit_cost = " ";
            prime_cost_original = " ";
            prime_cost_crncy = " ";
            cost_net_ratio = " ";
            market_price = " ";
            market_value_original = " ";
            market_value_crncy = " ";
            market_net_ratio = " ";
            evalu_add_original = " ";
            evalu_add_crncy = " ";
            stop_info = " ";
            rights_info = " ";
        }
 
        /// <summary>
        /// 估值日期
        /// </summary>
        public int evalu_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 估值表行号
        /// </summary>
        public int valtable_no { get; set; }
 
        /// <summary>
        /// 科目代码
        /// </summary>
        public String fina_acco_code { get; set; }
 
        /// <summary>
        /// 科目名称
        /// </summary>
        public String fina_acco_name { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 数量
        /// </summary>
        public String amount { get; set; }
 
        /// <summary>
        /// 单位成本
        /// </summary>
        public String unit_cost { get; set; }
 
        /// <summary>
        /// 成本原币
        /// </summary>
        public String prime_cost_original { get; set; }
 
        /// <summary>
        /// 成本本币
        /// </summary>
        public String prime_cost_crncy { get; set; }
 
        /// <summary>
        /// 成本占净值
        /// </summary>
        public String cost_net_ratio { get; set; }
 
        /// <summary>
        /// 市价
        /// </summary>
        public String market_price { get; set; }
 
        /// <summary>
        /// 市值原币
        /// </summary>
        public String market_value_original { get; set; }
 
        /// <summary>
        /// 市值本币
        /// </summary>
        public String market_value_crncy { get; set; }
 
        /// <summary>
        /// 市值占净值
        /// </summary>
        public String market_net_ratio { get; set; }
 
        /// <summary>
        /// 估值增值原币
        /// </summary>
        public String evalu_add_original { get; set; }
 
        /// <summary>
        /// 估值增值本币
        /// </summary>
        public String evalu_add_crncy { get; set; }
 
        /// <summary>
        /// 停牌信息
        /// </summary>
        public String stop_info { get; set; }
 
        /// <summary>
        /// 权益信息
        /// </summary>
        public String rights_info { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("evalu_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("valtable_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("fina_acco_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("fina_acco_name", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("amount", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("unit_cost", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("prime_cost_original", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("prime_cost_crncy", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("cost_net_ratio", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("market_price", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("market_value_original", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("market_value_crncy", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("market_net_ratio", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("evalu_add_original", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("evalu_add_crncy", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stop_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("rights_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(evalu_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(valtable_no);
            packer.AddStr(fina_acco_code);
            packer.AddStr(fina_acco_name);
            packer.AddStr(crncy_type);
            packer.AddStr(amount);
            packer.AddStr(unit_cost);
            packer.AddStr(prime_cost_original);
            packer.AddStr(prime_cost_crncy);
            packer.AddStr(cost_net_ratio);
            packer.AddStr(market_price);
            packer.AddStr(market_value_original);
            packer.AddStr(market_value_crncy);
            packer.AddStr(market_net_ratio);
            packer.AddStr(evalu_add_original);
            packer.AddStr(evalu_add_crncy);
            packer.AddStr(stop_info);
            packer.AddStr(rights_info);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_VALTABLE_NO_INT,valtable_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_CODE_STR,fina_acco_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FINA_ACCO_NAME_STR,fina_acco_name);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR,crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_AMOUNT_STR,amount);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_COST_STR,unit_cost);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_ORIGINAL_STR,prime_cost_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRIME_COST_CRNCY_STR,prime_cost_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COST_NET_RATIO_STR,cost_net_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_STR,market_price);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_ORIGINAL_STR,market_value_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_CRNCY_STR,market_value_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_NET_RATIO_STR,market_net_ratio);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_ORIGINAL_STR,evalu_add_original);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_ADD_CRNCY_STR,evalu_add_crncy);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOP_INFO_STR,stop_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_RIGHTS_INFO_STR,rights_info);
 
            return fastMsg;
        }
    }

    //逻辑_独立估值_查询核对_查询托管估值表
    public class ReqFuncvalL_4_22DTO : ReqBaseDTO
    {
        public ReqFuncvalL_4_22DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "valL.4.22";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            evalu_date = 0;
            row_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 估值日期
        /// </summary>
        public int evalu_date { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 指定行数
        /// </summary>
        public int row_count { get; set; }
 
        public override LDsdkDefine.LDPackerAdapter CreatePacker()
        {
            var packer = new LDPackerAdapter();
 
            packer.BeginPack();
            #region CommonDTOFiled
            packer.AddField("opor_co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("opor_pwd", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_mac", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_ip_addr", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("menu_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("func_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("token", ELDDATATYPE.LD_DATATYPE_STRING);
            #endregion
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("evalu_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("row_count", ELDDATATYPE.LD_DATATYPE_INT);
 
            #region CommonDTOValue
            packer.AddInt(CommonDTO.opor_co_no);
            packer.AddInt(CommonDTO.opor_no);
            packer.AddStr(CommonDTO.opor_pwd);
            packer.AddStr(CommonDTO.oper_mac);
            packer.AddStr(CommonDTO.oper_ip_addr);
            packer.AddStr(CommonDTO.oper_info);
            packer.AddStr(CommonDTO.oper_way);
            packer.AddInt(CommonDTO.menu_no);
            packer.AddStr(CommonDTO.func_code);
            packer.AddStr(CommonDTO.SessionID);
            #endregion
 
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(evalu_date);
            packer.AddInt64(row_id);
            packer.AddInt(row_count);
            packer.EndPack();
 
            return packer;
        }
        public override LDsdkDefineEx.LDFastMessageAdapter CreateFastMessage()
        {
            var fastMsg = new LDsdkDefineEx.LDFastMessageAdapter(CommonDTO.func_code, 0);

            #region CommonDTOFiled 默认参数，固定格式
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT, CommonDTO.opor_co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT,  CommonDTO.opor_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR, CommonDTO.opor_pwd);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR, CommonDTO.oper_mac);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR, CommonDTO.oper_ip_addr);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR, CommonDTO.oper_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR, CommonDTO.oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MENU_NO_INT, CommonDTO.menu_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_FUNC_CODE_STR, CommonDTO.func_code);
            #endregion

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_DATE_INT,evalu_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

}
