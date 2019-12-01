using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pubL_17_8_Info : ObservableObject
    {

        private int _mach_date;
        /// <summary>
        /// 机器日期
        /// </summary>
        public int mach_date
        {
            get { return _mach_date; }

            set
            {
                _mach_date = value;
                RaisePropertyChanged(() => mach_date);
            }
        }

        private int _mach_time;
        /// <summary>
        /// 机器时间
        /// </summary>
        public int mach_time
        {
            get { return _mach_time; }

            set
            {
                _mach_time = value;
                RaisePropertyChanged(() => mach_time);
            }
        }
    }

    public class pubL_17_12_Info : ObservableObject
    {
    }

    public class pubL_17_13_Info : ObservableObject
    {
    }

    public class pubL_17_18_Info : ObservableObject
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

        private String _co_name;
        /// <summary>
        /// 机构名称
        /// </summary>
        public String co_name
        {
            get { return _co_name; }

            set
            {
                _co_name = value;
                RaisePropertyChanged(() => co_name);
            }
        }

        private int _co_type;
        /// <summary>
        /// 机构类型
        /// </summary>
        public int co_type
        {
            get { return _co_type; }

            set
            {
                _co_type = value;
                RaisePropertyChanged(() => co_type);
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

        private String _conta_addr;
        /// <summary>
        /// 联系地址
        /// </summary>
        public String conta_addr
        {
            get { return _conta_addr; }

            set
            {
                _conta_addr = value;
                RaisePropertyChanged(() => conta_addr);
            }
        }

        private String _conta_name;
        /// <summary>
        /// 联系人
        /// </summary>
        public String conta_name
        {
            get { return _conta_name; }

            set
            {
                _conta_name = value;
                RaisePropertyChanged(() => conta_name);
            }
        }

        private String _phone_number;
        /// <summary>
        /// 电话
        /// </summary>
        public String phone_number
        {
            get { return _phone_number; }

            set
            {
                _phone_number = value;
                RaisePropertyChanged(() => phone_number);
            }
        }

        private int _pd_qty_max;
        /// <summary>
        /// 产品数量上限
        /// </summary>
        public int pd_qty_max
        {
            get { return _pd_qty_max; }

            set
            {
                _pd_qty_max = value;
                RaisePropertyChanged(() => pd_qty_max);
            }
        }

        private int _max_acco_count;
        /// <summary>
        /// 账户数量上限
        /// </summary>
        public int max_acco_count
        {
            get { return _max_acco_count; }

            set
            {
                _max_acco_count = value;
                RaisePropertyChanged(() => max_acco_count);
            }
        }

        private int _opor_qty_max;
        /// <summary>
        /// 操作员数量上限
        /// </summary>
        public int opor_qty_max
        {
            get { return _opor_qty_max; }

            set
            {
                _opor_qty_max = value;
                RaisePropertyChanged(() => opor_qty_max);
            }
        }

        private String _co_status;
        /// <summary>
        /// 机构状态
        /// </summary>
        public String co_status
        {
            get { return _co_status; }

            set
            {
                _co_status = value;
                RaisePropertyChanged(() => co_status);
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

        private String _mul_acco_trd_assign_set;
        /// <summary>
        /// 多账户交易分配设置
        /// </summary>
        public String mul_acco_trd_assign_set
        {
            get { return _mul_acco_trd_assign_set; }

            set
            {
                _mul_acco_trd_assign_set = value;
                RaisePropertyChanged(() => mul_acco_trd_assign_set);
            }
        }

        private int _mul_acco_trd_choice;
        /// <summary>
        /// 多账户交易账户选择
        /// </summary>
        public int mul_acco_trd_choice
        {
            get { return _mul_acco_trd_choice; }

            set
            {
                _mul_acco_trd_choice = value;
                RaisePropertyChanged(() => mul_acco_trd_choice);
            }
        }

        private String _mul_acco_trd_qty_set;
        /// <summary>
        /// 多账户交易数量设置
        /// </summary>
        public String mul_acco_trd_qty_set
        {
            get { return _mul_acco_trd_qty_set; }

            set
            {
                _mul_acco_trd_qty_set = value;
                RaisePropertyChanged(() => mul_acco_trd_qty_set);
            }
        }

        private String _genus_algo_strategy_set;
        /// <summary>
        /// 金纳算法策略设置
        /// </summary>
        public String genus_algo_strategy_set
        {
            get { return _genus_algo_strategy_set; }

            set
            {
                _genus_algo_strategy_set = value;
                RaisePropertyChanged(() => genus_algo_strategy_set);
            }
        }

        private String _base_crncy_type;
        /// <summary>
        /// 基础币种
        /// </summary>
        public String base_crncy_type
        {
            get { return _base_crncy_type; }

            set
            {
                _base_crncy_type = value;
                RaisePropertyChanged(() => base_crncy_type);
            }
        }
    }

    public class pubL_17_32_Info : ObservableObject
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

        private int _config_choice_type;
        /// <summary>
        /// 配置选择模式
        /// </summary>
        public int config_choice_type
        {
            get { return _config_choice_type; }

            set
            {
                _config_choice_type = value;
                RaisePropertyChanged(() => config_choice_type);
            }
        }

        private String _config_value;
        /// <summary>
        /// 配置值
        /// </summary>
        public String config_value
        {
            get { return _config_value; }

            set
            {
                _config_value = value;
                RaisePropertyChanged(() => config_value);
            }
        }

        private String _dict_field_name;
        /// <summary>
        /// 字典字段名
        /// </summary>
        public String dict_field_name
        {
            get { return _dict_field_name; }

            set
            {
                _dict_field_name = value;
                RaisePropertyChanged(() => dict_field_name);
            }
        }

        private String _config_memo;
        /// <summary>
        /// 配置说明
        /// </summary>
        public String config_memo
        {
            get { return _config_memo; }

            set
            {
                _config_memo = value;
                RaisePropertyChanged(() => config_memo);
            }
        }
    }

    public class pubL_17_38_Info : ObservableObject
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

        private String _for_crncy_type;
        /// <summary>
        /// 外币币种
        /// </summary>
        public String for_crncy_type
        {
            get { return _for_crncy_type; }

            set
            {
                _for_crncy_type = value;
                RaisePropertyChanged(() => for_crncy_type);
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

        private double _buy_exch_rate;
        /// <summary>
        /// 购汇汇率
        /// </summary>
        public double buy_exch_rate
        {
            get { return _buy_exch_rate; }

            set
            {
                _buy_exch_rate = value;
                RaisePropertyChanged(() => buy_exch_rate);
            }
        }

        private double _sale_exch_rate;
        /// <summary>
        /// 售汇汇率
        /// </summary>
        public double sale_exch_rate
        {
            get { return _sale_exch_rate; }

            set
            {
                _sale_exch_rate = value;
                RaisePropertyChanged(() => sale_exch_rate);
            }
        }
    }

    public class pubL_17_154_Info : ObservableObject
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
    }

    public class pubL_17_155_Info : ObservableObject
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
    }

    public class pubL_17_117_Info : ObservableObject
    {

        private double _sh_hk_buy_ref_rate;
        /// <summary>
        /// 沪港通买入参考汇率
        /// </summary>
        public double sh_hk_buy_ref_rate
        {
            get { return _sh_hk_buy_ref_rate; }

            set
            {
                _sh_hk_buy_ref_rate = value;
                RaisePropertyChanged(() => sh_hk_buy_ref_rate);
            }
        }

        private double _sh_hk_sell_ref_rate;
        /// <summary>
        /// 沪港通卖出参考汇率
        /// </summary>
        public double sh_hk_sell_ref_rate
        {
            get { return _sh_hk_sell_ref_rate; }

            set
            {
                _sh_hk_sell_ref_rate = value;
                RaisePropertyChanged(() => sh_hk_sell_ref_rate);
            }
        }

        private double _sh_hk_settle_buy_rate;
        /// <summary>
        /// 沪港通买入结算汇率
        /// </summary>
        public double sh_hk_settle_buy_rate
        {
            get { return _sh_hk_settle_buy_rate; }

            set
            {
                _sh_hk_settle_buy_rate = value;
                RaisePropertyChanged(() => sh_hk_settle_buy_rate);
            }
        }

        private double _sh_hk_settle_sell_rate;
        /// <summary>
        /// 沪港通卖出结算汇率
        /// </summary>
        public double sh_hk_settle_sell_rate
        {
            get { return _sh_hk_settle_sell_rate; }

            set
            {
                _sh_hk_settle_sell_rate = value;
                RaisePropertyChanged(() => sh_hk_settle_sell_rate);
            }
        }

        private double _sz_hk_buy_ref_rate;
        /// <summary>
        /// 深港通买入参考汇率
        /// </summary>
        public double sz_hk_buy_ref_rate
        {
            get { return _sz_hk_buy_ref_rate; }

            set
            {
                _sz_hk_buy_ref_rate = value;
                RaisePropertyChanged(() => sz_hk_buy_ref_rate);
            }
        }

        private double _sz_hk_sell_ref_rate;
        /// <summary>
        /// 深港通卖出参考汇率
        /// </summary>
        public double sz_hk_sell_ref_rate
        {
            get { return _sz_hk_sell_ref_rate; }

            set
            {
                _sz_hk_sell_ref_rate = value;
                RaisePropertyChanged(() => sz_hk_sell_ref_rate);
            }
        }

        private double _sz_hk_settle_buy_rate;
        /// <summary>
        /// 深港通买入结算汇率
        /// </summary>
        public double sz_hk_settle_buy_rate
        {
            get { return _sz_hk_settle_buy_rate; }

            set
            {
                _sz_hk_settle_buy_rate = value;
                RaisePropertyChanged(() => sz_hk_settle_buy_rate);
            }
        }

        private double _sz_hksettle_sell_rate;
        /// <summary>
        /// 深港通卖出结算汇率
        /// </summary>
        public double sz_hksettle_sell_rate
        {
            get { return _sz_hksettle_sell_rate; }

            set
            {
                _sz_hksettle_sell_rate = value;
                RaisePropertyChanged(() => sz_hksettle_sell_rate);
            }
        }
    }

    public class pubL_17_118_Info : ObservableObject
    {

        private int _update_times;
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times
        {
            get { return _update_times; }

            set
            {
                _update_times = value;
                RaisePropertyChanged(() => update_times);
            }
        }
    }

    public class pubL_17_119_Info : ObservableObject
    {

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

        private double _begin_limit;
        /// <summary>
        /// 当日初始额度
        /// </summary>
        public double begin_limit
        {
            get { return _begin_limit; }

            set
            {
                _begin_limit = value;
                RaisePropertyChanged(() => begin_limit);
            }
        }

        private double _remain_limit;
        /// <summary>
        /// 当日剩余额度
        /// </summary>
        public double remain_limit
        {
            get { return _remain_limit; }

            set
            {
                _remain_limit = value;
                RaisePropertyChanged(() => remain_limit);
            }
        }

        private int _limit_status;
        /// <summary>
        /// 额度状态
        /// </summary>
        public int limit_status
        {
            get { return _limit_status; }

            set
            {
                _limit_status = value;
                RaisePropertyChanged(() => limit_status);
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

        private int _update_times;
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times
        {
            get { return _update_times; }

            set
            {
                _update_times = value;
                RaisePropertyChanged(() => update_times);
            }
        }
    }

    public class pubL_17_180_Info : ObservableObject
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

        private int _dict_no;
        /// <summary>
        /// 字典编号
        /// </summary>
        public int dict_no
        {
            get { return _dict_no; }

            set
            {
                _dict_no = value;
                RaisePropertyChanged(() => dict_no);
            }
        }

        private String _dict_name;
        /// <summary>
        /// 字典名称
        /// </summary>
        public String dict_name
        {
            get { return _dict_name; }

            set
            {
                _dict_name = value;
                RaisePropertyChanged(() => dict_name);
            }
        }

        private String _dict_field_name;
        /// <summary>
        /// 字典字段名
        /// </summary>
        public String dict_field_name
        {
            get { return _dict_field_name; }

            set
            {
                _dict_field_name = value;
                RaisePropertyChanged(() => dict_field_name);
            }
        }

        private String _dict_item_name;
        /// <summary>
        /// 字典项名称
        /// </summary>
        public String dict_item_name
        {
            get { return _dict_item_name; }

            set
            {
                _dict_item_name = value;
                RaisePropertyChanged(() => dict_item_name);
            }
        }

        private String _dict_item_value;
        /// <summary>
        /// 字典项值
        /// </summary>
        public String dict_item_value
        {
            get { return _dict_item_value; }

            set
            {
                _dict_item_value = value;
                RaisePropertyChanged(() => dict_item_value);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class pubL_17_181_Info : ObservableObject
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

        private int _busi_type;
        /// <summary>
        /// 业务类别
        /// </summary>
        public int busi_type
        {
            get { return _busi_type; }

            set
            {
                _busi_type = value;
                RaisePropertyChanged(() => busi_type);
            }
        }

        private int _busi_sub_type;
        /// <summary>
        /// 业务子类
        /// </summary>
        public int busi_sub_type
        {
            get { return _busi_sub_type; }

            set
            {
                _busi_sub_type = value;
                RaisePropertyChanged(() => busi_sub_type);
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

        private String _busi_name;
        /// <summary>
        /// 业务名称
        /// </summary>
        public String busi_name
        {
            get { return _busi_name; }

            set
            {
                _busi_name = value;
                RaisePropertyChanged(() => busi_name);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class pubL_17_182_Info : ObservableObject
    {

        private double _up_limit_price;
        /// <summary>
        /// 涨停价
        /// </summary>
        public double up_limit_price
        {
            get { return _up_limit_price; }

            set
            {
                _up_limit_price = value;
                RaisePropertyChanged(() => up_limit_price);
            }
        }

        private double _down_limit_price;
        /// <summary>
        /// 跌停价
        /// </summary>
        public double down_limit_price
        {
            get { return _down_limit_price; }

            set
            {
                _down_limit_price = value;
                RaisePropertyChanged(() => down_limit_price);
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
    }

    public class pubL_17_120_Info : ObservableObject
    {

        private double _sh_hk_buy_ref_rate;
        /// <summary>
        /// 沪港通买入参考汇率
        /// </summary>
        public double sh_hk_buy_ref_rate
        {
            get { return _sh_hk_buy_ref_rate; }

            set
            {
                _sh_hk_buy_ref_rate = value;
                RaisePropertyChanged(() => sh_hk_buy_ref_rate);
            }
        }

        private double _sh_hk_sell_ref_rate;
        /// <summary>
        /// 沪港通卖出参考汇率
        /// </summary>
        public double sh_hk_sell_ref_rate
        {
            get { return _sh_hk_sell_ref_rate; }

            set
            {
                _sh_hk_sell_ref_rate = value;
                RaisePropertyChanged(() => sh_hk_sell_ref_rate);
            }
        }

        private double _sh_hk_settle_buy_rate;
        /// <summary>
        /// 沪港通买入结算汇率
        /// </summary>
        public double sh_hk_settle_buy_rate
        {
            get { return _sh_hk_settle_buy_rate; }

            set
            {
                _sh_hk_settle_buy_rate = value;
                RaisePropertyChanged(() => sh_hk_settle_buy_rate);
            }
        }

        private double _sh_hk_settle_sell_rate;
        /// <summary>
        /// 沪港通卖出结算汇率
        /// </summary>
        public double sh_hk_settle_sell_rate
        {
            get { return _sh_hk_settle_sell_rate; }

            set
            {
                _sh_hk_settle_sell_rate = value;
                RaisePropertyChanged(() => sh_hk_settle_sell_rate);
            }
        }

        private double _sz_hk_buy_ref_rate;
        /// <summary>
        /// 深港通买入参考汇率
        /// </summary>
        public double sz_hk_buy_ref_rate
        {
            get { return _sz_hk_buy_ref_rate; }

            set
            {
                _sz_hk_buy_ref_rate = value;
                RaisePropertyChanged(() => sz_hk_buy_ref_rate);
            }
        }

        private double _sz_hk_sell_ref_rate;
        /// <summary>
        /// 深港通卖出参考汇率
        /// </summary>
        public double sz_hk_sell_ref_rate
        {
            get { return _sz_hk_sell_ref_rate; }

            set
            {
                _sz_hk_sell_ref_rate = value;
                RaisePropertyChanged(() => sz_hk_sell_ref_rate);
            }
        }

        private double _sz_hk_settle_buy_rate;
        /// <summary>
        /// 深港通买入结算汇率
        /// </summary>
        public double sz_hk_settle_buy_rate
        {
            get { return _sz_hk_settle_buy_rate; }

            set
            {
                _sz_hk_settle_buy_rate = value;
                RaisePropertyChanged(() => sz_hk_settle_buy_rate);
            }
        }

        private double _sz_hksettle_sell_rate;
        /// <summary>
        /// 深港通卖出结算汇率
        /// </summary>
        public double sz_hksettle_sell_rate
        {
            get { return _sz_hksettle_sell_rate; }

            set
            {
                _sz_hksettle_sell_rate = value;
                RaisePropertyChanged(() => sz_hksettle_sell_rate);
            }
        }

        private int _busin_date;
        /// <summary>
        /// 业务日期
        /// </summary>
        public int busin_date
        {
            get { return _busin_date; }

            set
            {
                _busin_date = value;
                RaisePropertyChanged(() => busin_date);
            }
        }

        private double _pboc_rate;
        /// <summary>
        /// 中国人行汇率
        /// </summary>
        public double pboc_rate
        {
            get { return _pboc_rate; }

            set
            {
                _pboc_rate = value;
                RaisePropertyChanged(() => pboc_rate);
            }
        }
    }

    public class pubL_17_121_Info : ObservableObject
    {
    }

    public class pubL_17_122_Info : ObservableObject
    {
    }

    public class pubL_17_123_Info : ObservableObject
    {
    }

    public class pubL_17_124_Info : ObservableObject
    {
    }

    public class pubL_17_125_Info : ObservableObject
    {
    }

    public class pubL_17_126_Info : ObservableObject
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

        private int _comm_trd_type;
        /// <summary>
        /// 指令交易标志
        /// </summary>
        public int comm_trd_type
        {
            get { return _comm_trd_type; }

            set
            {
                _comm_trd_type = value;
                RaisePropertyChanged(() => comm_trd_type);
            }
        }

        private ulong _basket_id;
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id
        {
            get { return _basket_id; }

            set
            {
                _basket_id = value;
                RaisePropertyChanged(() => basket_id);
            }
        }

        private String _basket_name;
        /// <summary>
        /// 篮子名称
        /// </summary>
        public String basket_name
        {
            get { return _basket_name; }

            set
            {
                _basket_name = value;
                RaisePropertyChanged(() => basket_name);
            }
        }

        private double _futu_qty;
        /// <summary>
        /// 期货手数
        /// </summary>
        public double futu_qty
        {
            get { return _futu_qty; }

            set
            {
                _futu_qty = value;
                RaisePropertyChanged(() => futu_qty);
            }
        }

        private double _spot_qty;
        /// <summary>
        /// 现货数量
        /// </summary>
        public double spot_qty
        {
            get { return _spot_qty; }

            set
            {
                _spot_qty = value;
                RaisePropertyChanged(() => spot_qty);
            }
        }

        private double _basket_copies;
        /// <summary>
        /// 篮子份数
        /// </summary>
        public double basket_copies
        {
            get { return _basket_copies; }

            set
            {
                _basket_copies = value;
                RaisePropertyChanged(() => basket_copies);
            }
        }

        private double _remain_copies;
        /// <summary>
        /// 篮子剩余份数
        /// </summary>
        public double remain_copies
        {
            get { return _remain_copies; }

            set
            {
                _remain_copies = value;
                RaisePropertyChanged(() => remain_copies);
            }
        }

        private double _cash_replace_amt;
        /// <summary>
        /// 现金替代金额
        /// </summary>
        public double cash_replace_amt
        {
            get { return _cash_replace_amt; }

            set
            {
                _cash_replace_amt = value;
                RaisePropertyChanged(() => cash_replace_amt);
            }
        }

        private double _hedging_pankou;
        /// <summary>
        /// 对冲盘口
        /// </summary>
        public double hedging_pankou
        {
            get { return _hedging_pankou; }

            set
            {
                _hedging_pankou = value;
                RaisePropertyChanged(() => hedging_pankou);
            }
        }

        private double _name_base_diff;
        /// <summary>
        /// 名义基差
        /// </summary>
        public double name_base_diff
        {
            get { return _name_base_diff; }

            set
            {
                _name_base_diff = value;
                RaisePropertyChanged(() => name_base_diff);
            }
        }

        private double _basket_base_diff;
        /// <summary>
        /// 篮子基差
        /// </summary>
        public double basket_base_diff
        {
            get { return _basket_base_diff; }

            set
            {
                _basket_base_diff = value;
                RaisePropertyChanged(() => basket_base_diff);
            }
        }

        private double _track_base_diff;
        /// <summary>
        /// 跟踪基差
        /// </summary>
        public double track_base_diff
        {
            get { return _track_base_diff; }

            set
            {
                _track_base_diff = value;
                RaisePropertyChanged(() => track_base_diff);
            }
        }

        private int _update_times;
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times
        {
            get { return _update_times; }

            set
            {
                _update_times = value;
                RaisePropertyChanged(() => update_times);
            }
        }
    }

    public class pubL_17_127_Info : ObservableObject
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

        private int _comm_trd_type;
        /// <summary>
        /// 指令交易标志
        /// </summary>
        public int comm_trd_type
        {
            get { return _comm_trd_type; }

            set
            {
                _comm_trd_type = value;
                RaisePropertyChanged(() => comm_trd_type);
            }
        }

        private ulong _basket_id;
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id
        {
            get { return _basket_id; }

            set
            {
                _basket_id = value;
                RaisePropertyChanged(() => basket_id);
            }
        }

        private String _basket_name;
        /// <summary>
        /// 篮子名称
        /// </summary>
        public String basket_name
        {
            get { return _basket_name; }

            set
            {
                _basket_name = value;
                RaisePropertyChanged(() => basket_name);
            }
        }

        private double _futu_qty;
        /// <summary>
        /// 期货手数
        /// </summary>
        public double futu_qty
        {
            get { return _futu_qty; }

            set
            {
                _futu_qty = value;
                RaisePropertyChanged(() => futu_qty);
            }
        }

        private double _spot_qty;
        /// <summary>
        /// 现货数量
        /// </summary>
        public double spot_qty
        {
            get { return _spot_qty; }

            set
            {
                _spot_qty = value;
                RaisePropertyChanged(() => spot_qty);
            }
        }

        private double _basket_copies;
        /// <summary>
        /// 篮子份数
        /// </summary>
        public double basket_copies
        {
            get { return _basket_copies; }

            set
            {
                _basket_copies = value;
                RaisePropertyChanged(() => basket_copies);
            }
        }

        private double _remain_copies;
        /// <summary>
        /// 篮子剩余份数
        /// </summary>
        public double remain_copies
        {
            get { return _remain_copies; }

            set
            {
                _remain_copies = value;
                RaisePropertyChanged(() => remain_copies);
            }
        }

        private double _cash_replace_amt;
        /// <summary>
        /// 现金替代金额
        /// </summary>
        public double cash_replace_amt
        {
            get { return _cash_replace_amt; }

            set
            {
                _cash_replace_amt = value;
                RaisePropertyChanged(() => cash_replace_amt);
            }
        }

        private double _hedging_pankou;
        /// <summary>
        /// 对冲盘口
        /// </summary>
        public double hedging_pankou
        {
            get { return _hedging_pankou; }

            set
            {
                _hedging_pankou = value;
                RaisePropertyChanged(() => hedging_pankou);
            }
        }

        private double _name_base_diff;
        /// <summary>
        /// 名义基差
        /// </summary>
        public double name_base_diff
        {
            get { return _name_base_diff; }

            set
            {
                _name_base_diff = value;
                RaisePropertyChanged(() => name_base_diff);
            }
        }

        private double _basket_base_diff;
        /// <summary>
        /// 篮子基差
        /// </summary>
        public double basket_base_diff
        {
            get { return _basket_base_diff; }

            set
            {
                _basket_base_diff = value;
                RaisePropertyChanged(() => basket_base_diff);
            }
        }

        private double _track_base_diff;
        /// <summary>
        /// 跟踪基差
        /// </summary>
        public double track_base_diff
        {
            get { return _track_base_diff; }

            set
            {
                _track_base_diff = value;
                RaisePropertyChanged(() => track_base_diff);
            }
        }

        private int _update_times;
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times
        {
            get { return _update_times; }

            set
            {
                _update_times = value;
                RaisePropertyChanged(() => update_times);
            }
        }
    }

    public class pubL_17_128_Info : ObservableObject
    {
    }

}
