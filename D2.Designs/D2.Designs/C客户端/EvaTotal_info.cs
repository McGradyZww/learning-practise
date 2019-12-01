using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class evaL_3_1_Info : ObservableObject
    {
    }

    public class evaL_3_2_Info : ObservableObject
    {
    }

    public class evaL_3_3_Info : ObservableObject
    {

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

        private double _pd_curr_share;
        /// <summary>
        /// 产品当前份额
        /// </summary>
        public double pd_curr_share
        {
            get { return _pd_curr_share; }

            set
            {
                _pd_curr_share = value;
                RaisePropertyChanged(() => pd_curr_share);
            }
        }

        private String _eva_pd_curr_share;
        /// <summary>
        /// 估值表产品当前份额
        /// </summary>
        public String eva_pd_curr_share
        {
            get { return _eva_pd_curr_share; }

            set
            {
                _eva_pd_curr_share = value;
                RaisePropertyChanged(() => eva_pd_curr_share);
            }
        }

        private double _total_asset;
        /// <summary>
        /// 总资产
        /// </summary>
        public double total_asset
        {
            get { return _total_asset; }

            set
            {
                _total_asset = value;
                RaisePropertyChanged(() => total_asset);
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

        private String _eva_nav_asset;
        /// <summary>
        /// 估值表净资产
        /// </summary>
        public String eva_nav_asset
        {
            get { return _eva_nav_asset; }

            set
            {
                _eva_nav_asset = value;
                RaisePropertyChanged(() => eva_nav_asset);
            }
        }

        private double _cash_bala;
        /// <summary>
        /// 现金余额
        /// </summary>
        public double cash_bala
        {
            get { return _cash_bala; }

            set
            {
                _cash_bala = value;
                RaisePropertyChanged(() => cash_bala);
            }
        }

        private double _acco_cash;
        /// <summary>
        /// 账户余额
        /// </summary>
        public double acco_cash
        {
            get { return _acco_cash; }

            set
            {
                _acco_cash = value;
                RaisePropertyChanged(() => acco_cash);
            }
        }

        private double _pre_acco_cash;
        /// <summary>
        /// 上日账户余额
        /// </summary>
        public double pre_acco_cash
        {
            get { return _pre_acco_cash; }

            set
            {
                _pre_acco_cash = value;
                RaisePropertyChanged(() => pre_acco_cash);
            }
        }

        private double _stock_market_value;
        /// <summary>
        /// 股票市值
        /// </summary>
        public double stock_market_value
        {
            get { return _stock_market_value; }

            set
            {
                _stock_market_value = value;
                RaisePropertyChanged(() => stock_market_value);
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

        private double _futu_asset;
        /// <summary>
        /// 期货资产
        /// </summary>
        public double futu_asset
        {
            get { return _futu_asset; }

            set
            {
                _futu_asset = value;
                RaisePropertyChanged(() => futu_asset);
            }
        }

        private double _option_asset;
        /// <summary>
        /// 期权资产
        /// </summary>
        public double option_asset
        {
            get { return _option_asset; }

            set
            {
                _option_asset = value;
                RaisePropertyChanged(() => option_asset);
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

        private double _accumulative_receivable;
        /// <summary>
        /// 累计应收额
        /// </summary>
        public double accumulative_receivable
        {
            get { return _accumulative_receivable; }

            set
            {
                _accumulative_receivable = value;
                RaisePropertyChanged(() => accumulative_receivable);
            }
        }

        private double _accumulative_payable;
        /// <summary>
        /// 累计应付额
        /// </summary>
        public double accumulative_payable
        {
            get { return _accumulative_payable; }

            set
            {
                _accumulative_payable = value;
                RaisePropertyChanged(() => accumulative_payable);
            }
        }

        private double _apply_amt;
        /// <summary>
        /// 申购应收金额
        /// </summary>
        public double apply_amt
        {
            get { return _apply_amt; }

            set
            {
                _apply_amt = value;
                RaisePropertyChanged(() => apply_amt);
            }
        }

        private double _redemp_amt;
        /// <summary>
        /// 赎回应付金额
        /// </summary>
        public double redemp_amt
        {
            get { return _redemp_amt; }

            set
            {
                _redemp_amt = value;
                RaisePropertyChanged(() => redemp_amt);
            }
        }

        private double _unit_nav;
        /// <summary>
        /// 单位净值
        /// </summary>
        public double unit_nav
        {
            get { return _unit_nav; }

            set
            {
                _unit_nav = value;
                RaisePropertyChanged(() => unit_nav);
            }
        }

        private String _eva_unit_nav;
        /// <summary>
        /// 估值表单位净值
        /// </summary>
        public String eva_unit_nav
        {
            get { return _eva_unit_nav; }

            set
            {
                _eva_unit_nav = value;
                RaisePropertyChanged(() => eva_unit_nav);
            }
        }

        private double _total_cash_divide;
        /// <summary>
        /// 累计派现金额
        /// </summary>
        public double total_cash_divide
        {
            get { return _total_cash_divide; }

            set
            {
                _total_cash_divide = value;
                RaisePropertyChanged(() => total_cash_divide);
            }
        }

        private double _total_unit_nav;
        /// <summary>
        /// 累计单位净值
        /// </summary>
        public double total_unit_nav
        {
            get { return _total_unit_nav; }

            set
            {
                _total_unit_nav = value;
                RaisePropertyChanged(() => total_unit_nav);
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
    }

    public class evaL_3_4_Info : ObservableObject
    {

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

        private double _pd_manage_fee;
        /// <summary>
        /// 产品管理费
        /// </summary>
        public double pd_manage_fee
        {
            get { return _pd_manage_fee; }

            set
            {
                _pd_manage_fee = value;
                RaisePropertyChanged(() => pd_manage_fee);
            }
        }

        private double _pd_trustee_fee;
        /// <summary>
        /// 产品托管费
        /// </summary>
        public double pd_trustee_fee
        {
            get { return _pd_trustee_fee; }

            set
            {
                _pd_trustee_fee = value;
                RaisePropertyChanged(() => pd_trustee_fee);
            }
        }

        private double _pd_service_fee;
        /// <summary>
        /// 产品服务费
        /// </summary>
        public double pd_service_fee
        {
            get { return _pd_service_fee; }

            set
            {
                _pd_service_fee = value;
                RaisePropertyChanged(() => pd_service_fee);
            }
        }

        private double _pd_cons_fee;
        /// <summary>
        /// 产品投资顾问费
        /// </summary>
        public double pd_cons_fee
        {
            get { return _pd_cons_fee; }

            set
            {
                _pd_cons_fee = value;
                RaisePropertyChanged(() => pd_cons_fee);
            }
        }

        private double _pd_other_fee;
        /// <summary>
        /// 产品其他费
        /// </summary>
        public double pd_other_fee
        {
            get { return _pd_other_fee; }

            set
            {
                _pd_other_fee = value;
                RaisePropertyChanged(() => pd_other_fee);
            }
        }

        private double _intrst_cacl_amt;
        /// <summary>
        /// 预计利息
        /// </summary>
        public double intrst_cacl_amt
        {
            get { return _intrst_cacl_amt; }

            set
            {
                _intrst_cacl_amt = value;
                RaisePropertyChanged(() => intrst_cacl_amt);
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
    }

    public class evaL_3_5_Info : ObservableObject
    {
    }

    public class evaL_3_6_Info : ObservableObject
    {
    }

    public class evaL_3_7_Info : ObservableObject
    {
    }

    public class evaL_3_8_Info : ObservableObject
    {

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

        private int _pd_fee_type;
        /// <summary>
        /// 产品费用类型
        /// </summary>
        public int pd_fee_type
        {
            get { return _pd_fee_type; }

            set
            {
                _pd_fee_type = value;
                RaisePropertyChanged(() => pd_fee_type);
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

        private double _pd_net_asset;
        /// <summary>
        /// 产品净资产
        /// </summary>
        public double pd_net_asset
        {
            get { return _pd_net_asset; }

            set
            {
                _pd_net_asset = value;
                RaisePropertyChanged(() => pd_net_asset);
            }
        }

        private double _confirm_apply;
        /// <summary>
        /// 确认金额
        /// </summary>
        public double confirm_apply
        {
            get { return _confirm_apply; }

            set
            {
                _confirm_apply = value;
                RaisePropertyChanged(() => confirm_apply);
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

        private int _manual_flag;
        /// <summary>
        /// 手工标志
        /// </summary>
        public int manual_flag
        {
            get { return _manual_flag; }

            set
            {
                _manual_flag = value;
                RaisePropertyChanged(() => manual_flag);
            }
        }
    }

    public class evaL_3_9_Info : ObservableObject
    {
    }

    public class evaL_3_10_Info : ObservableObject
    {
    }

    public class evaL_3_11_Info : ObservableObject
    {
    }

    public class evaL_3_12_Info : ObservableObject
    {

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

        private int _pd_rate_type;
        /// <summary>
        /// 产品利率类型
        /// </summary>
        public int pd_rate_type
        {
            get { return _pd_rate_type; }

            set
            {
                _pd_rate_type = value;
                RaisePropertyChanged(() => pd_rate_type);
            }
        }

        private String _asset_acco;
        /// <summary>
        /// 资产账户
        /// </summary>
        public String asset_acco
        {
            get { return _asset_acco; }

            set
            {
                _asset_acco = value;
                RaisePropertyChanged(() => asset_acco);
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

        private double _confirm_apply;
        /// <summary>
        /// 确认金额
        /// </summary>
        public double confirm_apply
        {
            get { return _confirm_apply; }

            set
            {
                _confirm_apply = value;
                RaisePropertyChanged(() => confirm_apply);
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

        private int _manual_flag;
        /// <summary>
        /// 手工标志
        /// </summary>
        public int manual_flag
        {
            get { return _manual_flag; }

            set
            {
                _manual_flag = value;
                RaisePropertyChanged(() => manual_flag);
            }
        }
    }

    public class evaL_3_13_Info : ObservableObject
    {
    }

    public class evaL_3_14_Info : ObservableObject
    {
    }

    public class evaL_3_15_Info : ObservableObject
    {
    }

    public class evaL_3_16_Info : ObservableObject
    {
    }

    public class evaL_3_17_Info : ObservableObject
    {
    }

    public class evaL_3_18_Info : ObservableObject
    {
    }

    public class evaL_3_19_Info : ObservableObject
    {
    }

    public class evaL_3_20_Info : ObservableObject
    {

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

        private int _pd_fee_type;
        /// <summary>
        /// 产品费用类型
        /// </summary>
        public int pd_fee_type
        {
            get { return _pd_fee_type; }

            set
            {
                _pd_fee_type = value;
                RaisePropertyChanged(() => pd_fee_type);
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

    public class evaL_3_21_Info : ObservableObject
    {
    }

    public class evaL_3_22_Info : ObservableObject
    {
    }

    public class evaL_3_23_Info : ObservableObject
    {
    }

    public class evaL_3_24_Info : ObservableObject
    {

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

        private int _pd_rate_type;
        /// <summary>
        /// 产品利率类型
        /// </summary>
        public int pd_rate_type
        {
            get { return _pd_rate_type; }

            set
            {
                _pd_rate_type = value;
                RaisePropertyChanged(() => pd_rate_type);
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

    public class evaL_3_25_Info : ObservableObject
    {
    }

    public class evaL_3_26_Info : ObservableObject
    {

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

        private String _fina_acco_code;
        /// <summary>
        /// 科目代码
        /// </summary>
        public String fina_acco_code
        {
            get { return _fina_acco_code; }

            set
            {
                _fina_acco_code = value;
                RaisePropertyChanged(() => fina_acco_code);
            }
        }

        private String _fina_acco_name;
        /// <summary>
        /// 科目名称
        /// </summary>
        public String fina_acco_name
        {
            get { return _fina_acco_name; }

            set
            {
                _fina_acco_name = value;
                RaisePropertyChanged(() => fina_acco_name);
            }
        }

        private String _amount;
        /// <summary>
        /// 数量
        /// </summary>
        public String amount
        {
            get { return _amount; }

            set
            {
                _amount = value;
                RaisePropertyChanged(() => amount);
            }
        }

        private String _unit_cost;
        /// <summary>
        /// 单位成本
        /// </summary>
        public String unit_cost
        {
            get { return _unit_cost; }

            set
            {
                _unit_cost = value;
                RaisePropertyChanged(() => unit_cost);
            }
        }

        private String _prime_cost;
        /// <summary>
        /// 成本
        /// </summary>
        public String prime_cost
        {
            get { return _prime_cost; }

            set
            {
                _prime_cost = value;
                RaisePropertyChanged(() => prime_cost);
            }
        }

        private String _cost_net_ratio;
        /// <summary>
        /// 成本占净值
        /// </summary>
        public String cost_net_ratio
        {
            get { return _cost_net_ratio; }

            set
            {
                _cost_net_ratio = value;
                RaisePropertyChanged(() => cost_net_ratio);
            }
        }

        private String _market_price;
        /// <summary>
        /// 市价
        /// </summary>
        public String market_price
        {
            get { return _market_price; }

            set
            {
                _market_price = value;
                RaisePropertyChanged(() => market_price);
            }
        }

        private String _market_value;
        /// <summary>
        /// 市值
        /// </summary>
        public String market_value
        {
            get { return _market_value; }

            set
            {
                _market_value = value;
                RaisePropertyChanged(() => market_value);
            }
        }

        private String _market_net_ratio;
        /// <summary>
        /// 市值占净值
        /// </summary>
        public String market_net_ratio
        {
            get { return _market_net_ratio; }

            set
            {
                _market_net_ratio = value;
                RaisePropertyChanged(() => market_net_ratio);
            }
        }

        private double _evalu_add_value;
        /// <summary>
        /// 估值增值
        /// </summary>
        public double evalu_add_value
        {
            get { return _evalu_add_value; }

            set
            {
                _evalu_add_value = value;
                RaisePropertyChanged(() => evalu_add_value);
            }
        }

        private String _evalu_add_str;
        /// <summary>
        /// 估值增值串
        /// </summary>
        public String evalu_add_str
        {
            get { return _evalu_add_str; }

            set
            {
                _evalu_add_str = value;
                RaisePropertyChanged(() => evalu_add_str);
            }
        }

        private String _stop_info;
        /// <summary>
        /// 停牌信息
        /// </summary>
        public String stop_info
        {
            get { return _stop_info; }

            set
            {
                _stop_info = value;
                RaisePropertyChanged(() => stop_info);
            }
        }

        private String _rights_info;
        /// <summary>
        /// 权益信息
        /// </summary>
        public String rights_info
        {
            get { return _rights_info; }

            set
            {
                _rights_info = value;
                RaisePropertyChanged(() => rights_info);
            }
        }
    }

    public class evaL_3_27_Info : ObservableObject
    {

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

        private double _pd_curr_share;
        /// <summary>
        /// 产品当前份额
        /// </summary>
        public double pd_curr_share
        {
            get { return _pd_curr_share; }

            set
            {
                _pd_curr_share = value;
                RaisePropertyChanged(() => pd_curr_share);
            }
        }

        private double _pd_curr_share_std;
        /// <summary>
        /// 产品当前份额标准
        /// </summary>
        public double pd_curr_share_std
        {
            get { return _pd_curr_share_std; }

            set
            {
                _pd_curr_share_std = value;
                RaisePropertyChanged(() => pd_curr_share_std);
            }
        }

        private double _total_asset;
        /// <summary>
        /// 总资产
        /// </summary>
        public double total_asset
        {
            get { return _total_asset; }

            set
            {
                _total_asset = value;
                RaisePropertyChanged(() => total_asset);
            }
        }

        private double _total_asset_std;
        /// <summary>
        /// 总资产标准
        /// </summary>
        public double total_asset_std
        {
            get { return _total_asset_std; }

            set
            {
                _total_asset_std = value;
                RaisePropertyChanged(() => total_asset_std);
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

        private double _nav_asset_std;
        /// <summary>
        /// 净资产标准
        /// </summary>
        public double nav_asset_std
        {
            get { return _nav_asset_std; }

            set
            {
                _nav_asset_std = value;
                RaisePropertyChanged(() => nav_asset_std);
            }
        }

        private double _cash_bala;
        /// <summary>
        /// 现金余额
        /// </summary>
        public double cash_bala
        {
            get { return _cash_bala; }

            set
            {
                _cash_bala = value;
                RaisePropertyChanged(() => cash_bala);
            }
        }

        private double _cash_bala_std;
        /// <summary>
        /// 现金余额标准
        /// </summary>
        public double cash_bala_std
        {
            get { return _cash_bala_std; }

            set
            {
                _cash_bala_std = value;
                RaisePropertyChanged(() => cash_bala_std);
            }
        }

        private double _acco_cash;
        /// <summary>
        /// 账户余额
        /// </summary>
        public double acco_cash
        {
            get { return _acco_cash; }

            set
            {
                _acco_cash = value;
                RaisePropertyChanged(() => acco_cash);
            }
        }

        private double _acco_cash_std;
        /// <summary>
        /// 账户余额标准
        /// </summary>
        public double acco_cash_std
        {
            get { return _acco_cash_std; }

            set
            {
                _acco_cash_std = value;
                RaisePropertyChanged(() => acco_cash_std);
            }
        }

        private double _stock_market_value;
        /// <summary>
        /// 股票市值
        /// </summary>
        public double stock_market_value
        {
            get { return _stock_market_value; }

            set
            {
                _stock_market_value = value;
                RaisePropertyChanged(() => stock_market_value);
            }
        }

        private double _stock_market_value_std;
        /// <summary>
        /// 股票市值标准
        /// </summary>
        public double stock_market_value_std
        {
            get { return _stock_market_value_std; }

            set
            {
                _stock_market_value_std = value;
                RaisePropertyChanged(() => stock_market_value_std);
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

        private double _fund_asset_std;
        /// <summary>
        /// 基金资产标准
        /// </summary>
        public double fund_asset_std
        {
            get { return _fund_asset_std; }

            set
            {
                _fund_asset_std = value;
                RaisePropertyChanged(() => fund_asset_std);
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

        private double _bond_asset_std;
        /// <summary>
        /// 债券资产标准
        /// </summary>
        public double bond_asset_std
        {
            get { return _bond_asset_std; }

            set
            {
                _bond_asset_std = value;
                RaisePropertyChanged(() => bond_asset_std);
            }
        }

        private double _futu_asset;
        /// <summary>
        /// 期货资产
        /// </summary>
        public double futu_asset
        {
            get { return _futu_asset; }

            set
            {
                _futu_asset = value;
                RaisePropertyChanged(() => futu_asset);
            }
        }

        private double _futu_asset_std;
        /// <summary>
        /// 期货资产标准
        /// </summary>
        public double futu_asset_std
        {
            get { return _futu_asset_std; }

            set
            {
                _futu_asset_std = value;
                RaisePropertyChanged(() => futu_asset_std);
            }
        }

        private double _option_asset;
        /// <summary>
        /// 期权资产
        /// </summary>
        public double option_asset
        {
            get { return _option_asset; }

            set
            {
                _option_asset = value;
                RaisePropertyChanged(() => option_asset);
            }
        }

        private double _option_asset_std;
        /// <summary>
        /// 期权资产标准
        /// </summary>
        public double option_asset_std
        {
            get { return _option_asset_std; }

            set
            {
                _option_asset_std = value;
                RaisePropertyChanged(() => option_asset_std);
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

        private double _other_asset_std;
        /// <summary>
        /// 其他资产标准
        /// </summary>
        public double other_asset_std
        {
            get { return _other_asset_std; }

            set
            {
                _other_asset_std = value;
                RaisePropertyChanged(() => other_asset_std);
            }
        }

        private double _accumulative_receivable;
        /// <summary>
        /// 累计应收额
        /// </summary>
        public double accumulative_receivable
        {
            get { return _accumulative_receivable; }

            set
            {
                _accumulative_receivable = value;
                RaisePropertyChanged(() => accumulative_receivable);
            }
        }

        private double _accumulative_receivable_std;
        /// <summary>
        /// 累计应收额标准
        /// </summary>
        public double accumulative_receivable_std
        {
            get { return _accumulative_receivable_std; }

            set
            {
                _accumulative_receivable_std = value;
                RaisePropertyChanged(() => accumulative_receivable_std);
            }
        }

        private double _accumulative_payable;
        /// <summary>
        /// 累计应付额
        /// </summary>
        public double accumulative_payable
        {
            get { return _accumulative_payable; }

            set
            {
                _accumulative_payable = value;
                RaisePropertyChanged(() => accumulative_payable);
            }
        }

        private double _accumulative_payable_std;
        /// <summary>
        /// 累计应付额标准
        /// </summary>
        public double accumulative_payable_std
        {
            get { return _accumulative_payable_std; }

            set
            {
                _accumulative_payable_std = value;
                RaisePropertyChanged(() => accumulative_payable_std);
            }
        }

        private double _unit_nav;
        /// <summary>
        /// 单位净值
        /// </summary>
        public double unit_nav
        {
            get { return _unit_nav; }

            set
            {
                _unit_nav = value;
                RaisePropertyChanged(() => unit_nav);
            }
        }

        private double _unit_nav_std;
        /// <summary>
        /// 单位净值标准
        /// </summary>
        public double unit_nav_std
        {
            get { return _unit_nav_std; }

            set
            {
                _unit_nav_std = value;
                RaisePropertyChanged(() => unit_nav_std);
            }
        }
    }

    public class evaL_3_28_Info : ObservableObject
    {

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

        private int _pd_fee_type;
        /// <summary>
        /// 产品费用类型
        /// </summary>
        public int pd_fee_type
        {
            get { return _pd_fee_type; }

            set
            {
                _pd_fee_type = value;
                RaisePropertyChanged(() => pd_fee_type);
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

        private String _market_value;
        /// <summary>
        /// 市值
        /// </summary>
        public String market_value
        {
            get { return _market_value; }

            set
            {
                _market_value = value;
                RaisePropertyChanged(() => market_value);
            }
        }
    }

    public class evaL_3_29_Info : ObservableObject
    {

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

        private String _asset_acco;
        /// <summary>
        /// 资产账户
        /// </summary>
        public String asset_acco
        {
            get { return _asset_acco; }

            set
            {
                _asset_acco = value;
                RaisePropertyChanged(() => asset_acco);
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

        private String _market_value;
        /// <summary>
        /// 市值
        /// </summary>
        public String market_value
        {
            get { return _market_value; }

            set
            {
                _market_value = value;
                RaisePropertyChanged(() => market_value);
            }
        }
    }

    public class evaL_3_30_Info : ObservableObject
    {

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

        private double _vat_loan;
        /// <summary>
        /// 贷款增值税
        /// </summary>
        public double vat_loan
        {
            get { return _vat_loan; }

            set
            {
                _vat_loan = value;
                RaisePropertyChanged(() => vat_loan);
            }
        }

        private double _calc_pay;
        /// <summary>
        /// 转让计提金额
        /// </summary>
        public double calc_pay
        {
            get { return _calc_pay; }

            set
            {
                _calc_pay = value;
                RaisePropertyChanged(() => calc_pay);
            }
        }

        private double _vat_pay_offset;
        /// <summary>
        /// 转让抵扣额
        /// </summary>
        public double vat_pay_offset
        {
            get { return _vat_pay_offset; }

            set
            {
                _vat_pay_offset = value;
                RaisePropertyChanged(() => vat_pay_offset);
            }
        }

        private double _vat_transfer;
        /// <summary>
        /// 转让增值税
        /// </summary>
        public double vat_transfer
        {
            get { return _vat_transfer; }

            set
            {
                _vat_transfer = value;
                RaisePropertyChanged(() => vat_transfer);
            }
        }

        private double _vat_pay_add;
        /// <summary>
        /// 转让增值税附加税
        /// </summary>
        public double vat_pay_add
        {
            get { return _vat_pay_add; }

            set
            {
                _vat_pay_add = value;
                RaisePropertyChanged(() => vat_pay_add);
            }
        }

        private double _calc_estimate;
        /// <summary>
        /// 预估计提金额
        /// </summary>
        public double calc_estimate
        {
            get { return _calc_estimate; }

            set
            {
                _calc_estimate = value;
                RaisePropertyChanged(() => calc_estimate);
            }
        }

        private double _vat_estimate_offset;
        /// <summary>
        /// 预估抵扣额
        /// </summary>
        public double vat_estimate_offset
        {
            get { return _vat_estimate_offset; }

            set
            {
                _vat_estimate_offset = value;
                RaisePropertyChanged(() => vat_estimate_offset);
            }
        }

        private double _vat_estimate;
        /// <summary>
        /// 预估增值税
        /// </summary>
        public double vat_estimate
        {
            get { return _vat_estimate; }

            set
            {
                _vat_estimate = value;
                RaisePropertyChanged(() => vat_estimate);
            }
        }

        private double _vat_estimate_add;
        /// <summary>
        /// 预估增值税附加税
        /// </summary>
        public double vat_estimate_add
        {
            get { return _vat_estimate_add; }

            set
            {
                _vat_estimate_add = value;
                RaisePropertyChanged(() => vat_estimate_add);
            }
        }
    }

    public class evaL_3_31_Info : ObservableObject
    {

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

        private int _eva_check_type;
        /// <summary>
        /// 估值核对类型
        /// </summary>
        public int eva_check_type
        {
            get { return _eva_check_type; }

            set
            {
                _eva_check_type = value;
                RaisePropertyChanged(() => eva_check_type);
            }
        }

        private String _fina_acco_code;
        /// <summary>
        /// 科目代码
        /// </summary>
        public String fina_acco_code
        {
            get { return _fina_acco_code; }

            set
            {
                _fina_acco_code = value;
                RaisePropertyChanged(() => fina_acco_code);
            }
        }

        private String _fina_acco_name;
        /// <summary>
        /// 科目名称
        /// </summary>
        public String fina_acco_name
        {
            get { return _fina_acco_name; }

            set
            {
                _fina_acco_name = value;
                RaisePropertyChanged(() => fina_acco_name);
            }
        }

        private String _market_value;
        /// <summary>
        /// 市值
        /// </summary>
        public String market_value
        {
            get { return _market_value; }

            set
            {
                _market_value = value;
                RaisePropertyChanged(() => market_value);
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
    }

    public class evaL_3_32_Info : ObservableObject
    {
    }

    public class evaL_3_33_Info : ObservableObject
    {
    }

    public class evaL_3_34_Info : ObservableObject
    {
    }

    public class evaL_3_35_Info : ObservableObject
    {
    }

    public class evaL_3_36_Info : ObservableObject
    {

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

        private double _pd_curr_share;
        /// <summary>
        /// 产品当前份额
        /// </summary>
        public double pd_curr_share
        {
            get { return _pd_curr_share; }

            set
            {
                _pd_curr_share = value;
                RaisePropertyChanged(() => pd_curr_share);
            }
        }

        private double _unit_nav;
        /// <summary>
        /// 单位净值
        /// </summary>
        public double unit_nav
        {
            get { return _unit_nav; }

            set
            {
                _unit_nav = value;
                RaisePropertyChanged(() => unit_nav);
            }
        }

        private double _cash_coeffi;
        /// <summary>
        /// 现金分红系数
        /// </summary>
        public double cash_coeffi
        {
            get { return _cash_coeffi; }

            set
            {
                _cash_coeffi = value;
                RaisePropertyChanged(() => cash_coeffi);
            }
        }

        private double _share_coeffi;
        /// <summary>
        /// 份额分红系数
        /// </summary>
        public double share_coeffi
        {
            get { return _share_coeffi; }

            set
            {
                _share_coeffi = value;
                RaisePropertyChanged(() => share_coeffi);
            }
        }

        private double _total_unit_nav;
        /// <summary>
        /// 累计单位净值
        /// </summary>
        public double total_unit_nav
        {
            get { return _total_unit_nav; }

            set
            {
                _total_unit_nav = value;
                RaisePropertyChanged(() => total_unit_nav);
            }
        }

        private double _net_prefee_coeffi;
        /// <summary>
        /// 费前累计净值系数
        /// </summary>
        public double net_prefee_coeffi
        {
            get { return _net_prefee_coeffi; }

            set
            {
                _net_prefee_coeffi = value;
                RaisePropertyChanged(() => net_prefee_coeffi);
            }
        }

        private double _pre_fee_share_net_total;
        /// <summary>
        /// 费前累计净值
        /// </summary>
        public double pre_fee_share_net_total
        {
            get { return _pre_fee_share_net_total; }

            set
            {
                _pre_fee_share_net_total = value;
                RaisePropertyChanged(() => pre_fee_share_net_total);
            }
        }
    }

    public class evaL_3_37_Info : ObservableObject
    {
    }

    public class evaL_3_38_Info : ObservableObject
    {
    }

    public class evaL_3_39_Info : ObservableObject
    {
    }

    public class evaL_3_40_Info : ObservableObject
    {
    }

    public class evaL_3_41_Info : ObservableObject
    {
    }

    public class evaL_3_42_Info : ObservableObject
    {
    }

    public class evaL_3_43_Info : ObservableObject
    {

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

        private int _order_dir;
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir
        {
            get { return _order_dir; }

            set
            {
                _order_dir = value;
                RaisePropertyChanged(() => order_dir);
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

        private double _strike_qty;
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty
        {
            get { return _strike_qty; }

            set
            {
                _strike_qty = value;
                RaisePropertyChanged(() => strike_qty);
            }
        }

        private double _strike_amt;
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt
        {
            get { return _strike_amt; }

            set
            {
                _strike_amt = value;
                RaisePropertyChanged(() => strike_amt);
            }
        }

        private double _all_fee;
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee
        {
            get { return _all_fee; }

            set
            {
                _all_fee = value;
                RaisePropertyChanged(() => all_fee);
            }
        }

        private double _cost_price;
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price
        {
            get { return _cost_price; }

            set
            {
                _cost_price = value;
                RaisePropertyChanged(() => cost_price);
            }
        }

        private double _offset_qty;
        /// <summary>
        /// 冲抵数量
        /// </summary>
        public double offset_qty
        {
            get { return _offset_qty; }

            set
            {
                _offset_qty = value;
                RaisePropertyChanged(() => offset_qty);
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

        private double _begin_qty;
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty
        {
            get { return _begin_qty; }

            set
            {
                _begin_qty = value;
                RaisePropertyChanged(() => begin_qty);
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

    public class evaL_3_44_Info : ObservableObject
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

        private int _order_dir;
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir
        {
            get { return _order_dir; }

            set
            {
                _order_dir = value;
                RaisePropertyChanged(() => order_dir);
            }
        }

        private String _strike_no;
        /// <summary>
        /// 成交编号
        /// </summary>
        public String strike_no
        {
            get { return _strike_no; }

            set
            {
                _strike_no = value;
                RaisePropertyChanged(() => strike_no);
            }
        }

        private int _strike_time;
        /// <summary>
        /// 成交时间
        /// </summary>
        public int strike_time
        {
            get { return _strike_time; }

            set
            {
                _strike_time = value;
                RaisePropertyChanged(() => strike_time);
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

        private double _strike_price;
        /// <summary>
        /// 成交价格
        /// </summary>
        public double strike_price
        {
            get { return _strike_price; }

            set
            {
                _strike_price = value;
                RaisePropertyChanged(() => strike_price);
            }
        }

        private double _strike_qty;
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty
        {
            get { return _strike_qty; }

            set
            {
                _strike_qty = value;
                RaisePropertyChanged(() => strike_qty);
            }
        }

        private double _strike_amt;
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt
        {
            get { return _strike_amt; }

            set
            {
                _strike_amt = value;
                RaisePropertyChanged(() => strike_amt);
            }
        }

        private double _all_fee;
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee
        {
            get { return _all_fee; }

            set
            {
                _all_fee = value;
                RaisePropertyChanged(() => all_fee);
            }
        }

        private double _cost_price;
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price
        {
            get { return _cost_price; }

            set
            {
                _cost_price = value;
                RaisePropertyChanged(() => cost_price);
            }
        }

        private double _offset_qty;
        /// <summary>
        /// 冲抵数量
        /// </summary>
        public double offset_qty
        {
            get { return _offset_qty; }

            set
            {
                _offset_qty = value;
                RaisePropertyChanged(() => offset_qty);
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

    public class evaL_3_45_Info : ObservableObject
    {
    }

    public class evaL_3_46_Info : ObservableObject
    {

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

        private String _fina_acco_code;
        /// <summary>
        /// 科目代码
        /// </summary>
        public String fina_acco_code
        {
            get { return _fina_acco_code; }

            set
            {
                _fina_acco_code = value;
                RaisePropertyChanged(() => fina_acco_code);
            }
        }

        private String _fina_acco_name;
        /// <summary>
        /// 科目名称
        /// </summary>
        public String fina_acco_name
        {
            get { return _fina_acco_name; }

            set
            {
                _fina_acco_name = value;
                RaisePropertyChanged(() => fina_acco_name);
            }
        }

        private String _amount;
        /// <summary>
        /// 数量
        /// </summary>
        public String amount
        {
            get { return _amount; }

            set
            {
                _amount = value;
                RaisePropertyChanged(() => amount);
            }
        }

        private String _unit_cost;
        /// <summary>
        /// 单位成本
        /// </summary>
        public String unit_cost
        {
            get { return _unit_cost; }

            set
            {
                _unit_cost = value;
                RaisePropertyChanged(() => unit_cost);
            }
        }

        private String _prime_cost;
        /// <summary>
        /// 成本
        /// </summary>
        public String prime_cost
        {
            get { return _prime_cost; }

            set
            {
                _prime_cost = value;
                RaisePropertyChanged(() => prime_cost);
            }
        }

        private String _cost_net_ratio;
        /// <summary>
        /// 成本占净值
        /// </summary>
        public String cost_net_ratio
        {
            get { return _cost_net_ratio; }

            set
            {
                _cost_net_ratio = value;
                RaisePropertyChanged(() => cost_net_ratio);
            }
        }

        private String _market_price;
        /// <summary>
        /// 市价
        /// </summary>
        public String market_price
        {
            get { return _market_price; }

            set
            {
                _market_price = value;
                RaisePropertyChanged(() => market_price);
            }
        }

        private String _market_value;
        /// <summary>
        /// 市值
        /// </summary>
        public String market_value
        {
            get { return _market_value; }

            set
            {
                _market_value = value;
                RaisePropertyChanged(() => market_value);
            }
        }

        private String _market_net_ratio;
        /// <summary>
        /// 市值占净值
        /// </summary>
        public String market_net_ratio
        {
            get { return _market_net_ratio; }

            set
            {
                _market_net_ratio = value;
                RaisePropertyChanged(() => market_net_ratio);
            }
        }

        private double _evalu_add_value;
        /// <summary>
        /// 估值增值
        /// </summary>
        public double evalu_add_value
        {
            get { return _evalu_add_value; }

            set
            {
                _evalu_add_value = value;
                RaisePropertyChanged(() => evalu_add_value);
            }
        }

        private String _stop_info;
        /// <summary>
        /// 停牌信息
        /// </summary>
        public String stop_info
        {
            get { return _stop_info; }

            set
            {
                _stop_info = value;
                RaisePropertyChanged(() => stop_info);
            }
        }

        private String _rights_info;
        /// <summary>
        /// 权益信息
        /// </summary>
        public String rights_info
        {
            get { return _rights_info; }

            set
            {
                _rights_info = value;
                RaisePropertyChanged(() => rights_info);
            }
        }
    }

    public class evaL_3_47_Info : ObservableObject
    {

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

        private double _pd_curr_share;
        /// <summary>
        /// 产品当前份额
        /// </summary>
        public double pd_curr_share
        {
            get { return _pd_curr_share; }

            set
            {
                _pd_curr_share = value;
                RaisePropertyChanged(() => pd_curr_share);
            }
        }

        private double _total_asset;
        /// <summary>
        /// 总资产
        /// </summary>
        public double total_asset
        {
            get { return _total_asset; }

            set
            {
                _total_asset = value;
                RaisePropertyChanged(() => total_asset);
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

        private double _cash_bala;
        /// <summary>
        /// 现金余额
        /// </summary>
        public double cash_bala
        {
            get { return _cash_bala; }

            set
            {
                _cash_bala = value;
                RaisePropertyChanged(() => cash_bala);
            }
        }

        private double _acco_cash;
        /// <summary>
        /// 账户余额
        /// </summary>
        public double acco_cash
        {
            get { return _acco_cash; }

            set
            {
                _acco_cash = value;
                RaisePropertyChanged(() => acco_cash);
            }
        }

        private double _stock_market_value;
        /// <summary>
        /// 股票市值
        /// </summary>
        public double stock_market_value
        {
            get { return _stock_market_value; }

            set
            {
                _stock_market_value = value;
                RaisePropertyChanged(() => stock_market_value);
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

        private double _futu_asset;
        /// <summary>
        /// 期货资产
        /// </summary>
        public double futu_asset
        {
            get { return _futu_asset; }

            set
            {
                _futu_asset = value;
                RaisePropertyChanged(() => futu_asset);
            }
        }

        private double _option_asset;
        /// <summary>
        /// 期权资产
        /// </summary>
        public double option_asset
        {
            get { return _option_asset; }

            set
            {
                _option_asset = value;
                RaisePropertyChanged(() => option_asset);
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

        private double _accumulative_receivable;
        /// <summary>
        /// 累计应收额
        /// </summary>
        public double accumulative_receivable
        {
            get { return _accumulative_receivable; }

            set
            {
                _accumulative_receivable = value;
                RaisePropertyChanged(() => accumulative_receivable);
            }
        }

        private double _accumulative_payable;
        /// <summary>
        /// 累计应付额
        /// </summary>
        public double accumulative_payable
        {
            get { return _accumulative_payable; }

            set
            {
                _accumulative_payable = value;
                RaisePropertyChanged(() => accumulative_payable);
            }
        }

        private double _apply_amt;
        /// <summary>
        /// 申购应收金额
        /// </summary>
        public double apply_amt
        {
            get { return _apply_amt; }

            set
            {
                _apply_amt = value;
                RaisePropertyChanged(() => apply_amt);
            }
        }

        private double _redemp_amt;
        /// <summary>
        /// 赎回应付金额
        /// </summary>
        public double redemp_amt
        {
            get { return _redemp_amt; }

            set
            {
                _redemp_amt = value;
                RaisePropertyChanged(() => redemp_amt);
            }
        }

        private double _unit_nav;
        /// <summary>
        /// 单位净值
        /// </summary>
        public double unit_nav
        {
            get { return _unit_nav; }

            set
            {
                _unit_nav = value;
                RaisePropertyChanged(() => unit_nav);
            }
        }

        private double _total_cash_divide;
        /// <summary>
        /// 累计派现金额
        /// </summary>
        public double total_cash_divide
        {
            get { return _total_cash_divide; }

            set
            {
                _total_cash_divide = value;
                RaisePropertyChanged(() => total_cash_divide);
            }
        }

        private double _total_unit_nav;
        /// <summary>
        /// 累计单位净值
        /// </summary>
        public double total_unit_nav
        {
            get { return _total_unit_nav; }

            set
            {
                _total_unit_nav = value;
                RaisePropertyChanged(() => total_unit_nav);
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
    }

    public class evaL_3_48_Info : ObservableObject
    {
    }

    public class evaL_3_49_Info : ObservableObject
    {
    }

    public class evaL_3_50_Info : ObservableObject
    {
    }

    public class evaL_3_51_Info : ObservableObject
    {

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

        private int _pd_fee_type;
        /// <summary>
        /// 产品费用类型
        /// </summary>
        public int pd_fee_type
        {
            get { return _pd_fee_type; }

            set
            {
                _pd_fee_type = value;
                RaisePropertyChanged(() => pd_fee_type);
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

        private double _pd_net_asset;
        /// <summary>
        /// 产品净资产
        /// </summary>
        public double pd_net_asset
        {
            get { return _pd_net_asset; }

            set
            {
                _pd_net_asset = value;
                RaisePropertyChanged(() => pd_net_asset);
            }
        }

        private double _confirm_apply;
        /// <summary>
        /// 确认金额
        /// </summary>
        public double confirm_apply
        {
            get { return _confirm_apply; }

            set
            {
                _confirm_apply = value;
                RaisePropertyChanged(() => confirm_apply);
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

        private int _manual_flag;
        /// <summary>
        /// 手工标志
        /// </summary>
        public int manual_flag
        {
            get { return _manual_flag; }

            set
            {
                _manual_flag = value;
                RaisePropertyChanged(() => manual_flag);
            }
        }
    }

    public class evaL_3_52_Info : ObservableObject
    {
    }

    public class evaL_3_53_Info : ObservableObject
    {
    }

    public class evaL_3_54_Info : ObservableObject
    {
    }

    public class evaL_3_55_Info : ObservableObject
    {

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

        private int _pd_rate_type;
        /// <summary>
        /// 产品利率类型
        /// </summary>
        public int pd_rate_type
        {
            get { return _pd_rate_type; }

            set
            {
                _pd_rate_type = value;
                RaisePropertyChanged(() => pd_rate_type);
            }
        }

        private String _asset_acco;
        /// <summary>
        /// 资产账户
        /// </summary>
        public String asset_acco
        {
            get { return _asset_acco; }

            set
            {
                _asset_acco = value;
                RaisePropertyChanged(() => asset_acco);
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

        private double _confirm_apply;
        /// <summary>
        /// 确认金额
        /// </summary>
        public double confirm_apply
        {
            get { return _confirm_apply; }

            set
            {
                _confirm_apply = value;
                RaisePropertyChanged(() => confirm_apply);
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

        private int _manual_flag;
        /// <summary>
        /// 手工标志
        /// </summary>
        public int manual_flag
        {
            get { return _manual_flag; }

            set
            {
                _manual_flag = value;
                RaisePropertyChanged(() => manual_flag);
            }
        }
    }

    public class evaL_3_101_Info : ObservableObject
    {
    }

    public class evaL_3_102_Info : ObservableObject
    {
    }

    public class evaL_3_103_Info : ObservableObject
    {
    }

    public class evaL_3_104_Info : ObservableObject
    {
    }

    public class evaL_3_105_Info : ObservableObject
    {
    }

    public class evaL_3_106_Info : ObservableObject
    {
    }

}
