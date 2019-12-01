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
    //逻辑_交易证券_中泰_撤销指令
    public class ReqFunctdsecuL_7_1DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_7_1DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.7.1";
            CommonDTO.func_code = CommonDTO.function_code;
            exch_no = 0;
            comm_id = 0;
            cancel_info = " ";
            is_withdraw = 0;
            long_token = " ";
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
 
        /// <summary>
        /// 长密钥
        /// </summary>
        public String long_token { get; set; }
 
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
            packer.AddField("long_token", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddStr(long_token);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LONG_TOKEN_STR,long_token);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_中泰_新增组合指令
    public class ReqFunctdsecuL_7_2DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_7_2DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.7.2";
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
            long_token = " ";
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
        /// 长密钥
        /// </summary>
        public String long_token { get; set; }
 
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
            packer.AddField("long_token", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
            packer.AddStr(long_token);
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
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LONG_TOKEN_STR,long_token);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_中泰_新增组合订单
    public class ReqFunctdsecuL_7_3DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_7_3DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.7.3";
            CommonDTO.func_code = CommonDTO.function_code;
            combo_code = " ";
            combo_copies = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            exch_no_str = " ";
            stock_code_str = " ";
            target_stock_code_str = " ";
            order_batch_no = 0;
            comm_id_str = " ";
            order_dir_str = " ";
            price_type_str = " ";
            order_qty_str = " ";
            order_price_str = " ";
            order_amt_str = " ";
            order_oper_way = " ";
            combo_posi_id_str = " ";
            long_token = " ";
        }
 
        /// <summary>
        /// 组合代码
        /// </summary>
        public String combo_code { get; set; }
 
        /// <summary>
        /// 组合份数
        /// </summary>
        public double combo_copies { get; set; }
 
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
        /// 目标证券代码串
        /// </summary>
        public String target_stock_code_str { get; set; }
 
        /// <summary>
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// 指令序号串
        /// </summary>
        public String comm_id_str { get; set; }
 
        /// <summary>
        /// 订单方向串
        /// </summary>
        public String order_dir_str { get; set; }
 
        /// <summary>
        /// 价格类型串
        /// </summary>
        public String price_type_str { get; set; }
 
        /// <summary>
        /// 订单数量串
        /// </summary>
        public String order_qty_str { get; set; }
 
        /// <summary>
        /// 订单价格串
        /// </summary>
        public String order_price_str { get; set; }
 
        /// <summary>
        /// 订单金额串
        /// </summary>
        public String order_amt_str { get; set; }
 
        /// <summary>
        /// 订单操作方式
        /// </summary>
        public String order_oper_way { get; set; }
 
        /// <summary>
        /// 组合持仓序号串
        /// </summary>
        public String combo_posi_id_str { get; set; }
 
        /// <summary>
        /// 长密钥
        /// </summary>
        public String long_token { get; set; }
 
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
 
            packer.AddField("combo_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("combo_copies", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("target_stock_code_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_id_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_dir_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("price_type_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_qty_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_price_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_amt_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("order_oper_way", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("combo_posi_id_str", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("long_token", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddStr(combo_code);
            packer.AddDouble(combo_copies);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddStr(exch_no_str);
            packer.AddStr(stock_code_str);
            packer.AddStr(target_stock_code_str);
            packer.AddInt(order_batch_no);
            packer.AddStr(comm_id_str);
            packer.AddStr(order_dir_str);
            packer.AddStr(price_type_str);
            packer.AddStr(order_qty_str);
            packer.AddStr(order_price_str);
            packer.AddStr(order_amt_str);
            packer.AddStr(order_oper_way);
            packer.AddStr(combo_posi_id_str);
            packer.AddStr(long_token);
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

            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR,combo_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT,combo_copies);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR,exch_no_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR_STR,stock_code_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STOCK_CODE_STR_STR,target_stock_code_str);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT,order_batch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_STR_STR,comm_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR,order_dir_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_STR_STR,price_type_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_STR_STR,order_qty_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_STR_STR,order_price_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_AMT_STR_STR,order_amt_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR,order_oper_way);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_POSI_ID_STR_STR,combo_posi_id_str);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LONG_TOKEN_STR,long_token);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_中泰_撤销订单
    public class ReqFunctdsecuL_7_4DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_7_4DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.7.4";
            CommonDTO.func_code = CommonDTO.function_code;
            order_date = 0;
            order_id = 0;
            long_token = " ";
        }
 
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id { get; set; }
 
        /// <summary>
        /// 长密钥
        /// </summary>
        public String long_token { get; set; }
 
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
 
            packer.AddField("order_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("long_token", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt(order_date);
            packer.AddInt64(order_id);
            packer.AddStr(long_token);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LONG_TOKEN_STR,long_token);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_中泰_新增改单
    public class ReqFunctdsecuL_7_5DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_7_5DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.7.5";
            CommonDTO.func_code = CommonDTO.function_code;
            external_no = 0;
            order_date = 0;
            order_id = 0;
            modi_batch_no = 0;
            modi_order_price = 0;
            modi_order_qty = 0;
            modi_price_type = 0;
            long_token = " ";
        }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id { get; set; }
 
        /// <summary>
        /// 改单批号
        /// </summary>
        public int modi_batch_no { get; set; }
 
        /// <summary>
        /// 改单价格
        /// </summary>
        public double modi_order_price { get; set; }
 
        /// <summary>
        /// 改单数量
        /// </summary>
        public double modi_order_qty { get; set; }
 
        /// <summary>
        /// 改单价格类型
        /// </summary>
        public int modi_price_type { get; set; }
 
        /// <summary>
        /// 长密钥
        /// </summary>
        public String long_token { get; set; }
 
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
 
            packer.AddField("external_no", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("order_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("order_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("modi_batch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("modi_order_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("modi_order_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("modi_price_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("long_token", ELDDATATYPE.LD_DATATYPE_STRING);
 
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
 
            packer.AddInt64(external_no);
            packer.AddInt(order_date);
            packer.AddInt64(order_id);
            packer.AddInt(modi_batch_no);
            packer.AddDouble(modi_order_price);
            packer.AddDouble(modi_order_qty);
            packer.AddInt(modi_price_type);
            packer.AddStr(long_token);
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

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64,external_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT,order_date);
            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64,order_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_BATCH_NO_INT,modi_batch_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_PRICE_FLOAT,modi_order_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_QTY_FLOAT,modi_order_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_PRICE_TYPE_INT,modi_price_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_LONG_TOKEN_STR,long_token);
 
            return fastMsg;
        }
    }

    //逻辑_交易证券_中泰_指令有效期处理
    public class ReqFunctdsecuL_7_6DTO : ReqBaseDTO
    {
        public ReqFunctdsecuL_7_6DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "tdsecuL.7.6";
            CommonDTO.func_code = CommonDTO.function_code;
        }
 
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

 
            return fastMsg;
        }
    }

}
