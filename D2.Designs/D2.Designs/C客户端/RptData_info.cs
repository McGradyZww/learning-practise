using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class rptL_2_1_Info : ObservableObject
    {
    }

    public class rptL_2_2_Info : ObservableObject
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

        private double _risk_free_interest_rate;
        /// <summary>
        /// 无风险利率
        /// </summary>
        public double risk_free_interest_rate
        {
            get { return _risk_free_interest_rate; }

            set
            {
                _risk_free_interest_rate = value;
                RaisePropertyChanged(() => risk_free_interest_rate);
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

        private int _borker_no;
        /// <summary>
        /// 券商编号
        /// </summary>
        public int borker_no
        {
            get { return _borker_no; }

            set
            {
                _borker_no = value;
                RaisePropertyChanged(() => borker_no);
            }
        }

        private String _borker_name;
        /// <summary>
        /// 券商名称
        /// </summary>
        public String borker_name
        {
            get { return _borker_name; }

            set
            {
                _borker_name = value;
                RaisePropertyChanged(() => borker_name);
            }
        }

        private double _commis_ratio;
        /// <summary>
        /// 佣金费率
        /// </summary>
        public double commis_ratio
        {
            get { return _commis_ratio; }

            set
            {
                _commis_ratio = value;
                RaisePropertyChanged(() => commis_ratio);
            }
        }

        private int _broker_my_type;
        /// <summary>
        /// 券商自主类型
        /// </summary>
        public int broker_my_type
        {
            get { return _broker_my_type; }

            set
            {
                _broker_my_type = value;
                RaisePropertyChanged(() => broker_my_type);
            }
        }
    }

    public class rptL_2_3_Info : ObservableObject
    {
    }

    public class rptL_2_4_Info : ObservableObject
    {
    }

    public class rptL_2_5_Info : ObservableObject
    {
    }

    public class rptL_2_6_Info : ObservableObject
    {
    }

    public class rptL_2_7_Info : ObservableObject
    {
    }

    public class rptL_2_8_Info : ObservableObject
    {
    }

    public class rptL_2_9_Info : ObservableObject
    {
    }

    public class rptL_2_10_Info : ObservableObject
    {
    }

    public class rptL_2_11_Info : ObservableObject
    {
    }

    public class rptL_2_12_Info : ObservableObject
    {
    }

    public class rptL_2_13_Info : ObservableObject
    {
    }

    public class rptL_2_14_Info : ObservableObject
    {
    }

    public class rptL_2_15_Info : ObservableObject
    {
    }

    public class rptL_2_16_Info : ObservableObject
    {
    }

    public class rptL_2_17_Info : ObservableObject
    {
    }

    public class rptL_2_18_Info : ObservableObject
    {
    }

    public class rptL_2_19_Info : ObservableObject
    {
    }

    public class rptL_2_21_Info : ObservableObject
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

        private int _industry_id;
        /// <summary>
        /// 行业编号
        /// </summary>
        public int industry_id
        {
            get { return _industry_id; }

            set
            {
                _industry_id = value;
                RaisePropertyChanged(() => industry_id);
            }
        }

        private String _industry_code;
        /// <summary>
        /// 行业代码
        /// </summary>
        public String industry_code
        {
            get { return _industry_code; }

            set
            {
                _industry_code = value;
                RaisePropertyChanged(() => industry_code);
            }
        }

        private String _indu_name;
        /// <summary>
        /// 行业名称
        /// </summary>
        public String indu_name
        {
            get { return _indu_name; }

            set
            {
                _indu_name = value;
                RaisePropertyChanged(() => indu_name);
            }
        }

        private int _industry_classification;
        /// <summary>
        /// 行业级别
        /// </summary>
        public int industry_classification
        {
            get { return _industry_classification; }

            set
            {
                _industry_classification = value;
                RaisePropertyChanged(() => industry_classification);
            }
        }

        private int _parent_industry_id;
        /// <summary>
        /// 上级行业编号
        /// </summary>
        public int parent_industry_id
        {
            get { return _parent_industry_id; }

            set
            {
                _parent_industry_id = value;
                RaisePropertyChanged(() => parent_industry_id);
            }
        }

        private int _industry_std;
        /// <summary>
        /// 行业标准
        /// </summary>
        public int industry_std
        {
            get { return _industry_std; }

            set
            {
                _industry_std = value;
                RaisePropertyChanged(() => industry_std);
            }
        }

        private String _first_indu_code;
        /// <summary>
        /// 一级行业代码
        /// </summary>
        public String first_indu_code
        {
            get { return _first_indu_code; }

            set
            {
                _first_indu_code = value;
                RaisePropertyChanged(() => first_indu_code);
            }
        }

        private String _first_industry_name;
        /// <summary>
        /// 一级行业名称
        /// </summary>
        public String first_industry_name
        {
            get { return _first_industry_name; }

            set
            {
                _first_industry_name = value;
                RaisePropertyChanged(() => first_industry_name);
            }
        }

        private String _second_industry_code;
        /// <summary>
        /// 二级行业代码
        /// </summary>
        public String second_industry_code
        {
            get { return _second_industry_code; }

            set
            {
                _second_industry_code = value;
                RaisePropertyChanged(() => second_industry_code);
            }
        }

        private String _second_industry_name;
        /// <summary>
        /// 二级行业名称
        /// </summary>
        public String second_industry_name
        {
            get { return _second_industry_name; }

            set
            {
                _second_industry_name = value;
                RaisePropertyChanged(() => second_industry_name);
            }
        }

        private String _third_industry_code;
        /// <summary>
        /// 三级行业代码
        /// </summary>
        public String third_industry_code
        {
            get { return _third_industry_code; }

            set
            {
                _third_industry_code = value;
                RaisePropertyChanged(() => third_industry_code);
            }
        }

        private String _third_industry_name;
        /// <summary>
        /// 三级行业名称
        /// </summary>
        public String third_industry_name
        {
            get { return _third_industry_name; }

            set
            {
                _third_industry_name = value;
                RaisePropertyChanged(() => third_industry_name);
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

    public class rptL_2_22_Info : ObservableObject
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no
        {
            get { return _stock_code_no; }

            set
            {
                _stock_code_no = value;
                RaisePropertyChanged(() => stock_code_no);
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private int _stock_type;
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type
        {
            get { return _stock_type; }

            set
            {
                _stock_type = value;
                RaisePropertyChanged(() => stock_type);
            }
        }

        private int _asset_type;
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type
        {
            get { return _asset_type; }

            set
            {
                _asset_type = value;
                RaisePropertyChanged(() => asset_type);
            }
        }

        private int _industry_std;
        /// <summary>
        /// 行业标准
        /// </summary>
        public int industry_std
        {
            get { return _industry_std; }

            set
            {
                _industry_std = value;
                RaisePropertyChanged(() => industry_std);
            }
        }

        private int _industry_id;
        /// <summary>
        /// 行业编号
        /// </summary>
        public int industry_id
        {
            get { return _industry_id; }

            set
            {
                _industry_id = value;
                RaisePropertyChanged(() => industry_id);
            }
        }

        private String _industry_code;
        /// <summary>
        /// 行业代码
        /// </summary>
        public String industry_code
        {
            get { return _industry_code; }

            set
            {
                _industry_code = value;
                RaisePropertyChanged(() => industry_code);
            }
        }

        private String _indu_name;
        /// <summary>
        /// 行业名称
        /// </summary>
        public String indu_name
        {
            get { return _indu_name; }

            set
            {
                _indu_name = value;
                RaisePropertyChanged(() => indu_name);
            }
        }

        private String _first_indu_code;
        /// <summary>
        /// 一级行业代码
        /// </summary>
        public String first_indu_code
        {
            get { return _first_indu_code; }

            set
            {
                _first_indu_code = value;
                RaisePropertyChanged(() => first_indu_code);
            }
        }

        private String _first_industry_name;
        /// <summary>
        /// 一级行业名称
        /// </summary>
        public String first_industry_name
        {
            get { return _first_industry_name; }

            set
            {
                _first_industry_name = value;
                RaisePropertyChanged(() => first_industry_name);
            }
        }

        private String _second_industry_code;
        /// <summary>
        /// 二级行业代码
        /// </summary>
        public String second_industry_code
        {
            get { return _second_industry_code; }

            set
            {
                _second_industry_code = value;
                RaisePropertyChanged(() => second_industry_code);
            }
        }

        private String _second_industry_name;
        /// <summary>
        /// 二级行业名称
        /// </summary>
        public String second_industry_name
        {
            get { return _second_industry_name; }

            set
            {
                _second_industry_name = value;
                RaisePropertyChanged(() => second_industry_name);
            }
        }

        private String _third_industry_code;
        /// <summary>
        /// 三级行业代码
        /// </summary>
        public String third_industry_code
        {
            get { return _third_industry_code; }

            set
            {
                _third_industry_code = value;
                RaisePropertyChanged(() => third_industry_code);
            }
        }

        private String _third_industry_name;
        /// <summary>
        /// 三级行业名称
        /// </summary>
        public String third_industry_name
        {
            get { return _third_industry_name; }

            set
            {
                _third_industry_name = value;
                RaisePropertyChanged(() => third_industry_name);
            }
        }

        private String _fourth_industry_code;
        /// <summary>
        /// 四级行业代码
        /// </summary>
        public String fourth_industry_code
        {
            get { return _fourth_industry_code; }

            set
            {
                _fourth_industry_code = value;
                RaisePropertyChanged(() => fourth_industry_code);
            }
        }

        private String _fourth_industry_name;
        /// <summary>
        /// 四级行业名称
        /// </summary>
        public String fourth_industry_name
        {
            get { return _fourth_industry_name; }

            set
            {
                _fourth_industry_name = value;
                RaisePropertyChanged(() => fourth_industry_name);
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

    public class rptL_2_50_Info : ObservableObject
    {

        private String _task_strike_status;
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status
        {
            get { return _task_strike_status; }

            set
            {
                _task_strike_status = value;
                RaisePropertyChanged(() => task_strike_status);
            }
        }
    }

    public class rptL_2_51_Info : ObservableObject
    {
    }

    public class rptL_2_52_Info : ObservableObject
    {
    }

    public class rptL_2_53_Info : ObservableObject
    {
    }

    public class rptL_2_54_Info : ObservableObject
    {
    }

    public class rptL_2_55_Info : ObservableObject
    {
    }

    public class rptL_2_56_Info : ObservableObject
    {
    }

    public class rptL_2_61_Info : ObservableObject
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

        private int _def_asset_type;
        /// <summary>
        /// 资产定义类型
        /// </summary>
        public int def_asset_type
        {
            get { return _def_asset_type; }

            set
            {
                _def_asset_type = value;
                RaisePropertyChanged(() => def_asset_type);
            }
        }

        private String _def_asset_type_no;
        /// <summary>
        /// 资产定义类型编码
        /// </summary>
        public String def_asset_type_no
        {
            get { return _def_asset_type_no; }

            set
            {
                _def_asset_type_no = value;
                RaisePropertyChanged(() => def_asset_type_no);
            }
        }

        private String _def_asset_name;
        /// <summary>
        /// 资产定义类型名称
        /// </summary>
        public String def_asset_name
        {
            get { return _def_asset_name; }

            set
            {
                _def_asset_name = value;
                RaisePropertyChanged(() => def_asset_name);
            }
        }

        private int _parent_def_asset_type;
        /// <summary>
        /// 父资产定义类型
        /// </summary>
        public int parent_def_asset_type
        {
            get { return _parent_def_asset_type; }

            set
            {
                _parent_def_asset_type = value;
                RaisePropertyChanged(() => parent_def_asset_type);
            }
        }

        private int _def_type;
        /// <summary>
        /// 定义类型
        /// </summary>
        public int def_type
        {
            get { return _def_type; }

            set
            {
                _def_type = value;
                RaisePropertyChanged(() => def_type);
            }
        }

        private int _show_order;
        /// <summary>
        /// 显示顺序
        /// </summary>
        public int show_order
        {
            get { return _show_order; }

            set
            {
                _show_order = value;
                RaisePropertyChanged(() => show_order);
            }
        }

        private int _calc_type;
        /// <summary>
        /// 计算类型
        /// </summary>
        public int calc_type
        {
            get { return _calc_type; }

            set
            {
                _calc_type = value;
                RaisePropertyChanged(() => calc_type);
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

    public class rptL_2_62_Info : ObservableObject
    {
    }

    public class rptL_2_63_Info : ObservableObject
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

        private int _def_asset_type;
        /// <summary>
        /// 资产定义类型
        /// </summary>
        public int def_asset_type
        {
            get { return _def_asset_type; }

            set
            {
                _def_asset_type = value;
                RaisePropertyChanged(() => def_asset_type);
            }
        }

        private String _def_asset_name;
        /// <summary>
        /// 资产定义类型名称
        /// </summary>
        public String def_asset_name
        {
            get { return _def_asset_name; }

            set
            {
                _def_asset_name = value;
                RaisePropertyChanged(() => def_asset_name);
            }
        }

        private int _def_asset_field;
        /// <summary>
        /// 资产定义字段
        /// </summary>
        public int def_asset_field
        {
            get { return _def_asset_field; }

            set
            {
                _def_asset_field = value;
                RaisePropertyChanged(() => def_asset_field);
            }
        }

        private double _asset_value;
        /// <summary>
        /// 资产值
        /// </summary>
        public double asset_value
        {
            get { return _asset_value; }

            set
            {
                _asset_value = value;
                RaisePropertyChanged(() => asset_value);
            }
        }
    }

    public class rptL_2_64_Info : ObservableObject
    {
    }

    public class rptL_2_65_Info : ObservableObject
    {
    }

    public class rptL_2_66_Info : ObservableObject
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

        private String _dbgrid_x_field;
        /// <summary>
        /// 表格X轴字段
        /// </summary>
        public String dbgrid_x_field
        {
            get { return _dbgrid_x_field; }

            set
            {
                _dbgrid_x_field = value;
                RaisePropertyChanged(() => dbgrid_x_field);
            }
        }

        private int _dbgrid_x_field_no;
        /// <summary>
        /// 表格X轴字段编号
        /// </summary>
        public int dbgrid_x_field_no
        {
            get { return _dbgrid_x_field_no; }

            set
            {
                _dbgrid_x_field_no = value;
                RaisePropertyChanged(() => dbgrid_x_field_no);
            }
        }

        private String _dbgrid_x_field_name;
        /// <summary>
        /// 表格X轴字段名称
        /// </summary>
        public String dbgrid_x_field_name
        {
            get { return _dbgrid_x_field_name; }

            set
            {
                _dbgrid_x_field_name = value;
                RaisePropertyChanged(() => dbgrid_x_field_name);
            }
        }

        private int _def_type;
        /// <summary>
        /// 定义类型
        /// </summary>
        public int def_type
        {
            get { return _def_type; }

            set
            {
                _def_type = value;
                RaisePropertyChanged(() => def_type);
            }
        }
    }

    public class rptL_2_67_Info : ObservableObject
    {
    }

    public class rptL_2_68_Info : ObservableObject
    {

        private String _ip_addr;
        /// <summary>
        /// IP地址
        /// </summary>
        public String ip_addr
        {
            get { return _ip_addr; }

            set
            {
                _ip_addr = value;
                RaisePropertyChanged(() => ip_addr);
            }
        }

        private String _ip_port;
        /// <summary>
        /// IP端口
        /// </summary>
        public String ip_port
        {
            get { return _ip_port; }

            set
            {
                _ip_port = value;
                RaisePropertyChanged(() => ip_port);
            }
        }

        private String _user_name;
        /// <summary>
        /// 用户名
        /// </summary>
        public String user_name
        {
            get { return _user_name; }

            set
            {
                _user_name = value;
                RaisePropertyChanged(() => user_name);
            }
        }

        private String _user_password;
        /// <summary>
        /// 用户密码
        /// </summary>
        public String user_password
        {
            get { return _user_password; }

            set
            {
                _user_password = value;
                RaisePropertyChanged(() => user_password);
            }
        }

        private int _cmd_id;
        /// <summary>
        /// 命令编号
        /// </summary>
        public int cmd_id
        {
            get { return _cmd_id; }

            set
            {
                _cmd_id = value;
                RaisePropertyChanged(() => cmd_id);
            }
        }

        private int _cmd_type;
        /// <summary>
        /// 命令类型
        /// </summary>
        public int cmd_type
        {
            get { return _cmd_type; }

            set
            {
                _cmd_type = value;
                RaisePropertyChanged(() => cmd_type);
            }
        }

        private String _cmd_content;
        /// <summary>
        /// 命令内容
        /// </summary>
        public String cmd_content
        {
            get { return _cmd_content; }

            set
            {
                _cmd_content = value;
                RaisePropertyChanged(() => cmd_content);
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

    public class rptL_2_69_Info : ObservableObject
    {

        private int _sync_no;
        /// <summary>
        /// 同步编号
        /// </summary>
        public int sync_no
        {
            get { return _sync_no; }

            set
            {
                _sync_no = value;
                RaisePropertyChanged(() => sync_no);
            }
        }

        private String _sync_name;
        /// <summary>
        /// 同步名称
        /// </summary>
        public String sync_name
        {
            get { return _sync_name; }

            set
            {
                _sync_name = value;
                RaisePropertyChanged(() => sync_name);
            }
        }

        private String _target_db_name;
        /// <summary>
        /// 目标数据库名称
        /// </summary>
        public String target_db_name
        {
            get { return _target_db_name; }

            set
            {
                _target_db_name = value;
                RaisePropertyChanged(() => target_db_name);
            }
        }

        private String _target_table_name;
        /// <summary>
        /// 目标数据表名称
        /// </summary>
        public String target_table_name
        {
            get { return _target_table_name; }

            set
            {
                _target_table_name = value;
                RaisePropertyChanged(() => target_table_name);
            }
        }

        private String _source_db_name;
        /// <summary>
        /// 源数据库名称
        /// </summary>
        public String source_db_name
        {
            get { return _source_db_name; }

            set
            {
                _source_db_name = value;
                RaisePropertyChanged(() => source_db_name);
            }
        }

        private String _source_table_name;
        /// <summary>
        /// 源数据表名称
        /// </summary>
        public String source_table_name
        {
            get { return _source_table_name; }

            set
            {
                _source_table_name = value;
                RaisePropertyChanged(() => source_table_name);
            }
        }

        private String _src_last_update_time;
        /// <summary>
        /// 源表最后更新时间
        /// </summary>
        public String src_last_update_time
        {
            get { return _src_last_update_time; }

            set
            {
                _src_last_update_time = value;
                RaisePropertyChanged(() => src_last_update_time);
            }
        }

        private int _src_max_updatetimes;
        /// <summary>
        /// 源表最大更新次数
        /// </summary>
        public int src_max_updatetimes
        {
            get { return _src_max_updatetimes; }

            set
            {
                _src_max_updatetimes = value;
                RaisePropertyChanged(() => src_max_updatetimes);
            }
        }

        private int _src_table_rows;
        /// <summary>
        /// 源表数据行数
        /// </summary>
        public int src_table_rows
        {
            get { return _src_table_rows; }

            set
            {
                _src_table_rows = value;
                RaisePropertyChanged(() => src_table_rows);
            }
        }

        private String _tgt_last_update_time;
        /// <summary>
        /// 目标表最后更新时间
        /// </summary>
        public String tgt_last_update_time
        {
            get { return _tgt_last_update_time; }

            set
            {
                _tgt_last_update_time = value;
                RaisePropertyChanged(() => tgt_last_update_time);
            }
        }

        private int _tgt_max_updatetimes;
        /// <summary>
        /// 目标表最大更新次数
        /// </summary>
        public int tgt_max_updatetimes
        {
            get { return _tgt_max_updatetimes; }

            set
            {
                _tgt_max_updatetimes = value;
                RaisePropertyChanged(() => tgt_max_updatetimes);
            }
        }

        private int _tgt_table_rows;
        /// <summary>
        /// 目标表数据行数
        /// </summary>
        public int tgt_table_rows
        {
            get { return _tgt_table_rows; }

            set
            {
                _tgt_table_rows = value;
                RaisePropertyChanged(() => tgt_table_rows);
            }
        }

        private int _sync_type;
        /// <summary>
        /// 同步类型
        /// </summary>
        public int sync_type
        {
            get { return _sync_type; }

            set
            {
                _sync_type = value;
                RaisePropertyChanged(() => sync_type);
            }
        }

        private int _sync_status;
        /// <summary>
        /// 同步状态
        /// </summary>
        public int sync_status
        {
            get { return _sync_status; }

            set
            {
                _sync_status = value;
                RaisePropertyChanged(() => sync_status);
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

        private int _begin_date;
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _begin_time;
        /// <summary>
        /// 开始时间
        /// </summary>
        public int begin_time
        {
            get { return _begin_time; }

            set
            {
                _begin_time = value;
                RaisePropertyChanged(() => begin_time);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
            }
        }

        private int _end_time;
        /// <summary>
        /// 结束时间
        /// </summary>
        public int end_time
        {
            get { return _end_time; }

            set
            {
                _end_time = value;
                RaisePropertyChanged(() => end_time);
            }
        }

        private int _deal_count;
        /// <summary>
        /// 处理次数
        /// </summary>
        public int deal_count
        {
            get { return _deal_count; }

            set
            {
                _deal_count = value;
                RaisePropertyChanged(() => deal_count);
            }
        }
    }

    public class rptL_2_100_Info : ObservableObject
    {
    }

    public class rptL_2_101_Info : ObservableObject
    {
    }

    public class rptL_2_151_Info : ObservableObject
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

        private int _curr_month;
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month
        {
            get { return _curr_month; }

            set
            {
                _curr_month = value;
                RaisePropertyChanged(() => curr_month);
            }
        }

        private int _region_type;
        /// <summary>
        /// 区间类型
        /// </summary>
        public int region_type
        {
            get { return _region_type; }

            set
            {
                _region_type = value;
                RaisePropertyChanged(() => region_type);
            }
        }

        private String _region_type_name;
        /// <summary>
        /// 区间类型名称
        /// </summary>
        public String region_type_name
        {
            get { return _region_type_name; }

            set
            {
                _region_type_name = value;
                RaisePropertyChanged(() => region_type_name);
            }
        }

        private int _begin_date;
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
            }
        }

        private int _stat_days;
        /// <summary>
        /// 统计天数
        /// </summary>
        public int stat_days
        {
            get { return _stat_days; }

            set
            {
                _stat_days = value;
                RaisePropertyChanged(() => stat_days);
            }
        }

        private int _rise_days;
        /// <summary>
        /// 上涨天数
        /// </summary>
        public int rise_days
        {
            get { return _rise_days; }

            set
            {
                _rise_days = value;
                RaisePropertyChanged(() => rise_days);
            }
        }

        private int _fall_days;
        /// <summary>
        /// 下跌天数
        /// </summary>
        public int fall_days
        {
            get { return _fall_days; }

            set
            {
                _fall_days = value;
                RaisePropertyChanged(() => fall_days);
            }
        }

        private int _max_cont_rise_days;
        /// <summary>
        /// 最大连续上涨天数
        /// </summary>
        public int max_cont_rise_days
        {
            get { return _max_cont_rise_days; }

            set
            {
                _max_cont_rise_days = value;
                RaisePropertyChanged(() => max_cont_rise_days);
            }
        }

        private int _max_cont_fall_days;
        /// <summary>
        /// 最大连续下跌天数
        /// </summary>
        public int max_cont_fall_days
        {
            get { return _max_cont_fall_days; }

            set
            {
                _max_cont_fall_days = value;
                RaisePropertyChanged(() => max_cont_fall_days);
            }
        }

        private double _day_win_ratio;
        /// <summary>
        /// 日胜率
        /// </summary>
        public double day_win_ratio
        {
            get { return _day_win_ratio; }

            set
            {
                _day_win_ratio = value;
                RaisePropertyChanged(() => day_win_ratio);
            }
        }

        private int _week_cnt;
        /// <summary>
        /// 统计周数
        /// </summary>
        public int week_cnt
        {
            get { return _week_cnt; }

            set
            {
                _week_cnt = value;
                RaisePropertyChanged(() => week_cnt);
            }
        }

        private int _rise_weeks;
        /// <summary>
        /// 上涨周数
        /// </summary>
        public int rise_weeks
        {
            get { return _rise_weeks; }

            set
            {
                _rise_weeks = value;
                RaisePropertyChanged(() => rise_weeks);
            }
        }

        private int _fall_weeks;
        /// <summary>
        /// 下跌周数
        /// </summary>
        public int fall_weeks
        {
            get { return _fall_weeks; }

            set
            {
                _fall_weeks = value;
                RaisePropertyChanged(() => fall_weeks);
            }
        }

        private double _week_win_ratio;
        /// <summary>
        /// 周胜率
        /// </summary>
        public double week_win_ratio
        {
            get { return _week_win_ratio; }

            set
            {
                _week_win_ratio = value;
                RaisePropertyChanged(() => week_win_ratio);
            }
        }

        private double _begin_share_net_total;
        /// <summary>
        /// 期初份额累计净值
        /// </summary>
        public double begin_share_net_total
        {
            get { return _begin_share_net_total; }

            set
            {
                _begin_share_net_total = value;
                RaisePropertyChanged(() => begin_share_net_total);
            }
        }

        private double _end_share_net_total;
        /// <summary>
        /// 期末份额累计净值
        /// </summary>
        public double end_share_net_total
        {
            get { return _end_share_net_total; }

            set
            {
                _end_share_net_total = value;
                RaisePropertyChanged(() => end_share_net_total);
            }
        }
    }

    public class rptL_2_152_Info : ObservableObject
    {
    }

    public class rptL_2_153_Info : ObservableObject
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

        private int _curr_month;
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month
        {
            get { return _curr_month; }

            set
            {
                _curr_month = value;
                RaisePropertyChanged(() => curr_month);
            }
        }

        private int _region_type;
        /// <summary>
        /// 区间类型
        /// </summary>
        public int region_type
        {
            get { return _region_type; }

            set
            {
                _region_type = value;
                RaisePropertyChanged(() => region_type);
            }
        }

        private String _region_type_name;
        /// <summary>
        /// 区间类型名称
        /// </summary>
        public String region_type_name
        {
            get { return _region_type_name; }

            set
            {
                _region_type_name = value;
                RaisePropertyChanged(() => region_type_name);
            }
        }

        private int _begin_date;
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
            }
        }

        private int _stat_days;
        /// <summary>
        /// 统计天数
        /// </summary>
        public int stat_days
        {
            get { return _stat_days; }

            set
            {
                _stat_days = value;
                RaisePropertyChanged(() => stat_days);
            }
        }

        private int _rise_days;
        /// <summary>
        /// 上涨天数
        /// </summary>
        public int rise_days
        {
            get { return _rise_days; }

            set
            {
                _rise_days = value;
                RaisePropertyChanged(() => rise_days);
            }
        }

        private int _fall_days;
        /// <summary>
        /// 下跌天数
        /// </summary>
        public int fall_days
        {
            get { return _fall_days; }

            set
            {
                _fall_days = value;
                RaisePropertyChanged(() => fall_days);
            }
        }

        private int _max_cont_rise_days;
        /// <summary>
        /// 最大连续上涨天数
        /// </summary>
        public int max_cont_rise_days
        {
            get { return _max_cont_rise_days; }

            set
            {
                _max_cont_rise_days = value;
                RaisePropertyChanged(() => max_cont_rise_days);
            }
        }

        private int _max_cont_fall_days;
        /// <summary>
        /// 最大连续下跌天数
        /// </summary>
        public int max_cont_fall_days
        {
            get { return _max_cont_fall_days; }

            set
            {
                _max_cont_fall_days = value;
                RaisePropertyChanged(() => max_cont_fall_days);
            }
        }

        private double _day_win_ratio;
        /// <summary>
        /// 日胜率
        /// </summary>
        public double day_win_ratio
        {
            get { return _day_win_ratio; }

            set
            {
                _day_win_ratio = value;
                RaisePropertyChanged(() => day_win_ratio);
            }
        }

        private int _week_cnt;
        /// <summary>
        /// 统计周数
        /// </summary>
        public int week_cnt
        {
            get { return _week_cnt; }

            set
            {
                _week_cnt = value;
                RaisePropertyChanged(() => week_cnt);
            }
        }

        private int _rise_weeks;
        /// <summary>
        /// 上涨周数
        /// </summary>
        public int rise_weeks
        {
            get { return _rise_weeks; }

            set
            {
                _rise_weeks = value;
                RaisePropertyChanged(() => rise_weeks);
            }
        }

        private int _fall_weeks;
        /// <summary>
        /// 下跌周数
        /// </summary>
        public int fall_weeks
        {
            get { return _fall_weeks; }

            set
            {
                _fall_weeks = value;
                RaisePropertyChanged(() => fall_weeks);
            }
        }

        private double _week_win_ratio;
        /// <summary>
        /// 周胜率
        /// </summary>
        public double week_win_ratio
        {
            get { return _week_win_ratio; }

            set
            {
                _week_win_ratio = value;
                RaisePropertyChanged(() => week_win_ratio);
            }
        }

        private double _begin_share_net_total;
        /// <summary>
        /// 期初份额累计净值
        /// </summary>
        public double begin_share_net_total
        {
            get { return _begin_share_net_total; }

            set
            {
                _begin_share_net_total = value;
                RaisePropertyChanged(() => begin_share_net_total);
            }
        }

        private double _end_share_net_total;
        /// <summary>
        /// 期末份额累计净值
        /// </summary>
        public double end_share_net_total
        {
            get { return _end_share_net_total; }

            set
            {
                _end_share_net_total = value;
                RaisePropertyChanged(() => end_share_net_total);
            }
        }
    }

    public class rptL_2_154_Info : ObservableObject
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

        private int _curr_month;
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month
        {
            get { return _curr_month; }

            set
            {
                _curr_month = value;
                RaisePropertyChanged(() => curr_month);
            }
        }

        private int _region_type;
        /// <summary>
        /// 区间类型
        /// </summary>
        public int region_type
        {
            get { return _region_type; }

            set
            {
                _region_type = value;
                RaisePropertyChanged(() => region_type);
            }
        }

        private String _region_type_name;
        /// <summary>
        /// 区间类型名称
        /// </summary>
        public String region_type_name
        {
            get { return _region_type_name; }

            set
            {
                _region_type_name = value;
                RaisePropertyChanged(() => region_type_name);
            }
        }

        private int _begin_date;
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
            }
        }

        private int _indicator_id;
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id
        {
            get { return _indicator_id; }

            set
            {
                _indicator_id = value;
                RaisePropertyChanged(() => indicator_id);
            }
        }

        private String _indicator_name;
        /// <summary>
        /// 指标名称
        /// </summary>
        public String indicator_name
        {
            get { return _indicator_name; }

            set
            {
                _indicator_name = value;
                RaisePropertyChanged(() => indicator_name);
            }
        }

        private double _indicator_value;
        /// <summary>
        /// 指标值
        /// </summary>
        public double indicator_value
        {
            get { return _indicator_value; }

            set
            {
                _indicator_value = value;
                RaisePropertyChanged(() => indicator_value);
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

    public class rptL_2_155_Info : ObservableObject
    {
    }

    public class rptL_2_156_Info : ObservableObject
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

        private int _curr_month;
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month
        {
            get { return _curr_month; }

            set
            {
                _curr_month = value;
                RaisePropertyChanged(() => curr_month);
            }
        }

        private int _region_type;
        /// <summary>
        /// 区间类型
        /// </summary>
        public int region_type
        {
            get { return _region_type; }

            set
            {
                _region_type = value;
                RaisePropertyChanged(() => region_type);
            }
        }

        private String _region_type_name;
        /// <summary>
        /// 区间类型名称
        /// </summary>
        public String region_type_name
        {
            get { return _region_type_name; }

            set
            {
                _region_type_name = value;
                RaisePropertyChanged(() => region_type_name);
            }
        }

        private int _begin_date;
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
            }
        }

        private int _indicator_id;
        /// <summary>
        /// 指标编号
        /// </summary>
        public int indicator_id
        {
            get { return _indicator_id; }

            set
            {
                _indicator_id = value;
                RaisePropertyChanged(() => indicator_id);
            }
        }

        private String _indicator_name;
        /// <summary>
        /// 指标名称
        /// </summary>
        public String indicator_name
        {
            get { return _indicator_name; }

            set
            {
                _indicator_name = value;
                RaisePropertyChanged(() => indicator_name);
            }
        }

        private double _indicator_value;
        /// <summary>
        /// 指标值
        /// </summary>
        public double indicator_value
        {
            get { return _indicator_value; }

            set
            {
                _indicator_value = value;
                RaisePropertyChanged(() => indicator_value);
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

        private int _achi_compa_crite;
        /// <summary>
        /// 业绩比较基准
        /// </summary>
        public int achi_compa_crite
        {
            get { return _achi_compa_crite; }

            set
            {
                _achi_compa_crite = value;
                RaisePropertyChanged(() => achi_compa_crite);
            }
        }

        private double _achi_crite_value;
        /// <summary>
        /// 业绩基准值
        /// </summary>
        public double achi_crite_value
        {
            get { return _achi_crite_value; }

            set
            {
                _achi_crite_value = value;
                RaisePropertyChanged(() => achi_crite_value);
            }
        }

        private double _cmp_value;
        /// <summary>
        /// 比较值
        /// </summary>
        public double cmp_value
        {
            get { return _cmp_value; }

            set
            {
                _cmp_value = value;
                RaisePropertyChanged(() => cmp_value);
            }
        }

        private String _indicator_memo;
        /// <summary>
        /// 指标说明
        /// </summary>
        public String indicator_memo
        {
            get { return _indicator_memo; }

            set
            {
                _indicator_memo = value;
                RaisePropertyChanged(() => indicator_memo);
            }
        }
    }

    public class rptL_2_157_Info : ObservableObject
    {
    }

    public class rptL_2_158_Info : ObservableObject
    {
    }

    public class rptL_2_159_Info : ObservableObject
    {
    }

    public class rptL_2_160_Info : ObservableObject
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

        private double _share_net;
        /// <summary>
        /// 份额净值
        /// </summary>
        public double share_net
        {
            get { return _share_net; }

            set
            {
                _share_net = value;
                RaisePropertyChanged(() => share_net);
            }
        }

        private double _last_share_net;
        /// <summary>
        /// 上一份额净值
        /// </summary>
        public double last_share_net
        {
            get { return _last_share_net; }

            set
            {
                _last_share_net = value;
                RaisePropertyChanged(() => last_share_net);
            }
        }

        private double _share_net_total;
        /// <summary>
        /// 份额累计净值
        /// </summary>
        public double share_net_total
        {
            get { return _share_net_total; }

            set
            {
                _share_net_total = value;
                RaisePropertyChanged(() => share_net_total);
            }
        }

        private double _pre_share_net_total;
        /// <summary>
        /// 昨日份额累计净值
        /// </summary>
        public double pre_share_net_total
        {
            get { return _pre_share_net_total; }

            set
            {
                _pre_share_net_total = value;
                RaisePropertyChanged(() => pre_share_net_total);
            }
        }

        private double _net_change;
        /// <summary>
        /// 净值变化
        /// </summary>
        public double net_change
        {
            get { return _net_change; }

            set
            {
                _net_change = value;
                RaisePropertyChanged(() => net_change);
            }
        }

        private double _net_growth_rate;
        /// <summary>
        /// 净值增长率
        /// </summary>
        public double net_growth_rate
        {
            get { return _net_growth_rate; }

            set
            {
                _net_growth_rate = value;
                RaisePropertyChanged(() => net_growth_rate);
            }
        }

        private ulong _grp_row;
        /// <summary>
        /// 分组序号
        /// </summary>
        public ulong grp_row
        {
            get { return _grp_row; }

            set
            {
                _grp_row = value;
                RaisePropertyChanged(() => grp_row);
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

        private double _asset_market_value;
        /// <summary>
        /// 资产市值
        /// </summary>
        public double asset_market_value
        {
            get { return _asset_market_value; }

            set
            {
                _asset_market_value = value;
                RaisePropertyChanged(() => asset_market_value);
            }
        }

        private double _fund_share_total;
        /// <summary>
        /// 基金份额总额
        /// </summary>
        public double fund_share_total
        {
            get { return _fund_share_total; }

            set
            {
                _fund_share_total = value;
                RaisePropertyChanged(() => fund_share_total);
            }
        }

        private double _fund_asset_net;
        /// <summary>
        /// 基金资产净值
        /// </summary>
        public double fund_asset_net
        {
            get { return _fund_asset_net; }

            set
            {
                _fund_asset_net = value;
                RaisePropertyChanged(() => fund_asset_net);
            }
        }

        private double _pd_nav_day_ratio;
        /// <summary>
        /// 日净值增长率
        /// </summary>
        public double pd_nav_day_ratio
        {
            get { return _pd_nav_day_ratio; }

            set
            {
                _pd_nav_day_ratio = value;
                RaisePropertyChanged(() => pd_nav_day_ratio);
            }
        }

        private double _pd_nav_month_ratio;
        /// <summary>
        /// 月净值增长率
        /// </summary>
        public double pd_nav_month_ratio
        {
            get { return _pd_nav_month_ratio; }

            set
            {
                _pd_nav_month_ratio = value;
                RaisePropertyChanged(() => pd_nav_month_ratio);
            }
        }

        private double _total_realiz_pandl_ratio;
        /// <summary>
        /// 累计收益率
        /// </summary>
        public double total_realiz_pandl_ratio
        {
            get { return _total_realiz_pandl_ratio; }

            set
            {
                _total_realiz_pandl_ratio = value;
                RaisePropertyChanged(() => total_realiz_pandl_ratio);
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

        private double _post_fee_share_net_total;
        /// <summary>
        /// 费后累计净值
        /// </summary>
        public double post_fee_share_net_total
        {
            get { return _post_fee_share_net_total; }

            set
            {
                _post_fee_share_net_total = value;
                RaisePropertyChanged(() => post_fee_share_net_total);
            }
        }

        private double _achieve_performance;
        /// <summary>
        /// 业绩报酬
        /// </summary>
        public double achieve_performance
        {
            get { return _achieve_performance; }

            set
            {
                _achieve_performance = value;
                RaisePropertyChanged(() => achieve_performance);
            }
        }

        private double _recover_param;
        /// <summary>
        /// 复权系数
        /// </summary>
        public double recover_param
        {
            get { return _recover_param; }

            set
            {
                _recover_param = value;
                RaisePropertyChanged(() => recover_param);
            }
        }

        private int _last_init_date;
        /// <summary>
        /// 上日初始化日期
        /// </summary>
        public int last_init_date
        {
            get { return _last_init_date; }

            set
            {
                _last_init_date = value;
                RaisePropertyChanged(() => last_init_date);
            }
        }
    }

    public class rptL_2_161_Info : ObservableObject
    {
    }

    public class rptL_2_162_Info : ObservableObject
    {
    }

    public class rptL_2_163_Info : ObservableObject
    {
    }

    public class rptL_2_164_Info : ObservableObject
    {
    }

    public class rptL_2_165_Info : ObservableObject
    {
    }

    public class rptL_2_166_Info : ObservableObject
    {
    }

    public class rptL_2_181_Info : ObservableObject
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

        private double _share_net;
        /// <summary>
        /// 份额净值
        /// </summary>
        public double share_net
        {
            get { return _share_net; }

            set
            {
                _share_net = value;
                RaisePropertyChanged(() => share_net);
            }
        }

        private double _last_share_net;
        /// <summary>
        /// 上一份额净值
        /// </summary>
        public double last_share_net
        {
            get { return _last_share_net; }

            set
            {
                _last_share_net = value;
                RaisePropertyChanged(() => last_share_net);
            }
        }

        private double _share_net_total;
        /// <summary>
        /// 份额累计净值
        /// </summary>
        public double share_net_total
        {
            get { return _share_net_total; }

            set
            {
                _share_net_total = value;
                RaisePropertyChanged(() => share_net_total);
            }
        }

        private double _pre_share_net_total;
        /// <summary>
        /// 昨日份额累计净值
        /// </summary>
        public double pre_share_net_total
        {
            get { return _pre_share_net_total; }

            set
            {
                _pre_share_net_total = value;
                RaisePropertyChanged(() => pre_share_net_total);
            }
        }

        private double _net_change;
        /// <summary>
        /// 净值变化
        /// </summary>
        public double net_change
        {
            get { return _net_change; }

            set
            {
                _net_change = value;
                RaisePropertyChanged(() => net_change);
            }
        }

        private double _net_growth_rate;
        /// <summary>
        /// 净值增长率
        /// </summary>
        public double net_growth_rate
        {
            get { return _net_growth_rate; }

            set
            {
                _net_growth_rate = value;
                RaisePropertyChanged(() => net_growth_rate);
            }
        }

        private ulong _grp_row;
        /// <summary>
        /// 分组序号
        /// </summary>
        public ulong grp_row
        {
            get { return _grp_row; }

            set
            {
                _grp_row = value;
                RaisePropertyChanged(() => grp_row);
            }
        }

        private double _asset_market_value;
        /// <summary>
        /// 资产市值
        /// </summary>
        public double asset_market_value
        {
            get { return _asset_market_value; }

            set
            {
                _asset_market_value = value;
                RaisePropertyChanged(() => asset_market_value);
            }
        }

        private double _fund_share_total;
        /// <summary>
        /// 基金份额总额
        /// </summary>
        public double fund_share_total
        {
            get { return _fund_share_total; }

            set
            {
                _fund_share_total = value;
                RaisePropertyChanged(() => fund_share_total);
            }
        }

        private double _fund_asset_net;
        /// <summary>
        /// 基金资产净值
        /// </summary>
        public double fund_asset_net
        {
            get { return _fund_asset_net; }

            set
            {
                _fund_asset_net = value;
                RaisePropertyChanged(() => fund_asset_net);
            }
        }

        private double _pd_nav_day_ratio;
        /// <summary>
        /// 日净值增长率
        /// </summary>
        public double pd_nav_day_ratio
        {
            get { return _pd_nav_day_ratio; }

            set
            {
                _pd_nav_day_ratio = value;
                RaisePropertyChanged(() => pd_nav_day_ratio);
            }
        }

        private double _pd_nav_month_ratio;
        /// <summary>
        /// 月净值增长率
        /// </summary>
        public double pd_nav_month_ratio
        {
            get { return _pd_nav_month_ratio; }

            set
            {
                _pd_nav_month_ratio = value;
                RaisePropertyChanged(() => pd_nav_month_ratio);
            }
        }

        private double _total_realiz_pandl_ratio;
        /// <summary>
        /// 累计收益率
        /// </summary>
        public double total_realiz_pandl_ratio
        {
            get { return _total_realiz_pandl_ratio; }

            set
            {
                _total_realiz_pandl_ratio = value;
                RaisePropertyChanged(() => total_realiz_pandl_ratio);
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

        private double _post_fee_share_net_total;
        /// <summary>
        /// 费后累计净值
        /// </summary>
        public double post_fee_share_net_total
        {
            get { return _post_fee_share_net_total; }

            set
            {
                _post_fee_share_net_total = value;
                RaisePropertyChanged(() => post_fee_share_net_total);
            }
        }
    }

    public class rptL_2_182_Info : ObservableObject
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no
        {
            get { return _stock_code_no; }

            set
            {
                _stock_code_no = value;
                RaisePropertyChanged(() => stock_code_no);
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private double _today_close_price;
        /// <summary>
        /// 今收盘价
        /// </summary>
        public double today_close_price
        {
            get { return _today_close_price; }

            set
            {
                _today_close_price = value;
                RaisePropertyChanged(() => today_close_price);
            }
        }

        private double _pre_close_price;
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price
        {
            get { return _pre_close_price; }

            set
            {
                _pre_close_price = value;
                RaisePropertyChanged(() => pre_close_price);
            }
        }

        private double _price_change;
        /// <summary>
        /// 行情变化
        /// </summary>
        public double price_change
        {
            get { return _price_change; }

            set
            {
                _price_change = value;
                RaisePropertyChanged(() => price_change);
            }
        }

        private double _price_growth_rate;
        /// <summary>
        /// 行情增长率
        /// </summary>
        public double price_growth_rate
        {
            get { return _price_growth_rate; }

            set
            {
                _price_growth_rate = value;
                RaisePropertyChanged(() => price_growth_rate);
            }
        }

        private ulong _grp_row;
        /// <summary>
        /// 分组序号
        /// </summary>
        public ulong grp_row
        {
            get { return _grp_row; }

            set
            {
                _grp_row = value;
                RaisePropertyChanged(() => grp_row);
            }
        }
    }

    public class rptL_2_183_Info : ObservableObject
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

        private int _curr_year;
        /// <summary>
        /// 年份
        /// </summary>
        public int curr_year
        {
            get { return _curr_year; }

            set
            {
                _curr_year = value;
                RaisePropertyChanged(() => curr_year);
            }
        }

        private int _week_no;
        /// <summary>
        /// 第几周
        /// </summary>
        public int week_no
        {
            get { return _week_no; }

            set
            {
                _week_no = value;
                RaisePropertyChanged(() => week_no);
            }
        }

        private double _share_net;
        /// <summary>
        /// 份额净值
        /// </summary>
        public double share_net
        {
            get { return _share_net; }

            set
            {
                _share_net = value;
                RaisePropertyChanged(() => share_net);
            }
        }

        private double _share_net_total;
        /// <summary>
        /// 份额累计净值
        /// </summary>
        public double share_net_total
        {
            get { return _share_net_total; }

            set
            {
                _share_net_total = value;
                RaisePropertyChanged(() => share_net_total);
            }
        }

        private double _pre_share_net_total;
        /// <summary>
        /// 昨日份额累计净值
        /// </summary>
        public double pre_share_net_total
        {
            get { return _pre_share_net_total; }

            set
            {
                _pre_share_net_total = value;
                RaisePropertyChanged(() => pre_share_net_total);
            }
        }

        private double _net_change;
        /// <summary>
        /// 净值变化
        /// </summary>
        public double net_change
        {
            get { return _net_change; }

            set
            {
                _net_change = value;
                RaisePropertyChanged(() => net_change);
            }
        }

        private double _net_growth_rate;
        /// <summary>
        /// 净值增长率
        /// </summary>
        public double net_growth_rate
        {
            get { return _net_growth_rate; }

            set
            {
                _net_growth_rate = value;
                RaisePropertyChanged(() => net_growth_rate);
            }
        }

        private int _stat_days;
        /// <summary>
        /// 统计天数
        /// </summary>
        public int stat_days
        {
            get { return _stat_days; }

            set
            {
                _stat_days = value;
                RaisePropertyChanged(() => stat_days);
            }
        }

        private int _begin_date;
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
            }
        }

        private ulong _grp_row;
        /// <summary>
        /// 分组序号
        /// </summary>
        public ulong grp_row
        {
            get { return _grp_row; }

            set
            {
                _grp_row = value;
                RaisePropertyChanged(() => grp_row);
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

        private double _post_fee_share_net_total;
        /// <summary>
        /// 费后累计净值
        /// </summary>
        public double post_fee_share_net_total
        {
            get { return _post_fee_share_net_total; }

            set
            {
                _post_fee_share_net_total = value;
                RaisePropertyChanged(() => post_fee_share_net_total);
            }
        }
    }

    public class rptL_2_184_Info : ObservableObject
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no
        {
            get { return _stock_code_no; }

            set
            {
                _stock_code_no = value;
                RaisePropertyChanged(() => stock_code_no);
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private int _curr_year;
        /// <summary>
        /// 年份
        /// </summary>
        public int curr_year
        {
            get { return _curr_year; }

            set
            {
                _curr_year = value;
                RaisePropertyChanged(() => curr_year);
            }
        }

        private int _week_no;
        /// <summary>
        /// 第几周
        /// </summary>
        public int week_no
        {
            get { return _week_no; }

            set
            {
                _week_no = value;
                RaisePropertyChanged(() => week_no);
            }
        }

        private double _today_close_price;
        /// <summary>
        /// 今收盘价
        /// </summary>
        public double today_close_price
        {
            get { return _today_close_price; }

            set
            {
                _today_close_price = value;
                RaisePropertyChanged(() => today_close_price);
            }
        }

        private double _pre_close_price;
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price
        {
            get { return _pre_close_price; }

            set
            {
                _pre_close_price = value;
                RaisePropertyChanged(() => pre_close_price);
            }
        }

        private double _price_change;
        /// <summary>
        /// 行情变化
        /// </summary>
        public double price_change
        {
            get { return _price_change; }

            set
            {
                _price_change = value;
                RaisePropertyChanged(() => price_change);
            }
        }

        private double _price_growth_rate;
        /// <summary>
        /// 行情增长率
        /// </summary>
        public double price_growth_rate
        {
            get { return _price_growth_rate; }

            set
            {
                _price_growth_rate = value;
                RaisePropertyChanged(() => price_growth_rate);
            }
        }

        private int _begin_date;
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
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

        private ulong _grp_row;
        /// <summary>
        /// 分组序号
        /// </summary>
        public ulong grp_row
        {
            get { return _grp_row; }

            set
            {
                _grp_row = value;
                RaisePropertyChanged(() => grp_row);
            }
        }
    }

    public class rptL_2_185_Info : ObservableObject
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

        private int _curr_month;
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month
        {
            get { return _curr_month; }

            set
            {
                _curr_month = value;
                RaisePropertyChanged(() => curr_month);
            }
        }

        private double _share_net;
        /// <summary>
        /// 份额净值
        /// </summary>
        public double share_net
        {
            get { return _share_net; }

            set
            {
                _share_net = value;
                RaisePropertyChanged(() => share_net);
            }
        }

        private double _share_net_total;
        /// <summary>
        /// 份额累计净值
        /// </summary>
        public double share_net_total
        {
            get { return _share_net_total; }

            set
            {
                _share_net_total = value;
                RaisePropertyChanged(() => share_net_total);
            }
        }

        private double _pre_share_net_total;
        /// <summary>
        /// 昨日份额累计净值
        /// </summary>
        public double pre_share_net_total
        {
            get { return _pre_share_net_total; }

            set
            {
                _pre_share_net_total = value;
                RaisePropertyChanged(() => pre_share_net_total);
            }
        }

        private int _stat_days;
        /// <summary>
        /// 统计天数
        /// </summary>
        public int stat_days
        {
            get { return _stat_days; }

            set
            {
                _stat_days = value;
                RaisePropertyChanged(() => stat_days);
            }
        }

        private int _rise_days;
        /// <summary>
        /// 上涨天数
        /// </summary>
        public int rise_days
        {
            get { return _rise_days; }

            set
            {
                _rise_days = value;
                RaisePropertyChanged(() => rise_days);
            }
        }

        private int _fall_days;
        /// <summary>
        /// 下跌天数
        /// </summary>
        public int fall_days
        {
            get { return _fall_days; }

            set
            {
                _fall_days = value;
                RaisePropertyChanged(() => fall_days);
            }
        }

        private int _max_cont_rise_days;
        /// <summary>
        /// 最大连续上涨天数
        /// </summary>
        public int max_cont_rise_days
        {
            get { return _max_cont_rise_days; }

            set
            {
                _max_cont_rise_days = value;
                RaisePropertyChanged(() => max_cont_rise_days);
            }
        }

        private int _max_cont_fall_days;
        /// <summary>
        /// 最大连续下跌天数
        /// </summary>
        public int max_cont_fall_days
        {
            get { return _max_cont_fall_days; }

            set
            {
                _max_cont_fall_days = value;
                RaisePropertyChanged(() => max_cont_fall_days);
            }
        }

        private double _net_change;
        /// <summary>
        /// 净值变化
        /// </summary>
        public double net_change
        {
            get { return _net_change; }

            set
            {
                _net_change = value;
                RaisePropertyChanged(() => net_change);
            }
        }

        private double _net_growth_rate;
        /// <summary>
        /// 净值增长率
        /// </summary>
        public double net_growth_rate
        {
            get { return _net_growth_rate; }

            set
            {
                _net_growth_rate = value;
                RaisePropertyChanged(() => net_growth_rate);
            }
        }

        private int _begin_date;
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
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

        private ulong _grp_row;
        /// <summary>
        /// 分组序号
        /// </summary>
        public ulong grp_row
        {
            get { return _grp_row; }

            set
            {
                _grp_row = value;
                RaisePropertyChanged(() => grp_row);
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

        private double _post_fee_share_net_total;
        /// <summary>
        /// 费后累计净值
        /// </summary>
        public double post_fee_share_net_total
        {
            get { return _post_fee_share_net_total; }

            set
            {
                _post_fee_share_net_total = value;
                RaisePropertyChanged(() => post_fee_share_net_total);
            }
        }
    }

    public class rptL_2_186_Info : ObservableObject
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no
        {
            get { return _stock_code_no; }

            set
            {
                _stock_code_no = value;
                RaisePropertyChanged(() => stock_code_no);
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private int _curr_month;
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month
        {
            get { return _curr_month; }

            set
            {
                _curr_month = value;
                RaisePropertyChanged(() => curr_month);
            }
        }

        private double _today_close_price;
        /// <summary>
        /// 今收盘价
        /// </summary>
        public double today_close_price
        {
            get { return _today_close_price; }

            set
            {
                _today_close_price = value;
                RaisePropertyChanged(() => today_close_price);
            }
        }

        private double _pre_close_price;
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price
        {
            get { return _pre_close_price; }

            set
            {
                _pre_close_price = value;
                RaisePropertyChanged(() => pre_close_price);
            }
        }

        private int _stat_days;
        /// <summary>
        /// 统计天数
        /// </summary>
        public int stat_days
        {
            get { return _stat_days; }

            set
            {
                _stat_days = value;
                RaisePropertyChanged(() => stat_days);
            }
        }

        private int _rise_days;
        /// <summary>
        /// 上涨天数
        /// </summary>
        public int rise_days
        {
            get { return _rise_days; }

            set
            {
                _rise_days = value;
                RaisePropertyChanged(() => rise_days);
            }
        }

        private int _fall_days;
        /// <summary>
        /// 下跌天数
        /// </summary>
        public int fall_days
        {
            get { return _fall_days; }

            set
            {
                _fall_days = value;
                RaisePropertyChanged(() => fall_days);
            }
        }

        private int _max_cont_rise_days;
        /// <summary>
        /// 最大连续上涨天数
        /// </summary>
        public int max_cont_rise_days
        {
            get { return _max_cont_rise_days; }

            set
            {
                _max_cont_rise_days = value;
                RaisePropertyChanged(() => max_cont_rise_days);
            }
        }

        private int _max_cont_fall_days;
        /// <summary>
        /// 最大连续下跌天数
        /// </summary>
        public int max_cont_fall_days
        {
            get { return _max_cont_fall_days; }

            set
            {
                _max_cont_fall_days = value;
                RaisePropertyChanged(() => max_cont_fall_days);
            }
        }

        private double _price_change;
        /// <summary>
        /// 行情变化
        /// </summary>
        public double price_change
        {
            get { return _price_change; }

            set
            {
                _price_change = value;
                RaisePropertyChanged(() => price_change);
            }
        }

        private double _price_growth_rate;
        /// <summary>
        /// 行情增长率
        /// </summary>
        public double price_growth_rate
        {
            get { return _price_growth_rate; }

            set
            {
                _price_growth_rate = value;
                RaisePropertyChanged(() => price_growth_rate);
            }
        }

        private int _begin_date;
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
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

        private ulong _grp_row;
        /// <summary>
        /// 分组序号
        /// </summary>
        public ulong grp_row
        {
            get { return _grp_row; }

            set
            {
                _grp_row = value;
                RaisePropertyChanged(() => grp_row);
            }
        }
    }

    public class rptL_2_201_Info : ObservableObject
    {
    }

    public class rptL_2_202_Info : ObservableObject
    {
    }

    public class rptL_2_203_Info : ObservableObject
    {
    }

    public class rptL_2_204_Info : ObservableObject
    {
    }

    public class rptL_2_205_Info : ObservableObject
    {
    }

    public class rptL_2_206_Info : ObservableObject
    {
    }

    public class rptL_2_207_Info : ObservableObject
    {
    }

    public class rptL_2_208_Info : ObservableObject
    {
    }

    public class rptL_2_209_Info : ObservableObject
    {
    }

    public class rptL_2_210_Info : ObservableObject
    {
    }

    public class rptL_2_211_Info : ObservableObject
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

        private int _fund_manager_no;
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no
        {
            get { return _fund_manager_no; }

            set
            {
                _fund_manager_no = value;
                RaisePropertyChanged(() => fund_manager_no);
            }
        }

        private String _fund_manager_name;
        /// <summary>
        /// 基金经理名称
        /// </summary>
        public String fund_manager_name
        {
            get { return _fund_manager_name; }

            set
            {
                _fund_manager_name = value;
                RaisePropertyChanged(() => fund_manager_name);
            }
        }

        private int _trader_no;
        /// <summary>
        /// 交易员编号
        /// </summary>
        public int trader_no
        {
            get { return _trader_no; }

            set
            {
                _trader_no = value;
                RaisePropertyChanged(() => trader_no);
            }
        }

        private String _trader_name;
        /// <summary>
        /// 交易员名称
        /// </summary>
        public String trader_name
        {
            get { return _trader_name; }

            set
            {
                _trader_name = value;
                RaisePropertyChanged(() => trader_name);
            }
        }

        private int _show_order;
        /// <summary>
        /// 显示顺序
        /// </summary>
        public int show_order
        {
            get { return _show_order; }

            set
            {
                _show_order = value;
                RaisePropertyChanged(() => show_order);
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

    public class rptL_2_301_Info : ObservableObject
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

        private int _runtime;
        /// <summary>
        /// 运行时长
        /// </summary>
        public int runtime
        {
            get { return _runtime; }

            set
            {
                _runtime = value;
                RaisePropertyChanged(() => runtime);
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

        private double _warrant_asset;
        /// <summary>
        /// 权证资产
        /// </summary>
        public double warrant_asset
        {
            get { return _warrant_asset; }

            set
            {
                _warrant_asset = value;
                RaisePropertyChanged(() => warrant_asset);
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

        private double _money_fund_asset;
        /// <summary>
        /// 货币基金资产
        /// </summary>
        public double money_fund_asset
        {
            get { return _money_fund_asset; }

            set
            {
                _money_fund_asset = value;
                RaisePropertyChanged(() => money_fund_asset);
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

        private double _pre_pd_unit_nav;
        /// <summary>
        /// 昨日单位净值
        /// </summary>
        public double pre_pd_unit_nav
        {
            get { return _pre_pd_unit_nav; }

            set
            {
                _pre_pd_unit_nav = value;
                RaisePropertyChanged(() => pre_pd_unit_nav);
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

        private double _last_week_pd_nav;
        /// <summary>
        /// 上周净值
        /// </summary>
        public double last_week_pd_nav
        {
            get { return _last_week_pd_nav; }

            set
            {
                _last_week_pd_nav = value;
                RaisePropertyChanged(() => last_week_pd_nav);
            }
        }

        private double _last_month_pd_nav;
        /// <summary>
        /// 上月净值
        /// </summary>
        public double last_month_pd_nav
        {
            get { return _last_month_pd_nav; }

            set
            {
                _last_month_pd_nav = value;
                RaisePropertyChanged(() => last_month_pd_nav);
            }
        }

        private double _last_quarter_pd_nav;
        /// <summary>
        /// 上季度净值
        /// </summary>
        public double last_quarter_pd_nav
        {
            get { return _last_quarter_pd_nav; }

            set
            {
                _last_quarter_pd_nav = value;
                RaisePropertyChanged(() => last_quarter_pd_nav);
            }
        }

        private double _last_year_pd_nav;
        /// <summary>
        /// 上年产品净值
        /// </summary>
        public double last_year_pd_nav
        {
            get { return _last_year_pd_nav; }

            set
            {
                _last_year_pd_nav = value;
                RaisePropertyChanged(() => last_year_pd_nav);
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

        private double _product_unit_nav_ration;
        /// <summary>
        /// 净值比
        /// </summary>
        public double product_unit_nav_ration
        {
            get { return _product_unit_nav_ration; }

            set
            {
                _product_unit_nav_ration = value;
                RaisePropertyChanged(() => product_unit_nav_ration);
            }
        }

        private double _buy_amt;
        /// <summary>
        /// 买入金额
        /// </summary>
        public double buy_amt
        {
            get { return _buy_amt; }

            set
            {
                _buy_amt = value;
                RaisePropertyChanged(() => buy_amt);
            }
        }

        private double _sellout_amt;
        /// <summary>
        /// 卖出金额
        /// </summary>
        public double sellout_amt
        {
            get { return _sellout_amt; }

            set
            {
                _sellout_amt = value;
                RaisePropertyChanged(() => sellout_amt);
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

    public class rptL_2_302_Info : ObservableObject
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

        private int _stock_acco_no;
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no
        {
            get { return _stock_acco_no; }

            set
            {
                _stock_acco_no = value;
                RaisePropertyChanged(() => stock_acco_no);
            }
        }

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no
        {
            get { return _stock_code_no; }

            set
            {
                _stock_code_no = value;
                RaisePropertyChanged(() => stock_code_no);
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
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

        private int _invest_type;
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type
        {
            get { return _invest_type; }

            set
            {
                _invest_type = value;
                RaisePropertyChanged(() => invest_type);
            }
        }

        private int _stock_type;
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type
        {
            get { return _stock_type; }

            set
            {
                _stock_type = value;
                RaisePropertyChanged(() => stock_type);
            }
        }

        private int _asset_type;
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type
        {
            get { return _asset_type; }

            set
            {
                _asset_type = value;
                RaisePropertyChanged(() => asset_type);
            }
        }

        private int _asset_kind;
        /// <summary>
        /// 资产类别
        /// </summary>
        public int asset_kind
        {
            get { return _asset_kind; }

            set
            {
                _asset_kind = value;
                RaisePropertyChanged(() => asset_kind);
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

        private double _curr_qty;
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty
        {
            get { return _curr_qty; }

            set
            {
                _curr_qty = value;
                RaisePropertyChanged(() => curr_qty);
            }
        }

        private double _frozen_qty;
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty
        {
            get { return _frozen_qty; }

            set
            {
                _frozen_qty = value;
                RaisePropertyChanged(() => frozen_qty);
            }
        }

        private double _unfroz_qty;
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty
        {
            get { return _unfroz_qty; }

            set
            {
                _unfroz_qty = value;
                RaisePropertyChanged(() => unfroz_qty);
            }
        }

        private double _cost_amt;
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt
        {
            get { return _cost_amt; }

            set
            {
                _cost_amt = value;
                RaisePropertyChanged(() => cost_amt);
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

        private double _intrst_cost_amt;
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt
        {
            get { return _intrst_cost_amt; }

            set
            {
                _intrst_cost_amt = value;
                RaisePropertyChanged(() => intrst_cost_amt);
            }
        }

        private double _intrst_pandl;
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl
        {
            get { return _intrst_pandl; }

            set
            {
                _intrst_pandl = value;
                RaisePropertyChanged(() => intrst_pandl);
            }
        }

        private double _last_price;
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _stock_asset_value;
        /// <summary>
        /// 证券市值
        /// </summary>
        public double stock_asset_value
        {
            get { return _stock_asset_value; }

            set
            {
                _stock_asset_value = value;
                RaisePropertyChanged(() => stock_asset_value);
            }
        }

        private double _value_dirty_price;
        /// <summary>
        /// 估价全价
        /// </summary>
        public double value_dirty_price
        {
            get { return _value_dirty_price; }

            set
            {
                _value_dirty_price = value;
                RaisePropertyChanged(() => value_dirty_price);
            }
        }

        private double _value_net_price;
        /// <summary>
        /// 估价净价
        /// </summary>
        public double value_net_price
        {
            get { return _value_net_price; }

            set
            {
                _value_net_price = value;
                RaisePropertyChanged(() => value_net_price);
            }
        }

        private double _buy_qty;
        /// <summary>
        /// 买入数量
        /// </summary>
        public double buy_qty
        {
            get { return _buy_qty; }

            set
            {
                _buy_qty = value;
                RaisePropertyChanged(() => buy_qty);
            }
        }

        private double _buy_amt;
        /// <summary>
        /// 买入金额
        /// </summary>
        public double buy_amt
        {
            get { return _buy_amt; }

            set
            {
                _buy_amt = value;
                RaisePropertyChanged(() => buy_amt);
            }
        }

        private double _sell_qty;
        /// <summary>
        /// 卖出数量
        /// </summary>
        public double sell_qty
        {
            get { return _sell_qty; }

            set
            {
                _sell_qty = value;
                RaisePropertyChanged(() => sell_qty);
            }
        }

        private double _sellout_amt;
        /// <summary>
        /// 卖出金额
        /// </summary>
        public double sellout_amt
        {
            get { return _sellout_amt; }

            set
            {
                _sellout_amt = value;
                RaisePropertyChanged(() => sellout_amt);
            }
        }
    }

    public class rptL_2_303_Info : ObservableObject
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

        private int _industry_std;
        /// <summary>
        /// 行业标准
        /// </summary>
        public int industry_std
        {
            get { return _industry_std; }

            set
            {
                _industry_std = value;
                RaisePropertyChanged(() => industry_std);
            }
        }

        private int _industry_classification;
        /// <summary>
        /// 行业级别
        /// </summary>
        public int industry_classification
        {
            get { return _industry_classification; }

            set
            {
                _industry_classification = value;
                RaisePropertyChanged(() => industry_classification);
            }
        }

        private int _industry_id;
        /// <summary>
        /// 行业编号
        /// </summary>
        public int industry_id
        {
            get { return _industry_id; }

            set
            {
                _industry_id = value;
                RaisePropertyChanged(() => industry_id);
            }
        }

        private String _industry_code;
        /// <summary>
        /// 行业代码
        /// </summary>
        public String industry_code
        {
            get { return _industry_code; }

            set
            {
                _industry_code = value;
                RaisePropertyChanged(() => industry_code);
            }
        }

        private String _indu_name;
        /// <summary>
        /// 行业名称
        /// </summary>
        public String indu_name
        {
            get { return _indu_name; }

            set
            {
                _indu_name = value;
                RaisePropertyChanged(() => indu_name);
            }
        }

        private double _basket_qty;
        /// <summary>
        /// 篮子数量
        /// </summary>
        public double basket_qty
        {
            get { return _basket_qty; }

            set
            {
                _basket_qty = value;
                RaisePropertyChanged(() => basket_qty);
            }
        }

        private double _cost_amt;
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt
        {
            get { return _cost_amt; }

            set
            {
                _cost_amt = value;
                RaisePropertyChanged(() => cost_amt);
            }
        }

        private double _posi_market_value;
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
            }
        }

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
        /// </summary>
        public double float_pandl
        {
            get { return _float_pandl; }

            set
            {
                _float_pandl = value;
                RaisePropertyChanged(() => float_pandl);
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

    public class rptL_2_304_Info : ObservableObject
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

        private int _begin_date;
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
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

        private int _industry_std;
        /// <summary>
        /// 行业标准
        /// </summary>
        public int industry_std
        {
            get { return _industry_std; }

            set
            {
                _industry_std = value;
                RaisePropertyChanged(() => industry_std);
            }
        }

        private int _industry_classification;
        /// <summary>
        /// 行业级别
        /// </summary>
        public int industry_classification
        {
            get { return _industry_classification; }

            set
            {
                _industry_classification = value;
                RaisePropertyChanged(() => industry_classification);
            }
        }

        private int _industry_id;
        /// <summary>
        /// 行业编号
        /// </summary>
        public int industry_id
        {
            get { return _industry_id; }

            set
            {
                _industry_id = value;
                RaisePropertyChanged(() => industry_id);
            }
        }

        private String _industry_code;
        /// <summary>
        /// 行业代码
        /// </summary>
        public String industry_code
        {
            get { return _industry_code; }

            set
            {
                _industry_code = value;
                RaisePropertyChanged(() => industry_code);
            }
        }

        private String _indu_name;
        /// <summary>
        /// 行业名称
        /// </summary>
        public String indu_name
        {
            get { return _indu_name; }

            set
            {
                _indu_name = value;
                RaisePropertyChanged(() => indu_name);
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

        private double _begin_cost_amt;
        /// <summary>
        /// 期初成本
        /// </summary>
        public double begin_cost_amt
        {
            get { return _begin_cost_amt; }

            set
            {
                _begin_cost_amt = value;
                RaisePropertyChanged(() => begin_cost_amt);
            }
        }

        private double _begin_posi_market_value;
        /// <summary>
        /// 期初持仓市值
        /// </summary>
        public double begin_posi_market_value
        {
            get { return _begin_posi_market_value; }

            set
            {
                _begin_posi_market_value = value;
                RaisePropertyChanged(() => begin_posi_market_value);
            }
        }

        private double _begin_realize_pandl;
        /// <summary>
        /// 期初实现盈亏
        /// </summary>
        public double begin_realize_pandl
        {
            get { return _begin_realize_pandl; }

            set
            {
                _begin_realize_pandl = value;
                RaisePropertyChanged(() => begin_realize_pandl);
            }
        }

        private int _end_cur_qty;
        /// <summary>
        /// 期末数量
        /// </summary>
        public int end_cur_qty
        {
            get { return _end_cur_qty; }

            set
            {
                _end_cur_qty = value;
                RaisePropertyChanged(() => end_cur_qty);
            }
        }

        private double _end_cost_amt;
        /// <summary>
        /// 期末成本
        /// </summary>
        public double end_cost_amt
        {
            get { return _end_cost_amt; }

            set
            {
                _end_cost_amt = value;
                RaisePropertyChanged(() => end_cost_amt);
            }
        }

        private double _end_posi_market_value;
        /// <summary>
        /// 期末持仓市值
        /// </summary>
        public double end_posi_market_value
        {
            get { return _end_posi_market_value; }

            set
            {
                _end_posi_market_value = value;
                RaisePropertyChanged(() => end_posi_market_value);
            }
        }

        private double _end_realize_pandl;
        /// <summary>
        /// 期末实现盈亏
        /// </summary>
        public double end_realize_pandl
        {
            get { return _end_realize_pandl; }

            set
            {
                _end_realize_pandl = value;
                RaisePropertyChanged(() => end_realize_pandl);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
        /// </summary>
        public double float_pandl
        {
            get { return _float_pandl; }

            set
            {
                _float_pandl = value;
                RaisePropertyChanged(() => float_pandl);
            }
        }

        private double _interval_realize_pandl;
        /// <summary>
        /// 区间实现盈亏
        /// </summary>
        public double interval_realize_pandl
        {
            get { return _interval_realize_pandl; }

            set
            {
                _interval_realize_pandl = value;
                RaisePropertyChanged(() => interval_realize_pandl);
            }
        }

        private double _interval_pandl;
        /// <summary>
        /// 区间盈亏
        /// </summary>
        public double interval_pandl
        {
            get { return _interval_pandl; }

            set
            {
                _interval_pandl = value;
                RaisePropertyChanged(() => interval_pandl);
            }
        }
    }

    public class rptL_2_305_Info : ObservableObject
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no
        {
            get { return _stock_code_no; }

            set
            {
                _stock_code_no = value;
                RaisePropertyChanged(() => stock_code_no);
            }
        }

        private int _stock_type;
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type
        {
            get { return _stock_type; }

            set
            {
                _stock_type = value;
                RaisePropertyChanged(() => stock_type);
            }
        }

        private int _asset_type;
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type
        {
            get { return _asset_type; }

            set
            {
                _asset_type = value;
                RaisePropertyChanged(() => asset_type);
            }
        }

        private double _order_price;
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price
        {
            get { return _order_price; }

            set
            {
                _order_price = value;
                RaisePropertyChanged(() => order_price);
            }
        }

        private double _order_qty;
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty
        {
            get { return _order_qty; }

            set
            {
                _order_qty = value;
                RaisePropertyChanged(() => order_qty);
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

        private double _buy_qty;
        /// <summary>
        /// 买入数量
        /// </summary>
        public double buy_qty
        {
            get { return _buy_qty; }

            set
            {
                _buy_qty = value;
                RaisePropertyChanged(() => buy_qty);
            }
        }

        private double _buy_amt;
        /// <summary>
        /// 买入金额
        /// </summary>
        public double buy_amt
        {
            get { return _buy_amt; }

            set
            {
                _buy_amt = value;
                RaisePropertyChanged(() => buy_amt);
            }
        }

        private double _buy_strike_price;
        /// <summary>
        /// 买入成交价
        /// </summary>
        public double buy_strike_price
        {
            get { return _buy_strike_price; }

            set
            {
                _buy_strike_price = value;
                RaisePropertyChanged(() => buy_strike_price);
            }
        }

        private double _sell_qty;
        /// <summary>
        /// 卖出数量
        /// </summary>
        public double sell_qty
        {
            get { return _sell_qty; }

            set
            {
                _sell_qty = value;
                RaisePropertyChanged(() => sell_qty);
            }
        }

        private double _sellout_amt;
        /// <summary>
        /// 卖出金额
        /// </summary>
        public double sellout_amt
        {
            get { return _sellout_amt; }

            set
            {
                _sellout_amt = value;
                RaisePropertyChanged(() => sellout_amt);
            }
        }

        private double _sell_strike_price;
        /// <summary>
        /// 卖出成交价
        /// </summary>
        public double sell_strike_price
        {
            get { return _sell_strike_price; }

            set
            {
                _sell_strike_price = value;
                RaisePropertyChanged(() => sell_strike_price);
            }
        }

        private double _diff_qty;
        /// <summary>
        /// 数量差额
        /// </summary>
        public double diff_qty
        {
            get { return _diff_qty; }

            set
            {
                _diff_qty = value;
                RaisePropertyChanged(() => diff_qty);
            }
        }

        private int _buy_begin_time;
        /// <summary>
        /// 买入开始时间
        /// </summary>
        public int buy_begin_time
        {
            get { return _buy_begin_time; }

            set
            {
                _buy_begin_time = value;
                RaisePropertyChanged(() => buy_begin_time);
            }
        }

        private int _buy_end_time;
        /// <summary>
        /// 买入结束时间
        /// </summary>
        public int buy_end_time
        {
            get { return _buy_end_time; }

            set
            {
                _buy_end_time = value;
                RaisePropertyChanged(() => buy_end_time);
            }
        }

        private int _sell_begin_time;
        /// <summary>
        /// 卖出开始时间
        /// </summary>
        public int sell_begin_time
        {
            get { return _sell_begin_time; }

            set
            {
                _sell_begin_time = value;
                RaisePropertyChanged(() => sell_begin_time);
            }
        }

        private int _sell_end_time;
        /// <summary>
        /// 卖出结束时间
        /// </summary>
        public int sell_end_time
        {
            get { return _sell_end_time; }

            set
            {
                _sell_end_time = value;
                RaisePropertyChanged(() => sell_end_time);
            }
        }
    }

    public class rptL_2_306_Info : ObservableObject
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no
        {
            get { return _stock_code_no; }

            set
            {
                _stock_code_no = value;
                RaisePropertyChanged(() => stock_code_no);
            }
        }

        private int _stock_type;
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type
        {
            get { return _stock_type; }

            set
            {
                _stock_type = value;
                RaisePropertyChanged(() => stock_type);
            }
        }

        private int _asset_type;
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type
        {
            get { return _asset_type; }

            set
            {
                _asset_type = value;
                RaisePropertyChanged(() => asset_type);
            }
        }

        private double _order_price;
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price
        {
            get { return _order_price; }

            set
            {
                _order_price = value;
                RaisePropertyChanged(() => order_price);
            }
        }

        private double _order_qty;
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty
        {
            get { return _order_qty; }

            set
            {
                _order_qty = value;
                RaisePropertyChanged(() => order_qty);
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

        private double _buy_qty;
        /// <summary>
        /// 买入数量
        /// </summary>
        public double buy_qty
        {
            get { return _buy_qty; }

            set
            {
                _buy_qty = value;
                RaisePropertyChanged(() => buy_qty);
            }
        }

        private double _buy_amt;
        /// <summary>
        /// 买入金额
        /// </summary>
        public double buy_amt
        {
            get { return _buy_amt; }

            set
            {
                _buy_amt = value;
                RaisePropertyChanged(() => buy_amt);
            }
        }

        private double _buy_strike_price;
        /// <summary>
        /// 买入成交价
        /// </summary>
        public double buy_strike_price
        {
            get { return _buy_strike_price; }

            set
            {
                _buy_strike_price = value;
                RaisePropertyChanged(() => buy_strike_price);
            }
        }

        private double _sell_qty;
        /// <summary>
        /// 卖出数量
        /// </summary>
        public double sell_qty
        {
            get { return _sell_qty; }

            set
            {
                _sell_qty = value;
                RaisePropertyChanged(() => sell_qty);
            }
        }

        private double _sellout_amt;
        /// <summary>
        /// 卖出金额
        /// </summary>
        public double sellout_amt
        {
            get { return _sellout_amt; }

            set
            {
                _sellout_amt = value;
                RaisePropertyChanged(() => sellout_amt);
            }
        }

        private double _sell_strike_price;
        /// <summary>
        /// 卖出成交价
        /// </summary>
        public double sell_strike_price
        {
            get { return _sell_strike_price; }

            set
            {
                _sell_strike_price = value;
                RaisePropertyChanged(() => sell_strike_price);
            }
        }

        private double _diff_qty;
        /// <summary>
        /// 数量差额
        /// </summary>
        public double diff_qty
        {
            get { return _diff_qty; }

            set
            {
                _diff_qty = value;
                RaisePropertyChanged(() => diff_qty);
            }
        }

        private int _buy_begin_time;
        /// <summary>
        /// 买入开始时间
        /// </summary>
        public int buy_begin_time
        {
            get { return _buy_begin_time; }

            set
            {
                _buy_begin_time = value;
                RaisePropertyChanged(() => buy_begin_time);
            }
        }

        private int _buy_end_time;
        /// <summary>
        /// 买入结束时间
        /// </summary>
        public int buy_end_time
        {
            get { return _buy_end_time; }

            set
            {
                _buy_end_time = value;
                RaisePropertyChanged(() => buy_end_time);
            }
        }

        private int _sell_begin_time;
        /// <summary>
        /// 卖出开始时间
        /// </summary>
        public int sell_begin_time
        {
            get { return _sell_begin_time; }

            set
            {
                _sell_begin_time = value;
                RaisePropertyChanged(() => sell_begin_time);
            }
        }

        private int _sell_end_time;
        /// <summary>
        /// 卖出结束时间
        /// </summary>
        public int sell_end_time
        {
            get { return _sell_end_time; }

            set
            {
                _sell_end_time = value;
                RaisePropertyChanged(() => sell_end_time);
            }
        }
    }

    public class rptL_2_307_Info : ObservableObject
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no
        {
            get { return _stock_code_no; }

            set
            {
                _stock_code_no = value;
                RaisePropertyChanged(() => stock_code_no);
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

        private int _invest_type;
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type
        {
            get { return _invest_type; }

            set
            {
                _invest_type = value;
                RaisePropertyChanged(() => invest_type);
            }
        }

        private int _stock_type;
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type
        {
            get { return _stock_type; }

            set
            {
                _stock_type = value;
                RaisePropertyChanged(() => stock_type);
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

        private double _strike_aver_price;
        /// <summary>
        /// 成交均价
        /// </summary>
        public double strike_aver_price
        {
            get { return _strike_aver_price; }

            set
            {
                _strike_aver_price = value;
                RaisePropertyChanged(() => strike_aver_price);
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

        private double _order_price;
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price
        {
            get { return _order_price; }

            set
            {
                _order_price = value;
                RaisePropertyChanged(() => order_price);
            }
        }

        private double _order_qty;
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty
        {
            get { return _order_qty; }

            set
            {
                _order_qty = value;
                RaisePropertyChanged(() => order_qty);
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

        private double _stamp_tax;
        /// <summary>
        /// 印花税
        /// </summary>
        public double stamp_tax
        {
            get { return _stamp_tax; }

            set
            {
                _stamp_tax = value;
                RaisePropertyChanged(() => stamp_tax);
            }
        }

        private double _trans_fee;
        /// <summary>
        /// 过户费
        /// </summary>
        public double trans_fee
        {
            get { return _trans_fee; }

            set
            {
                _trans_fee = value;
                RaisePropertyChanged(() => trans_fee);
            }
        }

        private double _brkage_fee;
        /// <summary>
        /// 经手费
        /// </summary>
        public double brkage_fee
        {
            get { return _brkage_fee; }

            set
            {
                _brkage_fee = value;
                RaisePropertyChanged(() => brkage_fee);
            }
        }

        private double _SEC_charges;
        /// <summary>
        /// 证管费
        /// </summary>
        public double SEC_charges
        {
            get { return _SEC_charges; }

            set
            {
                _SEC_charges = value;
                RaisePropertyChanged(() => SEC_charges);
            }
        }

        private double _other_fee;
        /// <summary>
        /// 其他费用
        /// </summary>
        public double other_fee
        {
            get { return _other_fee; }

            set
            {
                _other_fee = value;
                RaisePropertyChanged(() => other_fee);
            }
        }

        private double _trade_commis;
        /// <summary>
        /// 交易佣金
        /// </summary>
        public double trade_commis
        {
            get { return _trade_commis; }

            set
            {
                _trade_commis = value;
                RaisePropertyChanged(() => trade_commis);
            }
        }

        private double _other_commis;
        /// <summary>
        /// 其他佣金
        /// </summary>
        public double other_commis
        {
            get { return _other_commis; }

            set
            {
                _other_commis = value;
                RaisePropertyChanged(() => other_commis);
            }
        }

        private double _bond_accr_intrst;
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst
        {
            get { return _bond_accr_intrst; }

            set
            {
                _bond_accr_intrst = value;
                RaisePropertyChanged(() => bond_accr_intrst);
            }
        }

        private int _net_price_flag;
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag
        {
            get { return _net_price_flag; }

            set
            {
                _net_price_flag = value;
                RaisePropertyChanged(() => net_price_flag);
            }
        }

        private String _bank_ib_member;
        /// <summary>
        /// 交易对手
        /// </summary>
        public String bank_ib_member
        {
            get { return _bank_ib_member; }

            set
            {
                _bank_ib_member = value;
                RaisePropertyChanged(() => bank_ib_member);
            }
        }

        private double _last_price;
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _quot_strike_qty;
        /// <summary>
        /// 行情成交数量
        /// </summary>
        public double quot_strike_qty
        {
            get { return _quot_strike_qty; }

            set
            {
                _quot_strike_qty = value;
                RaisePropertyChanged(() => quot_strike_qty);
            }
        }

        private double _quot_strike_amt;
        /// <summary>
        /// 行情成交金额
        /// </summary>
        public double quot_strike_amt
        {
            get { return _quot_strike_amt; }

            set
            {
                _quot_strike_amt = value;
                RaisePropertyChanged(() => quot_strike_amt);
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

        private int _src_data_type;
        /// <summary>
        /// 数据来源类型
        /// </summary>
        public int src_data_type
        {
            get { return _src_data_type; }

            set
            {
                _src_data_type = value;
                RaisePropertyChanged(() => src_data_type);
            }
        }
    }

    public class rptL_2_308_Info : ObservableObject
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

        private int _begin_date;
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
            }
        }

        private int _stat_days;
        /// <summary>
        /// 统计天数
        /// </summary>
        public int stat_days
        {
            get { return _stat_days; }

            set
            {
                _stat_days = value;
                RaisePropertyChanged(() => stat_days);
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no
        {
            get { return _stock_code_no; }

            set
            {
                _stock_code_no = value;
                RaisePropertyChanged(() => stock_code_no);
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

        private int _invest_type;
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type
        {
            get { return _invest_type; }

            set
            {
                _invest_type = value;
                RaisePropertyChanged(() => invest_type);
            }
        }

        private int _stock_type;
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type
        {
            get { return _stock_type; }

            set
            {
                _stock_type = value;
                RaisePropertyChanged(() => stock_type);
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

        private double _order_qty;
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty
        {
            get { return _order_qty; }

            set
            {
                _order_qty = value;
                RaisePropertyChanged(() => order_qty);
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

        private double _stamp_tax;
        /// <summary>
        /// 印花税
        /// </summary>
        public double stamp_tax
        {
            get { return _stamp_tax; }

            set
            {
                _stamp_tax = value;
                RaisePropertyChanged(() => stamp_tax);
            }
        }

        private double _trans_fee;
        /// <summary>
        /// 过户费
        /// </summary>
        public double trans_fee
        {
            get { return _trans_fee; }

            set
            {
                _trans_fee = value;
                RaisePropertyChanged(() => trans_fee);
            }
        }

        private double _brkage_fee;
        /// <summary>
        /// 经手费
        /// </summary>
        public double brkage_fee
        {
            get { return _brkage_fee; }

            set
            {
                _brkage_fee = value;
                RaisePropertyChanged(() => brkage_fee);
            }
        }

        private double _SEC_charges;
        /// <summary>
        /// 证管费
        /// </summary>
        public double SEC_charges
        {
            get { return _SEC_charges; }

            set
            {
                _SEC_charges = value;
                RaisePropertyChanged(() => SEC_charges);
            }
        }

        private double _other_fee;
        /// <summary>
        /// 其他费用
        /// </summary>
        public double other_fee
        {
            get { return _other_fee; }

            set
            {
                _other_fee = value;
                RaisePropertyChanged(() => other_fee);
            }
        }

        private double _trade_commis;
        /// <summary>
        /// 交易佣金
        /// </summary>
        public double trade_commis
        {
            get { return _trade_commis; }

            set
            {
                _trade_commis = value;
                RaisePropertyChanged(() => trade_commis);
            }
        }

        private double _other_commis;
        /// <summary>
        /// 其他佣金
        /// </summary>
        public double other_commis
        {
            get { return _other_commis; }

            set
            {
                _other_commis = value;
                RaisePropertyChanged(() => other_commis);
            }
        }

        private double _bond_accr_intrst;
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst
        {
            get { return _bond_accr_intrst; }

            set
            {
                _bond_accr_intrst = value;
                RaisePropertyChanged(() => bond_accr_intrst);
            }
        }

        private double _quot_strike_qty;
        /// <summary>
        /// 行情成交数量
        /// </summary>
        public double quot_strike_qty
        {
            get { return _quot_strike_qty; }

            set
            {
                _quot_strike_qty = value;
                RaisePropertyChanged(() => quot_strike_qty);
            }
        }

        private double _quot_strike_amt;
        /// <summary>
        /// 行情成交金额
        /// </summary>
        public double quot_strike_amt
        {
            get { return _quot_strike_amt; }

            set
            {
                _quot_strike_amt = value;
                RaisePropertyChanged(() => quot_strike_amt);
            }
        }
    }

    public class rptL_2_309_Info : ObservableObject
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
    }

    public class rptL_2_310_Info : ObservableObject
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

        private int _begin_date;
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
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
    }

    public class rptL_2_311_Info : ObservableObject
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

        private int _curr_month;
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month
        {
            get { return _curr_month; }

            set
            {
                _curr_month = value;
                RaisePropertyChanged(() => curr_month);
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

        private double _end_nav_asset;
        /// <summary>
        /// 期末净资产
        /// </summary>
        public double end_nav_asset
        {
            get { return _end_nav_asset; }

            set
            {
                _end_nav_asset = value;
                RaisePropertyChanged(() => end_nav_asset);
            }
        }

        private double _avg_nav_asset;
        /// <summary>
        /// 日均净资产
        /// </summary>
        public double avg_nav_asset
        {
            get { return _avg_nav_asset; }

            set
            {
                _avg_nav_asset = value;
                RaisePropertyChanged(() => avg_nav_asset);
            }
        }

        private double _avg_total_asset;
        /// <summary>
        /// 日均总资产
        /// </summary>
        public double avg_total_asset
        {
            get { return _avg_total_asset; }

            set
            {
                _avg_total_asset = value;
                RaisePropertyChanged(() => avg_total_asset);
            }
        }

        private double _avg_stock_asset;
        /// <summary>
        /// 日均股票资产
        /// </summary>
        public double avg_stock_asset
        {
            get { return _avg_stock_asset; }

            set
            {
                _avg_stock_asset = value;
                RaisePropertyChanged(() => avg_stock_asset);
            }
        }

        private double _avg_futu_asset;
        /// <summary>
        /// 日均期货资产
        /// </summary>
        public double avg_futu_asset
        {
            get { return _avg_futu_asset; }

            set
            {
                _avg_futu_asset = value;
                RaisePropertyChanged(() => avg_futu_asset);
            }
        }

        private double _avg_option_asset;
        /// <summary>
        /// 日均期权资产
        /// </summary>
        public double avg_option_asset
        {
            get { return _avg_option_asset; }

            set
            {
                _avg_option_asset = value;
                RaisePropertyChanged(() => avg_option_asset);
            }
        }

        private double _avg_warrant_asset;
        /// <summary>
        /// 日均权证资产
        /// </summary>
        public double avg_warrant_asset
        {
            get { return _avg_warrant_asset; }

            set
            {
                _avg_warrant_asset = value;
                RaisePropertyChanged(() => avg_warrant_asset);
            }
        }

        private double _avg_fund_asset;
        /// <summary>
        /// 日均基金资产
        /// </summary>
        public double avg_fund_asset
        {
            get { return _avg_fund_asset; }

            set
            {
                _avg_fund_asset = value;
                RaisePropertyChanged(() => avg_fund_asset);
            }
        }

        private double _avg_cash_asset;
        /// <summary>
        /// 日均现金资产
        /// </summary>
        public double avg_cash_asset
        {
            get { return _avg_cash_asset; }

            set
            {
                _avg_cash_asset = value;
                RaisePropertyChanged(() => avg_cash_asset);
            }
        }

        private double _avg_repo_asset;
        /// <summary>
        /// 日均回购资产
        /// </summary>
        public double avg_repo_asset
        {
            get { return _avg_repo_asset; }

            set
            {
                _avg_repo_asset = value;
                RaisePropertyChanged(() => avg_repo_asset);
            }
        }

        private double _avg_bond_asset;
        /// <summary>
        /// 日均债券资产
        /// </summary>
        public double avg_bond_asset
        {
            get { return _avg_bond_asset; }

            set
            {
                _avg_bond_asset = value;
                RaisePropertyChanged(() => avg_bond_asset);
            }
        }

        private double _avg_money_fund_asset;
        /// <summary>
        /// 日均货币基金资产
        /// </summary>
        public double avg_money_fund_asset
        {
            get { return _avg_money_fund_asset; }

            set
            {
                _avg_money_fund_asset = value;
                RaisePropertyChanged(() => avg_money_fund_asset);
            }
        }

        private double _pd_begin_unit_nav;
        /// <summary>
        /// 期初单位净值
        /// </summary>
        public double pd_begin_unit_nav
        {
            get { return _pd_begin_unit_nav; }

            set
            {
                _pd_begin_unit_nav = value;
                RaisePropertyChanged(() => pd_begin_unit_nav);
            }
        }

        private double _end_unit_nav;
        /// <summary>
        /// 期末单位净值
        /// </summary>
        public double end_unit_nav
        {
            get { return _end_unit_nav; }

            set
            {
                _end_unit_nav = value;
                RaisePropertyChanged(() => end_unit_nav);
            }
        }

        private double _avg_pd_all_share;
        /// <summary>
        /// 日均产品总份额
        /// </summary>
        public double avg_pd_all_share
        {
            get { return _avg_pd_all_share; }

            set
            {
                _avg_pd_all_share = value;
                RaisePropertyChanged(() => avg_pd_all_share);
            }
        }

        private double _buy_amt;
        /// <summary>
        /// 买入金额
        /// </summary>
        public double buy_amt
        {
            get { return _buy_amt; }

            set
            {
                _buy_amt = value;
                RaisePropertyChanged(() => buy_amt);
            }
        }

        private double _sellout_amt;
        /// <summary>
        /// 卖出金额
        /// </summary>
        public double sellout_amt
        {
            get { return _sellout_amt; }

            set
            {
                _sellout_amt = value;
                RaisePropertyChanged(() => sellout_amt);
            }
        }

        private int _begin_date;
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date
        {
            get { return _begin_date; }

            set
            {
                _begin_date = value;
                RaisePropertyChanged(() => begin_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
            }
        }

        private int _stat_days;
        /// <summary>
        /// 统计天数
        /// </summary>
        public int stat_days
        {
            get { return _stat_days; }

            set
            {
                _stat_days = value;
                RaisePropertyChanged(() => stat_days);
            }
        }

        private double _month_apply_amt;
        /// <summary>
        /// 月净申购金额
        /// </summary>
        public double month_apply_amt
        {
            get { return _month_apply_amt; }

            set
            {
                _month_apply_amt = value;
                RaisePropertyChanged(() => month_apply_amt);
            }
        }

        private double _trade_deduct_amt;
        /// <summary>
        /// 买卖扣除金额
        /// </summary>
        public double trade_deduct_amt
        {
            get { return _trade_deduct_amt; }

            set
            {
                _trade_deduct_amt = value;
                RaisePropertyChanged(() => trade_deduct_amt);
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

    public class rptL_2_312_Info : ObservableObject
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

        private String _exch_crncy_type;
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type
        {
            get { return _exch_crncy_type; }

            set
            {
                _exch_crncy_type = value;
                RaisePropertyChanged(() => exch_crncy_type);
            }
        }

        private double _exch_rate;
        /// <summary>
        /// 汇率
        /// </summary>
        public double exch_rate
        {
            get { return _exch_rate; }

            set
            {
                _exch_rate = value;
                RaisePropertyChanged(() => exch_rate);
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

        private int _stock_acco_no;
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no
        {
            get { return _stock_acco_no; }

            set
            {
                _stock_acco_no = value;
                RaisePropertyChanged(() => stock_acco_no);
            }
        }

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no
        {
            get { return _stock_code_no; }

            set
            {
                _stock_code_no = value;
                RaisePropertyChanged(() => stock_code_no);
            }
        }

        private int _trade_code_no;
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no
        {
            get { return _trade_code_no; }

            set
            {
                _trade_code_no = value;
                RaisePropertyChanged(() => trade_code_no);
            }
        }

        private int _target_code_no;
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no
        {
            get { return _target_code_no; }

            set
            {
                _target_code_no = value;
                RaisePropertyChanged(() => target_code_no);
            }
        }

        private int _stock_type;
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type
        {
            get { return _stock_type; }

            set
            {
                _stock_type = value;
                RaisePropertyChanged(() => stock_type);
            }
        }

        private int _asset_type;
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type
        {
            get { return _asset_type; }

            set
            {
                _asset_type = value;
                RaisePropertyChanged(() => asset_type);
            }
        }

        private double _pre_entry_qty;
        /// <summary>
        /// 待入账数量
        /// </summary>
        public double pre_entry_qty
        {
            get { return _pre_entry_qty; }

            set
            {
                _pre_entry_qty = value;
                RaisePropertyChanged(() => pre_entry_qty);
            }
        }

        private double _pre_entry_amt;
        /// <summary>
        /// 待入账金额
        /// </summary>
        public double pre_entry_amt
        {
            get { return _pre_entry_amt; }

            set
            {
                _pre_entry_amt = value;
                RaisePropertyChanged(() => pre_entry_amt);
            }
        }

        private double _impawn_ratio;
        /// <summary>
        /// 质押比例
        /// </summary>
        public double impawn_ratio
        {
            get { return _impawn_ratio; }

            set
            {
                _impawn_ratio = value;
                RaisePropertyChanged(() => impawn_ratio);
            }
        }

        private double _bond_accr_intrst;
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst
        {
            get { return _bond_accr_intrst; }

            set
            {
                _bond_accr_intrst = value;
                RaisePropertyChanged(() => bond_accr_intrst);
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

        private int _act_record_flag;
        /// <summary>
        /// 账户登记标志
        /// </summary>
        public int act_record_flag
        {
            get { return _act_record_flag; }

            set
            {
                _act_record_flag = value;
                RaisePropertyChanged(() => act_record_flag);
            }
        }

        private int _acco_entry_flag;
        /// <summary>
        /// 账户入账标志
        /// </summary>
        public int acco_entry_flag
        {
            get { return _acco_entry_flag; }

            set
            {
                _acco_entry_flag = value;
                RaisePropertyChanged(() => acco_entry_flag);
            }
        }

        private ulong _entry_money_jour_no;
        /// <summary>
        /// 入账资金流水号
        /// </summary>
        public ulong entry_money_jour_no
        {
            get { return _entry_money_jour_no; }

            set
            {
                _entry_money_jour_no = value;
                RaisePropertyChanged(() => entry_money_jour_no);
            }
        }

        private String _entry_status;
        /// <summary>
        /// 入账状态
        /// </summary>
        public String entry_status
        {
            get { return _entry_status; }

            set
            {
                _entry_status = value;
                RaisePropertyChanged(() => entry_status);
            }
        }

        private int _reg_date;
        /// <summary>
        /// 登记日期
        /// </summary>
        public int reg_date
        {
            get { return _reg_date; }

            set
            {
                _reg_date = value;
                RaisePropertyChanged(() => reg_date);
            }
        }

        private int _arrive_date;
        /// <summary>
        /// 到账日期
        /// </summary>
        public int arrive_date
        {
            get { return _arrive_date; }

            set
            {
                _arrive_date = value;
                RaisePropertyChanged(() => arrive_date);
            }
        }

        private int _begin_trade_date;
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date
        {
            get { return _begin_trade_date; }

            set
            {
                _begin_trade_date = value;
                RaisePropertyChanged(() => begin_trade_date);
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

        private int _src_data_type;
        /// <summary>
        /// 数据来源类型
        /// </summary>
        public int src_data_type
        {
            get { return _src_data_type; }

            set
            {
                _src_data_type = value;
                RaisePropertyChanged(() => src_data_type);
            }
        }
    }

    public class rptL_2_313_Info : ObservableObject
    {
    }

    public class rptL_2_314_Info : ObservableObject
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

        private int _fund_manager_no;
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no
        {
            get { return _fund_manager_no; }

            set
            {
                _fund_manager_no = value;
                RaisePropertyChanged(() => fund_manager_no);
            }
        }

        private String _fund_manager_name;
        /// <summary>
        /// 基金经理名称
        /// </summary>
        public String fund_manager_name
        {
            get { return _fund_manager_name; }

            set
            {
                _fund_manager_name = value;
                RaisePropertyChanged(() => fund_manager_name);
            }
        }

        private int _total_count;
        /// <summary>
        /// 总记录数
        /// </summary>
        public int total_count
        {
            get { return _total_count; }

            set
            {
                _total_count = value;
                RaisePropertyChanged(() => total_count);
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

        private double _warrant_asset;
        /// <summary>
        /// 权证资产
        /// </summary>
        public double warrant_asset
        {
            get { return _warrant_asset; }

            set
            {
                _warrant_asset = value;
                RaisePropertyChanged(() => warrant_asset);
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

        private double _money_fund_asset;
        /// <summary>
        /// 货币基金资产
        /// </summary>
        public double money_fund_asset
        {
            get { return _money_fund_asset; }

            set
            {
                _money_fund_asset = value;
                RaisePropertyChanged(() => money_fund_asset);
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

        private double _buy_amt;
        /// <summary>
        /// 买入金额
        /// </summary>
        public double buy_amt
        {
            get { return _buy_amt; }

            set
            {
                _buy_amt = value;
                RaisePropertyChanged(() => buy_amt);
            }
        }

        private double _sellout_amt;
        /// <summary>
        /// 卖出金额
        /// </summary>
        public double sellout_amt
        {
            get { return _sellout_amt; }

            set
            {
                _sellout_amt = value;
                RaisePropertyChanged(() => sellout_amt);
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

    public class rptL_2_315_Info : ObservableObject
    {
    }

    public class rptL_2_316_Info : ObservableObject
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

        private int _fund_manager_no;
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no
        {
            get { return _fund_manager_no; }

            set
            {
                _fund_manager_no = value;
                RaisePropertyChanged(() => fund_manager_no);
            }
        }

        private String _fund_manager_name;
        /// <summary>
        /// 基金经理名称
        /// </summary>
        public String fund_manager_name
        {
            get { return _fund_manager_name; }

            set
            {
                _fund_manager_name = value;
                RaisePropertyChanged(() => fund_manager_name);
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no
        {
            get { return _stock_code_no; }

            set
            {
                _stock_code_no = value;
                RaisePropertyChanged(() => stock_code_no);
            }
        }

        private int _total_count;
        /// <summary>
        /// 总记录数
        /// </summary>
        public int total_count
        {
            get { return _total_count; }

            set
            {
                _total_count = value;
                RaisePropertyChanged(() => total_count);
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private int _stock_type;
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type
        {
            get { return _stock_type; }

            set
            {
                _stock_type = value;
                RaisePropertyChanged(() => stock_type);
            }
        }

        private int _asset_type;
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type
        {
            get { return _asset_type; }

            set
            {
                _asset_type = value;
                RaisePropertyChanged(() => asset_type);
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

        private double _curr_qty;
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty
        {
            get { return _curr_qty; }

            set
            {
                _curr_qty = value;
                RaisePropertyChanged(() => curr_qty);
            }
        }

        private double _frozen_qty;
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty
        {
            get { return _frozen_qty; }

            set
            {
                _frozen_qty = value;
                RaisePropertyChanged(() => frozen_qty);
            }
        }

        private double _unfroz_qty;
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty
        {
            get { return _unfroz_qty; }

            set
            {
                _unfroz_qty = value;
                RaisePropertyChanged(() => unfroz_qty);
            }
        }

        private double _total_stock_issue;
        /// <summary>
        /// 总股本
        /// </summary>
        public double total_stock_issue
        {
            get { return _total_stock_issue; }

            set
            {
                _total_stock_issue = value;
                RaisePropertyChanged(() => total_stock_issue);
            }
        }

        private double _circl_stock_capit;
        /// <summary>
        /// 流通股本
        /// </summary>
        public double circl_stock_capit
        {
            get { return _circl_stock_capit; }

            set
            {
                _circl_stock_capit = value;
                RaisePropertyChanged(() => circl_stock_capit);
            }
        }

        private double _cost_amt;
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt
        {
            get { return _cost_amt; }

            set
            {
                _cost_amt = value;
                RaisePropertyChanged(() => cost_amt);
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

        private double _intrst_cost_amt;
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt
        {
            get { return _intrst_cost_amt; }

            set
            {
                _intrst_cost_amt = value;
                RaisePropertyChanged(() => intrst_cost_amt);
            }
        }

        private double _intrst_pandl;
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl
        {
            get { return _intrst_pandl; }

            set
            {
                _intrst_pandl = value;
                RaisePropertyChanged(() => intrst_pandl);
            }
        }

        private double _last_price;
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _posi_market_value;
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value
        {
            get { return _posi_market_value; }

            set
            {
                _posi_market_value = value;
                RaisePropertyChanged(() => posi_market_value);
            }
        }

        private double _buy_qty;
        /// <summary>
        /// 买入数量
        /// </summary>
        public double buy_qty
        {
            get { return _buy_qty; }

            set
            {
                _buy_qty = value;
                RaisePropertyChanged(() => buy_qty);
            }
        }

        private double _buy_amt;
        /// <summary>
        /// 买入金额
        /// </summary>
        public double buy_amt
        {
            get { return _buy_amt; }

            set
            {
                _buy_amt = value;
                RaisePropertyChanged(() => buy_amt);
            }
        }

        private double _sell_qty;
        /// <summary>
        /// 卖出数量
        /// </summary>
        public double sell_qty
        {
            get { return _sell_qty; }

            set
            {
                _sell_qty = value;
                RaisePropertyChanged(() => sell_qty);
            }
        }

        private double _sellout_amt;
        /// <summary>
        /// 卖出金额
        /// </summary>
        public double sellout_amt
        {
            get { return _sellout_amt; }

            set
            {
                _sellout_amt = value;
                RaisePropertyChanged(() => sellout_amt);
            }
        }

        private double _quot_strike_qty;
        /// <summary>
        /// 行情成交数量
        /// </summary>
        public double quot_strike_qty
        {
            get { return _quot_strike_qty; }

            set
            {
                _quot_strike_qty = value;
                RaisePropertyChanged(() => quot_strike_qty);
            }
        }

        private double _quot_strike_amt;
        /// <summary>
        /// 行情成交金额
        /// </summary>
        public double quot_strike_amt
        {
            get { return _quot_strike_amt; }

            set
            {
                _quot_strike_amt = value;
                RaisePropertyChanged(() => quot_strike_amt);
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

    public class rptL_2_401_Info : ObservableObject
    {
    }

    public class rptL_2_402_Info : ObservableObject
    {
    }

    public class rptL_2_403_Info : ObservableObject
    {
    }

    public class rptL_2_404_Info : ObservableObject
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

        private ulong _config_no;
        /// <summary>
        /// 配置编号
        /// </summary>
        public ulong config_no
        {
            get { return _config_no; }

            set
            {
                _config_no = value;
                RaisePropertyChanged(() => config_no);
            }
        }

        private String _config_name;
        /// <summary>
        /// 配置名称
        /// </summary>
        public String config_name
        {
            get { return _config_name; }

            set
            {
                _config_name = value;
                RaisePropertyChanged(() => config_name);
            }
        }

        private int _show_order;
        /// <summary>
        /// 显示顺序
        /// </summary>
        public int show_order
        {
            get { return _show_order; }

            set
            {
                _show_order = value;
                RaisePropertyChanged(() => show_order);
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

    public class rptL_2_406_Info : ObservableObject
    {
    }

    public class rptL_2_407_Info : ObservableObject
    {
    }

    public class rptL_2_408_Info : ObservableObject
    {
    }

    public class rptL_2_409_Info : ObservableObject
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

        private String _rpt_add_info;
        /// <summary>
        /// 报告附加信息
        /// </summary>
        public String rpt_add_info
        {
            get { return _rpt_add_info; }

            set
            {
                _rpt_add_info = value;
                RaisePropertyChanged(() => rpt_add_info);
            }
        }
    }

    public class rptL_2_411_Info : ObservableObject
    {
    }

    public class rptL_2_412_Info : ObservableObject
    {
    }

    public class rptL_2_413_Info : ObservableObject
    {
    }

    public class rptL_2_414_Info : ObservableObject
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

        private int _fund_manager_no;
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no
        {
            get { return _fund_manager_no; }

            set
            {
                _fund_manager_no = value;
                RaisePropertyChanged(() => fund_manager_no);
            }
        }

        private String _fund_manager_name;
        /// <summary>
        /// 基金经理名称
        /// </summary>
        public String fund_manager_name
        {
            get { return _fund_manager_name; }

            set
            {
                _fund_manager_name = value;
                RaisePropertyChanged(() => fund_manager_name);
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

    public class rptL_2_416_Info : ObservableObject
    {
    }

    public class rptL_2_417_Info : ObservableObject
    {
    }

    public class rptL_2_418_Info : ObservableObject
    {
    }

    public class rptL_2_419_Info : ObservableObject
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

        private int _fund_manager_no;
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no
        {
            get { return _fund_manager_no; }

            set
            {
                _fund_manager_no = value;
                RaisePropertyChanged(() => fund_manager_no);
            }
        }

        private String _fund_manager_name;
        /// <summary>
        /// 基金经理名称
        /// </summary>
        public String fund_manager_name
        {
            get { return _fund_manager_name; }

            set
            {
                _fund_manager_name = value;
                RaisePropertyChanged(() => fund_manager_name);
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

    public class rptL_2_421_Info : ObservableObject
    {
    }

    public class rptL_2_422_Info : ObservableObject
    {
    }

    public class rptL_2_423_Info : ObservableObject
    {
    }

    public class rptL_2_424_Info : ObservableObject
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

        private int _fund_manager_no;
        /// <summary>
        /// 基金经理编号
        /// </summary>
        public int fund_manager_no
        {
            get { return _fund_manager_no; }

            set
            {
                _fund_manager_no = value;
                RaisePropertyChanged(() => fund_manager_no);
            }
        }

        private String _fund_manager_name;
        /// <summary>
        /// 基金经理名称
        /// </summary>
        public String fund_manager_name
        {
            get { return _fund_manager_name; }

            set
            {
                _fund_manager_name = value;
                RaisePropertyChanged(() => fund_manager_name);
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

    public class rptL_2_425_Info : ObservableObject
    {
    }

    public class rptL_2_426_Info : ObservableObject
    {
    }

    public class rptL_2_428_Info : ObservableObject
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

        private ulong _pass_deli_jour_no;
        /// <summary>
        /// 通道交割流水号
        /// </summary>
        public ulong pass_deli_jour_no
        {
            get { return _pass_deli_jour_no; }

            set
            {
                _pass_deli_jour_no = value;
                RaisePropertyChanged(() => pass_deli_jour_no);
            }
        }

        private int _strike_date;
        /// <summary>
        /// 成交日期
        /// </summary>
        public int strike_date
        {
            get { return _strike_date; }

            set
            {
                _strike_date = value;
                RaisePropertyChanged(() => strike_date);
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

        private int _report_date;
        /// <summary>
        /// 申报日期
        /// </summary>
        public int report_date
        {
            get { return _report_date; }

            set
            {
                _report_date = value;
                RaisePropertyChanged(() => report_date);
            }
        }

        private int _report_time;
        /// <summary>
        /// 申报时间
        /// </summary>
        public int report_time
        {
            get { return _report_time; }

            set
            {
                _report_time = value;
                RaisePropertyChanged(() => report_time);
            }
        }

        private String _report_no;
        /// <summary>
        /// 申报编号
        /// </summary>
        public String report_no
        {
            get { return _report_no; }

            set
            {
                _report_no = value;
                RaisePropertyChanged(() => report_no);
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

        private double _order_price;
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price
        {
            get { return _order_price; }

            set
            {
                _order_price = value;
                RaisePropertyChanged(() => order_price);
            }
        }

        private double _order_qty;
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty
        {
            get { return _order_qty; }

            set
            {
                _order_qty = value;
                RaisePropertyChanged(() => order_qty);
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

        private int _strike_num;
        /// <summary>
        /// 成交笔数
        /// </summary>
        public int strike_num
        {
            get { return _strike_num; }

            set
            {
                _strike_num = value;
                RaisePropertyChanged(() => strike_num);
            }
        }

        private double _entry_end_qty;
        /// <summary>
        /// 入账后数量
        /// </summary>
        public double entry_end_qty
        {
            get { return _entry_end_qty; }

            set
            {
                _entry_end_qty = value;
                RaisePropertyChanged(() => entry_end_qty);
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

        private double _out_all_fee;
        /// <summary>
        /// 外部全部费用
        /// </summary>
        public double out_all_fee
        {
            get { return _out_all_fee; }

            set
            {
                _out_all_fee = value;
                RaisePropertyChanged(() => out_all_fee);
            }
        }

        private double _out_stamp_tax;
        /// <summary>
        /// 外部印花税
        /// </summary>
        public double out_stamp_tax
        {
            get { return _out_stamp_tax; }

            set
            {
                _out_stamp_tax = value;
                RaisePropertyChanged(() => out_stamp_tax);
            }
        }

        private double _out_trans_fee;
        /// <summary>
        /// 外部过户费
        /// </summary>
        public double out_trans_fee
        {
            get { return _out_trans_fee; }

            set
            {
                _out_trans_fee = value;
                RaisePropertyChanged(() => out_trans_fee);
            }
        }

        private double _out_brkage;
        /// <summary>
        /// 外部经手费
        /// </summary>
        public double out_brkage
        {
            get { return _out_brkage; }

            set
            {
                _out_brkage = value;
                RaisePropertyChanged(() => out_brkage);
            }
        }

        private double _out_SEC_charges;
        /// <summary>
        /// 外部证管费
        /// </summary>
        public double out_SEC_charges
        {
            get { return _out_SEC_charges; }

            set
            {
                _out_SEC_charges = value;
                RaisePropertyChanged(() => out_SEC_charges);
            }
        }

        private double _out_other_fee;
        /// <summary>
        /// 外部其他费用
        /// </summary>
        public double out_other_fee
        {
            get { return _out_other_fee; }

            set
            {
                _out_other_fee = value;
                RaisePropertyChanged(() => out_other_fee);
            }
        }

        private double _out_brkage_commis;
        /// <summary>
        /// 外部交易佣金
        /// </summary>
        public double out_brkage_commis
        {
            get { return _out_brkage_commis; }

            set
            {
                _out_brkage_commis = value;
                RaisePropertyChanged(() => out_brkage_commis);
            }
        }

        private double _out_chann_commis;
        /// <summary>
        /// 外部渠道佣金
        /// </summary>
        public double out_chann_commis
        {
            get { return _out_chann_commis; }

            set
            {
                _out_chann_commis = value;
                RaisePropertyChanged(() => out_chann_commis);
            }
        }

        private double _out_divi_commis;
        /// <summary>
        /// 外部分成佣金
        /// </summary>
        public double out_divi_commis
        {
            get { return _out_divi_commis; }

            set
            {
                _out_divi_commis = value;
                RaisePropertyChanged(() => out_divi_commis);
            }
        }

        private double _out_other_commis;
        /// <summary>
        /// 外部其他佣金
        /// </summary>
        public double out_other_commis
        {
            get { return _out_other_commis; }

            set
            {
                _out_other_commis = value;
                RaisePropertyChanged(() => out_other_commis);
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

    public class rptL_2_429_Info : ObservableObject
    {
    }

    public class rptL_2_431_Info : ObservableObject
    {
    }

    public class rptL_2_436_Info : ObservableObject
    {
    }

    public class rptL_2_437_Info : ObservableObject
    {
    }

    public class rptL_2_438_Info : ObservableObject
    {
    }

    public class rptL_2_441_Info : ObservableObject
    {
    }

    public class rptL_2_442_Info : ObservableObject
    {
    }

    public class rptL_2_443_Info : ObservableObject
    {
    }

}
