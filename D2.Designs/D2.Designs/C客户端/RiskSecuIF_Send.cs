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
    //逻辑_风控证券_接口_计算更新证券风险监控数据
    public class ReqFuncrksecuL_5_16DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_5_16DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.5.16";
            CommonDTO.func_code = CommonDTO.function_code;
            moni_set_id = 0;
            curr_moni_value = 0;
            contrs_curr_moni_value = 0;
        }
 
        /// <summary>
        /// 监控设置序号
        /// </summary>
        public ulong moni_set_id { get; set; }
 
        /// <summary>
        /// 当前监控值
        /// </summary>
        public double curr_moni_value { get; set; }
 
        /// <summary>
        /// 对比当前监控值
        /// </summary>
        public double contrs_curr_moni_value { get; set; }
 
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
 
            packer.AddField("moni_set_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("curr_moni_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("contrs_curr_moni_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
 
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
 
            packer.AddInt64(moni_set_id);
            packer.AddDouble(curr_moni_value);
            packer.AddDouble(contrs_curr_moni_value);
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

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT,curr_moni_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT,contrs_curr_moni_value);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_接口_计算更新账户风险监控数据
    public class ReqFuncrksecuL_5_17DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_5_17DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.5.17";
            CommonDTO.func_code = CommonDTO.function_code;
            moni_set_id = 0;
            curr_moni_value = 0;
            cash_asset = 0;
            fund_asset = 0;
            bond_asset = 0;
            stock_asset = 0;
            repo_asset = 0;
            nav_asset = 0;
            contrs_curr_moni_value = 0;
            pd_share = 0;
            begin_asset_value = 0;
            hk_thrgh_stock_asset = 0;
        }
 
        /// <summary>
        /// 监控设置序号
        /// </summary>
        public ulong moni_set_id { get; set; }
 
        /// <summary>
        /// 当前监控值
        /// </summary>
        public double curr_moni_value { get; set; }
 
        /// <summary>
        /// 现金资产
        /// </summary>
        public double cash_asset { get; set; }
 
        /// <summary>
        /// 基金资产
        /// </summary>
        public double fund_asset { get; set; }
 
        /// <summary>
        /// 债券资产
        /// </summary>
        public double bond_asset { get; set; }
 
        /// <summary>
        /// 股票资产
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// 回购资产
        /// </summary>
        public double repo_asset { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 对比当前监控值
        /// </summary>
        public double contrs_curr_moni_value { get; set; }
 
        /// <summary>
        /// 产品份额
        /// </summary>
        public double pd_share { get; set; }
 
        /// <summary>
        /// 期初资产值
        /// </summary>
        public double begin_asset_value { get; set; }
 
        /// <summary>
        /// 港股通资产
        /// </summary>
        public double hk_thrgh_stock_asset { get; set; }
 
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
 
            packer.AddField("moni_set_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("curr_moni_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("cash_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("fund_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("bond_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("stock_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("repo_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("nav_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("contrs_curr_moni_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pd_share", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("begin_asset_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("hk_thrgh_stock_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
 
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
 
            packer.AddInt64(moni_set_id);
            packer.AddDouble(curr_moni_value);
            packer.AddDouble(cash_asset);
            packer.AddDouble(fund_asset);
            packer.AddDouble(bond_asset);
            packer.AddDouble(stock_asset);
            packer.AddDouble(repo_asset);
            packer.AddDouble(nav_asset);
            packer.AddDouble(contrs_curr_moni_value);
            packer.AddDouble(pd_share);
            packer.AddDouble(begin_asset_value);
            packer.AddDouble(hk_thrgh_stock_asset);
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

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT,curr_moni_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT,cash_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT,fund_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT,bond_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT,stock_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT,repo_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT,nav_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT,contrs_curr_moni_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_SHARE_FLOAT,pd_share);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_ASSET_VALUE_FLOAT,begin_asset_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT,hk_thrgh_stock_asset);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_接口_计算t0操作员阀值
    public class ReqFuncrksecuL_5_18DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_5_18DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.5.18";
            CommonDTO.func_code = CommonDTO.function_code;
            detail_posi_id = 0;
            target_opor_no = 0;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            exch_no = 0;
            stock_code = " ";
            stock_acco_no = 0;
            stock_code_no = 0;
            lngsht_type = 0;
            curr_qty = 0;
            open_posi_date = 0;
            open_posi_time = 0;
            open_posi_price = 0;
            open_posi_value = 0;
            open_posi_fee = 0;
            close_posi_qty = 0;
            close_posi_market_value = 0;
            close_posi_fee = 0;
            realize_pandl = 0;
            pandl_ratio = 0;
            un_close_posi_qty = 0;
            un_close_marke_value = 0;
            last_price = 0;
            up_limit_price = 0;
            down_limit_price = 0;
            cost_price = 0;
            last_tshold_value = 0;
            float_pandl = 0;
            posi_status = "0";
            moni_result_status = " ";
            posi_limit_status = " ";
            opor_warn_tshold = 0;
            opor_stop_tshold = 0;
            stock_warn_ratio = 0;
            stock_stop_ratio = 0;
            stock_warn_amt = 0;
            stock_stop_amt = 0;
            open_close_permission = 0;
            posi_limit_time = 5;
        }
 
        /// <summary>
        /// 明细持仓序号
        /// </summary>
        public ulong detail_posi_id { get; set; }
 
        /// <summary>
        /// 目标操作员编号
        /// </summary>
        public int target_opor_no { get; set; }
 
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
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓日期
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// 开仓时间
        /// </summary>
        public int open_posi_time { get; set; }
 
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price { get; set; }
 
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee { get; set; }
 
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty { get; set; }
 
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// 平仓费用
        /// </summary>
        public double close_posi_fee { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 盈亏比例
        /// </summary>
        public double pandl_ratio { get; set; }
 
        /// <summary>
        /// 未平仓数量
        /// </summary>
        public double un_close_posi_qty { get; set; }
 
        /// <summary>
        /// 未平仓市值
        /// </summary>
        public double un_close_marke_value { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 涨停价
        /// </summary>
        public double up_limit_price { get; set; }
 
        /// <summary>
        /// 跌停价
        /// </summary>
        public double down_limit_price { get; set; }
 
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// 最新阈值
        /// </summary>
        public double last_tshold_value { get; set; }
 
        /// <summary>
        /// 浮动盈亏
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// 持仓状态
        /// </summary>
        public String posi_status { get; set; }
 
        /// <summary>
        /// 监控结果状态
        /// </summary>
        public String moni_result_status { get; set; }
 
        /// <summary>
        /// 持仓时限状态
        /// </summary>
        public String posi_limit_status { get; set; }
 
        /// <summary>
        /// 操作员预警阈值
        /// </summary>
        public double opor_warn_tshold { get; set; }
 
        /// <summary>
        /// 操作员止损阈值
        /// </summary>
        public double opor_stop_tshold { get; set; }
 
        /// <summary>
        /// 单券预警比例
        /// </summary>
        public double stock_warn_ratio { get; set; }
 
        /// <summary>
        /// 单券止损比例
        /// </summary>
        public double stock_stop_ratio { get; set; }
 
        /// <summary>
        /// 单券预警金额
        /// </summary>
        public double stock_warn_amt { get; set; }
 
        /// <summary>
        /// 单券止损金额
        /// </summary>
        public double stock_stop_amt { get; set; }
 
        /// <summary>
        /// 开平仓权限
        /// </summary>
        public int open_close_permission { get; set; }
 
        /// <summary>
        /// 持仓时限
        /// </summary>
        public int posi_limit_time { get; set; }
 
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
 
            packer.AddField("detail_posi_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("target_opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("stock_code_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("lngsht_type", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("curr_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("open_posi_date", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("open_posi_time", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("open_posi_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("open_posi_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("open_posi_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("close_posi_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("close_posi_market_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("close_posi_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("realize_pandl", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pandl_ratio", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("un_close_posi_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("un_close_marke_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("last_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("up_limit_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("down_limit_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("cost_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("last_tshold_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("float_pandl", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("posi_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("moni_result_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("posi_limit_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("opor_warn_tshold", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("opor_stop_tshold", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("stock_warn_ratio", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("stock_stop_ratio", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("stock_warn_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("stock_stop_amt", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("open_close_permission", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("posi_limit_time", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt64(detail_posi_id);
            packer.AddInt(target_opor_no);
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt(exch_no);
            packer.AddStr(stock_code);
            packer.AddInt(stock_acco_no);
            packer.AddInt(stock_code_no);
            packer.AddInt(lngsht_type);
            packer.AddDouble(curr_qty);
            packer.AddInt(open_posi_date);
            packer.AddInt(open_posi_time);
            packer.AddDouble(open_posi_price);
            packer.AddDouble(open_posi_value);
            packer.AddDouble(open_posi_fee);
            packer.AddDouble(close_posi_qty);
            packer.AddDouble(close_posi_market_value);
            packer.AddDouble(close_posi_fee);
            packer.AddDouble(realize_pandl);
            packer.AddDouble(pandl_ratio);
            packer.AddDouble(un_close_posi_qty);
            packer.AddDouble(un_close_marke_value);
            packer.AddDouble(last_price);
            packer.AddDouble(up_limit_price);
            packer.AddDouble(down_limit_price);
            packer.AddDouble(cost_price);
            packer.AddDouble(last_tshold_value);
            packer.AddDouble(float_pandl);
            packer.AddStr(posi_status);
            packer.AddStr(moni_result_status);
            packer.AddStr(posi_limit_status);
            packer.AddDouble(opor_warn_tshold);
            packer.AddDouble(opor_stop_tshold);
            packer.AddDouble(stock_warn_ratio);
            packer.AddDouble(stock_stop_ratio);
            packer.AddDouble(stock_warn_amt);
            packer.AddDouble(stock_stop_amt);
            packer.AddInt(open_close_permission);
            packer.AddInt(posi_limit_time);
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

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DETAIL_POSI_ID_INT64,detail_posi_id);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT,stock_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT,stock_code_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT,lngsht_type);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT,curr_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT,open_posi_date);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT,open_posi_time);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT,open_posi_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT,open_posi_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT,open_posi_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT,close_posi_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT,close_posi_market_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT,close_posi_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT,realize_pandl);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT,pandl_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT,un_close_posi_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT,un_close_marke_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT,last_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT,up_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT,down_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT,cost_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT,last_tshold_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT,float_pandl);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_STATUS_STR,posi_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR,moni_result_status);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_STATUS_STR,posi_limit_status);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT,opor_warn_tshold);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT,opor_stop_tshold);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT,stock_warn_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT,stock_stop_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT,stock_warn_amt);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT,stock_stop_amt);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT,open_close_permission);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_TIME_INT,posi_limit_time);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_接口_计算t0操作员汇总阀值
    public class ReqFuncrksecuL_5_19DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_5_19DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.5.19";
            CommonDTO.func_code = CommonDTO.function_code;
            target_opor_no = 0;
            co_no = 0;
            curr_qty = 0;
            open_posi_value = 0;
            open_posi_fee = 0;
            close_posi_qty = 0;
            close_posi_market_value = 0;
            close_posi_fee = 0;
            realize_pandl = 0;
            float_pandl = 0;
            pandl_ratio = 0;
            un_close_posi_qty = 0;
            un_close_marke_value = 0;
            last_tshold_value = 0;
            moni_result_status = " ";
            opor_warn_tshold = 0;
            opor_stop_tshold = 0;
            open_close_permission = 0;
        }
 
        /// <summary>
        /// 目标操作员编号
        /// </summary>
        public int target_opor_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee { get; set; }
 
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty { get; set; }
 
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// 平仓费用
        /// </summary>
        public double close_posi_fee { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 浮动盈亏
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// 盈亏比例
        /// </summary>
        public double pandl_ratio { get; set; }
 
        /// <summary>
        /// 未平仓数量
        /// </summary>
        public double un_close_posi_qty { get; set; }
 
        /// <summary>
        /// 未平仓市值
        /// </summary>
        public double un_close_marke_value { get; set; }
 
        /// <summary>
        /// 最新阈值
        /// </summary>
        public double last_tshold_value { get; set; }
 
        /// <summary>
        /// 监控结果状态
        /// </summary>
        public String moni_result_status { get; set; }
 
        /// <summary>
        /// 操作员预警阈值
        /// </summary>
        public double opor_warn_tshold { get; set; }
 
        /// <summary>
        /// 操作员止损阈值
        /// </summary>
        public double opor_stop_tshold { get; set; }
 
        /// <summary>
        /// 开平仓权限
        /// </summary>
        public int open_close_permission { get; set; }
 
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
 
            packer.AddField("target_opor_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("curr_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("open_posi_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("open_posi_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("close_posi_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("close_posi_market_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("close_posi_fee", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("realize_pandl", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("float_pandl", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("pandl_ratio", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("un_close_posi_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("un_close_marke_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("last_tshold_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("moni_result_status", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("opor_warn_tshold", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("opor_stop_tshold", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("open_close_permission", ELDDATATYPE.LD_DATATYPE_INT);
 
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
 
            packer.AddInt(target_opor_no);
            packer.AddInt(co_no);
            packer.AddDouble(curr_qty);
            packer.AddDouble(open_posi_value);
            packer.AddDouble(open_posi_fee);
            packer.AddDouble(close_posi_qty);
            packer.AddDouble(close_posi_market_value);
            packer.AddDouble(close_posi_fee);
            packer.AddDouble(realize_pandl);
            packer.AddDouble(float_pandl);
            packer.AddDouble(pandl_ratio);
            packer.AddDouble(un_close_posi_qty);
            packer.AddDouble(un_close_marke_value);
            packer.AddDouble(last_tshold_value);
            packer.AddStr(moni_result_status);
            packer.AddDouble(opor_warn_tshold);
            packer.AddDouble(opor_stop_tshold);
            packer.AddInt(open_close_permission);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT,target_opor_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT,curr_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT,open_posi_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT,open_posi_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT,close_posi_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT,close_posi_market_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT,close_posi_fee);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT,realize_pandl);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT,float_pandl);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT,pandl_ratio);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT,un_close_posi_qty);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT,un_close_marke_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT,last_tshold_value);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR,moni_result_status);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT,opor_warn_tshold);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT,opor_stop_tshold);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT,open_close_permission);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_接口_计算更新操作员风险监控数据
    public class ReqFuncrksecuL_5_20DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_5_20DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.5.20";
            CommonDTO.func_code = CommonDTO.function_code;
            moni_set_id = 0;
            curr_moni_value = 0;
            cash_asset = 0;
            fund_asset = 0;
            bond_asset = 0;
            stock_asset = 0;
            repo_asset = 0;
            nav_asset = 0;
            contrs_curr_moni_value = 0;
        }
 
        /// <summary>
        /// 监控设置序号
        /// </summary>
        public ulong moni_set_id { get; set; }
 
        /// <summary>
        /// 当前监控值
        /// </summary>
        public double curr_moni_value { get; set; }
 
        /// <summary>
        /// 现金资产
        /// </summary>
        public double cash_asset { get; set; }
 
        /// <summary>
        /// 基金资产
        /// </summary>
        public double fund_asset { get; set; }
 
        /// <summary>
        /// 债券资产
        /// </summary>
        public double bond_asset { get; set; }
 
        /// <summary>
        /// 股票资产
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// 回购资产
        /// </summary>
        public double repo_asset { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 对比当前监控值
        /// </summary>
        public double contrs_curr_moni_value { get; set; }
 
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
 
            packer.AddField("moni_set_id", ELDDATATYPE.LD_DATATYPE_LONG);
            packer.AddField("curr_moni_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("cash_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("fund_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("bond_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("stock_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("repo_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("nav_asset", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("contrs_curr_moni_value", ELDDATATYPE.LD_DATATYPE_DOUBLE);
 
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
 
            packer.AddInt64(moni_set_id);
            packer.AddDouble(curr_moni_value);
            packer.AddDouble(cash_asset);
            packer.AddDouble(fund_asset);
            packer.AddDouble(bond_asset);
            packer.AddDouble(stock_asset);
            packer.AddDouble(repo_asset);
            packer.AddDouble(nav_asset);
            packer.AddDouble(contrs_curr_moni_value);
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

            fastMsg.SetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64,moni_set_id);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT,curr_moni_value);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT,cash_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT,fund_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT,bond_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT,stock_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT,repo_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT,nav_asset);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT,contrs_curr_moni_value);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_接口_查询风控服务器资产账户资产
    public class ReqFuncrksecuL_5_21DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_5_21DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.5.21";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            asset_acco_no = 0;
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
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
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
 
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
            packer.AddInt(asset_acco_no);
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
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
 
            return fastMsg;
        }
    }

    //逻辑_风控证券_接口_单条检查客户风险
    public class ReqFuncrksecuL_5_22DTO : ReqBaseDTO
    {
        public ReqFuncrksecuL_5_22DTO(CommonDTO commonDTO)
        {
            CommonDTO = commonDTO.Copy();
            CommonDTO.function_code = "rksecuL.5.22";
            CommonDTO.func_code = CommonDTO.function_code;
            co_no = 0;
            pd_no = 0;
            exch_group_no = 0;
            asset_acco_no = 0;
            exch_no = 0;
            exch_crncy_type = "CNY";
            stock_code = " ";
            comm_limit_price = 0;
            limit_actual_price = 0;
            comm_dir = 0;
            comm_qty = 0;
            comm_executor = 0;
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
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty { get; set; }
 
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
 
            packer.AddField("co_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("pd_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_group_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("asset_acco_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_no", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("exch_crncy_type", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("stock_code", ELDDATATYPE.LD_DATATYPE_STRING);
            packer.AddField("comm_limit_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("limit_actual_price", ELDDATATYPE.LD_DATATYPE_DOUBLE);
            packer.AddField("comm_dir", ELDDATATYPE.LD_DATATYPE_INT);
            packer.AddField("comm_qty", ELDDATATYPE.LD_DATATYPE_DOUBLE);
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
 
            packer.AddInt(co_no);
            packer.AddInt(pd_no);
            packer.AddInt(exch_group_no);
            packer.AddInt(asset_acco_no);
            packer.AddInt(exch_no);
            packer.AddStr(exch_crncy_type);
            packer.AddStr(stock_code);
            packer.AddDouble(comm_limit_price);
            packer.AddDouble(limit_actual_price);
            packer.AddInt(comm_dir);
            packer.AddDouble(comm_qty);
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

            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT,co_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT,pd_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT,exch_group_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT,asset_acco_no);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT,exch_no);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR,exch_crncy_type);
            fastMsg.SetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR,stock_code);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT,comm_limit_price);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT,limit_actual_price);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT,comm_dir);
            fastMsg.SetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT,comm_qty);
            fastMsg.SetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT,comm_executor);
 
            return fastMsg;
        }
    }

}
