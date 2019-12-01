using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pubL_19_1_Info : ObservableObject
    {
    }

    public class pubL_19_2_Info : ObservableObject
    {
    }

    public class pubL_19_4_Info : ObservableObject
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

        private String _opor_name;
        /// <summary>
        /// 操作员名称
        /// </summary>
        public String opor_name
        {
            get { return _opor_name; }

            set
            {
                _opor_name = value;
                RaisePropertyChanged(() => opor_name);
            }
        }

        private int _opor_type;
        /// <summary>
        /// 操作员类型
        /// </summary>
        public int opor_type
        {
            get { return _opor_type; }

            set
            {
                _opor_type = value;
                RaisePropertyChanged(() => opor_type);
            }
        }

        private String _opor_pwd;
        /// <summary>
        /// 操作员密码
        /// </summary>
        public String opor_pwd
        {
            get { return _opor_pwd; }

            set
            {
                _opor_pwd = value;
                RaisePropertyChanged(() => opor_pwd);
            }
        }

        private String _opor_status;
        /// <summary>
        /// 操作员状态
        /// </summary>
        public String opor_status
        {
            get { return _opor_status; }

            set
            {
                _opor_status = value;
                RaisePropertyChanged(() => opor_status);
            }
        }

        private int _create_opor;
        /// <summary>
        /// 创建者
        /// </summary>
        public int create_opor
        {
            get { return _create_opor; }

            set
            {
                _create_opor = value;
                RaisePropertyChanged(() => create_opor);
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

        private int _oper_rights;
        /// <summary>
        /// 操作权限
        /// </summary>
        public int oper_rights
        {
            get { return _oper_rights; }

            set
            {
                _oper_rights = value;
                RaisePropertyChanged(() => oper_rights);
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

        private int _is_trader;
        /// <summary>
        /// 是否交易员
        /// </summary>
        public int is_trader
        {
            get { return _is_trader; }

            set
            {
                _is_trader = value;
                RaisePropertyChanged(() => is_trader);
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

        private String _allow_login_type;
        /// <summary>
        /// 允许登录方式
        /// </summary>
        public String allow_login_type
        {
            get { return _allow_login_type; }

            set
            {
                _allow_login_type = value;
                RaisePropertyChanged(() => allow_login_type);
            }
        }

        private String _allow_oper_ip_addr;
        /// <summary>
        /// 允许操作IP
        /// </summary>
        public String allow_oper_ip_addr
        {
            get { return _allow_oper_ip_addr; }

            set
            {
                _allow_oper_ip_addr = value;
                RaisePropertyChanged(() => allow_oper_ip_addr);
            }
        }

        private String _allow_login_mac;
        /// <summary>
        /// 允许登录MAC
        /// </summary>
        public String allow_login_mac
        {
            get { return _allow_login_mac; }

            set
            {
                _allow_login_mac = value;
                RaisePropertyChanged(() => allow_login_mac);
            }
        }

        private String _allow_oper_mac;
        /// <summary>
        /// 允许操作MAC
        /// </summary>
        public String allow_oper_mac
        {
            get { return _allow_oper_mac; }

            set
            {
                _allow_oper_mac = value;
                RaisePropertyChanged(() => allow_oper_mac);
            }
        }

        private String _opor_rights_str;
        /// <summary>
        /// 操作员权限串
        /// </summary>
        public String opor_rights_str
        {
            get { return _opor_rights_str; }

            set
            {
                _opor_rights_str = value;
                RaisePropertyChanged(() => opor_rights_str);
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

        private int _manage_nolgn_opor_orders;
        /// <summary>
        /// 管理非登录操作员订单
        /// </summary>
        public int manage_nolgn_opor_orders
        {
            get { return _manage_nolgn_opor_orders; }

            set
            {
                _manage_nolgn_opor_orders = value;
                RaisePropertyChanged(() => manage_nolgn_opor_orders);
            }
        }
    }

    public class pubL_19_5_Info : ObservableObject
    {
    }

    public class pubL_19_6_Info : ObservableObject
    {
    }

    public class pubL_19_7_Info : ObservableObject
    {
    }

    public class pubL_19_9_Info : ObservableObject
    {
    }

    public class pubL_19_10_Info : ObservableObject
    {
    }

    public class pubL_19_11_Info : ObservableObject
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

        private int _target_opor_no;
        /// <summary>
        /// 目标操作员编号
        /// </summary>
        public int target_opor_no
        {
            get { return _target_opor_no; }

            set
            {
                _target_opor_no = value;
                RaisePropertyChanged(() => target_opor_no);
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

    public class pubL_19_12_Info : ObservableObject
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

        private int _target_opor_no;
        /// <summary>
        /// 目标操作员编号
        /// </summary>
        public int target_opor_no
        {
            get { return _target_opor_no; }

            set
            {
                _target_opor_no = value;
                RaisePropertyChanged(() => target_opor_no);
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

    public class pubL_19_14_Info : ObservableObject
    {

        private int _target_opor_no;
        /// <summary>
        /// 目标操作员编号
        /// </summary>
        public int target_opor_no
        {
            get { return _target_opor_no; }

            set
            {
                _target_opor_no = value;
                RaisePropertyChanged(() => target_opor_no);
            }
        }
    }

    public class pubL_19_15_Info : ObservableObject
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

        private String _opor_name;
        /// <summary>
        /// 操作员名称
        /// </summary>
        public String opor_name
        {
            get { return _opor_name; }

            set
            {
                _opor_name = value;
                RaisePropertyChanged(() => opor_name);
            }
        }

        private String _opor_status;
        /// <summary>
        /// 操作员状态
        /// </summary>
        public String opor_status
        {
            get { return _opor_status; }

            set
            {
                _opor_status = value;
                RaisePropertyChanged(() => opor_status);
            }
        }

        private int _is_trader;
        /// <summary>
        /// 是否交易员
        /// </summary>
        public int is_trader
        {
            get { return _is_trader; }

            set
            {
                _is_trader = value;
                RaisePropertyChanged(() => is_trader);
            }
        }
    }

    public class pubL_19_16_Info : ObservableObject
    {
    }

    public class pubL_19_17_Info : ObservableObject
    {
    }

    public class pubL_19_18_Info : ObservableObject
    {

        private String _allow_oper_mac;
        /// <summary>
        /// 允许操作MAC
        /// </summary>
        public String allow_oper_mac
        {
            get { return _allow_oper_mac; }

            set
            {
                _allow_oper_mac = value;
                RaisePropertyChanged(() => allow_oper_mac);
            }
        }

        private String _opor_rights_str;
        /// <summary>
        /// 操作员权限串
        /// </summary>
        public String opor_rights_str
        {
            get { return _opor_rights_str; }

            set
            {
                _opor_rights_str = value;
                RaisePropertyChanged(() => opor_rights_str);
            }
        }
    }

    public class pubL_19_19_Info : ObservableObject
    {

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
    }

    public class pubL_19_21_Info : ObservableObject
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

        private String _opor_name;
        /// <summary>
        /// 操作员名称
        /// </summary>
        public String opor_name
        {
            get { return _opor_name; }

            set
            {
                _opor_name = value;
                RaisePropertyChanged(() => opor_name);
            }
        }

        private int _opor_type;
        /// <summary>
        /// 操作员类型
        /// </summary>
        public int opor_type
        {
            get { return _opor_type; }

            set
            {
                _opor_type = value;
                RaisePropertyChanged(() => opor_type);
            }
        }

        private int _oper_rights;
        /// <summary>
        /// 操作权限
        /// </summary>
        public int oper_rights
        {
            get { return _oper_rights; }

            set
            {
                _oper_rights = value;
                RaisePropertyChanged(() => oper_rights);
            }
        }

        private int _is_trader;
        /// <summary>
        /// 是否交易员
        /// </summary>
        public int is_trader
        {
            get { return _is_trader; }

            set
            {
                _is_trader = value;
                RaisePropertyChanged(() => is_trader);
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

        private int _login_count;
        /// <summary>
        /// 登录次数
        /// </summary>
        public int login_count
        {
            get { return _login_count; }

            set
            {
                _login_count = value;
                RaisePropertyChanged(() => login_count);
            }
        }

        private int _login_error_count;
        /// <summary>
        /// 登录错误次数
        /// </summary>
        public int login_error_count
        {
            get { return _login_error_count; }

            set
            {
                _login_error_count = value;
                RaisePropertyChanged(() => login_error_count);
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

        private String _last_login_ip;
        /// <summary>
        /// 上次登录IP
        /// </summary>
        public String last_login_ip
        {
            get { return _last_login_ip; }

            set
            {
                _last_login_ip = value;
                RaisePropertyChanged(() => last_login_ip);
            }
        }

        private String _last_login_mac;
        /// <summary>
        /// 上次登录MAC
        /// </summary>
        public String last_login_mac
        {
            get { return _last_login_mac; }

            set
            {
                _last_login_mac = value;
                RaisePropertyChanged(() => last_login_mac);
            }
        }

        private int _last_login_date;
        /// <summary>
        /// 上次登录日期
        /// </summary>
        public int last_login_date
        {
            get { return _last_login_date; }

            set
            {
                _last_login_date = value;
                RaisePropertyChanged(() => last_login_date);
            }
        }

        private int _last_login_time;
        /// <summary>
        /// 上次登录时间
        /// </summary>
        public int last_login_time
        {
            get { return _last_login_time; }

            set
            {
                _last_login_time = value;
                RaisePropertyChanged(() => last_login_time);
            }
        }

        private String _last_oper_info;
        /// <summary>
        /// 上次操作信息
        /// </summary>
        public String last_oper_info
        {
            get { return _last_oper_info; }

            set
            {
                _last_oper_info = value;
                RaisePropertyChanged(() => last_oper_info);
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

        private String _co_busi_config_str;
        /// <summary>
        /// 机构业务控制配置串
        /// </summary>
        public String co_busi_config_str
        {
            get { return _co_busi_config_str; }

            set
            {
                _co_busi_config_str = value;
                RaisePropertyChanged(() => co_busi_config_str);
            }
        }

        private int _change_pwd_flag;
        /// <summary>
        /// 改密标志
        /// </summary>
        public int change_pwd_flag
        {
            get { return _change_pwd_flag; }

            set
            {
                _change_pwd_flag = value;
                RaisePropertyChanged(() => change_pwd_flag);
            }
        }

        private int _sys_type;
        /// <summary>
        /// 系统类型
        /// </summary>
        public int sys_type
        {
            get { return _sys_type; }

            set
            {
                _sys_type = value;
                RaisePropertyChanged(() => sys_type);
            }
        }
    }

    public class pubL_19_22_Info : ObservableObject
    {
    }

    public class pubL_19_31_Info : ObservableObject
    {
    }

    public class pubL_19_32_Info : ObservableObject
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
    }

    public class pubL_19_33_Info : ObservableObject
    {
    }

    public class pubL_19_34_Info : ObservableObject
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

        private String _parent_panel;
        /// <summary>
        /// 父窗体
        /// </summary>
        public String parent_panel
        {
            get { return _parent_panel; }

            set
            {
                _parent_panel = value;
                RaisePropertyChanged(() => parent_panel);
            }
        }

        private String _dbgrid_name;
        /// <summary>
        /// 表格名称
        /// </summary>
        public String dbgrid_name
        {
            get { return _dbgrid_name; }

            set
            {
                _dbgrid_name = value;
                RaisePropertyChanged(() => dbgrid_name);
            }
        }

        private String _dbgrid_key;
        /// <summary>
        /// 表格键值
        /// </summary>
        public String dbgrid_key
        {
            get { return _dbgrid_key; }

            set
            {
                _dbgrid_key = value;
                RaisePropertyChanged(() => dbgrid_key);
            }
        }

        private String _dbgrid_field;
        /// <summary>
        /// 表格字段
        /// </summary>
        public String dbgrid_field
        {
            get { return _dbgrid_field; }

            set
            {
                _dbgrid_field = value;
                RaisePropertyChanged(() => dbgrid_field);
            }
        }

        private int _field_width;
        /// <summary>
        /// 字段宽度
        /// </summary>
        public int field_width
        {
            get { return _field_width; }

            set
            {
                _field_width = value;
                RaisePropertyChanged(() => field_width);
            }
        }

        private int _field_order;
        /// <summary>
        /// 字段列号
        /// </summary>
        public int field_order
        {
            get { return _field_order; }

            set
            {
                _field_order = value;
                RaisePropertyChanged(() => field_order);
            }
        }

        private int _client_type;
        /// <summary>
        /// 客户端类型
        /// </summary>
        public int client_type
        {
            get { return _client_type; }

            set
            {
                _client_type = value;
                RaisePropertyChanged(() => client_type);
            }
        }
    }

    public class pubL_19_45_Info : ObservableObject
    {
    }

    public class pubL_19_46_Info : ObservableObject
    {
    }

    public class pubL_19_48_Info : ObservableObject
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

        private int _oper_rights;
        /// <summary>
        /// 操作权限
        /// </summary>
        public int oper_rights
        {
            get { return _oper_rights; }

            set
            {
                _oper_rights = value;
                RaisePropertyChanged(() => oper_rights);
            }
        }
    }

    public class pubL_19_51_Info : ObservableObject
    {

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
    }

    public class pubL_19_52_Info : ObservableObject
    {
    }

    public class pubL_19_54_Info : ObservableObject
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

        private String _exch_group_code;
        /// <summary>
        /// 交易组编码
        /// </summary>
        public String exch_group_code
        {
            get { return _exch_group_code; }

            set
            {
                _exch_group_code = value;
                RaisePropertyChanged(() => exch_group_code);
            }
        }

        private String _exch_group_name;
        /// <summary>
        /// 交易组名称
        /// </summary>
        public String exch_group_name
        {
            get { return _exch_group_name; }

            set
            {
                _exch_group_name = value;
                RaisePropertyChanged(() => exch_group_name);
            }
        }

        private String _exch_group_status;
        /// <summary>
        /// 交易组状态
        /// </summary>
        public String exch_group_status
        {
            get { return _exch_group_status; }

            set
            {
                _exch_group_status = value;
                RaisePropertyChanged(() => exch_group_status);
            }
        }

        private int _default_group_flag;
        /// <summary>
        /// 默认组标志
        /// </summary>
        public int default_group_flag
        {
            get { return _default_group_flag; }

            set
            {
                _default_group_flag = value;
                RaisePropertyChanged(() => default_group_flag);
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

        private double _exch_group_dist_pd_amt;
        /// <summary>
        /// 分配产品资金
        /// </summary>
        public double exch_group_dist_pd_amt
        {
            get { return _exch_group_dist_pd_amt; }

            set
            {
                _exch_group_dist_pd_amt = value;
                RaisePropertyChanged(() => exch_group_dist_pd_amt);
            }
        }

        private double _exch_group_pd_share;
        /// <summary>
        /// 交易组产品份额
        /// </summary>
        public double exch_group_pd_share
        {
            get { return _exch_group_pd_share; }

            set
            {
                _exch_group_pd_share = value;
                RaisePropertyChanged(() => exch_group_pd_share);
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

        private String _trade_acco;
        /// <summary>
        /// 交易账户
        /// </summary>
        public String trade_acco
        {
            get { return _trade_acco; }

            set
            {
                _trade_acco = value;
                RaisePropertyChanged(() => trade_acco);
            }
        }

        private double _weight_value;
        /// <summary>
        /// 权重值
        /// </summary>
        public double weight_value
        {
            get { return _weight_value; }

            set
            {
                _weight_value = value;
                RaisePropertyChanged(() => weight_value);
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

        private int _futu_default_group_flag;
        /// <summary>
        /// 期货默认组标志
        /// </summary>
        public int futu_default_group_flag
        {
            get { return _futu_default_group_flag; }

            set
            {
                _futu_default_group_flag = value;
                RaisePropertyChanged(() => futu_default_group_flag);
            }
        }

        private int _fina_loan_default_group_flag;
        /// <summary>
        /// 融资融券默认组标志
        /// </summary>
        public int fina_loan_default_group_flag
        {
            get { return _fina_loan_default_group_flag; }

            set
            {
                _fina_loan_default_group_flag = value;
                RaisePropertyChanged(() => fina_loan_default_group_flag);
            }
        }
    }

    public class pubL_19_55_Info : ObservableObject
    {
    }

    public class pubL_19_56_Info : ObservableObject
    {
    }

    public class pubL_19_57_Info : ObservableObject
    {
    }

    public class pubL_19_58_Info : ObservableObject
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

    public class pubL_19_59_Info : ObservableObject
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

    public class pubL_19_60_Info : ObservableObject
    {
    }

    public class pubL_19_73_Info : ObservableObject
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

        private String _exch_group_code;
        /// <summary>
        /// 交易组编码
        /// </summary>
        public String exch_group_code
        {
            get { return _exch_group_code; }

            set
            {
                _exch_group_code = value;
                RaisePropertyChanged(() => exch_group_code);
            }
        }

        private String _exch_group_name;
        /// <summary>
        /// 交易组名称
        /// </summary>
        public String exch_group_name
        {
            get { return _exch_group_name; }

            set
            {
                _exch_group_name = value;
                RaisePropertyChanged(() => exch_group_name);
            }
        }

        private String _exch_group_status;
        /// <summary>
        /// 交易组状态
        /// </summary>
        public String exch_group_status
        {
            get { return _exch_group_status; }

            set
            {
                _exch_group_status = value;
                RaisePropertyChanged(() => exch_group_status);
            }
        }

        private int _default_group_flag;
        /// <summary>
        /// 默认组标志
        /// </summary>
        public int default_group_flag
        {
            get { return _default_group_flag; }

            set
            {
                _default_group_flag = value;
                RaisePropertyChanged(() => default_group_flag);
            }
        }
    }

    public class pubL_19_61_Info : ObservableObject
    {
    }

    public class pubL_19_62_Info : ObservableObject
    {
    }

    public class pubL_19_64_Info : ObservableObject
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

        private int _oper_rights;
        /// <summary>
        /// 操作权限
        /// </summary>
        public int oper_rights
        {
            get { return _oper_rights; }

            set
            {
                _oper_rights = value;
                RaisePropertyChanged(() => oper_rights);
            }
        }
    }

    public class pubL_19_65_Info : ObservableObject
    {

        private int _group_no;
        /// <summary>
        /// 组别编号
        /// </summary>
        public int group_no
        {
            get { return _group_no; }

            set
            {
                _group_no = value;
                RaisePropertyChanged(() => group_no);
            }
        }
    }

    public class pubL_19_66_Info : ObservableObject
    {
    }

    public class pubL_19_67_Info : ObservableObject
    {
    }

    public class pubL_19_68_Info : ObservableObject
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

        private int _group_no;
        /// <summary>
        /// 组别编号
        /// </summary>
        public int group_no
        {
            get { return _group_no; }

            set
            {
                _group_no = value;
                RaisePropertyChanged(() => group_no);
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

        private String _group_name;
        /// <summary>
        /// 组别名称
        /// </summary>
        public String group_name
        {
            get { return _group_name; }

            set
            {
                _group_name = value;
                RaisePropertyChanged(() => group_name);
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

        private int _pd_account_group_type;
        /// <summary>
        /// 产品账户组类型
        /// </summary>
        public int pd_account_group_type
        {
            get { return _pd_account_group_type; }

            set
            {
                _pd_account_group_type = value;
                RaisePropertyChanged(() => pd_account_group_type);
            }
        }
    }

    public class pubL_19_69_Info : ObservableObject
    {
    }

    public class pubL_19_70_Info : ObservableObject
    {
    }

    public class pubL_19_71_Info : ObservableObject
    {
    }

    public class pubL_19_72_Info : ObservableObject
    {

        private int _group_no;
        /// <summary>
        /// 组别编号
        /// </summary>
        public int group_no
        {
            get { return _group_no; }

            set
            {
                _group_no = value;
                RaisePropertyChanged(() => group_no);
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

    public class pubL_19_77_Info : ObservableObject
    {
    }

    public class pubL_19_74_Info : ObservableObject
    {
    }

    public class pubL_19_75_Info : ObservableObject
    {
    }

    public class pubL_19_78_Info : ObservableObject
    {
    }

    public class pubL_19_76_Info : ObservableObject
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

        private int _allow_opor_no;
        /// <summary>
        /// 可操作操作员编号
        /// </summary>
        public int allow_opor_no
        {
            get { return _allow_opor_no; }

            set
            {
                _allow_opor_no = value;
                RaisePropertyChanged(() => allow_opor_no);
            }
        }

        private int _oper_rights;
        /// <summary>
        /// 操作权限
        /// </summary>
        public int oper_rights
        {
            get { return _oper_rights; }

            set
            {
                _oper_rights = value;
                RaisePropertyChanged(() => oper_rights);
            }
        }
    }

    public class pubL_19_89_Info : ObservableObject
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

        private double _total_cash_asset;
        /// <summary>
        /// 总现金资产
        /// </summary>
        public double total_cash_asset
        {
            get { return _total_cash_asset; }

            set
            {
                _total_cash_asset = value;
                RaisePropertyChanged(() => total_cash_asset);
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

        private double _not_money_fund_asset;
        /// <summary>
        /// 非货币基金资产
        /// </summary>
        public double not_money_fund_asset
        {
            get { return _not_money_fund_asset; }

            set
            {
                _not_money_fund_asset = value;
                RaisePropertyChanged(() => not_money_fund_asset);
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

        private double _stock_cash_asset;
        /// <summary>
        /// 证券现金资产
        /// </summary>
        public double stock_cash_asset
        {
            get { return _stock_cash_asset; }

            set
            {
                _stock_cash_asset = value;
                RaisePropertyChanged(() => stock_cash_asset);
            }
        }

        private double _futu_cash_asset;
        /// <summary>
        /// 期货现金资产
        /// </summary>
        public double futu_cash_asset
        {
            get { return _futu_cash_asset; }

            set
            {
                _futu_cash_asset = value;
                RaisePropertyChanged(() => futu_cash_asset);
            }
        }
    }

    public class pubL_19_91_Info : ObservableObject
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

        private double _total_cash_asset;
        /// <summary>
        /// 总现金资产
        /// </summary>
        public double total_cash_asset
        {
            get { return _total_cash_asset; }

            set
            {
                _total_cash_asset = value;
                RaisePropertyChanged(() => total_cash_asset);
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

        private double _not_money_fund_asset;
        /// <summary>
        /// 非货币基金资产
        /// </summary>
        public double not_money_fund_asset
        {
            get { return _not_money_fund_asset; }

            set
            {
                _not_money_fund_asset = value;
                RaisePropertyChanged(() => not_money_fund_asset);
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

        private double _begin_evalu_nav_asset;
        /// <summary>
        /// 期初估值净资产
        /// </summary>
        public double begin_evalu_nav_asset
        {
            get { return _begin_evalu_nav_asset; }

            set
            {
                _begin_evalu_nav_asset = value;
                RaisePropertyChanged(() => begin_evalu_nav_asset);
            }
        }

        private double _evalu_nav_asset;
        /// <summary>
        /// 估值净资产
        /// </summary>
        public double evalu_nav_asset
        {
            get { return _evalu_nav_asset; }

            set
            {
                _evalu_nav_asset = value;
                RaisePropertyChanged(() => evalu_nav_asset);
            }
        }

        private double _futu_long_market_value;
        /// <summary>
        /// 期货多头市值
        /// </summary>
        public double futu_long_market_value
        {
            get { return _futu_long_market_value; }

            set
            {
                _futu_long_market_value = value;
                RaisePropertyChanged(() => futu_long_market_value);
            }
        }

        private double _futu_short_market_value;
        /// <summary>
        /// 期货空头市值
        /// </summary>
        public double futu_short_market_value
        {
            get { return _futu_short_market_value; }

            set
            {
                _futu_short_market_value = value;
                RaisePropertyChanged(() => futu_short_market_value);
            }
        }

        private double _stock_cash_asset;
        /// <summary>
        /// 证券现金资产
        /// </summary>
        public double stock_cash_asset
        {
            get { return _stock_cash_asset; }

            set
            {
                _stock_cash_asset = value;
                RaisePropertyChanged(() => stock_cash_asset);
            }
        }

        private double _futu_cash_asset;
        /// <summary>
        /// 期货现金资产
        /// </summary>
        public double futu_cash_asset
        {
            get { return _futu_cash_asset; }

            set
            {
                _futu_cash_asset = value;
                RaisePropertyChanged(() => futu_cash_asset);
            }
        }
    }

    public class pubL_19_90_Info : ObservableObject
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

        private double _total_cash_asset;
        /// <summary>
        /// 总现金资产
        /// </summary>
        public double total_cash_asset
        {
            get { return _total_cash_asset; }

            set
            {
                _total_cash_asset = value;
                RaisePropertyChanged(() => total_cash_asset);
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

        private double _not_money_fund_asset;
        /// <summary>
        /// 非货币基金资产
        /// </summary>
        public double not_money_fund_asset
        {
            get { return _not_money_fund_asset; }

            set
            {
                _not_money_fund_asset = value;
                RaisePropertyChanged(() => not_money_fund_asset);
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

        private double _futu_long_market_value;
        /// <summary>
        /// 期货多头市值
        /// </summary>
        public double futu_long_market_value
        {
            get { return _futu_long_market_value; }

            set
            {
                _futu_long_market_value = value;
                RaisePropertyChanged(() => futu_long_market_value);
            }
        }

        private double _futu_short_market_value;
        /// <summary>
        /// 期货空头市值
        /// </summary>
        public double futu_short_market_value
        {
            get { return _futu_short_market_value; }

            set
            {
                _futu_short_market_value = value;
                RaisePropertyChanged(() => futu_short_market_value);
            }
        }

        private double _stock_cash_asset;
        /// <summary>
        /// 证券现金资产
        /// </summary>
        public double stock_cash_asset
        {
            get { return _stock_cash_asset; }

            set
            {
                _stock_cash_asset = value;
                RaisePropertyChanged(() => stock_cash_asset);
            }
        }

        private double _futu_cash_asset;
        /// <summary>
        /// 期货现金资产
        /// </summary>
        public double futu_cash_asset
        {
            get { return _futu_cash_asset; }

            set
            {
                _futu_cash_asset = value;
                RaisePropertyChanged(() => futu_cash_asset);
            }
        }
    }

    public class pubL_19_92_Info : ObservableObject
    {

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
    }

    public class pubL_19_93_Info : ObservableObject
    {

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
    }

    public class pubL_19_94_Info : ObservableObject
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
    }

    public class pubL_19_95_Info : ObservableObject
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
    }

    public class pubL_19_202_Info : ObservableObject
    {

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

        private String _opor_name;
        /// <summary>
        /// 操作员名称
        /// </summary>
        public String opor_name
        {
            get { return _opor_name; }

            set
            {
                _opor_name = value;
                RaisePropertyChanged(() => opor_name);
            }
        }
    }

    public class pubL_19_203_Info : ObservableObject
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

        private String _exch_group_code;
        /// <summary>
        /// 交易组编码
        /// </summary>
        public String exch_group_code
        {
            get { return _exch_group_code; }

            set
            {
                _exch_group_code = value;
                RaisePropertyChanged(() => exch_group_code);
            }
        }

        private String _exch_group_name;
        /// <summary>
        /// 交易组名称
        /// </summary>
        public String exch_group_name
        {
            get { return _exch_group_name; }

            set
            {
                _exch_group_name = value;
                RaisePropertyChanged(() => exch_group_name);
            }
        }
    }

    public class pubL_19_900_Info : ObservableObject
    {
    }

    public class pubL_19_901_Info : ObservableObject
    {
    }

    public class pubL_19_902_Info : ObservableObject
    {

        private String _allow_opor_no_str;
        /// <summary>
        /// 可操作操作员编号串
        /// </summary>
        public String allow_opor_no_str
        {
            get { return _allow_opor_no_str; }

            set
            {
                _allow_opor_no_str = value;
                RaisePropertyChanged(() => allow_opor_no_str);
            }
        }
    }

    public class pubL_19_301_Info : ObservableObject
    {
    }

    public class pubL_19_303_Info : ObservableObject
    {
    }

    public class pubL_19_304_Info : ObservableObject
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

        private String _hedg_name;
        /// <summary>
        /// 对冲组合名称
        /// </summary>
        public String hedg_name
        {
            get { return _hedg_name; }

            set
            {
                _hedg_name = value;
                RaisePropertyChanged(() => hedg_name);
            }
        }

        private int _futu_exch_group_no;
        /// <summary>
        /// 期货交易组编号
        /// </summary>
        public int futu_exch_group_no
        {
            get { return _futu_exch_group_no; }

            set
            {
                _futu_exch_group_no = value;
                RaisePropertyChanged(() => futu_exch_group_no);
            }
        }

        private int _futu_asset_acco_no;
        /// <summary>
        /// 期货资产账户编号
        /// </summary>
        public int futu_asset_acco_no
        {
            get { return _futu_asset_acco_no; }

            set
            {
                _futu_asset_acco_no = value;
                RaisePropertyChanged(() => futu_asset_acco_no);
            }
        }

        private int _futu_order_pd_no;
        /// <summary>
        /// 期货产品编号
        /// </summary>
        public int futu_order_pd_no
        {
            get { return _futu_order_pd_no; }

            set
            {
                _futu_order_pd_no = value;
                RaisePropertyChanged(() => futu_order_pd_no);
            }
        }

        private int _secu_exch_group_no;
        /// <summary>
        /// 证券交易组编号
        /// </summary>
        public int secu_exch_group_no
        {
            get { return _secu_exch_group_no; }

            set
            {
                _secu_exch_group_no = value;
                RaisePropertyChanged(() => secu_exch_group_no);
            }
        }

        private int _secu_asset_acco_no;
        /// <summary>
        /// 证券资产账户编号
        /// </summary>
        public int secu_asset_acco_no
        {
            get { return _secu_asset_acco_no; }

            set
            {
                _secu_asset_acco_no = value;
                RaisePropertyChanged(() => secu_asset_acco_no);
            }
        }

        private int _secu_order_pd_no;
        /// <summary>
        /// 证券产品编号
        /// </summary>
        public int secu_order_pd_no
        {
            get { return _secu_order_pd_no; }

            set
            {
                _secu_order_pd_no = value;
                RaisePropertyChanged(() => secu_order_pd_no);
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

    public class pubL_19_401_Info : ObservableObject
    {
    }

    public class pubL_19_402_Info : ObservableObject
    {
    }

    public class pubL_19_403_Info : ObservableObject
    {
    }

    public class pubL_19_404_Info : ObservableObject
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

        private String _hedg_plan_name;
        /// <summary>
        /// 对冲计划名称
        /// </summary>
        public String hedg_plan_name
        {
            get { return _hedg_plan_name; }

            set
            {
                _hedg_plan_name = value;
                RaisePropertyChanged(() => hedg_plan_name);
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

        private int _contrc_code_no;
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no
        {
            get { return _contrc_code_no; }

            set
            {
                _contrc_code_no = value;
                RaisePropertyChanged(() => contrc_code_no);
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

        private int _plan_type;
        /// <summary>
        /// 监控类型
        /// </summary>
        public int plan_type
        {
            get { return _plan_type; }

            set
            {
                _plan_type = value;
                RaisePropertyChanged(() => plan_type);
            }
        }

        private ulong _hedg_no;
        /// <summary>
        /// 对冲组合编号
        /// </summary>
        public ulong hedg_no
        {
            get { return _hedg_no; }

            set
            {
                _hedg_no = value;
                RaisePropertyChanged(() => hedg_no);
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

        private double _futu_price_offset;
        /// <summary>
        /// 期货价格偏移量
        /// </summary>
        public double futu_price_offset
        {
            get { return _futu_price_offset; }

            set
            {
                _futu_price_offset = value;
                RaisePropertyChanged(() => futu_price_offset);
            }
        }

        private double _price_offset;
        /// <summary>
        /// 价格偏移量
        /// </summary>
        public double price_offset
        {
            get { return _price_offset; }

            set
            {
                _price_offset = value;
                RaisePropertyChanged(() => price_offset);
            }
        }

        private double _target_base_diff;
        /// <summary>
        /// 标的基差
        /// </summary>
        public double target_base_diff
        {
            get { return _target_base_diff; }

            set
            {
                _target_base_diff = value;
                RaisePropertyChanged(() => target_base_diff);
            }
        }

        private double _template_base_diff;
        /// <summary>
        /// 模板基差
        /// </summary>
        public double template_base_diff
        {
            get { return _template_base_diff; }

            set
            {
                _template_base_diff = value;
                RaisePropertyChanged(() => template_base_diff);
            }
        }

        private double _up_value_ratio;
        /// <summary>
        /// 现货涨停市值比例
        /// </summary>
        public double up_value_ratio
        {
            get { return _up_value_ratio; }

            set
            {
                _up_value_ratio = value;
                RaisePropertyChanged(() => up_value_ratio);
            }
        }

        private double _down_value_ratio;
        /// <summary>
        /// 现货跌停市值比例
        /// </summary>
        public double down_value_ratio
        {
            get { return _down_value_ratio; }

            set
            {
                _down_value_ratio = value;
                RaisePropertyChanged(() => down_value_ratio);
            }
        }

        private double _stop_value_ratio;
        /// <summary>
        /// 现货停牌市值比例
        /// </summary>
        public double stop_value_ratio
        {
            get { return _stop_value_ratio; }

            set
            {
                _stop_value_ratio = value;
                RaisePropertyChanged(() => stop_value_ratio);
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

    public class pubL_19_501_Info : ObservableObject
    {
    }

    public class pubL_19_502_Info : ObservableObject
    {
    }

    public class pubL_19_503_Info : ObservableObject
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

        private int _allow_opor_no;
        /// <summary>
        /// 可操作操作员编号
        /// </summary>
        public int allow_opor_no
        {
            get { return _allow_opor_no; }

            set
            {
                _allow_opor_no = value;
                RaisePropertyChanged(() => allow_opor_no);
            }
        }
    }

    public class pubL_19_504_Info : ObservableObject
    {

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
    }

    public class pubL_19_505_Info : ObservableObject
    {
    }

    public class pubL_19_506_Info : ObservableObject
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

    public class pubL_19_507_Info : ObservableObject
    {
    }

    public class pubL_19_508_Info : ObservableObject
    {
    }

    public class pubL_19_96_Info : ObservableObject
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

        private String _exch_group_code;
        /// <summary>
        /// 交易组编码
        /// </summary>
        public String exch_group_code
        {
            get { return _exch_group_code; }

            set
            {
                _exch_group_code = value;
                RaisePropertyChanged(() => exch_group_code);
            }
        }

        private String _exch_group_name;
        /// <summary>
        /// 交易组名称
        /// </summary>
        public String exch_group_name
        {
            get { return _exch_group_name; }

            set
            {
                _exch_group_name = value;
                RaisePropertyChanged(() => exch_group_name);
            }
        }

        private String _exch_group_status;
        /// <summary>
        /// 交易组状态
        /// </summary>
        public String exch_group_status
        {
            get { return _exch_group_status; }

            set
            {
                _exch_group_status = value;
                RaisePropertyChanged(() => exch_group_status);
            }
        }

        private int _default_group_flag;
        /// <summary>
        /// 默认组标志
        /// </summary>
        public int default_group_flag
        {
            get { return _default_group_flag; }

            set
            {
                _default_group_flag = value;
                RaisePropertyChanged(() => default_group_flag);
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

        private double _exch_group_dist_pd_amt;
        /// <summary>
        /// 分配产品资金
        /// </summary>
        public double exch_group_dist_pd_amt
        {
            get { return _exch_group_dist_pd_amt; }

            set
            {
                _exch_group_dist_pd_amt = value;
                RaisePropertyChanged(() => exch_group_dist_pd_amt);
            }
        }

        private double _exch_group_pd_share;
        /// <summary>
        /// 交易组产品份额
        /// </summary>
        public double exch_group_pd_share
        {
            get { return _exch_group_pd_share; }

            set
            {
                _exch_group_pd_share = value;
                RaisePropertyChanged(() => exch_group_pd_share);
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

        private String _trade_acco;
        /// <summary>
        /// 交易账户
        /// </summary>
        public String trade_acco
        {
            get { return _trade_acco; }

            set
            {
                _trade_acco = value;
                RaisePropertyChanged(() => trade_acco);
            }
        }

        private double _weight_value;
        /// <summary>
        /// 权重值
        /// </summary>
        public double weight_value
        {
            get { return _weight_value; }

            set
            {
                _weight_value = value;
                RaisePropertyChanged(() => weight_value);
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

        private int _futu_default_group_flag;
        /// <summary>
        /// 期货默认组标志
        /// </summary>
        public int futu_default_group_flag
        {
            get { return _futu_default_group_flag; }

            set
            {
                _futu_default_group_flag = value;
                RaisePropertyChanged(() => futu_default_group_flag);
            }
        }

        private int _fina_loan_default_group_flag;
        /// <summary>
        /// 融资融券默认组标志
        /// </summary>
        public int fina_loan_default_group_flag
        {
            get { return _fina_loan_default_group_flag; }

            set
            {
                _fina_loan_default_group_flag = value;
                RaisePropertyChanged(() => fina_loan_default_group_flag);
            }
        }
    }

}
