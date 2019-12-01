using LdNet.ClientSdk.Model;
using LdNet.ClientCore.Sdk;
using LdNet.Communication;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Response
{
    public class clfofuL_3_1_Response : IResponse
    {
        #region 构造函数
        public clfofuL_3_1_Response()
        {
            this.clfofuL_3_1_InfoList = new ObservableCollection<clfofuL_3_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_3_1_Info> clfofuL_3_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_3_1_Info info = new clfofuL_3_1_Info();
            clfofuL_3_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_3_1_InfoList.Add((clfofuL_3_1_Info)info);
        }
        #endregion
    }

    public class clfofuL_3_2_Response : IResponse
    {
        #region 构造函数
        public clfofuL_3_2_Response()
        {
            this.clfofuL_3_2_InfoList = new ObservableCollection<clfofuL_3_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_3_2_Info> clfofuL_3_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_3_2_Info info = new clfofuL_3_2_Info();
            clfofuL_3_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_3_2_InfoList.Add((clfofuL_3_2_Info)info);
        }
        #endregion
    }

    public class clfofuL_3_3_Response : IResponse
    {
        #region 构造函数
        public clfofuL_3_3_Response()
        {
            this.clfofuL_3_3_InfoList = new ObservableCollection<clfofuL_3_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_3_3_Info> clfofuL_3_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_3_3_Info info = new clfofuL_3_3_Info();
            clfofuL_3_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_3_3_InfoList.Add((clfofuL_3_3_Info)info);
        }
        #endregion
    }

    public class clfofuL_3_4_Response : IResponse
    {
        #region 构造函数
        public clfofuL_3_4_Response()
        {
            this.clfofuL_3_4_InfoList = new ObservableCollection<clfofuL_3_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_3_4_Info> clfofuL_3_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_3_4_Info info = new clfofuL_3_4_Info();
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.deli_price = unpacker.GetDouble("deli_price");
            clfofuL_3_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_3_4_InfoList.Add((clfofuL_3_4_Info)info);
        }
        #endregion
    }

    public class clfofuL_3_9_Response : IResponse
    {
        #region 构造函数
        public clfofuL_3_9_Response()
        {
            this.clfofuL_3_9_InfoList = new ObservableCollection<clfofuL_3_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_3_9_Info> clfofuL_3_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_3_9_Info info = new clfofuL_3_9_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.invest_type = unpacker.GetInt("invest_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.comb_code = unpacker.GetStr("comb_code");
            info.comb_type = unpacker.GetInt("comb_type");
            info.comb_name = unpacker.GetStr("comb_name");
            info.long_hold_margin = unpacker.GetDouble("long_hold_margin");
            info.short_hold_margin = unpacker.GetDouble("short_hold_margin");
            info.sett_capt_margin = unpacker.GetDouble("sett_capt_margin");
            info.deal_flag = unpacker.GetInt("deal_flag");
            clfofuL_3_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_3_9_InfoList.Add((clfofuL_3_9_Info)info);
        }
        #endregion
    }

    public class clfofuL_3_31_Response : IResponse
    {
        #region 构造函数
        public clfofuL_3_31_Response()
        {
            this.clfofuL_3_31_InfoList = new ObservableCollection<clfofuL_3_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_3_31_Info> clfofuL_3_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_3_31_Info info = new clfofuL_3_31_Info();
            clfofuL_3_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_3_31_InfoList.Add((clfofuL_3_31_Info)info);
        }
        #endregion
    }

    public class clfofuL_3_35_Response : IResponse
    {
        #region 构造函数
        public clfofuL_3_35_Response()
        {
            this.clfofuL_3_35_InfoList = new ObservableCollection<clfofuL_3_35_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_3_35_Info> clfofuL_3_35_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_3_35_Info info = new clfofuL_3_35_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.invest_type = unpacker.GetInt("invest_type");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_no = unpacker.GetInt("order_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.pre_settle_price = unpacker.GetDouble("pre_settle_price");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_num = unpacker.GetInt("strike_num");
            info.pre_entry_qty = unpacker.GetDouble("pre_entry_qty");
            info.pre_entry_amt = unpacker.GetDouble("pre_entry_amt");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.comb_code = unpacker.GetStr("comb_code");
            info.comb_type = unpacker.GetInt("comb_type");
            info.comb_name = unpacker.GetStr("comb_name");
            info.long_hold_margin = unpacker.GetDouble("long_hold_margin");
            info.short_hold_margin = unpacker.GetDouble("short_hold_margin");
            info.sett_capt_margin = unpacker.GetDouble("sett_capt_margin");
            info.sett_close_pandl = unpacker.GetDouble("sett_close_pandl");
            info.sett_marked_pandl = unpacker.GetDouble("sett_marked_pandl");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.report_fee = unpacker.GetDouble("report_fee");
            info.wtdraw_fee = unpacker.GetDouble("wtdraw_fee");
            info.deli_fee = unpacker.GetDouble("deli_fee");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.out_all_fee = unpacker.GetDouble("out_all_fee");
            info.out_report_fee = unpacker.GetDouble("out_report_fee");
            info.out_cancel_fee = unpacker.GetDouble("out_cancel_fee");
            info.out_deli_fee = unpacker.GetDouble("out_deli_fee");
            info.out_other_fee = unpacker.GetDouble("out_other_fee");
            info.out_brkage_commis = unpacker.GetDouble("out_brkage_commis");
            info.out_other_commis = unpacker.GetDouble("out_other_commis");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.entry_status = unpacker.GetStr("entry_status");
            info.undo_status = unpacker.GetStr("undo_status");
            info.entry_money_jour_no = unpacker.GetInt64("entry_money_jour_no");
            info.entry_posi_jour_no = unpacker.GetInt64("entry_posi_jour_no");
            info.deli_jour_no = unpacker.GetInt64("deli_jour_no");
            clfofuL_3_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_3_35_InfoList.Add((clfofuL_3_35_Info)info);
        }
        #endregion
    }

    public class clfofuL_3_51_Response : IResponse
    {
        #region 构造函数
        public clfofuL_3_51_Response()
        {
            this.clfofuL_3_51_InfoList = new ObservableCollection<clfofuL_3_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_3_51_Info> clfofuL_3_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_3_51_Info info = new clfofuL_3_51_Info();
            clfofuL_3_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_3_51_InfoList.Add((clfofuL_3_51_Info)info);
        }
        #endregion
    }

    public class clfofuL_3_52_Response : IResponse
    {
        #region 构造函数
        public clfofuL_3_52_Response()
        {
            this.clfofuL_3_52_InfoList = new ObservableCollection<clfofuL_3_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_3_52_Info> clfofuL_3_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_3_52_Info info = new clfofuL_3_52_Info();
            clfofuL_3_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_3_52_InfoList.Add((clfofuL_3_52_Info)info);
        }
        #endregion
    }

    public class clfofuL_3_71_Response : IResponse
    {
        #region 构造函数
        public clfofuL_3_71_Response()
        {
            this.clfofuL_3_71_InfoList = new ObservableCollection<clfofuL_3_71_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_3_71_Info> clfofuL_3_71_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_3_71_Info info = new clfofuL_3_71_Info();
            clfofuL_3_71_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_3_71_InfoList.Add((clfofuL_3_71_Info)info);
        }
        #endregion
    }

    public class clfofuL_3_102_Response : IResponse
    {
        #region 构造函数
        public clfofuL_3_102_Response()
        {
            this.clfofuL_3_102_InfoList = new ObservableCollection<clfofuL_3_102_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_3_102_Info> clfofuL_3_102_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_3_102_Info info = new clfofuL_3_102_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clfofuL_3_102_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_3_102_InfoList.Add((clfofuL_3_102_Info)info);
        }
        #endregion
    }

    public class clfofuL_3_104_Response : IResponse
    {
        #region 构造函数
        public clfofuL_3_104_Response()
        {
            this.clfofuL_3_104_InfoList = new ObservableCollection<clfofuL_3_104_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_3_104_Info> clfofuL_3_104_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_3_104_Info info = new clfofuL_3_104_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clfofuL_3_104_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_3_104_InfoList.Add((clfofuL_3_104_Info)info);
        }
        #endregion
    }

    public class clfofuL_3_106_Response : IResponse
    {
        #region 构造函数
        public clfofuL_3_106_Response()
        {
            this.clfofuL_3_106_InfoList = new ObservableCollection<clfofuL_3_106_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_3_106_Info> clfofuL_3_106_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_3_106_Info info = new clfofuL_3_106_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clfofuL_3_106_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_3_106_InfoList.Add((clfofuL_3_106_Info)info);
        }
        #endregion
    }

}
