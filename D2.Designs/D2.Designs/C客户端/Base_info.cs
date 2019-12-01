using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pubL_3_1_Info : ObservableObject
    {
    }

    public class pubL_3_2_Info : ObservableObject
    {
    }

    public class pubL_3_3_Info : ObservableObject
    {
    }

    public class pubL_3_4_Info : ObservableObject
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

        private String _sys_name;
        /// <summary>
        /// 系统名称
        /// </summary>
        public String sys_name
        {
            get { return _sys_name; }

            set
            {
                _sys_name = value;
                RaisePropertyChanged(() => sys_name);
            }
        }

        private String _sys_status;
        /// <summary>
        /// 系统状态
        /// </summary>
        public String sys_status
        {
            get { return _sys_status; }

            set
            {
                _sys_status = value;
                RaisePropertyChanged(() => sys_status);
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

        private String _no_exch_date_str;
        /// <summary>
        /// 非交易日期串
        /// </summary>
        public String no_exch_date_str
        {
            get { return _no_exch_date_str; }

            set
            {
                _no_exch_date_str = value;
                RaisePropertyChanged(() => no_exch_date_str);
            }
        }

        private int _allow_next_init_time;
        /// <summary>
        /// 允许次日初始化时间
        /// </summary>
        public int allow_next_init_time
        {
            get { return _allow_next_init_time; }

            set
            {
                _allow_next_init_time = value;
                RaisePropertyChanged(() => allow_next_init_time);
            }
        }

        private String _sys_config_str;
        /// <summary>
        /// 系统控制配置串
        /// </summary>
        public String sys_config_str
        {
            get { return _sys_config_str; }

            set
            {
                _sys_config_str = value;
                RaisePropertyChanged(() => sys_config_str);
            }
        }

        private String _client_version;
        /// <summary>
        /// 客户端版本
        /// </summary>
        public String client_version
        {
            get { return _client_version; }

            set
            {
                _client_version = value;
                RaisePropertyChanged(() => client_version);
            }
        }

        private String _manage_ver;
        /// <summary>
        /// 管理端版本
        /// </summary>
        public String manage_ver
        {
            get { return _manage_ver; }

            set
            {
                _manage_ver = value;
                RaisePropertyChanged(() => manage_ver);
            }
        }

        private String _admin_ver;
        /// <summary>
        /// 运维端版本
        /// </summary>
        public String admin_ver
        {
            get { return _admin_ver; }

            set
            {
                _admin_ver = value;
                RaisePropertyChanged(() => admin_ver);
            }
        }

        private String _update_addr;
        /// <summary>
        /// 更新地址
        /// </summary>
        public String update_addr
        {
            get { return _update_addr; }

            set
            {
                _update_addr = value;
                RaisePropertyChanged(() => update_addr);
            }
        }

        private String _dnload_addr;
        /// <summary>
        /// 下载地址
        /// </summary>
        public String dnload_addr
        {
            get { return _dnload_addr; }

            set
            {
                _dnload_addr = value;
                RaisePropertyChanged(() => dnload_addr);
            }
        }
    }

    public class pubL_3_5_Info : ObservableObject
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

        private String _jour_occur_info;
        /// <summary>
        /// 流水变动信息
        /// </summary>
        public String jour_occur_info
        {
            get { return _jour_occur_info; }

            set
            {
                _jour_occur_info = value;
                RaisePropertyChanged(() => jour_occur_info);
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

    public class pubL_3_6_Info : ObservableObject
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

        private String _jour_occur_info;
        /// <summary>
        /// 流水变动信息
        /// </summary>
        public String jour_occur_info
        {
            get { return _jour_occur_info; }

            set
            {
                _jour_occur_info = value;
                RaisePropertyChanged(() => jour_occur_info);
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

    public class pubL_3_7_Info : ObservableObject
    {
    }

    public class pubL_3_8_Info : ObservableObject
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

    public class pubL_3_11_Info : ObservableObject
    {
    }

    public class pubL_3_12_Info : ObservableObject
    {
    }

    public class pubL_3_14_Info : ObservableObject
    {
    }

    public class pubL_3_15_Info : ObservableObject
    {
    }

    public class pubL_3_16_Info : ObservableObject
    {
    }

    public class pubL_3_18_Info : ObservableObject
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

        private String _co_flname;
        /// <summary>
        /// 机构全称
        /// </summary>
        public String co_flname
        {
            get { return _co_flname; }

            set
            {
                _co_flname = value;
                RaisePropertyChanged(() => co_flname);
            }
        }

        private String _reg_code;
        /// <summary>
        /// 登记编号
        /// </summary>
        public String reg_code
        {
            get { return _reg_code; }

            set
            {
                _reg_code = value;
                RaisePropertyChanged(() => reg_code);
            }
        }

        private String _reg_addr;
        /// <summary>
        /// 注册地
        /// </summary>
        public String reg_addr
        {
            get { return _reg_addr; }

            set
            {
                _reg_addr = value;
                RaisePropertyChanged(() => reg_addr);
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

        private String _email;
        /// <summary>
        /// EMAIL
        /// </summary>
        public String email
        {
            get { return _email; }

            set
            {
                _email = value;
                RaisePropertyChanged(() => email);
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

    public class pubL_3_19_Info : ObservableObject
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

    public class pubL_3_20_Info : ObservableObject
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

    public class pubL_3_21_Info : ObservableObject
    {

        private int _record_count;
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count
        {
            get { return _record_count; }

            set
            {
                _record_count = value;
                RaisePropertyChanged(() => record_count);
            }
        }
    }

    public class pubL_3_22_Info : ObservableObject
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
    }

    public class pubL_3_17_Info : ObservableObject
    {
    }

    public class pubL_3_23_Info : ObservableObject
    {
    }

    public class pubL_3_24_Info : ObservableObject
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
    }

    public class pubL_3_31_Info : ObservableObject
    {
    }

    public class pubL_3_32_Info : ObservableObject
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

    public class pubL_3_33_Info : ObservableObject
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

    public class pubL_3_34_Info : ObservableObject
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

    public class pubL_3_35_Info : ObservableObject
    {
    }

    public class pubL_3_36_Info : ObservableObject
    {
    }

    public class pubL_3_37_Info : ObservableObject
    {
    }

    public class pubL_3_38_Info : ObservableObject
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

    public class pubL_3_39_Info : ObservableObject
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

    public class pubL_3_40_Info : ObservableObject
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

    public class pubL_3_41_Info : ObservableObject
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

        private double _buy_ref_rate;
        /// <summary>
        /// 买入参考汇率
        /// </summary>
        public double buy_ref_rate
        {
            get { return _buy_ref_rate; }

            set
            {
                _buy_ref_rate = value;
                RaisePropertyChanged(() => buy_ref_rate);
            }
        }

        private double _sell_ref_rate;
        /// <summary>
        /// 卖出参考汇率
        /// </summary>
        public double sell_ref_rate
        {
            get { return _sell_ref_rate; }

            set
            {
                _sell_ref_rate = value;
                RaisePropertyChanged(() => sell_ref_rate);
            }
        }

        private double _settle_buy_rate;
        /// <summary>
        /// 买入结算汇率
        /// </summary>
        public double settle_buy_rate
        {
            get { return _settle_buy_rate; }

            set
            {
                _settle_buy_rate = value;
                RaisePropertyChanged(() => settle_buy_rate);
            }
        }

        private double _settle_sell_rate;
        /// <summary>
        /// 卖出结算汇率
        /// </summary>
        public double settle_sell_rate
        {
            get { return _settle_sell_rate; }

            set
            {
                _settle_sell_rate = value;
                RaisePropertyChanged(() => settle_sell_rate);
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

    public class pubL_3_42_Info : ObservableObject
    {
    }

    public class pubL_3_43_Info : ObservableObject
    {
    }

    public class pubL_3_44_Info : ObservableObject
    {
    }

    public class pubL_3_104_Info : ObservableObject
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

        private String _exch_name;
        /// <summary>
        /// 市场名称
        /// </summary>
        public String exch_name
        {
            get { return _exch_name; }

            set
            {
                _exch_name = value;
                RaisePropertyChanged(() => exch_name);
            }
        }

        private String _exch_code;
        /// <summary>
        /// 市场代码
        /// </summary>
        public String exch_code
        {
            get { return _exch_code; }

            set
            {
                _exch_code = value;
                RaisePropertyChanged(() => exch_code);
            }
        }

        private int _exch_type;
        /// <summary>
        /// 市场类别
        /// </summary>
        public int exch_type
        {
            get { return _exch_type; }

            set
            {
                _exch_type = value;
                RaisePropertyChanged(() => exch_type);
            }
        }

        private String _distric;
        /// <summary>
        /// 地区
        /// </summary>
        public String distric
        {
            get { return _distric; }

            set
            {
                _distric = value;
                RaisePropertyChanged(() => distric);
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

        private int _exch_status;
        /// <summary>
        /// 市场状态
        /// </summary>
        public int exch_status
        {
            get { return _exch_status; }

            set
            {
                _exch_status = value;
                RaisePropertyChanged(() => exch_status);
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

        private int _time_lag;
        /// <summary>
        /// 时区时差
        /// </summary>
        public int time_lag
        {
            get { return _time_lag; }

            set
            {
                _time_lag = value;
                RaisePropertyChanged(() => time_lag);
            }
        }

        private String _no_exch_date_str;
        /// <summary>
        /// 非交易日期串
        /// </summary>
        public String no_exch_date_str
        {
            get { return _no_exch_date_str; }

            set
            {
                _no_exch_date_str = value;
                RaisePropertyChanged(() => no_exch_date_str);
            }
        }

        private int _allow_next_init_time;
        /// <summary>
        /// 允许次日初始化时间
        /// </summary>
        public int allow_next_init_time
        {
            get { return _allow_next_init_time; }

            set
            {
                _allow_next_init_time = value;
                RaisePropertyChanged(() => allow_next_init_time);
            }
        }

        private String _no_settle_date_str;
        /// <summary>
        /// 非交收日期串
        /// </summary>
        public String no_settle_date_str
        {
            get { return _no_settle_date_str; }

            set
            {
                _no_settle_date_str = value;
                RaisePropertyChanged(() => no_settle_date_str);
            }
        }
    }

    public class pubL_3_105_Info : ObservableObject
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

        private String _jour_occur_info;
        /// <summary>
        /// 流水变动信息
        /// </summary>
        public String jour_occur_info
        {
            get { return _jour_occur_info; }

            set
            {
                _jour_occur_info = value;
                RaisePropertyChanged(() => jour_occur_info);
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

    public class pubL_3_106_Info : ObservableObject
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

        private String _jour_occur_info;
        /// <summary>
        /// 流水变动信息
        /// </summary>
        public String jour_occur_info
        {
            get { return _jour_occur_info; }

            set
            {
                _jour_occur_info = value;
                RaisePropertyChanged(() => jour_occur_info);
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

    public class pubL_3_107_Info : ObservableObject
    {
    }

    public class pubL_3_108_Info : ObservableObject
    {
    }

    public class pubL_3_111_Info : ObservableObject
    {
    }

    public class pubL_3_113_Info : ObservableObject
    {
    }

    public class pubL_3_114_Info : ObservableObject
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

        private int _allow_wtdraw_flag;
        /// <summary>
        /// 允许撤单
        /// </summary>
        public int allow_wtdraw_flag
        {
            get { return _allow_wtdraw_flag; }

            set
            {
                _allow_wtdraw_flag = value;
                RaisePropertyChanged(() => allow_wtdraw_flag);
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

    public class pubL_3_115_Info : ObservableObject
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

        private int _allow_wtdraw_flag;
        /// <summary>
        /// 允许撤单
        /// </summary>
        public int allow_wtdraw_flag
        {
            get { return _allow_wtdraw_flag; }

            set
            {
                _allow_wtdraw_flag = value;
                RaisePropertyChanged(() => allow_wtdraw_flag);
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

    public class pubL_3_116_Info : ObservableObject
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

        private int _allow_wtdraw_flag;
        /// <summary>
        /// 允许撤单
        /// </summary>
        public int allow_wtdraw_flag
        {
            get { return _allow_wtdraw_flag; }

            set
            {
                _allow_wtdraw_flag = value;
                RaisePropertyChanged(() => allow_wtdraw_flag);
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

    public class pubL_3_117_Info : ObservableObject
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

    public class pubL_3_118_Info : ObservableObject
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
    }

    public class pubL_3_150_Info : ObservableObject
    {
    }

    public class pubL_3_151_Info : ObservableObject
    {
    }

    public class pubL_3_152_Info : ObservableObject
    {
    }

    public class pubL_3_153_Info : ObservableObject
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

        private String _pass_name;
        /// <summary>
        /// 通道名称
        /// </summary>
        public String pass_name
        {
            get { return _pass_name; }

            set
            {
                _pass_name = value;
                RaisePropertyChanged(() => pass_name);
            }
        }

        private String _config_file;
        /// <summary>
        /// 配置文件名
        /// </summary>
        public String config_file
        {
            get { return _config_file; }

            set
            {
                _config_file = value;
                RaisePropertyChanged(() => config_file);
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

        private int _bond_qty_unit_set;
        /// <summary>
        /// 债券数量单位配置
        /// </summary>
        public int bond_qty_unit_set
        {
            get { return _bond_qty_unit_set; }

            set
            {
                _bond_qty_unit_set = value;
                RaisePropertyChanged(() => bond_qty_unit_set);
            }
        }

        private int _hk_cash_avail_date_type;
        /// <summary>
        /// 港股通资金可用日期
        /// </summary>
        public int hk_cash_avail_date_type
        {
            get { return _hk_cash_avail_date_type; }

            set
            {
                _hk_cash_avail_date_type = value;
                RaisePropertyChanged(() => hk_cash_avail_date_type);
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

    public class pubL_3_154_Info : ObservableObject
    {
    }

    public class pubL_3_155_Info : ObservableObject
    {
    }

    public class pubL_3_180_Info : ObservableObject
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

    public class pubL_3_181_Info : ObservableObject
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

    public class pubL_3_201_Info : ObservableObject
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

    public class pubL_3_202_Info : ObservableObject
    {
    }

    public class pubL_3_203_Info : ObservableObject
    {
    }

    public class pubL_3_210_Info : ObservableObject
    {
    }

    public class pubL_3_204_Info : ObservableObject
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

        private String _pass_name;
        /// <summary>
        /// 通道名称
        /// </summary>
        public String pass_name
        {
            get { return _pass_name; }

            set
            {
                _pass_name = value;
                RaisePropertyChanged(() => pass_name);
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

        private String _trans_name;
        /// <summary>
        /// 报盘名称
        /// </summary>
        public String trans_name
        {
            get { return _trans_name; }

            set
            {
                _trans_name = value;
                RaisePropertyChanged(() => trans_name);
            }
        }

        private String _trans_node_name;
        /// <summary>
        /// 报盘节点名称
        /// </summary>
        public String trans_node_name
        {
            get { return _trans_node_name; }

            set
            {
                _trans_node_name = value;
                RaisePropertyChanged(() => trans_node_name);
            }
        }

        private int _trans_create_date;
        /// <summary>
        /// 报盘创建日期
        /// </summary>
        public int trans_create_date
        {
            get { return _trans_create_date; }

            set
            {
                _trans_create_date = value;
                RaisePropertyChanged(() => trans_create_date);
            }
        }

        private String _trans_server_name;
        /// <summary>
        /// 报盘服务机器名称
        /// </summary>
        public String trans_server_name
        {
            get { return _trans_server_name; }

            set
            {
                _trans_server_name = value;
                RaisePropertyChanged(() => trans_server_name);
            }
        }

        private String _trans_server_ip;
        /// <summary>
        /// 报盘服务机器IP
        /// </summary>
        public String trans_server_ip
        {
            get { return _trans_server_ip; }

            set
            {
                _trans_server_ip = value;
                RaisePropertyChanged(() => trans_server_ip);
            }
        }

        private int _trans_server_port;
        /// <summary>
        /// 报盘服务机器端口
        /// </summary>
        public int trans_server_port
        {
            get { return _trans_server_port; }

            set
            {
                _trans_server_port = value;
                RaisePropertyChanged(() => trans_server_port);
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

}
