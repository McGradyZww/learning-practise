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
    public class tdsecuL_12_88_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_12_88_Response()
        {
            this.tdsecuL_12_88_InfoList = new ObservableCollection<tdsecuL_12_88_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_12_88_Info> tdsecuL_12_88_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_12_88_Info info = new tdsecuL_12_88_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.comm_frozen_qty = unpacker.GetDouble("comm_frozen_qty");
            info.comm_unfroz_qty = unpacker.GetDouble("comm_unfroz_qty");
            info.comm_capt_qty = unpacker.GetDouble("comm_capt_qty");
            info.comm_releas_qty = unpacker.GetDouble("comm_releas_qty");
            info.trade_frozen_qty = unpacker.GetDouble("trade_frozen_qty");
            info.trade_unfroz_qty = unpacker.GetDouble("trade_unfroz_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_frozen_qty = unpacker.GetDouble("strike_frozen_qty");
            info.strike_unfroz_qty = unpacker.GetDouble("strike_unfroz_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.update_times = unpacker.GetInt("update_times");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            tdsecuL_12_88_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_12_88_InfoList.Add((tdsecuL_12_88_Info)info);
        }
        #endregion

        //逻辑_交易证券_账户运维_查询资产账户持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_12_88_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    info.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    info.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    info.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    info.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    info.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    info.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    tdsecuL_12_88_InfoList.Add(info);
                }
            }
        }
    }

}
