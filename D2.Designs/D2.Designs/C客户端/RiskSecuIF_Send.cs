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
    //�߼�_���֤ȯ_�ӿ�_�������֤ȯ���ռ������
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
        /// ����������
        /// </summary>
        public ulong moni_set_id { get; set; }
 
        /// <summary>
        /// ��ǰ���ֵ
        /// </summary>
        public double curr_moni_value { get; set; }
 
        /// <summary>
        /// �Աȵ�ǰ���ֵ
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

            #region CommonDTOFiled Ĭ�ϲ������̶���ʽ
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

    //�߼�_���֤ȯ_�ӿ�_��������˻����ռ������
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
        /// ����������
        /// </summary>
        public ulong moni_set_id { get; set; }
 
        /// <summary>
        /// ��ǰ���ֵ
        /// </summary>
        public double curr_moni_value { get; set; }
 
        /// <summary>
        /// �ֽ��ʲ�
        /// </summary>
        public double cash_asset { get; set; }
 
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double fund_asset { get; set; }
 
        /// <summary>
        /// ծȯ�ʲ�
        /// </summary>
        public double bond_asset { get; set; }
 
        /// <summary>
        /// ��Ʊ�ʲ�
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// �ع��ʲ�
        /// </summary>
        public double repo_asset { get; set; }
 
        /// <summary>
        /// ���ʲ�
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// �Աȵ�ǰ���ֵ
        /// </summary>
        public double contrs_curr_moni_value { get; set; }
 
        /// <summary>
        /// ��Ʒ�ݶ�
        /// </summary>
        public double pd_share { get; set; }
 
        /// <summary>
        /// �ڳ��ʲ�ֵ
        /// </summary>
        public double begin_asset_value { get; set; }
 
        /// <summary>
        /// �۹�ͨ�ʲ�
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

            #region CommonDTOFiled Ĭ�ϲ������̶���ʽ
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

    //�߼�_���֤ȯ_�ӿ�_����t0����Ա��ֵ
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
        /// ��ϸ�ֲ����
        /// </summary>
        public ulong detail_posi_id { get; set; }
 
        /// <summary>
        /// Ŀ�����Ա���
        /// </summary>
        public int target_opor_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// �ɶ�������
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// ֤ȯ������
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// ��ǰ����
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int open_posi_time { get; set; }
 
        /// <summary>
        /// ���ּ۸�
        /// </summary>
        public double open_posi_price { get; set; }
 
        /// <summary>
        /// ������ֵ
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// ���ַ���
        /// </summary>
        public double open_posi_fee { get; set; }
 
        /// <summary>
        /// ƽ������
        /// </summary>
        public double close_posi_qty { get; set; }
 
        /// <summary>
        /// ƽ����ֵ
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// ƽ�ַ���
        /// </summary>
        public double close_posi_fee { get; set; }
 
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// ӯ������
        /// </summary>
        public double pandl_ratio { get; set; }
 
        /// <summary>
        /// δƽ������
        /// </summary>
        public double un_close_posi_qty { get; set; }
 
        /// <summary>
        /// δƽ����ֵ
        /// </summary>
        public double un_close_marke_value { get; set; }
 
        /// <summary>
        /// ���¼�
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// ��ͣ��
        /// </summary>
        public double up_limit_price { get; set; }
 
        /// <summary>
        /// ��ͣ��
        /// </summary>
        public double down_limit_price { get; set; }
 
        /// <summary>
        /// �ɱ���
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// ������ֵ
        /// </summary>
        public double last_tshold_value { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// �ֲ�״̬
        /// </summary>
        public String posi_status { get; set; }
 
        /// <summary>
        /// ��ؽ��״̬
        /// </summary>
        public String moni_result_status { get; set; }
 
        /// <summary>
        /// �ֲ�ʱ��״̬
        /// </summary>
        public String posi_limit_status { get; set; }
 
        /// <summary>
        /// ����ԱԤ����ֵ
        /// </summary>
        public double opor_warn_tshold { get; set; }
 
        /// <summary>
        /// ����Աֹ����ֵ
        /// </summary>
        public double opor_stop_tshold { get; set; }
 
        /// <summary>
        /// ��ȯԤ������
        /// </summary>
        public double stock_warn_ratio { get; set; }
 
        /// <summary>
        /// ��ȯֹ�����
        /// </summary>
        public double stock_stop_ratio { get; set; }
 
        /// <summary>
        /// ��ȯԤ�����
        /// </summary>
        public double stock_warn_amt { get; set; }
 
        /// <summary>
        /// ��ȯֹ����
        /// </summary>
        public double stock_stop_amt { get; set; }
 
        /// <summary>
        /// ��ƽ��Ȩ��
        /// </summary>
        public int open_close_permission { get; set; }
 
        /// <summary>
        /// �ֲ�ʱ��
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

            #region CommonDTOFiled Ĭ�ϲ������̶���ʽ
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

    //�߼�_���֤ȯ_�ӿ�_����t0����Ա���ܷ�ֵ
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
        /// Ŀ�����Ա���
        /// </summary>
        public int target_opor_no { get; set; }
 
        /// <summary>
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��ǰ����
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// ������ֵ
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// ���ַ���
        /// </summary>
        public double open_posi_fee { get; set; }
 
        /// <summary>
        /// ƽ������
        /// </summary>
        public double close_posi_qty { get; set; }
 
        /// <summary>
        /// ƽ����ֵ
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// ƽ�ַ���
        /// </summary>
        public double close_posi_fee { get; set; }
 
        /// <summary>
        /// ʵ��ӯ��
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// ����ӯ��
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// ӯ������
        /// </summary>
        public double pandl_ratio { get; set; }
 
        /// <summary>
        /// δƽ������
        /// </summary>
        public double un_close_posi_qty { get; set; }
 
        /// <summary>
        /// δƽ����ֵ
        /// </summary>
        public double un_close_marke_value { get; set; }
 
        /// <summary>
        /// ������ֵ
        /// </summary>
        public double last_tshold_value { get; set; }
 
        /// <summary>
        /// ��ؽ��״̬
        /// </summary>
        public String moni_result_status { get; set; }
 
        /// <summary>
        /// ����ԱԤ����ֵ
        /// </summary>
        public double opor_warn_tshold { get; set; }
 
        /// <summary>
        /// ����Աֹ����ֵ
        /// </summary>
        public double opor_stop_tshold { get; set; }
 
        /// <summary>
        /// ��ƽ��Ȩ��
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

            #region CommonDTOFiled Ĭ�ϲ������̶���ʽ
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

    //�߼�_���֤ȯ_�ӿ�_������²���Ա���ռ������
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
        /// ����������
        /// </summary>
        public ulong moni_set_id { get; set; }
 
        /// <summary>
        /// ��ǰ���ֵ
        /// </summary>
        public double curr_moni_value { get; set; }
 
        /// <summary>
        /// �ֽ��ʲ�
        /// </summary>
        public double cash_asset { get; set; }
 
        /// <summary>
        /// �����ʲ�
        /// </summary>
        public double fund_asset { get; set; }
 
        /// <summary>
        /// ծȯ�ʲ�
        /// </summary>
        public double bond_asset { get; set; }
 
        /// <summary>
        /// ��Ʊ�ʲ�
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// �ع��ʲ�
        /// </summary>
        public double repo_asset { get; set; }
 
        /// <summary>
        /// ���ʲ�
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// �Աȵ�ǰ���ֵ
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

            #region CommonDTOFiled Ĭ�ϲ������̶���ʽ
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

    //�߼�_���֤ȯ_�ӿ�_��ѯ��ط������ʲ��˻��ʲ�
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
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
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

            #region CommonDTOFiled Ĭ�ϲ������̶���ʽ
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

    //�߼�_���֤ȯ_�ӿ�_�������ͻ�����
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
        /// �������
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// ��Ʒ���
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// ��������
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// �ʲ��˻����
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// �г����
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// ���ױ���
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// ֤ȯ����
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// ָ���޼�
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// ָ��ʵ���޼�
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// ָ���
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// ָ������
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// ָ��ִ����
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

            #region CommonDTOFiled Ĭ�ϲ������̶���ʽ
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
