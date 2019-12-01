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
    //逻辑_交易证券_指令_新增指令
    public class ReqFunctdsecuL_3_1DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_1DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.1";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            exch_no = 0;
            stock_code = " ";
            comm_batch_no = 0;
            comm_executor = 0;
            comm_dir = 0;
            price_kind = 0;
            ctrl_type = 0;
            comm_limit_price = 0;
            limit_actual_price = 0;
            comm_qty = 0;
            comm_amt = 0;
            comm_remark = " ";
            comm_begin_date = 0;
            comm_end_date = 0;
            comm_begin_time = 0;
            comm_end_time = 0;
            external_no = 0;
            basket_id = 0;
            comm_oper_way = " ";
            comm_remark_info = " ";
            acco_concat_info = " ";
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// 价格方式
        /// </summary>
        public int price_kind { get; set; }
 
        /// <summary>
        /// 控制方式
        /// </summary>
        public int ctrl_type { get; set; }
 
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// 指令说明
        /// </summary>
        public String comm_remark { get; set; }
 
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 指令备注信息
        /// </summary>
        public String comm_remark_info { get; set; }
 
        /// <summary>
        /// 账户拼接信息
        /// </summary>
        public String acco_concat_info { get; set; }
 
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
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("price_kind", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("ctrl_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_limit_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("limit_actual_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("comm_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("comm_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("comm_remark", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_begin_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_end_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("external_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("basket_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("acco_concat_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt(exch_no);
            packer.AddStr(stock_code);
            packer.AddInt(comm_batch_no);
            packer.AddInt(comm_executor);
            packer.AddInt(comm_dir);
            packer.AddInt(price_kind);
            packer.AddInt(ctrl_type);
            packer.AddDouble(comm_limit_price);
            packer.AddDouble(limit_actual_price);
            packer.AddDouble(comm_qty);
            packer.AddDouble(comm_amt);
            packer.AddStr(comm_remark);
            packer.AddInt(comm_begin_date);
            packer.AddInt(comm_end_date);
            packer.AddInt(comm_begin_time);
            packer.AddInt(comm_end_time);
            packer.AddInt64(external_no);
            packer.AddInt64(basket_id);
            packer.AddStr(comm_oper_way);
            packer.AddStr(comm_remark_info);
            packer.AddStr(acco_concat_info);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT,comm_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_KIND_INT,price_kind);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CTRL_TYPE_INT,ctrl_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT,comm_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,limit_actual_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT,comm_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT,comm_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_STR,comm_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT,comm_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT,comm_end_time);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR,comm_remark_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR,acco_concat_info);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_撤销指令
    public class ReqFunctdsecuL_3_2DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_2DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.2";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no = 0;
            comm_id = 0;
            cancel_info = " ";
            is_withdraw = 0;
        }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 撤销说明
        /// </summary>
        public String cancel_info { get; set; }
 
        /// <summary>
        /// 是否撤单
        /// </summary>
        public int is_withdraw { get; set; }
 
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
 
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("cancel_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("is_withdraw", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(exch_no);
            packer.AddInt64(comm_id);
            packer.AddStr(cancel_info);
            packer.AddInt(is_withdraw);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CANCEL_INFO_STR,cancel_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_修改指令
    public class ReqFunctdsecuL_3_3DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_3DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.3";
            CommonDTO.func_code = CommonDTO.function_code;
            comm_id = 0;
            comm_dir = 0;
            comm_limit_price = 0;
            limit_actual_price = 0;
            comm_qty = 0;
            comm_amt = 0;
            comm_begin_date = 0;
            comm_end_date = 0;
            comm_begin_time = 0;
            comm_end_time = 0;
            comm_remark_info = " ";
            read_flag = 0;
            modi_info = " ";
        }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// 指令备注信息
        /// </summary>
        public String comm_remark_info { get; set; }
 
        /// <summary>
        /// 已读标记
        /// </summary>
        public int read_flag { get; set; }
 
        /// <summary>
        /// 修改说明
        /// </summary>
        public String modi_info { get; set; }
 
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
 
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_limit_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("limit_actual_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("comm_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("comm_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("comm_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_begin_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_end_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("read_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("modi_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt64(comm_id);
            packer.AddInt(comm_dir);
            packer.AddDouble(comm_limit_price);
            packer.AddDouble(limit_actual_price);
            packer.AddDouble(comm_qty);
            packer.AddDouble(comm_amt);
            packer.AddInt(comm_begin_date);
            packer.AddInt(comm_end_date);
            packer.AddInt(comm_begin_time);
            packer.AddInt(comm_end_time);
            packer.AddStr(comm_remark_info);
            packer.AddInt(read_flag);
            packer.AddStr(modi_info);
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

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT,comm_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT,comm_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,limit_actual_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT,comm_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT,comm_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT,comm_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT,comm_end_time);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR,comm_remark_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_READ_FLAG_INT,read_flag);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MODI_INFO_STR,modi_info);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_审批指令
    public class ReqFunctdsecuL_3_4DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_4DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.4";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no = 0;
            comm_id = 0;
            comm_date = 0;
            comm_appr_status = " ";
            comm_appr_remark = " ";
        }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令审批状态
        /// </summary>
        public String comm_appr_status { get; set; }
 
        /// <summary>
        /// 指令审批说明
        /// </summary>
        public String comm_appr_remark { get; set; }
 
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
 
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_appr_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_appr_remark", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(exch_no);
            packer.AddInt64(comm_id);
            packer.AddInt(comm_date);
            packer.AddStr(comm_appr_status);
            packer.AddStr(comm_appr_remark);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR,comm_appr_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_REMARK_STR,comm_appr_remark);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_分发指令
    public class ReqFunctdsecuL_3_5DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_5DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.5";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no = 0;
            co_no = 0;
            exch_group_no = 0;
            comm_id = 0;
            comm_executor = 0;
            is_withdraw = 0;
            disp_remark = " ";
        }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 是否撤单
        /// </summary>
        public int is_withdraw { get; set; }
 
        /// <summary>
        /// 分发说明
        /// </summary>
        public String disp_remark { get; set; }
 
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
 
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("is_withdraw", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("disp_remark", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(exch_no);
            packer.AddInt(co_no);
            packer.AddInt(exch_group_no);
            packer.AddInt64(comm_id);
            packer.AddInt(comm_executor);
            packer.AddInt(is_withdraw);
            packer.AddStr(disp_remark);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DISP_REMARK_STR,disp_remark);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_新增篮子批量指令
    public class ReqFunctdsecuL_3_6DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_6DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.6";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            exch_no_str = " ";
            stock_code_str = " ";
            comm_batch_no = 0;
            comm_executor = 0;
            comm_dir_str = " ";
            price_kind = 0;
            ctrl_type = 0;
            limit_price_str = " ";
            limit_actual_price_str = " ";
            comm_qty_str = " ";
            comm_amt_str = " ";
            comm_remark = " ";
            comm_begin_date = 0;
            comm_end_date = 0;
            comm_begin_time = 0;
            comm_end_time = 0;
            basket_id = 0;
            external_no = 0;
            comm_oper_way = " ";
            comm_remark_info = " ";
            acco_concat_info = " ";
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券代码串
        /// </summary>
        public String stock_code_str { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令方向串
        /// </summary>
        public String comm_dir_str { get; set; }
 
        /// <summary>
        /// 价格方式
        /// </summary>
        public int price_kind { get; set; }
 
        /// <summary>
        /// 控制方式
        /// </summary>
        public int ctrl_type { get; set; }
 
        /// <summary>
        /// 指令限价串
        /// </summary>
        public String limit_price_str { get; set; }
 
        /// <summary>
        /// 指令实际限价串
        /// </summary>
        public String limit_actual_price_str { get; set; }
 
        /// <summary>
        /// 指令数量串
        /// </summary>
        public String comm_qty_str { get; set; }
 
        /// <summary>
        /// 指令金额串
        /// </summary>
        public String comm_amt_str { get; set; }
 
        /// <summary>
        /// 指令说明
        /// </summary>
        public String comm_remark { get; set; }
 
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 指令备注信息
        /// </summary>
        public String comm_remark_info { get; set; }
 
        /// <summary>
        /// 账户拼接信息
        /// </summary>
        public String acco_concat_info { get; set; }
 
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
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("price_kind", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("ctrl_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("limit_price_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("limit_actual_price_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_qty_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_amt_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_remark", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_begin_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_end_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("basket_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("external_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("acco_concat_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddStr(exch_no_str);
            packer.AddStr(stock_code_str);
            packer.AddInt(comm_batch_no);
            packer.AddInt(comm_executor);
            packer.AddStr(comm_dir_str);
            packer.AddInt(price_kind);
            packer.AddInt(ctrl_type);
            packer.AddStr(limit_price_str);
            packer.AddStr(limit_actual_price_str);
            packer.AddStr(comm_qty_str);
            packer.AddStr(comm_amt_str);
            packer.AddStr(comm_remark);
            packer.AddInt(comm_begin_date);
            packer.AddInt(comm_end_date);
            packer.AddInt(comm_begin_time);
            packer.AddInt(comm_end_time);
            packer.AddInt64(basket_id);
            packer.AddInt64(external_no);
            packer.AddStr(comm_oper_way);
            packer.AddStr(comm_remark_info);
            packer.AddStr(acco_concat_info);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_KIND_INT,price_kind);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CTRL_TYPE_INT,ctrl_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_PRICE_STR_STR,limit_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_STR_STR,limit_actual_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_STR_STR,comm_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_STR_STR,comm_amt_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_STR,comm_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT,comm_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT,comm_end_time);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR,comm_remark_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR,acco_concat_info);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_批量分发指令
    public class ReqFunctdsecuL_3_7DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_7DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.7";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            exch_group_no = 0;
            comm_date = 0;
            comm_batch_no = 0;
            comm_executor = 0;
            is_withdraw = 0;
            disp_remark = " ";
        }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 是否撤单
        /// </summary>
        public int is_withdraw { get; set; }
 
        /// <summary>
        /// 分发说明
        /// </summary>
        public String disp_remark { get; set; }
 
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
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("is_withdraw", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("disp_remark", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(exch_group_no);
            packer.AddInt(comm_date);
            packer.AddInt(comm_batch_no);
            packer.AddInt(comm_executor);
            packer.AddInt(is_withdraw);
            packer.AddStr(disp_remark);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DISP_REMARK_STR,disp_remark);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_新增调仓指令
    public class ReqFunctdsecuL_3_8DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_8DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.8";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            exch_no_str = " ";
            stock_code_str = " ";
            comm_batch_no = 0;
            comm_executor = 0;
            comm_dir_str = " ";
            price_kind = 0;
            ctrl_type = 0;
            limit_price_str = " ";
            limit_actual_price_str = " ";
            comm_qty_str = " ";
            comm_amt_str = " ";
            comm_remark = " ";
            comm_begin_date = 0;
            comm_end_date = 0;
            comm_begin_time = 0;
            comm_end_time = 0;
            basket_id = 0;
            external_no = 0;
            comm_oper_way = " ";
            comm_frozen_amt = 0;
            comm_remark_info = " ";
            acco_concat_info = " ";
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券代码串
        /// </summary>
        public String stock_code_str { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令方向串
        /// </summary>
        public String comm_dir_str { get; set; }
 
        /// <summary>
        /// 价格方式
        /// </summary>
        public int price_kind { get; set; }
 
        /// <summary>
        /// 控制方式
        /// </summary>
        public int ctrl_type { get; set; }
 
        /// <summary>
        /// 指令限价串
        /// </summary>
        public String limit_price_str { get; set; }
 
        /// <summary>
        /// 指令实际限价串
        /// </summary>
        public String limit_actual_price_str { get; set; }
 
        /// <summary>
        /// 指令数量串
        /// </summary>
        public String comm_qty_str { get; set; }
 
        /// <summary>
        /// 指令金额串
        /// </summary>
        public String comm_amt_str { get; set; }
 
        /// <summary>
        /// 指令说明
        /// </summary>
        public String comm_remark { get; set; }
 
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 指令冻结金额
        /// </summary>
        public double comm_frozen_amt { get; set; }
 
        /// <summary>
        /// 指令备注信息
        /// </summary>
        public String comm_remark_info { get; set; }
 
        /// <summary>
        /// 账户拼接信息
        /// </summary>
        public String acco_concat_info { get; set; }
 
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
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("price_kind", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("ctrl_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("limit_price_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("limit_actual_price_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_qty_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_amt_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_remark", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_begin_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_end_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("basket_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("external_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_frozen_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("comm_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("acco_concat_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddStr(exch_no_str);
            packer.AddStr(stock_code_str);
            packer.AddInt(comm_batch_no);
            packer.AddInt(comm_executor);
            packer.AddStr(comm_dir_str);
            packer.AddInt(price_kind);
            packer.AddInt(ctrl_type);
            packer.AddStr(limit_price_str);
            packer.AddStr(limit_actual_price_str);
            packer.AddStr(comm_qty_str);
            packer.AddStr(comm_amt_str);
            packer.AddStr(comm_remark);
            packer.AddInt(comm_begin_date);
            packer.AddInt(comm_end_date);
            packer.AddInt(comm_begin_time);
            packer.AddInt(comm_end_time);
            packer.AddInt64(basket_id);
            packer.AddInt64(external_no);
            packer.AddStr(comm_oper_way);
            packer.AddDouble(comm_frozen_amt);
            packer.AddStr(comm_remark_info);
            packer.AddStr(acco_concat_info);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_KIND_INT,price_kind);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CTRL_TYPE_INT,ctrl_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_PRICE_STR_STR,limit_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_STR_STR,limit_actual_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_STR_STR,comm_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_STR_STR,comm_amt_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_STR,comm_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT,comm_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT,comm_end_time);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT,comm_frozen_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR,comm_remark_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR,acco_concat_info);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_新增组合指令
    public class ReqFunctdsecuL_3_9DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_9DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.9";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            combo_code = " ";
            combo_copies = 0;
            exch_no_str = " ";
            stock_code_str = " ";
            target_stock_code_str = " ";
            comm_batch_no = 0;
            comm_executor = 0;
            comm_begin_date = 0;
            comm_end_date = 0;
            comm_begin_time = 0;
            comm_end_time = 0;
            order_batch_no = 0;
            comm_dir_str = " ";
            price_type_str = " ";
            comm_qty_str = " ";
            limit_price_str = " ";
            limit_actual_price_str = " ";
            comm_amt_str = " ";
            comm_oper_way = " ";
            basket_id = 0;
            combo_posi_id_str = " ";
            acco_concat_info = " ";
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 组合代码
        /// </summary>
        public String combo_code { get; set; }
 
        /// <summary>
        /// 组合份数
        /// </summary>
        public double combo_copies { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券代码串
        /// </summary>
        public String stock_code_str { get; set; }
 
        /// <summary>
        /// 目标证券代码串
        /// </summary>
        public String target_stock_code_str { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// 指令方向串
        /// </summary>
        public String comm_dir_str { get; set; }
 
        /// <summary>
        /// 价格类型串
        /// </summary>
        public String price_type_str { get; set; }
 
        /// <summary>
        /// 指令数量串
        /// </summary>
        public String comm_qty_str { get; set; }
 
        /// <summary>
        /// 指令限价串
        /// </summary>
        public String limit_price_str { get; set; }
 
        /// <summary>
        /// 指令实际限价串
        /// </summary>
        public String limit_actual_price_str { get; set; }
 
        /// <summary>
        /// 指令金额串
        /// </summary>
        public String comm_amt_str { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 组合持仓序号串
        /// </summary>
        public String combo_posi_id_str { get; set; }
 
        /// <summary>
        /// 账户拼接信息
        /// </summary>
        public String acco_concat_info { get; set; }
 
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
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("combo_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("combo_copies", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("target_stock_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_begin_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_end_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("price_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_qty_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("limit_price_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("limit_actual_price_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_amt_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("basket_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("combo_posi_id_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("acco_concat_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddStr(combo_code);
            packer.AddDouble(combo_copies);
            packer.AddStr(exch_no_str);
            packer.AddStr(stock_code_str);
            packer.AddStr(target_stock_code_str);
            packer.AddInt(comm_batch_no);
            packer.AddInt(comm_executor);
            packer.AddInt(comm_begin_date);
            packer.AddInt(comm_end_date);
            packer.AddInt(comm_begin_time);
            packer.AddInt(comm_end_time);
            packer.AddInt(order_batch_no);
            packer.AddStr(comm_dir_str);
            packer.AddStr(price_type_str);
            packer.AddStr(comm_qty_str);
            packer.AddStr(limit_price_str);
            packer.AddStr(limit_actual_price_str);
            packer.AddStr(comm_amt_str);
            packer.AddStr(comm_oper_way);
            packer.AddInt64(basket_id);
            packer.AddStr(combo_posi_id_str);
            packer.AddStr(acco_concat_info);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT,combo_copies);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STOCK_CODE_STR_STR,target_stock_code_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT,comm_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT,comm_end_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_STR_STR,price_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_STR_STR,comm_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_PRICE_STR_STR,limit_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_STR_STR,limit_actual_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_STR_STR,comm_amt_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_POSI_ID_STR_STR,combo_posi_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR,acco_concat_info);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_查询指令
    public class ReqFunctdsecuL_3_51DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_51DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.51";
            CommonDTO.func_code = CommonDTO.function_code;
            comm_id = 0;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            comm_opor = 0;
            comm_executor = 0;
            comm_appr_oper = 0;
            comm_appr_status_str = " ";
            exch_no_str = " ";
            stock_code_no = 0;
            stock_type_str = " ";
            asset_type_str = " ";
            comm_dir_str = " ";
            comm_status_str = " ";
            strike_status_str = " ";
            basket_id = 0;
            comm_oper_way = " ";
            exter_comm_flag = 0;
            comm_comple_flag = 0;
            row_id = 0;
            row_count = -1;
            sort_type = 1;
        }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令审批操作员
        /// </summary>
        public int comm_appr_oper { get; set; }
 
        /// <summary>
        /// 指令审批状态串
        /// </summary>
        public String comm_appr_status_str { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型串
        /// </summary>
        public String stock_type_str { get; set; }
 
        /// <summary>
        /// 资产类型串
        /// </summary>
        public String asset_type_str { get; set; }
 
        /// <summary>
        /// 指令方向串
        /// </summary>
        public String comm_dir_str { get; set; }
 
        /// <summary>
        /// 指令状态串
        /// </summary>
        public String comm_status_str { get; set; }
 
        /// <summary>
        /// 成交状态串
        /// </summary>
        public String strike_status_str { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// 指令完成标志
        /// </summary>
        public int comm_comple_flag { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 指定行数
        /// </summary>
        public int row_count { get; set; }
 
        /// <summary>
        /// 排序方式
        /// </summary>
        public int sort_type { get; set; }
 
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
 
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_opor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_appr_oper", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_appr_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("asset_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strike_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("basket_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exter_comm_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_comple_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("row_count", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("sort_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt64(comm_id);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt(comm_opor);
            packer.AddInt(comm_executor);
            packer.AddInt(comm_appr_oper);
            packer.AddStr(comm_appr_status_str);
            packer.AddStr(exch_no_str);
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_type_str);
            packer.AddStr(asset_type_str);
            packer.AddStr(comm_dir_str);
            packer.AddStr(comm_status_str);
            packer.AddStr(strike_status_str);
            packer.AddInt64(basket_id);
            packer.AddStr(comm_oper_way);
            packer.AddInt(exter_comm_flag);
            packer.AddInt(comm_comple_flag);
            packer.AddInt64(row_id);
            packer.AddInt(row_count);
            packer.AddInt(sort_type);
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

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT,comm_appr_oper);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR_STR,comm_appr_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_STR_STR,asset_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR_STR,comm_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR_STR,strike_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_FLAG_INT,comm_comple_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_查询指令历史
    public class ReqFunctdsecuL_3_52DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_52DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.52";
            CommonDTO.func_code = CommonDTO.function_code;
            begin_date = 0;
            end_date = 0;
            comm_id = 0;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            comm_opor = 0;
            comm_executor = 0;
            comm_appr_oper = 0;
            comm_appr_status_str = " ";
            exch_no_str = " ";
            stock_code_no = 0;
            stock_type_str = " ";
            asset_type_str = " ";
            comm_dir_str = " ";
            comm_status_str = " ";
            strike_status_str = " ";
            basket_id = 0;
            comm_oper_way = " ";
            exter_comm_flag = 0;
            comm_comple_flag = 0;
            row_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令审批操作员
        /// </summary>
        public int comm_appr_oper { get; set; }
 
        /// <summary>
        /// 指令审批状态串
        /// </summary>
        public String comm_appr_status_str { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型串
        /// </summary>
        public String stock_type_str { get; set; }
 
        /// <summary>
        /// 资产类型串
        /// </summary>
        public String asset_type_str { get; set; }
 
        /// <summary>
        /// 指令方向串
        /// </summary>
        public String comm_dir_str { get; set; }
 
        /// <summary>
        /// 指令状态串
        /// </summary>
        public String comm_status_str { get; set; }
 
        /// <summary>
        /// 成交状态串
        /// </summary>
        public String strike_status_str { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// 指令完成标志
        /// </summary>
        public int comm_comple_flag { get; set; }
 
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
 
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_opor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_appr_oper", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_appr_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("asset_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strike_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("basket_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exter_comm_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_comple_flag", ELDDATATYPE.LD_DATATYPE_INT);
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
 
            packer.AddInt(begin_date);
            packer.AddInt(end_date);
            packer.AddInt64(comm_id);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt(comm_opor);
            packer.AddInt(comm_executor);
            packer.AddInt(comm_appr_oper);
            packer.AddStr(comm_appr_status_str);
            packer.AddStr(exch_no_str);
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_type_str);
            packer.AddStr(asset_type_str);
            packer.AddStr(comm_dir_str);
            packer.AddStr(comm_status_str);
            packer.AddStr(strike_status_str);
            packer.AddInt64(basket_id);
            packer.AddStr(comm_oper_way);
            packer.AddInt(exter_comm_flag);
            packer.AddInt(comm_comple_flag);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT,comm_appr_oper);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR_STR,comm_appr_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_STR_STR,asset_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR_STR,comm_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR_STR,strike_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_FLAG_INT,comm_comple_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_查询指令分发
    public class ReqFunctdsecuL_3_53DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_53DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.53";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            exch_no_str = " ";
            stock_code_no = 0;
            stock_type_str = " ";
            disp_opor = 0;
            before_comm_executor = 0;
            comm_executor = 0;
            comm_id = 0;
            comm_dir_str = " ";
            exter_comm_flag = 0;
            row_id = 0;
            row_count = -1;
            sort_type = 1;
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型串
        /// </summary>
        public String stock_type_str { get; set; }
 
        /// <summary>
        /// 分发操作员
        /// </summary>
        public int disp_opor { get; set; }
 
        /// <summary>
        /// 前指令执行人
        /// </summary>
        public int before_comm_executor { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令方向串
        /// </summary>
        public String comm_dir_str { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 指定行数
        /// </summary>
        public int row_count { get; set; }
 
        /// <summary>
        /// 排序方式
        /// </summary>
        public int sort_type { get; set; }
 
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
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("disp_opor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("before_comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exter_comm_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("row_count", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("sort_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(exch_group_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_type_str);
            packer.AddInt(disp_opor);
            packer.AddInt(before_comm_executor);
            packer.AddInt(comm_executor);
            packer.AddInt64(comm_id);
            packer.AddStr(comm_dir_str);
            packer.AddInt(exter_comm_flag);
            packer.AddInt64(row_id);
            packer.AddInt(row_count);
            packer.AddInt(sort_type);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_OPOR_INT,disp_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEFORE_COMM_EXECUTOR_INT,before_comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_查询指令分发历史
    public class ReqFunctdsecuL_3_54DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_54DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.54";
            CommonDTO.func_code = CommonDTO.function_code;
            begin_date = 0;
            end_date = 0;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            exch_no_str = " ";
            stock_code_no = 0;
            stock_type_str = " ";
            disp_opor = 0;
            before_comm_executor = 0;
            comm_executor = 0;
            comm_id = 0;
            comm_dir_str = " ";
            exter_comm_flag = 0;
            row_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型串
        /// </summary>
        public String stock_type_str { get; set; }
 
        /// <summary>
        /// 分发操作员
        /// </summary>
        public int disp_opor { get; set; }
 
        /// <summary>
        /// 前指令执行人
        /// </summary>
        public int before_comm_executor { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令方向串
        /// </summary>
        public String comm_dir_str { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
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
 
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("disp_opor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("before_comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exter_comm_flag", ELDDATATYPE.LD_DATATYPE_INT);
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
 
            packer.AddInt(begin_date);
            packer.AddInt(end_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_type_str);
            packer.AddInt(disp_opor);
            packer.AddInt(before_comm_executor);
            packer.AddInt(comm_executor);
            packer.AddInt64(comm_id);
            packer.AddStr(comm_dir_str);
            packer.AddInt(exter_comm_flag);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_OPOR_INT,disp_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEFORE_COMM_EXECUTOR_INT,before_comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_查询指令审批
    public class ReqFunctdsecuL_3_55DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_55DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.55";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            exch_no_str = " ";
            stock_code_no = 0;
            stock_type_str = " ";
            comm_id = 0;
            comm_opor = 0;
            comm_dir_str = " ";
            comm_appr_oper = 0;
            exter_comm_flag = 0;
            row_id = 0;
            row_count = -1;
            sort_type = 1;
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型串
        /// </summary>
        public String stock_type_str { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令方向串
        /// </summary>
        public String comm_dir_str { get; set; }
 
        /// <summary>
        /// 指令审批操作员
        /// </summary>
        public int comm_appr_oper { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 指定行数
        /// </summary>
        public int row_count { get; set; }
 
        /// <summary>
        /// 排序方式
        /// </summary>
        public int sort_type { get; set; }
 
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
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_opor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_appr_oper", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exter_comm_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("row_count", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("sort_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(exch_group_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_type_str);
            packer.AddInt64(comm_id);
            packer.AddInt(comm_opor);
            packer.AddStr(comm_dir_str);
            packer.AddInt(comm_appr_oper);
            packer.AddInt(exter_comm_flag);
            packer.AddInt64(row_id);
            packer.AddInt(row_count);
            packer.AddInt(sort_type);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT,comm_appr_oper);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_查询指令审批历史
    public class ReqFunctdsecuL_3_56DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_56DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.56";
            CommonDTO.func_code = CommonDTO.function_code;
            begin_date = 0;
            end_date = 0;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            exch_no_str = " ";
            stock_code_no = 0;
            stock_type_str = " ";
            comm_id = 0;
            comm_opor = 0;
            comm_dir_str = " ";
            comm_appr_oper = 0;
            exter_comm_flag = 0;
            row_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型串
        /// </summary>
        public String stock_type_str { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令方向串
        /// </summary>
        public String comm_dir_str { get; set; }
 
        /// <summary>
        /// 指令审批操作员
        /// </summary>
        public int comm_appr_oper { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
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
 
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_opor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_appr_oper", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exter_comm_flag", ELDDATATYPE.LD_DATATYPE_INT);
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
 
            packer.AddInt(begin_date);
            packer.AddInt(end_date);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddStr(exch_no_str);
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_type_str);
            packer.AddInt64(comm_id);
            packer.AddInt(comm_opor);
            packer.AddStr(comm_dir_str);
            packer.AddInt(comm_appr_oper);
            packer.AddInt(exter_comm_flag);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT,comm_appr_oper);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_查询汇总指令
    public class ReqFunctdsecuL_3_57DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_57DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.57";
            CommonDTO.func_code = CommonDTO.function_code;
            comm_date = 0;
            comm_batch_no = 0;
            comm_opor = 0;
            comm_executor = 0;
            comm_sum_appr_status_str = " ";
            exch_no_str = " ";
            stock_code_no = 0;
            stock_type_str = " ";
            asset_type_str = " ";
            comm_dir_str = " ";
            comm_sum_status_str = " ";
            strike_status_str = " ";
            basket_id = 0;
            comm_oper_way = " ";
            exter_comm_flag = 0;
            row_id = 0;
            row_count = -1;
            sort_type = 1;
        }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令汇总审批状态串
        /// </summary>
        public String comm_sum_appr_status_str { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型串
        /// </summary>
        public String stock_type_str { get; set; }
 
        /// <summary>
        /// 资产类型串
        /// </summary>
        public String asset_type_str { get; set; }
 
        /// <summary>
        /// 指令方向串
        /// </summary>
        public String comm_dir_str { get; set; }
 
        /// <summary>
        /// 指令汇总状态串
        /// </summary>
        public String comm_sum_status_str { get; set; }
 
        /// <summary>
        /// 成交状态串
        /// </summary>
        public String strike_status_str { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 指定行数
        /// </summary>
        public int row_count { get; set; }
 
        /// <summary>
        /// 排序方式
        /// </summary>
        public int sort_type { get; set; }
 
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
 
            packer.AddField("comm_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_opor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_sum_appr_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("asset_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_sum_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strike_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("basket_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exter_comm_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("row_count", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("sort_type", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(comm_date);
            packer.AddInt(comm_batch_no);
            packer.AddInt(comm_opor);
            packer.AddInt(comm_executor);
            packer.AddStr(comm_sum_appr_status_str);
            packer.AddStr(exch_no_str);
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_type_str);
            packer.AddStr(asset_type_str);
            packer.AddStr(comm_dir_str);
            packer.AddStr(comm_sum_status_str);
            packer.AddStr(strike_status_str);
            packer.AddInt64(basket_id);
            packer.AddStr(comm_oper_way);
            packer.AddInt(exter_comm_flag);
            packer.AddInt64(row_id);
            packer.AddInt(row_count);
            packer.AddInt(sort_type);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_APPR_STATUS_STR_STR,comm_sum_appr_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_STR_STR,asset_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_STATUS_STR_STR,comm_sum_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR_STR,strike_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SORT_TYPE_INT,sort_type);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_查询汇总指令历史
    public class ReqFunctdsecuL_3_58DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_58DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.58";
            CommonDTO.func_code = CommonDTO.function_code;
            begin_date = 0;
            end_date = 0;
            comm_date = 0;
            comm_batch_no = 0;
            comm_opor = 0;
            comm_executor = 0;
            comm_sum_appr_status_str = " ";
            exch_no_str = " ";
            stock_code_no = 0;
            stock_type_str = " ";
            asset_type_str = " ";
            comm_dir_str = " ";
            comm_sum_status_str = " ";
            strike_status_str = " ";
            basket_id = 0;
            comm_oper_way = " ";
            exter_comm_flag = 0;
            row_id = 0;
            row_count = -1;
        }
 
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令汇总审批状态串
        /// </summary>
        public String comm_sum_appr_status_str { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型串
        /// </summary>
        public String stock_type_str { get; set; }
 
        /// <summary>
        /// 资产类型串
        /// </summary>
        public String asset_type_str { get; set; }
 
        /// <summary>
        /// 指令方向串
        /// </summary>
        public String comm_dir_str { get; set; }
 
        /// <summary>
        /// 指令汇总状态串
        /// </summary>
        public String comm_sum_status_str { get; set; }
 
        /// <summary>
        /// 成交状态串
        /// </summary>
        public String strike_status_str { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
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
 
            packer.AddField("begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_opor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_sum_appr_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("asset_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_sum_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strike_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("basket_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exter_comm_flag", ELDDATATYPE.LD_DATATYPE_INT);
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
 
            packer.AddInt(begin_date);
            packer.AddInt(end_date);
            packer.AddInt(comm_date);
            packer.AddInt(comm_batch_no);
            packer.AddInt(comm_opor);
            packer.AddInt(comm_executor);
            packer.AddStr(comm_sum_appr_status_str);
            packer.AddStr(exch_no_str);
            packer.AddInt(stock_code_no);
            packer.AddStr(stock_type_str);
            packer.AddStr(asset_type_str);
            packer.AddStr(comm_dir_str);
            packer.AddStr(comm_sum_status_str);
            packer.AddStr(strike_status_str);
            packer.AddInt64(basket_id);
            packer.AddStr(comm_oper_way);
            packer.AddInt(exter_comm_flag);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT,begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT,end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT,comm_opor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_APPR_STATUS_STR_STR,comm_sum_appr_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_STR_STR,stock_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_STR_STR,asset_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_STATUS_STR_STR,comm_sum_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR_STR,strike_status_str);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ROW_COUNT_INT,row_count);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_暂停明细指令
    public class ReqFunctdsecuL_3_59DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_59DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.59";
            CommonDTO.func_code = CommonDTO.function_code;
            comm_id_str = " ";
            exch_no_str = " ";
            co_no = 0;
            stock_code_str = " ";
            comm_date = 0;
            comm_batch_no = 0;
            comm_executor = 0;
            comm_dir_str = " ";
            comm_qty_str = " ";
            limit_price_str = " ";
            is_withdraw = 0;
        }
 
        /// <summary>
        /// 指令序号串
        /// </summary>
        public String comm_id_str { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 证券代码串
        /// </summary>
        public String stock_code_str { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令方向串
        /// </summary>
        public String comm_dir_str { get; set; }
 
        /// <summary>
        /// 指令数量串
        /// </summary>
        public String comm_qty_str { get; set; }
 
        /// <summary>
        /// 指令限价串
        /// </summary>
        public String limit_price_str { get; set; }
 
        /// <summary>
        /// 是否撤单
        /// </summary>
        public int is_withdraw { get; set; }
 
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
 
            packer.AddField("comm_id_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_qty_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("limit_price_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("is_withdraw", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddStr(comm_id_str);
            packer.AddStr(exch_no_str);
            packer.AddInt(co_no);
            packer.AddStr(stock_code_str);
            packer.AddInt(comm_date);
            packer.AddInt(comm_batch_no);
            packer.AddInt(comm_executor);
            packer.AddStr(comm_dir_str);
            packer.AddStr(comm_qty_str);
            packer.AddStr(limit_price_str);
            packer.AddInt(is_withdraw);
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

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_STR_STR,comm_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_STR_STR,comm_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_PRICE_STR_STR,limit_price_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_暂停汇总指令
    public class ReqFunctdsecuL_3_60DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_60DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.60";
            CommonDTO.func_code = CommonDTO.function_code;
            comm_date = 0;
            co_no = 0;
            comm_batch_no = 0;
            comm_executor = 0;
            is_withdraw = 0;
        }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 是否撤单
        /// </summary>
        public int is_withdraw { get; set; }
 
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
 
            packer.AddField("comm_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("is_withdraw", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(comm_date);
            packer.AddInt(co_no);
            packer.AddInt(comm_batch_no);
            packer.AddInt(comm_executor);
            packer.AddInt(is_withdraw);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_启动明细指令
    public class ReqFunctdsecuL_3_61DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_61DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.61";
            CommonDTO.func_code = CommonDTO.function_code;
            comm_id_str = " ";
            exch_no_str = " ";
            co_no = 0;
            stock_code_str = " ";
            comm_date = 0;
            comm_batch_no = 0;
            comm_executor = 0;
            comm_dir_str = " ";
            comm_qty_str = " ";
            limit_price_str = " ";
        }
 
        /// <summary>
        /// 指令序号串
        /// </summary>
        public String comm_id_str { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 证券代码串
        /// </summary>
        public String stock_code_str { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令方向串
        /// </summary>
        public String comm_dir_str { get; set; }
 
        /// <summary>
        /// 指令数量串
        /// </summary>
        public String comm_qty_str { get; set; }
 
        /// <summary>
        /// 指令限价串
        /// </summary>
        public String limit_price_str { get; set; }
 
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
 
            packer.AddField("comm_id_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_qty_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("limit_price_str", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddStr(comm_id_str);
            packer.AddStr(exch_no_str);
            packer.AddInt(co_no);
            packer.AddStr(stock_code_str);
            packer.AddInt(comm_date);
            packer.AddInt(comm_batch_no);
            packer.AddInt(comm_executor);
            packer.AddStr(comm_dir_str);
            packer.AddStr(comm_qty_str);
            packer.AddStr(limit_price_str);
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

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_STR_STR,comm_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_STR_STR,comm_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_PRICE_STR_STR,limit_price_str);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_启动汇总指令
    public class ReqFunctdsecuL_3_62DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_62DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.62";
            CommonDTO.func_code = CommonDTO.function_code;
            comm_date = 0;
            co_no = 0;
            comm_batch_no = 0;
            comm_executor = 0;
        }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
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
 
            packer.AddField("comm_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(comm_date);
            packer.AddInt(co_no);
            packer.AddInt(comm_batch_no);
            packer.AddInt(comm_executor);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_分发待审批指令
    public class ReqFunctdsecuL_3_63DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_63DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.63";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no = 0;
            co_no = 0;
            exch_group_no = 0;
            comm_id = 0;
            comm_executor = 0;
            is_withdraw = 0;
            disp_remark = " ";
        }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 是否撤单
        /// </summary>
        public int is_withdraw { get; set; }
 
        /// <summary>
        /// 分发说明
        /// </summary>
        public String disp_remark { get; set; }
 
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
 
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("is_withdraw", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("disp_remark", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(exch_no);
            packer.AddInt(co_no);
            packer.AddInt(exch_group_no);
            packer.AddInt64(comm_id);
            packer.AddInt(comm_executor);
            packer.AddInt(is_withdraw);
            packer.AddStr(disp_remark);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DISP_REMARK_STR,disp_remark);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_审批转发指令
    public class ReqFunctdsecuL_3_64DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_64DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.64";
            CommonDTO.func_code = CommonDTO.function_code;
            row_id = 0;
            exch_no = 0;
            comm_id = 0;
            comm_date = 0;
            comm_dispense_appr_status = "0";
            comm_dispense_appr_remark = " ";
        }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令转发审批状态
        /// </summary>
        public String comm_dispense_appr_status { get; set; }
 
        /// <summary>
        /// 指令转发审批说明
        /// </summary>
        public String comm_dispense_appr_remark { get; set; }
 
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
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_dispense_appr_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_dispense_appr_remark", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(exch_no);
            packer.AddInt64(comm_id);
            packer.AddInt(comm_date);
            packer.AddStr(comm_dispense_appr_status);
            packer.AddStr(comm_dispense_appr_remark);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISPENSE_APPR_STATUS_STR,comm_dispense_appr_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISPENSE_APPR_REMARK_STR,comm_dispense_appr_remark);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_查询转发审批指令
    public class ReqFunctdsecuL_3_65DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_65DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.65";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            comm_id = 0;
            comm_disp_appr_remark_str = " ";
            exch_no_str = " ";
            stock_code_no = 0;
            comm_dir_str = " ";
            comm_status_str = " ";
            strike_status_str = " ";
            comm_oper_way = " ";
            exter_comm_flag = 0;
            comm_comple_flag = 0;
            row_id = 0;
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令转发审批状态串
        /// </summary>
        public String comm_disp_appr_remark_str { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 指令方向串
        /// </summary>
        public String comm_dir_str { get; set; }
 
        /// <summary>
        /// 指令状态串
        /// </summary>
        public String comm_status_str { get; set; }
 
        /// <summary>
        /// 成交状态串
        /// </summary>
        public String strike_status_str { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// 指令完成标志
        /// </summary>
        public int comm_comple_flag { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_disp_appr_remark_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("strike_status_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("exter_comm_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_comple_flag", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("row_id", ELDDATATYPE.LD_DATATYPE_LONG);
 
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
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt64(comm_id);
            packer.AddStr(comm_disp_appr_remark_str);
            packer.AddStr(exch_no_str);
            packer.AddInt(stock_code_no);
            packer.AddStr(comm_dir_str);
            packer.AddStr(comm_status_str);
            packer.AddStr(strike_status_str);
            packer.AddStr(comm_oper_way);
            packer.AddInt(exter_comm_flag);
            packer.AddInt(comm_comple_flag);
            packer.AddInt64(row_id);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISP_APPR_REMARK_STR_STR,comm_disp_appr_remark_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_STR_STR,comm_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR_STR,comm_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR_STR,strike_status_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT,exter_comm_flag);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_FLAG_INT,comm_comple_flag);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64,row_id);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_融资融券新增指令
    public class ReqFunctdsecuL_3_66DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_66DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.66";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            exch_no = 0;
            stock_code = " ";
            comm_batch_no = 0;
            comm_executor = 0;
            comm_dir = 0;
            price_kind = 0;
            ctrl_type = 0;
            comm_limit_price = 0;
            limit_actual_price = 0;
            comm_qty = 0;
            comm_amt = 0;
            comm_remark = " ";
            comm_begin_date = 0;
            comm_end_date = 0;
            comm_begin_time = 0;
            comm_end_time = 0;
            external_no = 0;
            basket_id = 0;
            comm_oper_way = " ";
            contra_no = " ";
            comm_remark_info = " ";
            acco_concat_info = " ";
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// 价格方式
        /// </summary>
        public int price_kind { get; set; }
 
        /// <summary>
        /// 控制方式
        /// </summary>
        public int ctrl_type { get; set; }
 
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// 指令说明
        /// </summary>
        public String comm_remark { get; set; }
 
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 合同编号
        /// </summary>
        public String contra_no { get; set; }
 
        /// <summary>
        /// 指令备注信息
        /// </summary>
        public String comm_remark_info { get; set; }
 
        /// <summary>
        /// 账户拼接信息
        /// </summary>
        public String acco_concat_info { get; set; }
 
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
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("price_kind", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("ctrl_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_limit_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("limit_actual_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("comm_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("comm_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("comm_remark", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_begin_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_end_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("external_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("basket_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("contra_no", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("acco_concat_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt(exch_no);
            packer.AddStr(stock_code);
            packer.AddInt(comm_batch_no);
            packer.AddInt(comm_executor);
            packer.AddInt(comm_dir);
            packer.AddInt(price_kind);
            packer.AddInt(ctrl_type);
            packer.AddDouble(comm_limit_price);
            packer.AddDouble(limit_actual_price);
            packer.AddDouble(comm_qty);
            packer.AddDouble(comm_amt);
            packer.AddStr(comm_remark);
            packer.AddInt(comm_begin_date);
            packer.AddInt(comm_end_date);
            packer.AddInt(comm_begin_time);
            packer.AddInt(comm_end_time);
            packer.AddInt64(external_no);
            packer.AddInt64(basket_id);
            packer.AddStr(comm_oper_way);
            packer.AddStr(contra_no);
            packer.AddStr(comm_remark_info);
            packer.AddStr(acco_concat_info);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT,comm_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_KIND_INT,price_kind);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CTRL_TYPE_INT,ctrl_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT,comm_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,limit_actual_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT,comm_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT,comm_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_STR,comm_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT,comm_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT,comm_end_time);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRA_NO_STR,contra_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR,comm_remark_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR,acco_concat_info);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_融资融券撤销指令
    public class ReqFunctdsecuL_3_67DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_67DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.67";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no = 0;
            comm_id = 0;
            cancel_info = " ";
            is_withdraw = 0;
        }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 撤销说明
        /// </summary>
        public String cancel_info { get; set; }
 
        /// <summary>
        /// 是否撤单
        /// </summary>
        public int is_withdraw { get; set; }
 
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
 
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("cancel_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("is_withdraw", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(exch_no);
            packer.AddInt64(comm_id);
            packer.AddStr(cancel_info);
            packer.AddInt(is_withdraw);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_CANCEL_INFO_STR,cancel_info);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_融资融券审批指令
    public class ReqFunctdsecuL_3_68DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_68DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.68";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no = 0;
            comm_id = 0;
            comm_date = 0;
            comm_appr_status = " ";
            comm_appr_remark = " ";
        }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令审批状态
        /// </summary>
        public String comm_appr_status { get; set; }
 
        /// <summary>
        /// 指令审批说明
        /// </summary>
        public String comm_appr_remark { get; set; }
 
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
 
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_appr_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_appr_remark", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(exch_no);
            packer.AddInt64(comm_id);
            packer.AddInt(comm_date);
            packer.AddStr(comm_appr_status);
            packer.AddStr(comm_appr_remark);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT,comm_date);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR,comm_appr_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_REMARK_STR,comm_appr_remark);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_新分发指令
    public class ReqFunctdsecuL_3_69DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_69DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.69";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no = 0;
            co_no = 0;
            exch_group_no = 0;
            comm_id = 0;
            comm_executor = 0;
            is_withdraw = 0;
            disp_remark = " ";
            disp_status = 0;
        }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 是否撤单
        /// </summary>
        public int is_withdraw { get; set; }
 
        /// <summary>
        /// 分发说明
        /// </summary>
        public String disp_remark { get; set; }
 
        /// <summary>
        /// 分发状态
        /// </summary>
        public int disp_status { get; set; }
 
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
 
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("is_withdraw", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("disp_remark", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("disp_status", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(exch_no);
            packer.AddInt(co_no);
            packer.AddInt(exch_group_no);
            packer.AddInt64(comm_id);
            packer.AddInt(comm_executor);
            packer.AddInt(is_withdraw);
            packer.AddStr(disp_remark);
            packer.AddInt(disp_status);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64,comm_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT,is_withdraw);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_DISP_REMARK_STR,disp_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_STATUS_INT,disp_status);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_指令_新增组合策略指令
    public class ReqFunctdsecuL_3_70DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_3_70DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.3.70";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            exch_no = 0;
            stock_code = " ";
            combo_code = " ";
            comm_batch_no = 0;
            comm_executor = 0;
            comm_dir = 0;
            price_kind = 0;
            ctrl_type = 0;
            comm_limit_price = 0;
            limit_actual_price = 0;
            comm_qty = 0;
            comm_amt = 0;
            comm_remark = " ";
            comm_begin_date = 0;
            comm_end_date = 0;
            comm_begin_time = 0;
            comm_end_time = 0;
            external_no = 0;
            basket_id = 0;
            comm_oper_way = " ";
            comm_remark_info = " ";
            acco_concat_info = " ";
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 组合代码
        /// </summary>
        public String combo_code { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// 价格方式
        /// </summary>
        public int price_kind { get; set; }
 
        /// <summary>
        /// 控制方式
        /// </summary>
        public int ctrl_type { get; set; }
 
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// 指令说明
        /// </summary>
        public String comm_remark { get; set; }
 
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 指令备注信息
        /// </summary>
        public String comm_remark_info { get; set; }
 
        /// <summary>
        /// 账户拼接信息
        /// </summary>
        public String acco_concat_info { get; set; }
 
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
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("combo_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_executor", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("price_kind", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("ctrl_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_limit_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("limit_actual_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("comm_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("comm_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("comm_remark", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_begin_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_end_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_begin_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_end_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("external_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("basket_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("comm_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_remark_info", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("acco_concat_info", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt(exch_no);
            packer.AddStr(stock_code);
            packer.AddStr(combo_code);
            packer.AddInt(comm_batch_no);
            packer.AddInt(comm_executor);
            packer.AddInt(comm_dir);
            packer.AddInt(price_kind);
            packer.AddInt(ctrl_type);
            packer.AddDouble(comm_limit_price);
            packer.AddDouble(limit_actual_price);
            packer.AddDouble(comm_qty);
            packer.AddDouble(comm_amt);
            packer.AddStr(comm_remark);
            packer.AddInt(comm_begin_date);
            packer.AddInt(comm_end_date);
            packer.AddInt(comm_begin_time);
            packer.AddInt(comm_end_time);
            packer.AddInt64(external_no);
            packer.AddInt64(basket_id);
            packer.AddStr(comm_oper_way);
            packer.AddStr(comm_remark_info);
            packer.AddStr(acco_concat_info);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT,comm_batch_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT,comm_dir);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_KIND_INT,price_kind);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CTRL_TYPE_INT,ctrl_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT,comm_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,limit_actual_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT,comm_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT,comm_amt);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_STR,comm_remark);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT,comm_begin_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT,comm_end_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT,comm_begin_time);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT,comm_end_time);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64,basket_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR,comm_oper_way);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR,comm_remark_info);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR,acco_concat_info);
 
            return fastMsg;
        }
    }

}
