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
    public class clfofuL_2_1_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_1_Response()
        {
            this.clfofuL_2_1_InfoList = new ObservableCollection<clfofuL_2_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_1_Info> clfofuL_2_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_1_Info info = new clfofuL_2_1_Info();
            info.record_count = unpacker.GetInt("record_count");
            clfofuL_2_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_1_InfoList.Add((clfofuL_2_1_Info)info);
        }
        #endregion
    }

    public class clfofuL_2_4_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_4_Response()
        {
            this.clfofuL_2_4_InfoList = new ObservableCollection<clfofuL_2_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_4_Info> clfofuL_2_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_4_Info info = new clfofuL_2_4_Info();
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
            info.comm_id = unpacker.GetInt64("comm_id");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_no = unpacker.GetInt("order_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.report_fee = unpacker.GetDouble("report_fee");
            info.wtdraw_fee = unpacker.GetDouble("wtdraw_fee");
            info.order_status = unpacker.GetStr("order_status");
            info.deal_flag = unpacker.GetInt("deal_flag");
            clfofuL_2_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_4_InfoList.Add((clfofuL_2_4_Info)info);
        }
        #endregion
    }

    public class clfofuL_2_6_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_6_Response()
        {
            this.clfofuL_2_6_InfoList = new ObservableCollection<clfofuL_2_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_6_Info> clfofuL_2_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_6_Info info = new clfofuL_2_6_Info();
            info.record_count = unpacker.GetInt("record_count");
            clfofuL_2_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_6_InfoList.Add((clfofuL_2_6_Info)info);
        }
        #endregion
    }

    public class clfofuL_2_9_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_9_Response()
        {
            this.clfofuL_2_9_InfoList = new ObservableCollection<clfofuL_2_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_9_Info> clfofuL_2_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_9_Info info = new clfofuL_2_9_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.match_status = unpacker.GetStr("match_status");
            info.deal_flag = unpacker.GetInt("deal_flag");
            clfofuL_2_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_9_InfoList.Add((clfofuL_2_9_Info)info);
        }
        #endregion
    }

    public class clfutuL_2_21_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_21_Response()
        {
            this.clfutuL_2_21_InfoList = new ObservableCollection<clfutuL_2_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_21_Info> clfutuL_2_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_21_Info info = new clfutuL_2_21_Info();
            clfutuL_2_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_21_InfoList.Add((clfutuL_2_21_Info)info);
        }
        #endregion
    }

    public class clfofuL_2_31_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_31_Response()
        {
            this.clfofuL_2_31_InfoList = new ObservableCollection<clfofuL_2_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_31_Info> clfofuL_2_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_31_Info info = new clfofuL_2_31_Info();
            info.record_count = unpacker.GetInt("record_count");
            clfofuL_2_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_31_InfoList.Add((clfofuL_2_31_Info)info);
        }
        #endregion
    }

    public class clfofuL_2_32_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_32_Response()
        {
            this.clfofuL_2_32_InfoList = new ObservableCollection<clfofuL_2_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_32_Info> clfofuL_2_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_32_Info info = new clfofuL_2_32_Info();
            info.record_count = unpacker.GetInt("record_count");
            clfofuL_2_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_32_InfoList.Add((clfofuL_2_32_Info)info);
        }
        #endregion
    }

    public class clfofuL_2_33_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_33_Response()
        {
            this.clfofuL_2_33_InfoList = new ObservableCollection<clfofuL_2_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_33_Info> clfofuL_2_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_33_Info info = new clfofuL_2_33_Info();
            info.record_count = unpacker.GetInt("record_count");
            clfofuL_2_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_33_InfoList.Add((clfofuL_2_33_Info)info);
        }
        #endregion
    }

    public class clfofuL_2_34_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_34_Response()
        {
            this.clfofuL_2_34_InfoList = new ObservableCollection<clfofuL_2_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_34_Info> clfofuL_2_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_34_Info info = new clfofuL_2_34_Info();
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
            info.strike_num = unpacker.GetInt("strike_num");
            info.strike_aver_price = unpacker.GetDouble("strike_aver_price");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.pre_entry_qty = unpacker.GetDouble("pre_entry_qty");
            info.pre_entry_amt = unpacker.GetDouble("pre_entry_amt");
            info.split_rece_margin = unpacker.GetDouble("split_rece_margin");
            info.split_strike_qty = unpacker.GetDouble("split_strike_qty");
            info.split_strike_amt = unpacker.GetDouble("split_strike_amt");
            info.split_report_fee = unpacker.GetDouble("split_report_fee");
            info.split_cancel_fee = unpacker.GetDouble("split_cancel_fee");
            info.split_deli_fee = unpacker.GetDouble("split_deli_fee");
            info.split_other_fee = unpacker.GetDouble("split_other_fee");
            info.split_brkage_commis = unpacker.GetDouble("split_brkage_commis");
            info.split_other_commis = unpacker.GetDouble("split_other_commis");
            info.split_out_strike_qty = unpacker.GetDouble("split_out_strike_qty");
            info.split_out_strike_amt = unpacker.GetDouble("split_out_strike_amt");
            info.split_out_report_fee = unpacker.GetDouble("split_out_report_fee");
            info.split_out_cancel_fee = unpacker.GetDouble("split_out_cancel_fee");
            info.split_out_deli_fee = unpacker.GetDouble("split_out_deli_fee");
            info.split_out_other_fee = unpacker.GetDouble("split_out_other_fee");
            info.split_out_brkage_commis = unpacker.GetDouble("split_out_brkage_commis");
            info.split_out_other_commis = unpacker.GetDouble("split_out_other_commis");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.deal_flag = unpacker.GetInt("deal_flag");
            clfofuL_2_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_34_InfoList.Add((clfofuL_2_34_Info)info);
        }
        #endregion
    }

    public class clfofuL_2_35_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_35_Response()
        {
            this.clfofuL_2_35_InfoList = new ObservableCollection<clfofuL_2_35_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_35_Info> clfofuL_2_35_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_35_Info info = new clfofuL_2_35_Info();
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
            clfofuL_2_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_35_InfoList.Add((clfofuL_2_35_Info)info);
        }
        #endregion
    }

    public class clfofuL_2_51_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_51_Response()
        {
            this.clfofuL_2_51_InfoList = new ObservableCollection<clfofuL_2_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_51_Info> clfofuL_2_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_51_Info info = new clfofuL_2_51_Info();
            info.record_count = unpacker.GetInt("record_count");
            clfofuL_2_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_51_InfoList.Add((clfofuL_2_51_Info)info);
        }
        #endregion
    }

    public class clfofuL_2_52_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_52_Response()
        {
            this.clfofuL_2_52_InfoList = new ObservableCollection<clfofuL_2_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_52_Info> clfofuL_2_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_52_Info info = new clfofuL_2_52_Info();
            clfofuL_2_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_52_InfoList.Add((clfofuL_2_52_Info)info);
        }
        #endregion
    }

    public class clfofuL_2_71_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_71_Response()
        {
            this.clfofuL_2_71_InfoList = new ObservableCollection<clfofuL_2_71_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_71_Info> clfofuL_2_71_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_71_Info info = new clfofuL_2_71_Info();
            clfofuL_2_71_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_71_InfoList.Add((clfofuL_2_71_Info)info);
        }
        #endregion
    }

    public class clfofuL_2_101_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_101_Response()
        {
            this.clfofuL_2_101_InfoList = new ObservableCollection<clfofuL_2_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_101_Info> clfofuL_2_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_101_Info info = new clfofuL_2_101_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clfofuL_2_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_101_InfoList.Add((clfofuL_2_101_Info)info);
        }
        #endregion
    }

    public class clfutuL_2_102_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_102_Response()
        {
            this.clfutuL_2_102_InfoList = new ObservableCollection<clfutuL_2_102_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_102_Info> clfutuL_2_102_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_102_Info info = new clfutuL_2_102_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clfutuL_2_102_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_102_InfoList.Add((clfutuL_2_102_Info)info);
        }
        #endregion
    }

    public class clfofuL_2_103_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_103_Response()
        {
            this.clfofuL_2_103_InfoList = new ObservableCollection<clfofuL_2_103_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_103_Info> clfofuL_2_103_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_103_Info info = new clfofuL_2_103_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clfofuL_2_103_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_103_InfoList.Add((clfofuL_2_103_Info)info);
        }
        #endregion
    }

    public class clfofuL_2_104_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_104_Response()
        {
            this.clfofuL_2_104_InfoList = new ObservableCollection<clfofuL_2_104_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_104_Info> clfofuL_2_104_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_104_Info info = new clfofuL_2_104_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clfofuL_2_104_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_104_InfoList.Add((clfofuL_2_104_Info)info);
        }
        #endregion
    }

    public class clfofuL_2_106_Response : IResponse
    {
        #region 构造函数
        public clfofuL_2_106_Response()
        {
            this.clfofuL_2_106_InfoList = new ObservableCollection<clfofuL_2_106_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfofuL_2_106_Info> clfofuL_2_106_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfofuL_2_106_Info info = new clfofuL_2_106_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clfofuL_2_106_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfofuL_2_106_InfoList.Add((clfofuL_2_106_Info)info);
        }
        #endregion
    }

}
