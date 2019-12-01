using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class prodL_5_1_Info : ObservableObject
    {

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

        private String _pd_code;
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code
        {
            get { return _pd_code; }

            set
            {
                _pd_code = value;
                RaisePropertyChanged(() => pd_code);
            }
        }

        private String _pd_name;
        /// <summary>
        /// 产品名称
        /// </summary>
        public String pd_name
        {
            get { return _pd_name; }

            set
            {
                _pd_name = value;
                RaisePropertyChanged(() => pd_name);
            }
        }

        private String _pd_status;
        /// <summary>
        /// 产品状态
        /// </summary>
        public String pd_status
        {
            get { return _pd_status; }

            set
            {
                _pd_status = value;
                RaisePropertyChanged(() => pd_status);
            }
        }
    }

    public class prodL_5_2_Info : ObservableObject
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

        private String _asset_acco_name;
        /// <summary>
        /// 资产账户名称
        /// </summary>
        public String asset_acco_name
        {
            get { return _asset_acco_name; }

            set
            {
                _asset_acco_name = value;
                RaisePropertyChanged(() => asset_acco_name);
            }
        }

        private String _asset_acco_status;
        /// <summary>
        /// 资产账户状态
        /// </summary>
        public String asset_acco_status
        {
            get { return _asset_acco_status; }

            set
            {
                _asset_acco_status = value;
                RaisePropertyChanged(() => asset_acco_status);
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

        private String _busi_depart;
        /// <summary>
        /// 营业部
        /// </summary>
        public String busi_depart
        {
            get { return _busi_depart; }

            set
            {
                _busi_depart = value;
                RaisePropertyChanged(() => busi_depart);
            }
        }
    }

    public class prodL_5_4_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code
        {
            get { return _pd_code; }

            set
            {
                _pd_code = value;
                RaisePropertyChanged(() => pd_code);
            }
        }

        private String _pd_name;
        /// <summary>
        /// 产品名称
        /// </summary>
        public String pd_name
        {
            get { return _pd_name; }

            set
            {
                _pd_name = value;
                RaisePropertyChanged(() => pd_name);
            }
        }

        private String _pd_flname;
        /// <summary>
        /// 产品全称
        /// </summary>
        public String pd_flname
        {
            get { return _pd_flname; }

            set
            {
                _pd_flname = value;
                RaisePropertyChanged(() => pd_flname);
            }
        }

        private String _pd_manager;
        /// <summary>
        /// 产品管理人
        /// </summary>
        public String pd_manager
        {
            get { return _pd_manager; }

            set
            {
                _pd_manager = value;
                RaisePropertyChanged(() => pd_manager);
            }
        }

        private int _found_date;
        /// <summary>
        /// 成立日期
        /// </summary>
        public int found_date
        {
            get { return _found_date; }

            set
            {
                _found_date = value;
                RaisePropertyChanged(() => found_date);
            }
        }

        private int _pd_type;
        /// <summary>
        /// 产品类型
        /// </summary>
        public int pd_type
        {
            get { return _pd_type; }

            set
            {
                _pd_type = value;
                RaisePropertyChanged(() => pd_type);
            }
        }

        private String _apply_currency;
        /// <summary>
        /// 募集币种
        /// </summary>
        public String apply_currency
        {
            get { return _apply_currency; }

            set
            {
                _apply_currency = value;
                RaisePropertyChanged(() => apply_currency);
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

        private double _first_asset;
        /// <summary>
        /// 原始资产
        /// </summary>
        public double first_asset
        {
            get { return _first_asset; }

            set
            {
                _first_asset = value;
                RaisePropertyChanged(() => first_asset);
            }
        }

        private double _first_amt;
        /// <summary>
        /// 原始金额
        /// </summary>
        public double first_amt
        {
            get { return _first_amt; }

            set
            {
                _first_amt = value;
                RaisePropertyChanged(() => first_amt);
            }
        }

        private double _pd_all_share;
        /// <summary>
        /// 产品总份额
        /// </summary>
        public double pd_all_share
        {
            get { return _pd_all_share; }

            set
            {
                _pd_all_share = value;
                RaisePropertyChanged(() => pd_all_share);
            }
        }

        private double _curr_share;
        /// <summary>
        /// 当前份额
        /// </summary>
        public double curr_share
        {
            get { return _curr_share; }

            set
            {
                _curr_share = value;
                RaisePropertyChanged(() => curr_share);
            }
        }

        private double _pre_share;
        /// <summary>
        /// 昨日份额
        /// </summary>
        public double pre_share
        {
            get { return _pre_share; }

            set
            {
                _pre_share = value;
                RaisePropertyChanged(() => pre_share);
            }
        }

        private double _his_max_per_nav;
        /// <summary>
        /// 历史最高单位净值
        /// </summary>
        public double his_max_per_nav
        {
            get { return _his_max_per_nav; }

            set
            {
                _his_max_per_nav = value;
                RaisePropertyChanged(() => his_max_per_nav);
            }
        }

        private double _pre_nav;
        /// <summary>
        /// 昨日净值
        /// </summary>
        public double pre_nav
        {
            get { return _pre_nav; }

            set
            {
                _pre_nav = value;
                RaisePropertyChanged(() => pre_nav);
            }
        }

        private String _coust_full_name;
        /// <summary>
        /// 境内托管人全名
        /// </summary>
        public String coust_full_name
        {
            get { return _coust_full_name; }

            set
            {
                _coust_full_name = value;
                RaisePropertyChanged(() => coust_full_name);
            }
        }

        private String _coust_acco;
        /// <summary>
        /// 境内托管账户
        /// </summary>
        public String coust_acco
        {
            get { return _coust_acco; }

            set
            {
                _coust_acco = value;
                RaisePropertyChanged(() => coust_acco);
            }
        }

        private String _coust_acco_name;
        /// <summary>
        /// 境内托管账户名
        /// </summary>
        public String coust_acco_name
        {
            get { return _coust_acco_name; }

            set
            {
                _coust_acco_name = value;
                RaisePropertyChanged(() => coust_acco_name);
            }
        }

        private int _cost_calc_type;
        /// <summary>
        /// 成本计算方式
        /// </summary>
        public int cost_calc_type
        {
            get { return _cost_calc_type; }

            set
            {
                _cost_calc_type = value;
                RaisePropertyChanged(() => cost_calc_type);
            }
        }

        private String _allow_exch;
        /// <summary>
        /// 允许投资市场
        /// </summary>
        public String allow_exch
        {
            get { return _allow_exch; }

            set
            {
                _allow_exch = value;
                RaisePropertyChanged(() => allow_exch);
            }
        }

        private String _allow_stock_type;
        /// <summary>
        /// 允许操作证券类型
        /// </summary>
        public String allow_stock_type
        {
            get { return _allow_stock_type; }

            set
            {
                _allow_stock_type = value;
                RaisePropertyChanged(() => allow_stock_type);
            }
        }

        private String _busi_config_str;
        /// <summary>
        /// 业务控制配置串
        /// </summary>
        public String busi_config_str
        {
            get { return _busi_config_str; }

            set
            {
                _busi_config_str = value;
                RaisePropertyChanged(() => busi_config_str);
            }
        }

        private int _comm_appr_oper;
        /// <summary>
        /// 指令审批操作员
        /// </summary>
        public int comm_appr_oper
        {
            get { return _comm_appr_oper; }

            set
            {
                _comm_appr_oper = value;
                RaisePropertyChanged(() => comm_appr_oper);
            }
        }

        private double _market_price_ratio;
        /// <summary>
        /// 市价冻结浮动比例
        /// </summary>
        public double market_price_ratio
        {
            get { return _market_price_ratio; }

            set
            {
                _market_price_ratio = value;
                RaisePropertyChanged(() => market_price_ratio);
            }
        }

        private String _forbid_order_dir;
        /// <summary>
        /// 禁止订单方向
        /// </summary>
        public String forbid_order_dir
        {
            get { return _forbid_order_dir; }

            set
            {
                _forbid_order_dir = value;
                RaisePropertyChanged(() => forbid_order_dir);
            }
        }

        private double _warn_posi_value;
        /// <summary>
        /// 预警线
        /// </summary>
        public double warn_posi_value
        {
            get { return _warn_posi_value; }

            set
            {
                _warn_posi_value = value;
                RaisePropertyChanged(() => warn_posi_value);
            }
        }

        private double _close_posi_value;
        /// <summary>
        /// 平仓线
        /// </summary>
        public double close_posi_value
        {
            get { return _close_posi_value; }

            set
            {
                _close_posi_value = value;
                RaisePropertyChanged(() => close_posi_value);
            }
        }

        private double _target_posi_ratio;
        /// <summary>
        /// 目标仓位
        /// </summary>
        public double target_posi_ratio
        {
            get { return _target_posi_ratio; }

            set
            {
                _target_posi_ratio = value;
                RaisePropertyChanged(() => target_posi_ratio);
            }
        }

        private double _beta_coeffi;
        /// <summary>
        /// beta系数
        /// </summary>
        public double beta_coeffi
        {
            get { return _beta_coeffi; }

            set
            {
                _beta_coeffi = value;
                RaisePropertyChanged(() => beta_coeffi);
            }
        }

        private String _custom_pd_class;
        /// <summary>
        /// 自定义产品分类
        /// </summary>
        public String custom_pd_class
        {
            get { return _custom_pd_class; }

            set
            {
                _custom_pd_class = value;
                RaisePropertyChanged(() => custom_pd_class);
            }
        }

        private String _pd_status;
        /// <summary>
        /// 产品状态
        /// </summary>
        public String pd_status
        {
            get { return _pd_status; }

            set
            {
                _pd_status = value;
                RaisePropertyChanged(() => pd_status);
            }
        }

        private int _index_value;
        /// <summary>
        /// 索引值
        /// </summary>
        public int index_value
        {
            get { return _index_value; }

            set
            {
                _index_value = value;
                RaisePropertyChanged(() => index_value);
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

    public class prodL_5_5_Info : ObservableObject
    {
    }

    public class prodL_5_6_Info : ObservableObject
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

        private String _asset_acco_name;
        /// <summary>
        /// 资产账户名称
        /// </summary>
        public String asset_acco_name
        {
            get { return _asset_acco_name; }

            set
            {
                _asset_acco_name = value;
                RaisePropertyChanged(() => asset_acco_name);
            }
        }

        private int _asset_acco_type;
        /// <summary>
        /// 资产账户类型
        /// </summary>
        public int asset_acco_type
        {
            get { return _asset_acco_type; }

            set
            {
                _asset_acco_type = value;
                RaisePropertyChanged(() => asset_acco_type);
            }
        }

        private String _trade_pwd;
        /// <summary>
        /// 交易密码
        /// </summary>
        public String trade_pwd
        {
            get { return _trade_pwd; }

            set
            {
                _trade_pwd = value;
                RaisePropertyChanged(() => trade_pwd);
            }
        }

        private String _asset_acco_status;
        /// <summary>
        /// 资产账户状态
        /// </summary>
        public String asset_acco_status
        {
            get { return _asset_acco_status; }

            set
            {
                _asset_acco_status = value;
                RaisePropertyChanged(() => asset_acco_status);
            }
        }

        private String _busi_config_str;
        /// <summary>
        /// 业务控制配置串
        /// </summary>
        public String busi_config_str
        {
            get { return _busi_config_str; }

            set
            {
                _busi_config_str = value;
                RaisePropertyChanged(() => busi_config_str);
            }
        }

        private double _market_price_ratio;
        /// <summary>
        /// 市价冻结浮动比例
        /// </summary>
        public double market_price_ratio
        {
            get { return _market_price_ratio; }

            set
            {
                _market_price_ratio = value;
                RaisePropertyChanged(() => market_price_ratio);
            }
        }

        private String _allow_exch;
        /// <summary>
        /// 允许投资市场
        /// </summary>
        public String allow_exch
        {
            get { return _allow_exch; }

            set
            {
                _allow_exch = value;
                RaisePropertyChanged(() => allow_exch);
            }
        }

        private String _allow_stock_type;
        /// <summary>
        /// 允许操作证券类型
        /// </summary>
        public String allow_stock_type
        {
            get { return _allow_stock_type; }

            set
            {
                _allow_stock_type = value;
                RaisePropertyChanged(() => allow_stock_type);
            }
        }

        private String _split_fee_typr_str;
        /// <summary>
        /// 分笔费用类型串
        /// </summary>
        public String split_fee_typr_str
        {
            get { return _split_fee_typr_str; }

            set
            {
                _split_fee_typr_str = value;
                RaisePropertyChanged(() => split_fee_typr_str);
            }
        }

        private String _busi_limit_str;
        /// <summary>
        /// 业务限制串
        /// </summary>
        public String busi_limit_str
        {
            get { return _busi_limit_str; }

            set
            {
                _busi_limit_str = value;
                RaisePropertyChanged(() => busi_limit_str);
            }
        }

        private int _exter_comm_flag;
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag
        {
            get { return _exter_comm_flag; }

            set
            {
                _exter_comm_flag = value;
                RaisePropertyChanged(() => exter_comm_flag);
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

    public class prodL_5_7_Info : ObservableObject
    {
    }

    public class prodL_5_8_Info : ObservableObject
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

        private int _online_status;
        /// <summary>
        /// 在线状态
        /// </summary>
        public int online_status
        {
            get { return _online_status; }

            set
            {
                _online_status = value;
                RaisePropertyChanged(() => online_status);
            }
        }
    }

    public class prodL_5_11_Info : ObservableObject
    {
    }

    public class prodL_5_21_Info : ObservableObject
    {
    }

    public class prodL_5_71_Info : ObservableObject
    {
    }

    public class prodL_5_74_Info : ObservableObject
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

        private int _pass_type;
        /// <summary>
        /// 通道类型
        /// </summary>
        public int pass_type
        {
            get { return _pass_type; }

            set
            {
                _pass_type = value;
                RaisePropertyChanged(() => pass_type);
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

        private int _online_status;
        /// <summary>
        /// 在线状态
        /// </summary>
        public int online_status
        {
            get { return _online_status; }

            set
            {
                _online_status = value;
                RaisePropertyChanged(() => online_status);
            }
        }

        private String _config_str;
        /// <summary>
        /// 参数配置串
        /// </summary>
        public String config_str
        {
            get { return _config_str; }

            set
            {
                _config_str = value;
                RaisePropertyChanged(() => config_str);
            }
        }

        private int _read_flag;
        /// <summary>
        /// 已读标记
        /// </summary>
        public int read_flag
        {
            get { return _read_flag; }

            set
            {
                _read_flag = value;
                RaisePropertyChanged(() => read_flag);
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

    public class prodL_5_75_Info : ObservableObject
    {
    }

    public class prodL_5_76_Info : ObservableObject
    {

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

        private String _pd_code;
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code
        {
            get { return _pd_code; }

            set
            {
                _pd_code = value;
                RaisePropertyChanged(() => pd_code);
            }
        }

        private String _pd_name;
        /// <summary>
        /// 产品名称
        /// </summary>
        public String pd_name
        {
            get { return _pd_name; }

            set
            {
                _pd_name = value;
                RaisePropertyChanged(() => pd_name);
            }
        }

        private String _pd_status;
        /// <summary>
        /// 产品状态
        /// </summary>
        public String pd_status
        {
            get { return _pd_status; }

            set
            {
                _pd_status = value;
                RaisePropertyChanged(() => pd_status);
            }
        }
    }

    public class prodL_5_77_Info : ObservableObject
    {

        private String _mac_addr;
        /// <summary>
        /// MAC地址
        /// </summary>
        public String mac_addr
        {
            get { return _mac_addr; }

            set
            {
                _mac_addr = value;
                RaisePropertyChanged(() => mac_addr);
            }
        }

        private String _offer_name;
        /// <summary>
        /// 报盘标识
        /// </summary>
        public String offer_name
        {
            get { return _offer_name; }

            set
            {
                _offer_name = value;
                RaisePropertyChanged(() => offer_name);
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

        private String _offer_server_name;
        /// <summary>
        /// 报盘服务器名称
        /// </summary>
        public String offer_server_name
        {
            get { return _offer_server_name; }

            set
            {
                _offer_server_name = value;
                RaisePropertyChanged(() => offer_server_name);
            }
        }

        private String _offer_server_ip;
        /// <summary>
        /// 报盘服务器IP
        /// </summary>
        public String offer_server_ip
        {
            get { return _offer_server_ip; }

            set
            {
                _offer_server_ip = value;
                RaisePropertyChanged(() => offer_server_ip);
            }
        }

        private int _software_start_time;
        /// <summary>
        /// 程序启动时间
        /// </summary>
        public int software_start_time
        {
            get { return _software_start_time; }

            set
            {
                _software_start_time = value;
                RaisePropertyChanged(() => software_start_time);
            }
        }

        private String _pass_status;
        /// <summary>
        /// 通道状态
        /// </summary>
        public String pass_status
        {
            get { return _pass_status; }

            set
            {
                _pass_status = value;
                RaisePropertyChanged(() => pass_status);
            }
        }

        private String _bkup_field_1;
        /// <summary>
        /// 备用字段1
        /// </summary>
        public String bkup_field_1
        {
            get { return _bkup_field_1; }

            set
            {
                _bkup_field_1 = value;
                RaisePropertyChanged(() => bkup_field_1);
            }
        }

        private int _bkup_field_2;
        /// <summary>
        /// 备用字段2
        /// </summary>
        public int bkup_field_2
        {
            get { return _bkup_field_2; }

            set
            {
                _bkup_field_2 = value;
                RaisePropertyChanged(() => bkup_field_2);
            }
        }

        private double _bkup_field_3;
        /// <summary>
        /// 备用字段3
        /// </summary>
        public double bkup_field_3
        {
            get { return _bkup_field_3; }

            set
            {
                _bkup_field_3 = value;
                RaisePropertyChanged(() => bkup_field_3);
            }
        }
    }

    public class prodL_5_78_Info : ObservableObject
    {
    }

    public class prodL_5_79_Info : ObservableObject
    {
    }

    public class prodL_5_80_Info : ObservableObject
    {
    }

    public class prodL_5_81_Info : ObservableObject
    {
    }

    public class prodL_5_82_Info : ObservableObject
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

        private int _cost_calc_type;
        /// <summary>
        /// 成本计算方式
        /// </summary>
        public int cost_calc_type
        {
            get { return _cost_calc_type; }

            set
            {
                _cost_calc_type = value;
                RaisePropertyChanged(() => cost_calc_type);
            }
        }

        private String _allow_exch;
        /// <summary>
        /// 允许投资市场
        /// </summary>
        public String allow_exch
        {
            get { return _allow_exch; }

            set
            {
                _allow_exch = value;
                RaisePropertyChanged(() => allow_exch);
            }
        }

        private String _allow_stock_type;
        /// <summary>
        /// 允许操作证券类型
        /// </summary>
        public String allow_stock_type
        {
            get { return _allow_stock_type; }

            set
            {
                _allow_stock_type = value;
                RaisePropertyChanged(() => allow_stock_type);
            }
        }

        private String _busi_config_str;
        /// <summary>
        /// 业务控制配置串
        /// </summary>
        public String busi_config_str
        {
            get { return _busi_config_str; }

            set
            {
                _busi_config_str = value;
                RaisePropertyChanged(() => busi_config_str);
            }
        }

        private int _comm_appr_oper;
        /// <summary>
        /// 指令审批操作员
        /// </summary>
        public int comm_appr_oper
        {
            get { return _comm_appr_oper; }

            set
            {
                _comm_appr_oper = value;
                RaisePropertyChanged(() => comm_appr_oper);
            }
        }

        private double _market_price_ratio;
        /// <summary>
        /// 市价冻结浮动比例
        /// </summary>
        public double market_price_ratio
        {
            get { return _market_price_ratio; }

            set
            {
                _market_price_ratio = value;
                RaisePropertyChanged(() => market_price_ratio);
            }
        }

        private String _forbid_order_dir;
        /// <summary>
        /// 禁止订单方向
        /// </summary>
        public String forbid_order_dir
        {
            get { return _forbid_order_dir; }

            set
            {
                _forbid_order_dir = value;
                RaisePropertyChanged(() => forbid_order_dir);
            }
        }

        private String _pd_status;
        /// <summary>
        /// 产品状态
        /// </summary>
        public String pd_status
        {
            get { return _pd_status; }

            set
            {
                _pd_status = value;
                RaisePropertyChanged(() => pd_status);
            }
        }

        private double _comm_no_limit_price_ratio;
        /// <summary>
        /// 指令不限价浮动比例
        /// </summary>
        public double comm_no_limit_price_ratio
        {
            get { return _comm_no_limit_price_ratio; }

            set
            {
                _comm_no_limit_price_ratio = value;
                RaisePropertyChanged(() => comm_no_limit_price_ratio);
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

    public class prodL_5_83_Info : ObservableObject
    {

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
    }

    public class prodL_5_84_Info : ObservableObject
    {

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
    }

    public class prodL_5_85_Info : ObservableObject
    {
    }

    public class prodL_5_86_Info : ObservableObject
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
    }

    public class prodL_5_87_Info : ObservableObject
    {
    }

    public class prodL_5_88_Info : ObservableObject
    {
    }

    public class prodL_5_89_Info : ObservableObject
    {
    }

    public class prodL_5_90_Info : ObservableObject
    {
    }

    public class prodL_5_91_Info : ObservableObject
    {
    }

    public class prodL_5_92_Info : ObservableObject
    {
    }

    public class prodL_5_93_Info : ObservableObject
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

        private String _pd_code;
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code
        {
            get { return _pd_code; }

            set
            {
                _pd_code = value;
                RaisePropertyChanged(() => pd_code);
            }
        }

        private String _pd_name;
        /// <summary>
        /// 产品名称
        /// </summary>
        public String pd_name
        {
            get { return _pd_name; }

            set
            {
                _pd_name = value;
                RaisePropertyChanged(() => pd_name);
            }
        }

        private String _pd_flname;
        /// <summary>
        /// 产品全称
        /// </summary>
        public String pd_flname
        {
            get { return _pd_flname; }

            set
            {
                _pd_flname = value;
                RaisePropertyChanged(() => pd_flname);
            }
        }

        private String _fund_reg_code;
        /// <summary>
        /// 基金备案编号
        /// </summary>
        public String fund_reg_code
        {
            get { return _fund_reg_code; }

            set
            {
                _fund_reg_code = value;
                RaisePropertyChanged(() => fund_reg_code);
            }
        }

        private String _pd_manager;
        /// <summary>
        /// 产品管理人
        /// </summary>
        public String pd_manager
        {
            get { return _pd_manager; }

            set
            {
                _pd_manager = value;
                RaisePropertyChanged(() => pd_manager);
            }
        }

        private int _found_date;
        /// <summary>
        /// 成立日期
        /// </summary>
        public int found_date
        {
            get { return _found_date; }

            set
            {
                _found_date = value;
                RaisePropertyChanged(() => found_date);
            }
        }

        private int _pd_type;
        /// <summary>
        /// 产品类型
        /// </summary>
        public int pd_type
        {
            get { return _pd_type; }

            set
            {
                _pd_type = value;
                RaisePropertyChanged(() => pd_type);
            }
        }

        private String _apply_currency;
        /// <summary>
        /// 募集币种
        /// </summary>
        public String apply_currency
        {
            get { return _apply_currency; }

            set
            {
                _apply_currency = value;
                RaisePropertyChanged(() => apply_currency);
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

        private double _first_asset;
        /// <summary>
        /// 原始资产
        /// </summary>
        public double first_asset
        {
            get { return _first_asset; }

            set
            {
                _first_asset = value;
                RaisePropertyChanged(() => first_asset);
            }
        }

        private double _first_amt;
        /// <summary>
        /// 原始金额
        /// </summary>
        public double first_amt
        {
            get { return _first_amt; }

            set
            {
                _first_amt = value;
                RaisePropertyChanged(() => first_amt);
            }
        }

        private double _pd_all_share;
        /// <summary>
        /// 产品总份额
        /// </summary>
        public double pd_all_share
        {
            get { return _pd_all_share; }

            set
            {
                _pd_all_share = value;
                RaisePropertyChanged(() => pd_all_share);
            }
        }

        private double _curr_share;
        /// <summary>
        /// 当前份额
        /// </summary>
        public double curr_share
        {
            get { return _curr_share; }

            set
            {
                _curr_share = value;
                RaisePropertyChanged(() => curr_share);
            }
        }

        private double _pre_share;
        /// <summary>
        /// 昨日份额
        /// </summary>
        public double pre_share
        {
            get { return _pre_share; }

            set
            {
                _pre_share = value;
                RaisePropertyChanged(() => pre_share);
            }
        }

        private double _his_max_per_nav;
        /// <summary>
        /// 历史最高单位净值
        /// </summary>
        public double his_max_per_nav
        {
            get { return _his_max_per_nav; }

            set
            {
                _his_max_per_nav = value;
                RaisePropertyChanged(() => his_max_per_nav);
            }
        }

        private double _pre_nav;
        /// <summary>
        /// 昨日净值
        /// </summary>
        public double pre_nav
        {
            get { return _pre_nav; }

            set
            {
                _pre_nav = value;
                RaisePropertyChanged(() => pre_nav);
            }
        }

        private String _coust_full_name;
        /// <summary>
        /// 境内托管人全名
        /// </summary>
        public String coust_full_name
        {
            get { return _coust_full_name; }

            set
            {
                _coust_full_name = value;
                RaisePropertyChanged(() => coust_full_name);
            }
        }

        private String _coust_acco;
        /// <summary>
        /// 境内托管账户
        /// </summary>
        public String coust_acco
        {
            get { return _coust_acco; }

            set
            {
                _coust_acco = value;
                RaisePropertyChanged(() => coust_acco);
            }
        }

        private String _coust_acco_name;
        /// <summary>
        /// 境内托管账户名
        /// </summary>
        public String coust_acco_name
        {
            get { return _coust_acco_name; }

            set
            {
                _coust_acco_name = value;
                RaisePropertyChanged(() => coust_acco_name);
            }
        }

        private double _warn_posi_value;
        /// <summary>
        /// 预警线
        /// </summary>
        public double warn_posi_value
        {
            get { return _warn_posi_value; }

            set
            {
                _warn_posi_value = value;
                RaisePropertyChanged(() => warn_posi_value);
            }
        }

        private double _close_posi_value;
        /// <summary>
        /// 平仓线
        /// </summary>
        public double close_posi_value
        {
            get { return _close_posi_value; }

            set
            {
                _close_posi_value = value;
                RaisePropertyChanged(() => close_posi_value);
            }
        }

        private double _target_posi_ratio;
        /// <summary>
        /// 目标仓位
        /// </summary>
        public double target_posi_ratio
        {
            get { return _target_posi_ratio; }

            set
            {
                _target_posi_ratio = value;
                RaisePropertyChanged(() => target_posi_ratio);
            }
        }

        private double _beta_coeffi;
        /// <summary>
        /// beta系数
        /// </summary>
        public double beta_coeffi
        {
            get { return _beta_coeffi; }

            set
            {
                _beta_coeffi = value;
                RaisePropertyChanged(() => beta_coeffi);
            }
        }

        private String _custom_pd_class;
        /// <summary>
        /// 自定义产品分类
        /// </summary>
        public String custom_pd_class
        {
            get { return _custom_pd_class; }

            set
            {
                _custom_pd_class = value;
                RaisePropertyChanged(() => custom_pd_class);
            }
        }

        private String _pd_status;
        /// <summary>
        /// 产品状态
        /// </summary>
        public String pd_status
        {
            get { return _pd_status; }

            set
            {
                _pd_status = value;
                RaisePropertyChanged(() => pd_status);
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

        private int _index_value;
        /// <summary>
        /// 索引值
        /// </summary>
        public int index_value
        {
            get { return _index_value; }

            set
            {
                _index_value = value;
                RaisePropertyChanged(() => index_value);
            }
        }
    }

    public class prodL_5_94_Info : ObservableObject
    {
    }

}
