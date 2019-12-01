using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pdsecuL_2_8_Info : ObservableObject
    {
    }

    public class pdsecuL_2_9_Info : ObservableObject
    {
    }

    public class pdsecuL_2_10_Info : ObservableObject
    {
    }

    public class pdsecuL_2_11_Info : ObservableObject
    {
    }

    public class pdsecuL_2_32_Info : ObservableObject
    {
    }

    public class pdsecuL_2_33_Info : ObservableObject
    {
    }

    public class pdsecuL_2_34_Info : ObservableObject
    {
    }

    public class pdsecuL_2_35_Info : ObservableObject
    {
    }

    public class pdsecuL_2_37_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private double _begin_amt;
        /// <summary>
        /// 期初金额
        /// </summary>
        public double begin_amt
        {
            get { return _begin_amt; }

            set
            {
                _begin_amt = value;
                RaisePropertyChanged(() => begin_amt);
            }
        }

        private double _curr_amt;
        /// <summary>
        /// 当前金额
        /// </summary>
        public double curr_amt
        {
            get { return _curr_amt; }

            set
            {
                _curr_amt = value;
                RaisePropertyChanged(() => curr_amt);
            }
        }

        private double _frozen_amt;
        /// <summary>
        /// 冻结金额
        /// </summary>
        public double frozen_amt
        {
            get { return _frozen_amt; }

            set
            {
                _frozen_amt = value;
                RaisePropertyChanged(() => frozen_amt);
            }
        }

        private double _unfroz_amt;
        /// <summary>
        /// 解冻金额
        /// </summary>
        public double unfroz_amt
        {
            get { return _unfroz_amt; }

            set
            {
                _unfroz_amt = value;
                RaisePropertyChanged(() => unfroz_amt);
            }
        }

        private double _pre_settle_amt;
        /// <summary>
        /// 待交收金额
        /// </summary>
        public double pre_settle_amt
        {
            get { return _pre_settle_amt; }

            set
            {
                _pre_settle_amt = value;
                RaisePropertyChanged(() => pre_settle_amt);
            }
        }

        private double _shsz_avail_change_amt;
        /// <summary>
        /// 沪深可用调整金额
        /// </summary>
        public double shsz_avail_change_amt
        {
            get { return _shsz_avail_change_amt; }

            set
            {
                _shsz_avail_change_amt = value;
                RaisePropertyChanged(() => shsz_avail_change_amt);
            }
        }

        private double _hk_avail_change_amt;
        /// <summary>
        /// 港股通可用调整金额
        /// </summary>
        public double hk_avail_change_amt
        {
            get { return _hk_avail_change_amt; }

            set
            {
                _hk_avail_change_amt = value;
                RaisePropertyChanged(() => hk_avail_change_amt);
            }
        }

        private double _amt_check_diff;
        /// <summary>
        /// 金额核对差额
        /// </summary>
        public double amt_check_diff
        {
            get { return _amt_check_diff; }

            set
            {
                _amt_check_diff = value;
                RaisePropertyChanged(() => amt_check_diff);
            }
        }

        private double _T_hk_buy_total_amt;
        /// <summary>
        /// T日当日港股买入金额
        /// </summary>
        public double T_hk_buy_total_amt
        {
            get { return _T_hk_buy_total_amt; }

            set
            {
                _T_hk_buy_total_amt = value;
                RaisePropertyChanged(() => T_hk_buy_total_amt);
            }
        }

        private double _T_hk_sell_total_amt;
        /// <summary>
        /// T日当日港股卖出金额
        /// </summary>
        public double T_hk_sell_total_amt
        {
            get { return _T_hk_sell_total_amt; }

            set
            {
                _T_hk_sell_total_amt = value;
                RaisePropertyChanged(() => T_hk_sell_total_amt);
            }
        }

        private double _T1_hk_buy_total_amt;
        /// <summary>
        /// T1日当日港股买入金额
        /// </summary>
        public double T1_hk_buy_total_amt
        {
            get { return _T1_hk_buy_total_amt; }

            set
            {
                _T1_hk_buy_total_amt = value;
                RaisePropertyChanged(() => T1_hk_buy_total_amt);
            }
        }

        private double _T1_hk_sell_total_amt;
        /// <summary>
        /// T1日当日港股卖出金额
        /// </summary>
        public double T1_hk_sell_total_amt
        {
            get { return _T1_hk_sell_total_amt; }

            set
            {
                _T1_hk_sell_total_amt = value;
                RaisePropertyChanged(() => T1_hk_sell_total_amt);
            }
        }

        private double _total_rece_amt;
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt
        {
            get { return _total_rece_amt; }

            set
            {
                _total_rece_amt = value;
                RaisePropertyChanged(() => total_rece_amt);
            }
        }

        private double _total_payab_amt;
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt
        {
            get { return _total_payab_amt; }

            set
            {
                _total_payab_amt = value;
                RaisePropertyChanged(() => total_payab_amt);
            }
        }

        private double _total_change_amt;
        /// <summary>
        /// 红冲蓝补金额
        /// </summary>
        public double total_change_amt
        {
            get { return _total_change_amt; }

            set
            {
                _total_change_amt = value;
                RaisePropertyChanged(() => total_change_amt);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _intrst_rate;
        /// <summary>
        /// 利率
        /// </summary>
        public double intrst_rate
        {
            get { return _intrst_rate; }

            set
            {
                _intrst_rate = value;
                RaisePropertyChanged(() => intrst_rate);
            }
        }

        private double _intrst_base_amt;
        /// <summary>
        /// 利息积数
        /// </summary>
        public double intrst_base_amt
        {
            get { return _intrst_base_amt; }

            set
            {
                _intrst_base_amt = value;
                RaisePropertyChanged(() => intrst_base_amt);
            }
        }

        private double _pre_entry_intrst_amt;
        /// <summary>
        /// 待入账利息
        /// </summary>
        public double pre_entry_intrst_amt
        {
            get { return _pre_entry_intrst_amt; }

            set
            {
                _pre_entry_intrst_amt = value;
                RaisePropertyChanged(() => pre_entry_intrst_amt);
            }
        }
    }

    public class pdsecuL_2_38_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private double _begin_amt;
        /// <summary>
        /// 期初金额
        /// </summary>
        public double begin_amt
        {
            get { return _begin_amt; }

            set
            {
                _begin_amt = value;
                RaisePropertyChanged(() => begin_amt);
            }
        }

        private double _curr_amt;
        /// <summary>
        /// 当前金额
        /// </summary>
        public double curr_amt
        {
            get { return _curr_amt; }

            set
            {
                _curr_amt = value;
                RaisePropertyChanged(() => curr_amt);
            }
        }

        private double _frozen_amt;
        /// <summary>
        /// 冻结金额
        /// </summary>
        public double frozen_amt
        {
            get { return _frozen_amt; }

            set
            {
                _frozen_amt = value;
                RaisePropertyChanged(() => frozen_amt);
            }
        }

        private double _unfroz_amt;
        /// <summary>
        /// 解冻金额
        /// </summary>
        public double unfroz_amt
        {
            get { return _unfroz_amt; }

            set
            {
                _unfroz_amt = value;
                RaisePropertyChanged(() => unfroz_amt);
            }
        }

        private double _pre_settle_amt;
        /// <summary>
        /// 待交收金额
        /// </summary>
        public double pre_settle_amt
        {
            get { return _pre_settle_amt; }

            set
            {
                _pre_settle_amt = value;
                RaisePropertyChanged(() => pre_settle_amt);
            }
        }

        private double _shsz_avail_change_amt;
        /// <summary>
        /// 沪深可用调整金额
        /// </summary>
        public double shsz_avail_change_amt
        {
            get { return _shsz_avail_change_amt; }

            set
            {
                _shsz_avail_change_amt = value;
                RaisePropertyChanged(() => shsz_avail_change_amt);
            }
        }

        private double _hk_avail_change_amt;
        /// <summary>
        /// 港股通可用调整金额
        /// </summary>
        public double hk_avail_change_amt
        {
            get { return _hk_avail_change_amt; }

            set
            {
                _hk_avail_change_amt = value;
                RaisePropertyChanged(() => hk_avail_change_amt);
            }
        }

        private double _amt_check_diff;
        /// <summary>
        /// 金额核对差额
        /// </summary>
        public double amt_check_diff
        {
            get { return _amt_check_diff; }

            set
            {
                _amt_check_diff = value;
                RaisePropertyChanged(() => amt_check_diff);
            }
        }

        private double _T_hk_buy_total_amt;
        /// <summary>
        /// T日当日港股买入金额
        /// </summary>
        public double T_hk_buy_total_amt
        {
            get { return _T_hk_buy_total_amt; }

            set
            {
                _T_hk_buy_total_amt = value;
                RaisePropertyChanged(() => T_hk_buy_total_amt);
            }
        }

        private double _T_hk_sell_total_amt;
        /// <summary>
        /// T日当日港股卖出金额
        /// </summary>
        public double T_hk_sell_total_amt
        {
            get { return _T_hk_sell_total_amt; }

            set
            {
                _T_hk_sell_total_amt = value;
                RaisePropertyChanged(() => T_hk_sell_total_amt);
            }
        }

        private double _T1_hk_buy_total_amt;
        /// <summary>
        /// T1日当日港股买入金额
        /// </summary>
        public double T1_hk_buy_total_amt
        {
            get { return _T1_hk_buy_total_amt; }

            set
            {
                _T1_hk_buy_total_amt = value;
                RaisePropertyChanged(() => T1_hk_buy_total_amt);
            }
        }

        private double _T1_hk_sell_total_amt;
        /// <summary>
        /// T1日当日港股卖出金额
        /// </summary>
        public double T1_hk_sell_total_amt
        {
            get { return _T1_hk_sell_total_amt; }

            set
            {
                _T1_hk_sell_total_amt = value;
                RaisePropertyChanged(() => T1_hk_sell_total_amt);
            }
        }

        private double _total_rece_amt;
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt
        {
            get { return _total_rece_amt; }

            set
            {
                _total_rece_amt = value;
                RaisePropertyChanged(() => total_rece_amt);
            }
        }

        private double _total_payab_amt;
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt
        {
            get { return _total_payab_amt; }

            set
            {
                _total_payab_amt = value;
                RaisePropertyChanged(() => total_payab_amt);
            }
        }

        private double _total_change_amt;
        /// <summary>
        /// 红冲蓝补金额
        /// </summary>
        public double total_change_amt
        {
            get { return _total_change_amt; }

            set
            {
                _total_change_amt = value;
                RaisePropertyChanged(() => total_change_amt);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _intrst_rate;
        /// <summary>
        /// 利率
        /// </summary>
        public double intrst_rate
        {
            get { return _intrst_rate; }

            set
            {
                _intrst_rate = value;
                RaisePropertyChanged(() => intrst_rate);
            }
        }

        private double _intrst_base_amt;
        /// <summary>
        /// 利息积数
        /// </summary>
        public double intrst_base_amt
        {
            get { return _intrst_base_amt; }

            set
            {
                _intrst_base_amt = value;
                RaisePropertyChanged(() => intrst_base_amt);
            }
        }

        private double _pre_entry_intrst_amt;
        /// <summary>
        /// 待入账利息
        /// </summary>
        public double pre_entry_intrst_amt
        {
            get { return _pre_entry_intrst_amt; }

            set
            {
                _pre_entry_intrst_amt = value;
                RaisePropertyChanged(() => pre_entry_intrst_amt);
            }
        }
    }

    public class pdsecuL_2_39_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private int _busi_flag;
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag
        {
            get { return _busi_flag; }

            set
            {
                _busi_flag = value;
                RaisePropertyChanged(() => busi_flag);
            }
        }

        private double _occur_amt;
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt
        {
            get { return _occur_amt; }

            set
            {
                _occur_amt = value;
                RaisePropertyChanged(() => occur_amt);
            }
        }

        private double _occur_end_amt;
        /// <summary>
        /// 变动后金额
        /// </summary>
        public double occur_end_amt
        {
            get { return _occur_end_amt; }

            set
            {
                _occur_end_amt = value;
                RaisePropertyChanged(() => occur_end_amt);
            }
        }

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pdsecuL_2_40_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private int _busi_flag;
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag
        {
            get { return _busi_flag; }

            set
            {
                _busi_flag = value;
                RaisePropertyChanged(() => busi_flag);
            }
        }

        private double _occur_amt;
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt
        {
            get { return _occur_amt; }

            set
            {
                _occur_amt = value;
                RaisePropertyChanged(() => occur_amt);
            }
        }

        private double _occur_end_amt;
        /// <summary>
        /// 变动后金额
        /// </summary>
        public double occur_end_amt
        {
            get { return _occur_end_amt; }

            set
            {
                _occur_end_amt = value;
                RaisePropertyChanged(() => occur_end_amt);
            }
        }

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pdsecuL_2_41_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private int _frozen_type;
        /// <summary>
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type
        {
            get { return _frozen_type; }

            set
            {
                _frozen_type = value;
                RaisePropertyChanged(() => frozen_type);
            }
        }

        private double _occur_amt;
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt
        {
            get { return _occur_amt; }

            set
            {
                _occur_amt = value;
                RaisePropertyChanged(() => occur_amt);
            }
        }

        private int _expire_date;
        /// <summary>
        /// 到期日期
        /// </summary>
        public int expire_date
        {
            get { return _expire_date; }

            set
            {
                _expire_date = value;
                RaisePropertyChanged(() => expire_date);
            }
        }

        private String _jour_status;
        /// <summary>
        /// 流水状态
        /// </summary>
        public String jour_status
        {
            get { return _jour_status; }

            set
            {
                _jour_status = value;
                RaisePropertyChanged(() => jour_status);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pdsecuL_2_42_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private int _frozen_type;
        /// <summary>
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type
        {
            get { return _frozen_type; }

            set
            {
                _frozen_type = value;
                RaisePropertyChanged(() => frozen_type);
            }
        }

        private double _occur_amt;
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt
        {
            get { return _occur_amt; }

            set
            {
                _occur_amt = value;
                RaisePropertyChanged(() => occur_amt);
            }
        }

        private int _expire_date;
        /// <summary>
        /// 到期日期
        /// </summary>
        public int expire_date
        {
            get { return _expire_date; }

            set
            {
                _expire_date = value;
                RaisePropertyChanged(() => expire_date);
            }
        }

        private String _jour_status;
        /// <summary>
        /// 流水状态
        /// </summary>
        public String jour_status
        {
            get { return _jour_status; }

            set
            {
                _jour_status = value;
                RaisePropertyChanged(() => jour_status);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pdsecuL_2_43_Info : ObservableObject
    {
    }

    public class pdsecuL_2_44_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private double _begin_NAV;
        /// <summary>
        /// 期初净资产
        /// </summary>
        public double begin_NAV
        {
            get { return _begin_NAV; }

            set
            {
                _begin_NAV = value;
                RaisePropertyChanged(() => begin_NAV);
            }
        }

        private double _nav_asset;
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset
        {
            get { return _nav_asset; }

            set
            {
                _nav_asset = value;
                RaisePropertyChanged(() => nav_asset);
            }
        }

        private double _cash_asset;
        /// <summary>
        /// 现金资产
        /// </summary>
        public double cash_asset
        {
            get { return _cash_asset; }

            set
            {
                _cash_asset = value;
                RaisePropertyChanged(() => cash_asset);
            }
        }

        private double _stock_asset;
        /// <summary>
        /// 股票资产
        /// </summary>
        public double stock_asset
        {
            get { return _stock_asset; }

            set
            {
                _stock_asset = value;
                RaisePropertyChanged(() => stock_asset);
            }
        }

        private double _fund_asset;
        /// <summary>
        /// 基金资产
        /// </summary>
        public double fund_asset
        {
            get { return _fund_asset; }

            set
            {
                _fund_asset = value;
                RaisePropertyChanged(() => fund_asset);
            }
        }

        private double _bond_asset;
        /// <summary>
        /// 债券资产
        /// </summary>
        public double bond_asset
        {
            get { return _bond_asset; }

            set
            {
                _bond_asset = value;
                RaisePropertyChanged(() => bond_asset);
            }
        }

        private double _repo_asset;
        /// <summary>
        /// 回购资产
        /// </summary>
        public double repo_asset
        {
            get { return _repo_asset; }

            set
            {
                _repo_asset = value;
                RaisePropertyChanged(() => repo_asset);
            }
        }

        private double _other_asset;
        /// <summary>
        /// 其他资产
        /// </summary>
        public double other_asset
        {
            get { return _other_asset; }

            set
            {
                _other_asset = value;
                RaisePropertyChanged(() => other_asset);
            }
        }

        private double _hk_thrgh_stock_asset;
        /// <summary>
        /// 港股通资产
        /// </summary>
        public double hk_thrgh_stock_asset
        {
            get { return _hk_thrgh_stock_asset; }

            set
            {
                _hk_thrgh_stock_asset = value;
                RaisePropertyChanged(() => hk_thrgh_stock_asset);
            }
        }
    }

    public class pdsecuL_2_51_Info : ObservableObject
    {
    }

    public class pdsecuL_2_52_Info : ObservableObject
    {
    }

    public class pdsecuL_2_53_Info : ObservableObject
    {
    }

    public class pdsecuL_2_54_Info : ObservableObject
    {
    }

    public class pdsecuL_2_55_Info : ObservableObject
    {
    }

    public class pdsecuL_2_57_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private double _begin_amt;
        /// <summary>
        /// 期初金额
        /// </summary>
        public double begin_amt
        {
            get { return _begin_amt; }

            set
            {
                _begin_amt = value;
                RaisePropertyChanged(() => begin_amt);
            }
        }

        private double _curr_amt;
        /// <summary>
        /// 当前金额
        /// </summary>
        public double curr_amt
        {
            get { return _curr_amt; }

            set
            {
                _curr_amt = value;
                RaisePropertyChanged(() => curr_amt);
            }
        }

        private double _frozen_amt;
        /// <summary>
        /// 冻结金额
        /// </summary>
        public double frozen_amt
        {
            get { return _frozen_amt; }

            set
            {
                _frozen_amt = value;
                RaisePropertyChanged(() => frozen_amt);
            }
        }

        private double _unfroz_amt;
        /// <summary>
        /// 解冻金额
        /// </summary>
        public double unfroz_amt
        {
            get { return _unfroz_amt; }

            set
            {
                _unfroz_amt = value;
                RaisePropertyChanged(() => unfroz_amt);
            }
        }

        private double _pre_settle_amt;
        /// <summary>
        /// 待交收金额
        /// </summary>
        public double pre_settle_amt
        {
            get { return _pre_settle_amt; }

            set
            {
                _pre_settle_amt = value;
                RaisePropertyChanged(() => pre_settle_amt);
            }
        }

        private double _shsz_avail_change_amt;
        /// <summary>
        /// 沪深可用调整金额
        /// </summary>
        public double shsz_avail_change_amt
        {
            get { return _shsz_avail_change_amt; }

            set
            {
                _shsz_avail_change_amt = value;
                RaisePropertyChanged(() => shsz_avail_change_amt);
            }
        }

        private double _hk_avail_change_amt;
        /// <summary>
        /// 港股通可用调整金额
        /// </summary>
        public double hk_avail_change_amt
        {
            get { return _hk_avail_change_amt; }

            set
            {
                _hk_avail_change_amt = value;
                RaisePropertyChanged(() => hk_avail_change_amt);
            }
        }

        private double _amt_check_diff;
        /// <summary>
        /// 金额核对差额
        /// </summary>
        public double amt_check_diff
        {
            get { return _amt_check_diff; }

            set
            {
                _amt_check_diff = value;
                RaisePropertyChanged(() => amt_check_diff);
            }
        }

        private double _T_hk_buy_total_amt;
        /// <summary>
        /// T日当日港股买入金额
        /// </summary>
        public double T_hk_buy_total_amt
        {
            get { return _T_hk_buy_total_amt; }

            set
            {
                _T_hk_buy_total_amt = value;
                RaisePropertyChanged(() => T_hk_buy_total_amt);
            }
        }

        private double _T_hk_sell_total_amt;
        /// <summary>
        /// T日当日港股卖出金额
        /// </summary>
        public double T_hk_sell_total_amt
        {
            get { return _T_hk_sell_total_amt; }

            set
            {
                _T_hk_sell_total_amt = value;
                RaisePropertyChanged(() => T_hk_sell_total_amt);
            }
        }

        private double _T1_hk_buy_total_amt;
        /// <summary>
        /// T1日当日港股买入金额
        /// </summary>
        public double T1_hk_buy_total_amt
        {
            get { return _T1_hk_buy_total_amt; }

            set
            {
                _T1_hk_buy_total_amt = value;
                RaisePropertyChanged(() => T1_hk_buy_total_amt);
            }
        }

        private double _T1_hk_sell_total_amt;
        /// <summary>
        /// T1日当日港股卖出金额
        /// </summary>
        public double T1_hk_sell_total_amt
        {
            get { return _T1_hk_sell_total_amt; }

            set
            {
                _T1_hk_sell_total_amt = value;
                RaisePropertyChanged(() => T1_hk_sell_total_amt);
            }
        }

        private double _total_rece_amt;
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt
        {
            get { return _total_rece_amt; }

            set
            {
                _total_rece_amt = value;
                RaisePropertyChanged(() => total_rece_amt);
            }
        }

        private double _total_payab_amt;
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt
        {
            get { return _total_payab_amt; }

            set
            {
                _total_payab_amt = value;
                RaisePropertyChanged(() => total_payab_amt);
            }
        }

        private double _total_change_amt;
        /// <summary>
        /// 红冲蓝补金额
        /// </summary>
        public double total_change_amt
        {
            get { return _total_change_amt; }

            set
            {
                _total_change_amt = value;
                RaisePropertyChanged(() => total_change_amt);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _intrst_rate;
        /// <summary>
        /// 利率
        /// </summary>
        public double intrst_rate
        {
            get { return _intrst_rate; }

            set
            {
                _intrst_rate = value;
                RaisePropertyChanged(() => intrst_rate);
            }
        }

        private double _intrst_base_amt;
        /// <summary>
        /// 利息积数
        /// </summary>
        public double intrst_base_amt
        {
            get { return _intrst_base_amt; }

            set
            {
                _intrst_base_amt = value;
                RaisePropertyChanged(() => intrst_base_amt);
            }
        }

        private double _pre_entry_intrst_amt;
        /// <summary>
        /// 待入账利息
        /// </summary>
        public double pre_entry_intrst_amt
        {
            get { return _pre_entry_intrst_amt; }

            set
            {
                _pre_entry_intrst_amt = value;
                RaisePropertyChanged(() => pre_entry_intrst_amt);
            }
        }
    }

    public class pdsecuL_2_58_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private double _begin_amt;
        /// <summary>
        /// 期初金额
        /// </summary>
        public double begin_amt
        {
            get { return _begin_amt; }

            set
            {
                _begin_amt = value;
                RaisePropertyChanged(() => begin_amt);
            }
        }

        private double _curr_amt;
        /// <summary>
        /// 当前金额
        /// </summary>
        public double curr_amt
        {
            get { return _curr_amt; }

            set
            {
                _curr_amt = value;
                RaisePropertyChanged(() => curr_amt);
            }
        }

        private double _frozen_amt;
        /// <summary>
        /// 冻结金额
        /// </summary>
        public double frozen_amt
        {
            get { return _frozen_amt; }

            set
            {
                _frozen_amt = value;
                RaisePropertyChanged(() => frozen_amt);
            }
        }

        private double _unfroz_amt;
        /// <summary>
        /// 解冻金额
        /// </summary>
        public double unfroz_amt
        {
            get { return _unfroz_amt; }

            set
            {
                _unfroz_amt = value;
                RaisePropertyChanged(() => unfroz_amt);
            }
        }

        private double _pre_settle_amt;
        /// <summary>
        /// 待交收金额
        /// </summary>
        public double pre_settle_amt
        {
            get { return _pre_settle_amt; }

            set
            {
                _pre_settle_amt = value;
                RaisePropertyChanged(() => pre_settle_amt);
            }
        }

        private double _shsz_avail_change_amt;
        /// <summary>
        /// 沪深可用调整金额
        /// </summary>
        public double shsz_avail_change_amt
        {
            get { return _shsz_avail_change_amt; }

            set
            {
                _shsz_avail_change_amt = value;
                RaisePropertyChanged(() => shsz_avail_change_amt);
            }
        }

        private double _hk_avail_change_amt;
        /// <summary>
        /// 港股通可用调整金额
        /// </summary>
        public double hk_avail_change_amt
        {
            get { return _hk_avail_change_amt; }

            set
            {
                _hk_avail_change_amt = value;
                RaisePropertyChanged(() => hk_avail_change_amt);
            }
        }

        private double _amt_check_diff;
        /// <summary>
        /// 金额核对差额
        /// </summary>
        public double amt_check_diff
        {
            get { return _amt_check_diff; }

            set
            {
                _amt_check_diff = value;
                RaisePropertyChanged(() => amt_check_diff);
            }
        }

        private double _T_hk_buy_total_amt;
        /// <summary>
        /// T日当日港股买入金额
        /// </summary>
        public double T_hk_buy_total_amt
        {
            get { return _T_hk_buy_total_amt; }

            set
            {
                _T_hk_buy_total_amt = value;
                RaisePropertyChanged(() => T_hk_buy_total_amt);
            }
        }

        private double _T_hk_sell_total_amt;
        /// <summary>
        /// T日当日港股卖出金额
        /// </summary>
        public double T_hk_sell_total_amt
        {
            get { return _T_hk_sell_total_amt; }

            set
            {
                _T_hk_sell_total_amt = value;
                RaisePropertyChanged(() => T_hk_sell_total_amt);
            }
        }

        private double _T1_hk_buy_total_amt;
        /// <summary>
        /// T1日当日港股买入金额
        /// </summary>
        public double T1_hk_buy_total_amt
        {
            get { return _T1_hk_buy_total_amt; }

            set
            {
                _T1_hk_buy_total_amt = value;
                RaisePropertyChanged(() => T1_hk_buy_total_amt);
            }
        }

        private double _T1_hk_sell_total_amt;
        /// <summary>
        /// T1日当日港股卖出金额
        /// </summary>
        public double T1_hk_sell_total_amt
        {
            get { return _T1_hk_sell_total_amt; }

            set
            {
                _T1_hk_sell_total_amt = value;
                RaisePropertyChanged(() => T1_hk_sell_total_amt);
            }
        }

        private double _total_rece_amt;
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt
        {
            get { return _total_rece_amt; }

            set
            {
                _total_rece_amt = value;
                RaisePropertyChanged(() => total_rece_amt);
            }
        }

        private double _total_payab_amt;
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt
        {
            get { return _total_payab_amt; }

            set
            {
                _total_payab_amt = value;
                RaisePropertyChanged(() => total_payab_amt);
            }
        }

        private double _total_change_amt;
        /// <summary>
        /// 红冲蓝补金额
        /// </summary>
        public double total_change_amt
        {
            get { return _total_change_amt; }

            set
            {
                _total_change_amt = value;
                RaisePropertyChanged(() => total_change_amt);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _intrst_rate;
        /// <summary>
        /// 利率
        /// </summary>
        public double intrst_rate
        {
            get { return _intrst_rate; }

            set
            {
                _intrst_rate = value;
                RaisePropertyChanged(() => intrst_rate);
            }
        }

        private double _intrst_base_amt;
        /// <summary>
        /// 利息积数
        /// </summary>
        public double intrst_base_amt
        {
            get { return _intrst_base_amt; }

            set
            {
                _intrst_base_amt = value;
                RaisePropertyChanged(() => intrst_base_amt);
            }
        }

        private double _pre_entry_intrst_amt;
        /// <summary>
        /// 待入账利息
        /// </summary>
        public double pre_entry_intrst_amt
        {
            get { return _pre_entry_intrst_amt; }

            set
            {
                _pre_entry_intrst_amt = value;
                RaisePropertyChanged(() => pre_entry_intrst_amt);
            }
        }
    }

    public class pdsecuL_2_59_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private int _busi_flag;
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag
        {
            get { return _busi_flag; }

            set
            {
                _busi_flag = value;
                RaisePropertyChanged(() => busi_flag);
            }
        }

        private double _occur_amt;
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt
        {
            get { return _occur_amt; }

            set
            {
                _occur_amt = value;
                RaisePropertyChanged(() => occur_amt);
            }
        }

        private double _occur_end_amt;
        /// <summary>
        /// 变动后金额
        /// </summary>
        public double occur_end_amt
        {
            get { return _occur_end_amt; }

            set
            {
                _occur_end_amt = value;
                RaisePropertyChanged(() => occur_end_amt);
            }
        }

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pdsecuL_2_60_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private int _busi_flag;
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag
        {
            get { return _busi_flag; }

            set
            {
                _busi_flag = value;
                RaisePropertyChanged(() => busi_flag);
            }
        }

        private double _occur_amt;
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt
        {
            get { return _occur_amt; }

            set
            {
                _occur_amt = value;
                RaisePropertyChanged(() => occur_amt);
            }
        }

        private double _occur_end_amt;
        /// <summary>
        /// 变动后金额
        /// </summary>
        public double occur_end_amt
        {
            get { return _occur_end_amt; }

            set
            {
                _occur_end_amt = value;
                RaisePropertyChanged(() => occur_end_amt);
            }
        }

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pdsecuL_2_61_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private int _frozen_type;
        /// <summary>
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type
        {
            get { return _frozen_type; }

            set
            {
                _frozen_type = value;
                RaisePropertyChanged(() => frozen_type);
            }
        }

        private double _occur_amt;
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt
        {
            get { return _occur_amt; }

            set
            {
                _occur_amt = value;
                RaisePropertyChanged(() => occur_amt);
            }
        }

        private int _expire_date;
        /// <summary>
        /// 到期日期
        /// </summary>
        public int expire_date
        {
            get { return _expire_date; }

            set
            {
                _expire_date = value;
                RaisePropertyChanged(() => expire_date);
            }
        }

        private String _jour_status;
        /// <summary>
        /// 流水状态
        /// </summary>
        public String jour_status
        {
            get { return _jour_status; }

            set
            {
                _jour_status = value;
                RaisePropertyChanged(() => jour_status);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pdsecuL_2_62_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private int _frozen_type;
        /// <summary>
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type
        {
            get { return _frozen_type; }

            set
            {
                _frozen_type = value;
                RaisePropertyChanged(() => frozen_type);
            }
        }

        private double _occur_amt;
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt
        {
            get { return _occur_amt; }

            set
            {
                _occur_amt = value;
                RaisePropertyChanged(() => occur_amt);
            }
        }

        private int _expire_date;
        /// <summary>
        /// 到期日期
        /// </summary>
        public int expire_date
        {
            get { return _expire_date; }

            set
            {
                _expire_date = value;
                RaisePropertyChanged(() => expire_date);
            }
        }

        private String _jour_status;
        /// <summary>
        /// 流水状态
        /// </summary>
        public String jour_status
        {
            get { return _jour_status; }

            set
            {
                _jour_status = value;
                RaisePropertyChanged(() => jour_status);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pdsecuL_2_63_Info : ObservableObject
    {
    }

    public class pdsecuL_2_101_Info : ObservableObject
    {
    }

    public class pdsecuL_2_103_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private ulong _pass_money_jour_no;
        /// <summary>
        /// 通道资金流水号
        /// </summary>
        public ulong pass_money_jour_no
        {
            get { return _pass_money_jour_no; }

            set
            {
                _pass_money_jour_no = value;
                RaisePropertyChanged(() => pass_money_jour_no);
            }
        }

        private int _busi_flag;
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag
        {
            get { return _busi_flag; }

            set
            {
                _busi_flag = value;
                RaisePropertyChanged(() => busi_flag);
            }
        }

        private int _pass_no;
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no
        {
            get { return _pass_no; }

            set
            {
                _pass_no = value;
                RaisePropertyChanged(() => pass_no);
            }
        }

        private String _out_acco;
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco
        {
            get { return _out_acco; }

            set
            {
                _out_acco = value;
                RaisePropertyChanged(() => out_acco);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private double _entry_amt;
        /// <summary>
        /// 入账金额
        /// </summary>
        public double entry_amt
        {
            get { return _entry_amt; }

            set
            {
                _entry_amt = value;
                RaisePropertyChanged(() => entry_amt);
            }
        }

        private double _entry_end_amt;
        /// <summary>
        /// 入账后金额
        /// </summary>
        public double entry_end_amt
        {
            get { return _entry_end_amt; }

            set
            {
                _entry_end_amt = value;
                RaisePropertyChanged(() => entry_end_amt);
            }
        }

        private int _exch_no;
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no
        {
            get { return _exch_no; }

            set
            {
                _exch_no = value;
                RaisePropertyChanged(() => exch_no);
            }
        }

        private String _stock_acco;
        /// <summary>
        /// 股东代码
        /// </summary>
        public String stock_acco
        {
            get { return _stock_acco; }

            set
            {
                _stock_acco = value;
                RaisePropertyChanged(() => stock_acco);
            }
        }

        private String _stock_code;
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code
        {
            get { return _stock_code; }

            set
            {
                _stock_code = value;
                RaisePropertyChanged(() => stock_code);
            }
        }

        private String _remark_info;
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info
        {
            get { return _remark_info; }

            set
            {
                _remark_info = value;
                RaisePropertyChanged(() => remark_info);
            }
        }

        private int _deal_flag;
        /// <summary>
        /// 处理标志
        /// </summary>
        public int deal_flag
        {
            get { return _deal_flag; }

            set
            {
                _deal_flag = value;
                RaisePropertyChanged(() => deal_flag);
            }
        }
    }

    public class pdsecuL_2_171_Info : ObservableObject
    {

        private int _pass_no;
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no
        {
            get { return _pass_no; }

            set
            {
                _pass_no = value;
                RaisePropertyChanged(() => pass_no);
            }
        }

        private String _out_acco;
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco
        {
            get { return _out_acco; }

            set
            {
                _out_acco = value;
                RaisePropertyChanged(() => out_acco);
            }
        }
    }

    public class pdsecuL_2_64_Info : ObservableObject
    {
    }

    public class pdsecuL_2_65_Info : ObservableObject
    {
    }

    public class pdsecuL_2_66_Info : ObservableObject
    {
    }

    public class pdsecuL_2_67_Info : ObservableObject
    {

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_no;
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no
        {
            get { return _exch_no; }

            set
            {
                _exch_no = value;
                RaisePropertyChanged(() => exch_no);
            }
        }

        private String _stock_acco;
        /// <summary>
        /// 股东代码
        /// </summary>
        public String stock_acco
        {
            get { return _stock_acco; }

            set
            {
                _stock_acco = value;
                RaisePropertyChanged(() => stock_acco);
            }
        }
    }

    public class pdsecuL_2_68_Info : ObservableObject
    {
    }

    public class pdsecuL_2_69_Info : ObservableObject
    {

        private double _exch_group_net_asset;
        /// <summary>
        /// 交易组净资产
        /// </summary>
        public double exch_group_net_asset
        {
            get { return _exch_group_net_asset; }

            set
            {
                _exch_group_net_asset = value;
                RaisePropertyChanged(() => exch_group_net_asset);
            }
        }

        private double _profit;
        /// <summary>
        /// 收益
        /// </summary>
        public double profit
        {
            get { return _profit; }

            set
            {
                _profit = value;
                RaisePropertyChanged(() => profit);
            }
        }

        private double _daily_pandl_ratio;
        /// <summary>
        /// 当日收益率
        /// </summary>
        public double daily_pandl_ratio
        {
            get { return _daily_pandl_ratio; }

            set
            {
                _daily_pandl_ratio = value;
                RaisePropertyChanged(() => daily_pandl_ratio);
            }
        }

        private double _total_realiz_pandl;
        /// <summary>
        /// 累计实现收益
        /// </summary>
        public double total_realiz_pandl
        {
            get { return _total_realiz_pandl; }

            set
            {
                _total_realiz_pandl = value;
                RaisePropertyChanged(() => total_realiz_pandl);
            }
        }

        private double _yield_rate;
        /// <summary>
        /// 收益率
        /// </summary>
        public double yield_rate
        {
            get { return _yield_rate; }

            set
            {
                _yield_rate = value;
                RaisePropertyChanged(() => yield_rate);
            }
        }

        private double _pre_profit;
        /// <summary>
        /// 上日收益
        /// </summary>
        public double pre_profit
        {
            get { return _pre_profit; }

            set
            {
                _pre_profit = value;
                RaisePropertyChanged(() => pre_profit);
            }
        }
    }

    public class pdsecuL_2_70_Info : ObservableObject
    {
    }

    public class pdsecuL_2_71_Info : ObservableObject
    {
    }

    public class pdsecuL_2_72_Info : ObservableObject
    {

        private int _pass_no;
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no
        {
            get { return _pass_no; }

            set
            {
                _pass_no = value;
                RaisePropertyChanged(() => pass_no);
            }
        }

        private String _out_acco;
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco
        {
            get { return _out_acco; }

            set
            {
                _out_acco = value;
                RaisePropertyChanged(() => out_acco);
            }
        }
    }

    public class pdsecuL_2_73_Info : ObservableObject
    {

        private int _pass_no;
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no
        {
            get { return _pass_no; }

            set
            {
                _pass_no = value;
                RaisePropertyChanged(() => pass_no);
            }
        }

        private String _out_acco;
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco
        {
            get { return _out_acco; }

            set
            {
                _out_acco = value;
                RaisePropertyChanged(() => out_acco);
            }
        }
    }

    public class pdsecuL_2_80_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private double _begin_amt;
        /// <summary>
        /// 期初金额
        /// </summary>
        public double begin_amt
        {
            get { return _begin_amt; }

            set
            {
                _begin_amt = value;
                RaisePropertyChanged(() => begin_amt);
            }
        }

        private double _curr_amt;
        /// <summary>
        /// 当前金额
        /// </summary>
        public double curr_amt
        {
            get { return _curr_amt; }

            set
            {
                _curr_amt = value;
                RaisePropertyChanged(() => curr_amt);
            }
        }

        private double _frozen_amt;
        /// <summary>
        /// 冻结金额
        /// </summary>
        public double frozen_amt
        {
            get { return _frozen_amt; }

            set
            {
                _frozen_amt = value;
                RaisePropertyChanged(() => frozen_amt);
            }
        }

        private double _unfroz_amt;
        /// <summary>
        /// 解冻金额
        /// </summary>
        public double unfroz_amt
        {
            get { return _unfroz_amt; }

            set
            {
                _unfroz_amt = value;
                RaisePropertyChanged(() => unfroz_amt);
            }
        }

        private double _pre_settle_amt;
        /// <summary>
        /// 待交收金额
        /// </summary>
        public double pre_settle_amt
        {
            get { return _pre_settle_amt; }

            set
            {
                _pre_settle_amt = value;
                RaisePropertyChanged(() => pre_settle_amt);
            }
        }

        private double _shsz_avail_change_amt;
        /// <summary>
        /// 沪深可用调整金额
        /// </summary>
        public double shsz_avail_change_amt
        {
            get { return _shsz_avail_change_amt; }

            set
            {
                _shsz_avail_change_amt = value;
                RaisePropertyChanged(() => shsz_avail_change_amt);
            }
        }

        private double _hk_avail_change_amt;
        /// <summary>
        /// 港股通可用调整金额
        /// </summary>
        public double hk_avail_change_amt
        {
            get { return _hk_avail_change_amt; }

            set
            {
                _hk_avail_change_amt = value;
                RaisePropertyChanged(() => hk_avail_change_amt);
            }
        }

        private double _amt_check_diff;
        /// <summary>
        /// 金额核对差额
        /// </summary>
        public double amt_check_diff
        {
            get { return _amt_check_diff; }

            set
            {
                _amt_check_diff = value;
                RaisePropertyChanged(() => amt_check_diff);
            }
        }

        private double _T_hk_buy_total_amt;
        /// <summary>
        /// T日当日港股买入金额
        /// </summary>
        public double T_hk_buy_total_amt
        {
            get { return _T_hk_buy_total_amt; }

            set
            {
                _T_hk_buy_total_amt = value;
                RaisePropertyChanged(() => T_hk_buy_total_amt);
            }
        }

        private double _T_hk_sell_total_amt;
        /// <summary>
        /// T日当日港股卖出金额
        /// </summary>
        public double T_hk_sell_total_amt
        {
            get { return _T_hk_sell_total_amt; }

            set
            {
                _T_hk_sell_total_amt = value;
                RaisePropertyChanged(() => T_hk_sell_total_amt);
            }
        }

        private double _T1_hk_buy_total_amt;
        /// <summary>
        /// T1日当日港股买入金额
        /// </summary>
        public double T1_hk_buy_total_amt
        {
            get { return _T1_hk_buy_total_amt; }

            set
            {
                _T1_hk_buy_total_amt = value;
                RaisePropertyChanged(() => T1_hk_buy_total_amt);
            }
        }

        private double _T1_hk_sell_total_amt;
        /// <summary>
        /// T1日当日港股卖出金额
        /// </summary>
        public double T1_hk_sell_total_amt
        {
            get { return _T1_hk_sell_total_amt; }

            set
            {
                _T1_hk_sell_total_amt = value;
                RaisePropertyChanged(() => T1_hk_sell_total_amt);
            }
        }

        private double _total_rece_amt;
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt
        {
            get { return _total_rece_amt; }

            set
            {
                _total_rece_amt = value;
                RaisePropertyChanged(() => total_rece_amt);
            }
        }

        private double _total_payab_amt;
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt
        {
            get { return _total_payab_amt; }

            set
            {
                _total_payab_amt = value;
                RaisePropertyChanged(() => total_payab_amt);
            }
        }

        private double _total_change_amt;
        /// <summary>
        /// 红冲蓝补金额
        /// </summary>
        public double total_change_amt
        {
            get { return _total_change_amt; }

            set
            {
                _total_change_amt = value;
                RaisePropertyChanged(() => total_change_amt);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _intrst_rate;
        /// <summary>
        /// 利率
        /// </summary>
        public double intrst_rate
        {
            get { return _intrst_rate; }

            set
            {
                _intrst_rate = value;
                RaisePropertyChanged(() => intrst_rate);
            }
        }

        private double _intrst_base_amt;
        /// <summary>
        /// 利息积数
        /// </summary>
        public double intrst_base_amt
        {
            get { return _intrst_base_amt; }

            set
            {
                _intrst_base_amt = value;
                RaisePropertyChanged(() => intrst_base_amt);
            }
        }

        private double _pre_entry_intrst_amt;
        /// <summary>
        /// 待入账利息
        /// </summary>
        public double pre_entry_intrst_amt
        {
            get { return _pre_entry_intrst_amt; }

            set
            {
                _pre_entry_intrst_amt = value;
                RaisePropertyChanged(() => pre_entry_intrst_amt);
            }
        }
    }

    public class pdsecuL_2_81_Info : ObservableObject
    {
    }

    public class pdsecuL_2_82_Info : ObservableObject
    {
    }

    public class pdsecuL_2_83_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _record_batch_no;
        /// <summary>
        /// 记录批号
        /// </summary>
        public int record_batch_no
        {
            get { return _record_batch_no; }

            set
            {
                _record_batch_no = value;
                RaisePropertyChanged(() => record_batch_no);
            }
        }

        private int _redempt_type;
        /// <summary>
        /// 申赎类型
        /// </summary>
        public int redempt_type
        {
            get { return _redempt_type; }

            set
            {
                _redempt_type = value;
                RaisePropertyChanged(() => redempt_type);
            }
        }

        private double _redempt_amt;
        /// <summary>
        /// 申赎金额
        /// </summary>
        public double redempt_amt
        {
            get { return _redempt_amt; }

            set
            {
                _redempt_amt = value;
                RaisePropertyChanged(() => redempt_amt);
            }
        }

        private double _redempt_qty;
        /// <summary>
        /// 申赎份额
        /// </summary>
        public double redempt_qty
        {
            get { return _redempt_qty; }

            set
            {
                _redempt_qty = value;
                RaisePropertyChanged(() => redempt_qty);
            }
        }

        private String _exch_group_no_str;
        /// <summary>
        /// 交易组编号串
        /// </summary>
        public String exch_group_no_str
        {
            get { return _exch_group_no_str; }

            set
            {
                _exch_group_no_str = value;
                RaisePropertyChanged(() => exch_group_no_str);
            }
        }

        private String _exgp_dist_amt_str;
        /// <summary>
        /// 交易组分配金额串
        /// </summary>
        public String exgp_dist_amt_str
        {
            get { return _exgp_dist_amt_str; }

            set
            {
                _exgp_dist_amt_str = value;
                RaisePropertyChanged(() => exgp_dist_amt_str);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pdsecuL_2_84_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _record_batch_no;
        /// <summary>
        /// 记录批号
        /// </summary>
        public int record_batch_no
        {
            get { return _record_batch_no; }

            set
            {
                _record_batch_no = value;
                RaisePropertyChanged(() => record_batch_no);
            }
        }

        private int _redempt_type;
        /// <summary>
        /// 申赎类型
        /// </summary>
        public int redempt_type
        {
            get { return _redempt_type; }

            set
            {
                _redempt_type = value;
                RaisePropertyChanged(() => redempt_type);
            }
        }

        private double _redempt_amt;
        /// <summary>
        /// 申赎金额
        /// </summary>
        public double redempt_amt
        {
            get { return _redempt_amt; }

            set
            {
                _redempt_amt = value;
                RaisePropertyChanged(() => redempt_amt);
            }
        }

        private double _redempt_qty;
        /// <summary>
        /// 申赎份额
        /// </summary>
        public double redempt_qty
        {
            get { return _redempt_qty; }

            set
            {
                _redempt_qty = value;
                RaisePropertyChanged(() => redempt_qty);
            }
        }

        private String _exch_group_no_str;
        /// <summary>
        /// 交易组编号串
        /// </summary>
        public String exch_group_no_str
        {
            get { return _exch_group_no_str; }

            set
            {
                _exch_group_no_str = value;
                RaisePropertyChanged(() => exch_group_no_str);
            }
        }

        private String _exgp_dist_amt_str;
        /// <summary>
        /// 交易组分配金额串
        /// </summary>
        public String exgp_dist_amt_str
        {
            get { return _exgp_dist_amt_str; }

            set
            {
                _exgp_dist_amt_str = value;
                RaisePropertyChanged(() => exgp_dist_amt_str);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pdsecuL_2_74_Info : ObservableObject
    {

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private double _out_nav_asset;
        /// <summary>
        /// 外部净资产
        /// </summary>
        public double out_nav_asset
        {
            get { return _out_nav_asset; }

            set
            {
                _out_nav_asset = value;
                RaisePropertyChanged(() => out_nav_asset);
            }
        }

        private double _out_stock_asset;
        /// <summary>
        /// 外部股票资产
        /// </summary>
        public double out_stock_asset
        {
            get { return _out_stock_asset; }

            set
            {
                _out_stock_asset = value;
                RaisePropertyChanged(() => out_stock_asset);
            }
        }

        private double _out_bond_asset;
        /// <summary>
        /// 外部债券资产
        /// </summary>
        public double out_bond_asset
        {
            get { return _out_bond_asset; }

            set
            {
                _out_bond_asset = value;
                RaisePropertyChanged(() => out_bond_asset);
            }
        }

        private double _out_fund_asset;
        /// <summary>
        /// 外部基金资产
        /// </summary>
        public double out_fund_asset
        {
            get { return _out_fund_asset; }

            set
            {
                _out_fund_asset = value;
                RaisePropertyChanged(() => out_fund_asset);
            }
        }

        private double _out_repo_asset;
        /// <summary>
        /// 外部回购资产
        /// </summary>
        public double out_repo_asset
        {
            get { return _out_repo_asset; }

            set
            {
                _out_repo_asset = value;
                RaisePropertyChanged(() => out_repo_asset);
            }
        }

        private double _out_total_rece_amt;
        /// <summary>
        /// 外部累计应收金额
        /// </summary>
        public double out_total_rece_amt
        {
            get { return _out_total_rece_amt; }

            set
            {
                _out_total_rece_amt = value;
                RaisePropertyChanged(() => out_total_rece_amt);
            }
        }

        private double _out_total_payab_amt;
        /// <summary>
        /// 外部累计应付金额
        /// </summary>
        public double out_total_payab_amt
        {
            get { return _out_total_payab_amt; }

            set
            {
                _out_total_payab_amt = value;
                RaisePropertyChanged(() => out_total_payab_amt);
            }
        }

        private double _out_other_asset;
        /// <summary>
        /// 外部其他资产
        /// </summary>
        public double out_other_asset
        {
            get { return _out_other_asset; }

            set
            {
                _out_other_asset = value;
                RaisePropertyChanged(() => out_other_asset);
            }
        }

        private double _out_option_asset;
        /// <summary>
        /// 外部期权资产
        /// </summary>
        public double out_option_asset
        {
            get { return _out_option_asset; }

            set
            {
                _out_option_asset = value;
                RaisePropertyChanged(() => out_option_asset);
            }
        }

        private double _out_fina_debt;
        /// <summary>
        /// 外部融资负债
        /// </summary>
        public double out_fina_debt
        {
            get { return _out_fina_debt; }

            set
            {
                _out_fina_debt = value;
                RaisePropertyChanged(() => out_fina_debt);
            }
        }

        private double _out_loan_debt;
        /// <summary>
        /// 外部融券负债
        /// </summary>
        public double out_loan_debt
        {
            get { return _out_loan_debt; }

            set
            {
                _out_loan_debt = value;
                RaisePropertyChanged(() => out_loan_debt);
            }
        }

        private double _out_margin_amt;
        /// <summary>
        /// 外部期货保证金
        /// </summary>
        public double out_margin_amt
        {
            get { return _out_margin_amt; }

            set
            {
                _out_margin_amt = value;
                RaisePropertyChanged(() => out_margin_amt);
            }
        }

        private double _out_futu_asset;
        /// <summary>
        /// 外部期货资产
        /// </summary>
        public double out_futu_asset
        {
            get { return _out_futu_asset; }

            set
            {
                _out_futu_asset = value;
                RaisePropertyChanged(() => out_futu_asset);
            }
        }

        private double _out_shsz_T0_avail;
        /// <summary>
        /// 外部沪深T+0可用
        /// </summary>
        public double out_shsz_T0_avail
        {
            get { return _out_shsz_T0_avail; }

            set
            {
                _out_shsz_T0_avail = value;
                RaisePropertyChanged(() => out_shsz_T0_avail);
            }
        }

        private double _out_shsz_T1_avail;
        /// <summary>
        /// 外部沪深T+1可用
        /// </summary>
        public double out_shsz_T1_avail
        {
            get { return _out_shsz_T1_avail; }

            set
            {
                _out_shsz_T1_avail = value;
                RaisePropertyChanged(() => out_shsz_T1_avail);
            }
        }

        private double _out_shhk_avail_amt;
        /// <summary>
        /// 外部沪港通可用
        /// </summary>
        public double out_shhk_avail_amt
        {
            get { return _out_shhk_avail_amt; }

            set
            {
                _out_shhk_avail_amt = value;
                RaisePropertyChanged(() => out_shhk_avail_amt);
            }
        }

        private double _out_szhk_avail_amt;
        /// <summary>
        /// 外部深港通可用
        /// </summary>
        public double out_szhk_avail_amt
        {
            get { return _out_szhk_avail_amt; }

            set
            {
                _out_szhk_avail_amt = value;
                RaisePropertyChanged(() => out_szhk_avail_amt);
            }
        }

        private double _out_cash_asset;
        /// <summary>
        /// 外部现金资产
        /// </summary>
        public double out_cash_asset
        {
            get { return _out_cash_asset; }

            set
            {
                _out_cash_asset = value;
                RaisePropertyChanged(() => out_cash_asset);
            }
        }

        private double _out_futu_pandl_amt;
        /// <summary>
        /// 外部期货盈亏
        /// </summary>
        public double out_futu_pandl_amt
        {
            get { return _out_futu_pandl_amt; }

            set
            {
                _out_futu_pandl_amt = value;
                RaisePropertyChanged(() => out_futu_pandl_amt);
            }
        }
    }

    public class pdsecuL_2_75_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private int _pass_no;
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no
        {
            get { return _pass_no; }

            set
            {
                _pass_no = value;
                RaisePropertyChanged(() => pass_no);
            }
        }

        private String _out_acco;
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco
        {
            get { return _out_acco; }

            set
            {
                _out_acco = value;
                RaisePropertyChanged(() => out_acco);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private double _acco_curr_amt;
        /// <summary>
        /// 账户当前金额
        /// </summary>
        public double acco_curr_amt
        {
            get { return _acco_curr_amt; }

            set
            {
                _acco_curr_amt = value;
                RaisePropertyChanged(() => acco_curr_amt);
            }
        }

        private double _acco_avail_amt;
        /// <summary>
        /// 账户可用金额
        /// </summary>
        public double acco_avail_amt
        {
            get { return _acco_avail_amt; }

            set
            {
                _acco_avail_amt = value;
                RaisePropertyChanged(() => acco_avail_amt);
            }
        }

        private double _out_curr_amt;
        /// <summary>
        /// 外部当前金额
        /// </summary>
        public double out_curr_amt
        {
            get { return _out_curr_amt; }

            set
            {
                _out_curr_amt = value;
                RaisePropertyChanged(() => out_curr_amt);
            }
        }

        private double _out_enable_amt;
        /// <summary>
        /// 外部可用金额
        /// </summary>
        public double out_enable_amt
        {
            get { return _out_enable_amt; }

            set
            {
                _out_enable_amt = value;
                RaisePropertyChanged(() => out_enable_amt);
            }
        }

        private double _sys_avail_amt_diff;
        /// <summary>
        /// 系统可用金额差额
        /// </summary>
        public double sys_avail_amt_diff
        {
            get { return _sys_avail_amt_diff; }

            set
            {
                _sys_avail_amt_diff = value;
                RaisePropertyChanged(() => sys_avail_amt_diff);
            }
        }

        private double _acco_curr_amt_diff;
        /// <summary>
        /// 账户当前金额差额
        /// </summary>
        public double acco_curr_amt_diff
        {
            get { return _acco_curr_amt_diff; }

            set
            {
                _acco_curr_amt_diff = value;
                RaisePropertyChanged(() => acco_curr_amt_diff);
            }
        }

        private double _acco_avail_amt_diff;
        /// <summary>
        /// 账户可用金额差额
        /// </summary>
        public double acco_avail_amt_diff
        {
            get { return _acco_avail_amt_diff; }

            set
            {
                _acco_avail_amt_diff = value;
                RaisePropertyChanged(() => acco_avail_amt_diff);
            }
        }

        private double _total_payab_amt;
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt
        {
            get { return _total_payab_amt; }

            set
            {
                _total_payab_amt = value;
                RaisePropertyChanged(() => total_payab_amt);
            }
        }

        private double _total_rece_amt;
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt
        {
            get { return _total_rece_amt; }

            set
            {
                _total_rece_amt = value;
                RaisePropertyChanged(() => total_rece_amt);
            }
        }

        private double _out_total_payab_amt;
        /// <summary>
        /// 外部累计应付金额
        /// </summary>
        public double out_total_payab_amt
        {
            get { return _out_total_payab_amt; }

            set
            {
                _out_total_payab_amt = value;
                RaisePropertyChanged(() => out_total_payab_amt);
            }
        }

        private double _out_total_rece_amt;
        /// <summary>
        /// 外部累计应收金额
        /// </summary>
        public double out_total_rece_amt
        {
            get { return _out_total_rece_amt; }

            set
            {
                _out_total_rece_amt = value;
                RaisePropertyChanged(() => out_total_rece_amt);
            }
        }

        private double _acco_total_payab_amt_diff;
        /// <summary>
        /// 账户累计应付金额差额
        /// </summary>
        public double acco_total_payab_amt_diff
        {
            get { return _acco_total_payab_amt_diff; }

            set
            {
                _acco_total_payab_amt_diff = value;
                RaisePropertyChanged(() => acco_total_payab_amt_diff);
            }
        }

        private double _acco_total_rece_amt_diff;
        /// <summary>
        /// 账户累计应收金额差额
        /// </summary>
        public double acco_total_rece_amt_diff
        {
            get { return _acco_total_rece_amt_diff; }

            set
            {
                _acco_total_rece_amt_diff = value;
                RaisePropertyChanged(() => acco_total_rece_amt_diff);
            }
        }

        private int _deal_flag;
        /// <summary>
        /// 处理标志
        /// </summary>
        public int deal_flag
        {
            get { return _deal_flag; }

            set
            {
                _deal_flag = value;
                RaisePropertyChanged(() => deal_flag);
            }
        }

        private int _asset_sync_flag;
        /// <summary>
        /// 资产是否同步
        /// </summary>
        public int asset_sync_flag
        {
            get { return _asset_sync_flag; }

            set
            {
                _asset_sync_flag = value;
                RaisePropertyChanged(() => asset_sync_flag);
            }
        }

        private String _remark_info;
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info
        {
            get { return _remark_info; }

            set
            {
                _remark_info = value;
                RaisePropertyChanged(() => remark_info);
            }
        }
    }

    public class pdsecuL_2_76_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private double _begin_amt;
        /// <summary>
        /// 期初金额
        /// </summary>
        public double begin_amt
        {
            get { return _begin_amt; }

            set
            {
                _begin_amt = value;
                RaisePropertyChanged(() => begin_amt);
            }
        }

        private double _curr_amt;
        /// <summary>
        /// 当前金额
        /// </summary>
        public double curr_amt
        {
            get { return _curr_amt; }

            set
            {
                _curr_amt = value;
                RaisePropertyChanged(() => curr_amt);
            }
        }

        private double _frozen_amt;
        /// <summary>
        /// 冻结金额
        /// </summary>
        public double frozen_amt
        {
            get { return _frozen_amt; }

            set
            {
                _frozen_amt = value;
                RaisePropertyChanged(() => frozen_amt);
            }
        }

        private double _unfroz_amt;
        /// <summary>
        /// 解冻金额
        /// </summary>
        public double unfroz_amt
        {
            get { return _unfroz_amt; }

            set
            {
                _unfroz_amt = value;
                RaisePropertyChanged(() => unfroz_amt);
            }
        }

        private double _pre_settle_amt;
        /// <summary>
        /// 待交收金额
        /// </summary>
        public double pre_settle_amt
        {
            get { return _pre_settle_amt; }

            set
            {
                _pre_settle_amt = value;
                RaisePropertyChanged(() => pre_settle_amt);
            }
        }

        private double _shsz_avail_change_amt;
        /// <summary>
        /// 沪深可用调整金额
        /// </summary>
        public double shsz_avail_change_amt
        {
            get { return _shsz_avail_change_amt; }

            set
            {
                _shsz_avail_change_amt = value;
                RaisePropertyChanged(() => shsz_avail_change_amt);
            }
        }

        private double _hk_avail_change_amt;
        /// <summary>
        /// 港股通可用调整金额
        /// </summary>
        public double hk_avail_change_amt
        {
            get { return _hk_avail_change_amt; }

            set
            {
                _hk_avail_change_amt = value;
                RaisePropertyChanged(() => hk_avail_change_amt);
            }
        }

        private double _amt_check_diff;
        /// <summary>
        /// 金额核对差额
        /// </summary>
        public double amt_check_diff
        {
            get { return _amt_check_diff; }

            set
            {
                _amt_check_diff = value;
                RaisePropertyChanged(() => amt_check_diff);
            }
        }

        private double _T_hk_buy_total_amt;
        /// <summary>
        /// T日当日港股买入金额
        /// </summary>
        public double T_hk_buy_total_amt
        {
            get { return _T_hk_buy_total_amt; }

            set
            {
                _T_hk_buy_total_amt = value;
                RaisePropertyChanged(() => T_hk_buy_total_amt);
            }
        }

        private double _T_hk_sell_total_amt;
        /// <summary>
        /// T日当日港股卖出金额
        /// </summary>
        public double T_hk_sell_total_amt
        {
            get { return _T_hk_sell_total_amt; }

            set
            {
                _T_hk_sell_total_amt = value;
                RaisePropertyChanged(() => T_hk_sell_total_amt);
            }
        }

        private double _T1_hk_buy_total_amt;
        /// <summary>
        /// T1日当日港股买入金额
        /// </summary>
        public double T1_hk_buy_total_amt
        {
            get { return _T1_hk_buy_total_amt; }

            set
            {
                _T1_hk_buy_total_amt = value;
                RaisePropertyChanged(() => T1_hk_buy_total_amt);
            }
        }

        private double _T1_hk_sell_total_amt;
        /// <summary>
        /// T1日当日港股卖出金额
        /// </summary>
        public double T1_hk_sell_total_amt
        {
            get { return _T1_hk_sell_total_amt; }

            set
            {
                _T1_hk_sell_total_amt = value;
                RaisePropertyChanged(() => T1_hk_sell_total_amt);
            }
        }

        private double _total_rece_amt;
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt
        {
            get { return _total_rece_amt; }

            set
            {
                _total_rece_amt = value;
                RaisePropertyChanged(() => total_rece_amt);
            }
        }

        private double _total_payab_amt;
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt
        {
            get { return _total_payab_amt; }

            set
            {
                _total_payab_amt = value;
                RaisePropertyChanged(() => total_payab_amt);
            }
        }

        private double _total_change_amt;
        /// <summary>
        /// 红冲蓝补金额
        /// </summary>
        public double total_change_amt
        {
            get { return _total_change_amt; }

            set
            {
                _total_change_amt = value;
                RaisePropertyChanged(() => total_change_amt);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _intrst_rate;
        /// <summary>
        /// 利率
        /// </summary>
        public double intrst_rate
        {
            get { return _intrst_rate; }

            set
            {
                _intrst_rate = value;
                RaisePropertyChanged(() => intrst_rate);
            }
        }

        private double _intrst_base_amt;
        /// <summary>
        /// 利息积数
        /// </summary>
        public double intrst_base_amt
        {
            get { return _intrst_base_amt; }

            set
            {
                _intrst_base_amt = value;
                RaisePropertyChanged(() => intrst_base_amt);
            }
        }

        private double _pre_entry_intrst_amt;
        /// <summary>
        /// 待入账利息
        /// </summary>
        public double pre_entry_intrst_amt
        {
            get { return _pre_entry_intrst_amt; }

            set
            {
                _pre_entry_intrst_amt = value;
                RaisePropertyChanged(() => pre_entry_intrst_amt);
            }
        }
    }

    public class pdsecuL_2_77_Info : ObservableObject
    {
    }

    public class pdsecuL_2_78_Info : ObservableObject
    {
    }

    public class pdsecuL_2_79_Info : ObservableObject
    {
    }

    public class pdsecuL_2_85_Info : ObservableObject
    {
    }

    public class pdsecuL_2_86_Info : ObservableObject
    {
    }

    public class pdsecuL_2_87_Info : ObservableObject
    {
    }

    public class pdsecuL_2_88_Info : ObservableObject
    {
    }

    public class pdsecuL_2_89_Info : ObservableObject
    {
    }

    public class pdsecuL_2_90_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private int _frozen_type;
        /// <summary>
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type
        {
            get { return _frozen_type; }

            set
            {
                _frozen_type = value;
                RaisePropertyChanged(() => frozen_type);
            }
        }

        private double _occur_amt;
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt
        {
            get { return _occur_amt; }

            set
            {
                _occur_amt = value;
                RaisePropertyChanged(() => occur_amt);
            }
        }

        private int _expire_date;
        /// <summary>
        /// 到期日期
        /// </summary>
        public int expire_date
        {
            get { return _expire_date; }

            set
            {
                _expire_date = value;
                RaisePropertyChanged(() => expire_date);
            }
        }

        private String _jour_status;
        /// <summary>
        /// 流水状态
        /// </summary>
        public String jour_status
        {
            get { return _jour_status; }

            set
            {
                _jour_status = value;
                RaisePropertyChanged(() => jour_status);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pdsecuL_2_91_Info : ObservableObject
    {
    }

    public class pdsecuL_2_92_Info : ObservableObject
    {
    }

    public class pdsecuL_2_93_Info : ObservableObject
    {
    }

    public class pdsecuL_2_94_Info : ObservableObject
    {
    }

    public class pdsecuL_2_95_Info : ObservableObject
    {
    }

    public class pdsecuL_2_96_Info : ObservableObject
    {
    }

    public class pdsecuL_2_97_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id
        {
            get { return _row_id; }

            set
            {
                _row_id = value;
                RaisePropertyChanged(() => row_id);
            }
        }

        private int _create_date;
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date
        {
            get { return _create_date; }

            set
            {
                _create_date = value;
                RaisePropertyChanged(() => create_date);
            }
        }

        private int _create_time;
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time
        {
            get { return _create_time; }

            set
            {
                _create_time = value;
                RaisePropertyChanged(() => create_time);
            }
        }

        private int _update_date;
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date
        {
            get { return _update_date; }

            set
            {
                _update_date = value;
                RaisePropertyChanged(() => update_date);
            }
        }

        private int _update_time;
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time
        {
            get { return _update_time; }

            set
            {
                _update_time = value;
                RaisePropertyChanged(() => update_time);
            }
        }

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
            }
        }

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

        private int _init_date;
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date
        {
            get { return _init_date; }

            set
            {
                _init_date = value;
                RaisePropertyChanged(() => init_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no
        {
            get { return _co_no; }

            set
            {
                _co_no = value;
                RaisePropertyChanged(() => co_no);
            }
        }

        private int _pd_no;
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no
        {
            get { return _pd_no; }

            set
            {
                _pd_no = value;
                RaisePropertyChanged(() => pd_no);
            }
        }

        private int _asset_acco_no;
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no
        {
            get { return _asset_acco_no; }

            set
            {
                _asset_acco_no = value;
                RaisePropertyChanged(() => asset_acco_no);
            }
        }

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no
        {
            get { return _exch_group_no; }

            set
            {
                _exch_group_no = value;
                RaisePropertyChanged(() => exch_group_no);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type
        {
            get { return _crncy_type; }

            set
            {
                _crncy_type = value;
                RaisePropertyChanged(() => crncy_type);
            }
        }

        private int _frozen_type;
        /// <summary>
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type
        {
            get { return _frozen_type; }

            set
            {
                _frozen_type = value;
                RaisePropertyChanged(() => frozen_type);
            }
        }

        private double _occur_amt;
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt
        {
            get { return _occur_amt; }

            set
            {
                _occur_amt = value;
                RaisePropertyChanged(() => occur_amt);
            }
        }

        private int _expire_date;
        /// <summary>
        /// 到期日期
        /// </summary>
        public int expire_date
        {
            get { return _expire_date; }

            set
            {
                _expire_date = value;
                RaisePropertyChanged(() => expire_date);
            }
        }

        private String _jour_status;
        /// <summary>
        /// 流水状态
        /// </summary>
        public String jour_status
        {
            get { return _jour_status; }

            set
            {
                _jour_status = value;
                RaisePropertyChanged(() => jour_status);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pdsecuL_2_98_Info : ObservableObject
    {
    }

    public class pdsecuL_2_99_Info : ObservableObject
    {
    }

}
