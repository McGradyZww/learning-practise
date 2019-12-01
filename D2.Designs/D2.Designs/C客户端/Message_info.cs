using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pubL_11_1_Info : ObservableObject
    {
    }

    public class pubL_11_2_Info : ObservableObject
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

        private String _object_zh_name;
        /// <summary>
        /// 对象中文名
        /// </summary>
        public String object_zh_name
        {
            get { return _object_zh_name; }

            set
            {
                _object_zh_name = value;
                RaisePropertyChanged(() => object_zh_name);
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

    public class pubL_11_3_Info : ObservableObject
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

        private String _object_zh_name;
        /// <summary>
        /// 对象中文名
        /// </summary>
        public String object_zh_name
        {
            get { return _object_zh_name; }

            set
            {
                _object_zh_name = value;
                RaisePropertyChanged(() => object_zh_name);
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

    public class pubL_11_6_Info : ObservableObject
    {
    }

    public class pubL_11_7_Info : ObservableObject
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

        private int _task_no;
        /// <summary>
        /// 任务编号
        /// </summary>
        public int task_no
        {
            get { return _task_no; }

            set
            {
                _task_no = value;
                RaisePropertyChanged(() => task_no);
            }
        }

        private String _task_name;
        /// <summary>
        /// 任务名称
        /// </summary>
        public String task_name
        {
            get { return _task_name; }

            set
            {
                _task_name = value;
                RaisePropertyChanged(() => task_name);
            }
        }

        private int _depend_task_no;
        /// <summary>
        /// 依赖任务编号
        /// </summary>
        public int depend_task_no
        {
            get { return _depend_task_no; }

            set
            {
                _depend_task_no = value;
                RaisePropertyChanged(() => depend_task_no);
            }
        }

        private String _task_order;
        /// <summary>
        /// 任务排序
        /// </summary>
        public String task_order
        {
            get { return _task_order; }

            set
            {
                _task_order = value;
                RaisePropertyChanged(() => task_order);
            }
        }

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

        private String _task_strike_rule;
        /// <summary>
        /// 任务执行规则
        /// </summary>
        public String task_strike_rule
        {
            get { return _task_strike_rule; }

            set
            {
                _task_strike_rule = value;
                RaisePropertyChanged(() => task_strike_rule);
            }
        }

        private String _exec_pro;
        /// <summary>
        /// 执行过程
        /// </summary>
        public String exec_pro
        {
            get { return _exec_pro; }

            set
            {
                _exec_pro = value;
                RaisePropertyChanged(() => exec_pro);
            }
        }

        private int _busi_menu_no;
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no
        {
            get { return _busi_menu_no; }

            set
            {
                _busi_menu_no = value;
                RaisePropertyChanged(() => busi_menu_no);
            }
        }

        private String _busi_func_code;
        /// <summary>
        /// 业务功能编码
        /// </summary>
        public String busi_func_code
        {
            get { return _busi_func_code; }

            set
            {
                _busi_func_code = value;
                RaisePropertyChanged(() => busi_func_code);
            }
        }

        private int _exec_date;
        /// <summary>
        /// 执行日期
        /// </summary>
        public int exec_date
        {
            get { return _exec_date; }

            set
            {
                _exec_date = value;
                RaisePropertyChanged(() => exec_date);
            }
        }

        private int _exec_time;
        /// <summary>
        /// 执行时间
        /// </summary>
        public int exec_time
        {
            get { return _exec_time; }

            set
            {
                _exec_time = value;
                RaisePropertyChanged(() => exec_time);
            }
        }

        private int _comple_date;
        /// <summary>
        /// 完成日期
        /// </summary>
        public int comple_date
        {
            get { return _comple_date; }

            set
            {
                _comple_date = value;
                RaisePropertyChanged(() => comple_date);
            }
        }

        private int _comple_time;
        /// <summary>
        /// 完成时间
        /// </summary>
        public int comple_time
        {
            get { return _comple_time; }

            set
            {
                _comple_time = value;
                RaisePropertyChanged(() => comple_time);
            }
        }

        private int _exec_count;
        /// <summary>
        /// 执行次数
        /// </summary>
        public int exec_count
        {
            get { return _exec_count; }

            set
            {
                _exec_count = value;
                RaisePropertyChanged(() => exec_count);
            }
        }

        private String _task_status;
        /// <summary>
        /// 任务状态
        /// </summary>
        public String task_status
        {
            get { return _task_status; }

            set
            {
                _task_status = value;
                RaisePropertyChanged(() => task_status);
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

    public class pubL_11_11_Info : ObservableObject
    {
    }

    public class pubL_11_12_Info : ObservableObject
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

        private int _task_no;
        /// <summary>
        /// 任务编号
        /// </summary>
        public int task_no
        {
            get { return _task_no; }

            set
            {
                _task_no = value;
                RaisePropertyChanged(() => task_no);
            }
        }

        private String _task_name;
        /// <summary>
        /// 任务名称
        /// </summary>
        public String task_name
        {
            get { return _task_name; }

            set
            {
                _task_name = value;
                RaisePropertyChanged(() => task_name);
            }
        }

        private int _depend_task_no;
        /// <summary>
        /// 依赖任务编号
        /// </summary>
        public int depend_task_no
        {
            get { return _depend_task_no; }

            set
            {
                _depend_task_no = value;
                RaisePropertyChanged(() => depend_task_no);
            }
        }

        private String _task_order;
        /// <summary>
        /// 任务排序
        /// </summary>
        public String task_order
        {
            get { return _task_order; }

            set
            {
                _task_order = value;
                RaisePropertyChanged(() => task_order);
            }
        }

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

        private String _task_strike_rule;
        /// <summary>
        /// 任务执行规则
        /// </summary>
        public String task_strike_rule
        {
            get { return _task_strike_rule; }

            set
            {
                _task_strike_rule = value;
                RaisePropertyChanged(() => task_strike_rule);
            }
        }

        private String _exec_pro;
        /// <summary>
        /// 执行过程
        /// </summary>
        public String exec_pro
        {
            get { return _exec_pro; }

            set
            {
                _exec_pro = value;
                RaisePropertyChanged(() => exec_pro);
            }
        }

        private int _busi_menu_no;
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no
        {
            get { return _busi_menu_no; }

            set
            {
                _busi_menu_no = value;
                RaisePropertyChanged(() => busi_menu_no);
            }
        }

        private String _busi_func_code;
        /// <summary>
        /// 业务功能编码
        /// </summary>
        public String busi_func_code
        {
            get { return _busi_func_code; }

            set
            {
                _busi_func_code = value;
                RaisePropertyChanged(() => busi_func_code);
            }
        }

        private int _exec_date;
        /// <summary>
        /// 执行日期
        /// </summary>
        public int exec_date
        {
            get { return _exec_date; }

            set
            {
                _exec_date = value;
                RaisePropertyChanged(() => exec_date);
            }
        }

        private int _exec_time;
        /// <summary>
        /// 执行时间
        /// </summary>
        public int exec_time
        {
            get { return _exec_time; }

            set
            {
                _exec_time = value;
                RaisePropertyChanged(() => exec_time);
            }
        }

        private int _comple_date;
        /// <summary>
        /// 完成日期
        /// </summary>
        public int comple_date
        {
            get { return _comple_date; }

            set
            {
                _comple_date = value;
                RaisePropertyChanged(() => comple_date);
            }
        }

        private int _comple_time;
        /// <summary>
        /// 完成时间
        /// </summary>
        public int comple_time
        {
            get { return _comple_time; }

            set
            {
                _comple_time = value;
                RaisePropertyChanged(() => comple_time);
            }
        }

        private int _exec_count;
        /// <summary>
        /// 执行次数
        /// </summary>
        public int exec_count
        {
            get { return _exec_count; }

            set
            {
                _exec_count = value;
                RaisePropertyChanged(() => exec_count);
            }
        }

        private String _task_status;
        /// <summary>
        /// 任务状态
        /// </summary>
        public String task_status
        {
            get { return _task_status; }

            set
            {
                _task_status = value;
                RaisePropertyChanged(() => task_status);
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

    public class pubL_11_21_Info : ObservableObject
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

        private int _log_level;
        /// <summary>
        /// 日志级别
        /// </summary>
        public int log_level
        {
            get { return _log_level; }

            set
            {
                _log_level = value;
                RaisePropertyChanged(() => log_level);
            }
        }

        private int _target_menu_no;
        /// <summary>
        /// 目标菜单编号
        /// </summary>
        public int target_menu_no
        {
            get { return _target_menu_no; }

            set
            {
                _target_menu_no = value;
                RaisePropertyChanged(() => target_menu_no);
            }
        }

        private String _target_func_code;
        /// <summary>
        /// 目标功能编码
        /// </summary>
        public String target_func_code
        {
            get { return _target_func_code; }

            set
            {
                _target_func_code = value;
                RaisePropertyChanged(() => target_func_code);
            }
        }

        private String _oper_mark;
        /// <summary>
        /// 操作标志
        /// </summary>
        public String oper_mark
        {
            get { return _oper_mark; }

            set
            {
                _oper_mark = value;
                RaisePropertyChanged(() => oper_mark);
            }
        }

        private String _error_code;
        /// <summary>
        /// 错误编码
        /// </summary>
        public String error_code
        {
            get { return _error_code; }

            set
            {
                _error_code = value;
                RaisePropertyChanged(() => error_code);
            }
        }

        private String _error_info;
        /// <summary>
        /// 错误信息
        /// </summary>
        public String error_info
        {
            get { return _error_info; }

            set
            {
                _error_info = value;
                RaisePropertyChanged(() => error_info);
            }
        }
    }

    public class pubL_11_22_Info : ObservableObject
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

        private int _log_level;
        /// <summary>
        /// 日志级别
        /// </summary>
        public int log_level
        {
            get { return _log_level; }

            set
            {
                _log_level = value;
                RaisePropertyChanged(() => log_level);
            }
        }

        private int _target_menu_no;
        /// <summary>
        /// 目标菜单编号
        /// </summary>
        public int target_menu_no
        {
            get { return _target_menu_no; }

            set
            {
                _target_menu_no = value;
                RaisePropertyChanged(() => target_menu_no);
            }
        }

        private String _target_func_code;
        /// <summary>
        /// 目标功能编码
        /// </summary>
        public String target_func_code
        {
            get { return _target_func_code; }

            set
            {
                _target_func_code = value;
                RaisePropertyChanged(() => target_func_code);
            }
        }

        private String _oper_mark;
        /// <summary>
        /// 操作标志
        /// </summary>
        public String oper_mark
        {
            get { return _oper_mark; }

            set
            {
                _oper_mark = value;
                RaisePropertyChanged(() => oper_mark);
            }
        }

        private String _error_code;
        /// <summary>
        /// 错误编码
        /// </summary>
        public String error_code
        {
            get { return _error_code; }

            set
            {
                _error_code = value;
                RaisePropertyChanged(() => error_code);
            }
        }

        private String _error_info;
        /// <summary>
        /// 错误信息
        /// </summary>
        public String error_info
        {
            get { return _error_info; }

            set
            {
                _error_info = value;
                RaisePropertyChanged(() => error_info);
            }
        }
    }

    public class pubL_11_30_Info : ObservableObject
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

        private int _log_level;
        /// <summary>
        /// 日志级别
        /// </summary>
        public int log_level
        {
            get { return _log_level; }

            set
            {
                _log_level = value;
                RaisePropertyChanged(() => log_level);
            }
        }

        private int _exec_date;
        /// <summary>
        /// 执行日期
        /// </summary>
        public int exec_date
        {
            get { return _exec_date; }

            set
            {
                _exec_date = value;
                RaisePropertyChanged(() => exec_date);
            }
        }

        private int _exec_time;
        /// <summary>
        /// 执行时间
        /// </summary>
        public int exec_time
        {
            get { return _exec_time; }

            set
            {
                _exec_time = value;
                RaisePropertyChanged(() => exec_time);
            }
        }

        private int _comple_date;
        /// <summary>
        /// 完成日期
        /// </summary>
        public int comple_date
        {
            get { return _comple_date; }

            set
            {
                _comple_date = value;
                RaisePropertyChanged(() => comple_date);
            }
        }

        private int _comple_time;
        /// <summary>
        /// 完成时间
        /// </summary>
        public int comple_time
        {
            get { return _comple_time; }

            set
            {
                _comple_time = value;
                RaisePropertyChanged(() => comple_time);
            }
        }

        private String _mark_info;
        /// <summary>
        /// 标识信息
        /// </summary>
        public String mark_info
        {
            get { return _mark_info; }

            set
            {
                _mark_info = value;
                RaisePropertyChanged(() => mark_info);
            }
        }

        private int _busi_menu_no;
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no
        {
            get { return _busi_menu_no; }

            set
            {
                _busi_menu_no = value;
                RaisePropertyChanged(() => busi_menu_no);
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

    public class pubL_11_31_Info : ObservableObject
    {
    }

    public class pubL_11_32_Info : ObservableObject
    {
    }

    public class pubL_11_33_Info : ObservableObject
    {

        private ulong _rsp_id;
        /// <summary>
        /// 回报序号
        /// </summary>
        public ulong rsp_id
        {
            get { return _rsp_id; }

            set
            {
                _rsp_id = value;
                RaisePropertyChanged(() => rsp_id);
            }
        }
    }

    public class pubL_11_40_Info : ObservableObject
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

        private int _exception_level;
        /// <summary>
        /// 异常级别
        /// </summary>
        public int exception_level
        {
            get { return _exception_level; }

            set
            {
                _exception_level = value;
                RaisePropertyChanged(() => exception_level);
            }
        }

        private int _moni_server_type;
        /// <summary>
        /// 监控服务类型
        /// </summary>
        public int moni_server_type
        {
            get { return _moni_server_type; }

            set
            {
                _moni_server_type = value;
                RaisePropertyChanged(() => moni_server_type);
            }
        }

        private String _computer_name;
        /// <summary>
        /// 计算机名称
        /// </summary>
        public String computer_name
        {
            get { return _computer_name; }

            set
            {
                _computer_name = value;
                RaisePropertyChanged(() => computer_name);
            }
        }

        private int _proc_no;
        /// <summary>
        /// 进程号
        /// </summary>
        public int proc_no
        {
            get { return _proc_no; }

            set
            {
                _proc_no = value;
                RaisePropertyChanged(() => proc_no);
            }
        }

        private String _proc_path;
        /// <summary>
        /// 进程目录
        /// </summary>
        public String proc_path
        {
            get { return _proc_path; }

            set
            {
                _proc_path = value;
                RaisePropertyChanged(() => proc_path);
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

        private String _deal_info;
        /// <summary>
        /// 处理信息
        /// </summary>
        public String deal_info
        {
            get { return _deal_info; }

            set
            {
                _deal_info = value;
                RaisePropertyChanged(() => deal_info);
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

    public class pubL_11_41_Info : ObservableObject
    {
    }

    public class pubL_11_42_Info : ObservableObject
    {
    }

    public class pubL_11_43_Info : ObservableObject
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

        private int _log_level;
        /// <summary>
        /// 日志级别
        /// </summary>
        public int log_level
        {
            get { return _log_level; }

            set
            {
                _log_level = value;
                RaisePropertyChanged(() => log_level);
            }
        }

        private int _target_menu_no;
        /// <summary>
        /// 目标菜单编号
        /// </summary>
        public int target_menu_no
        {
            get { return _target_menu_no; }

            set
            {
                _target_menu_no = value;
                RaisePropertyChanged(() => target_menu_no);
            }
        }

        private String _target_func_code;
        /// <summary>
        /// 目标功能编码
        /// </summary>
        public String target_func_code
        {
            get { return _target_func_code; }

            set
            {
                _target_func_code = value;
                RaisePropertyChanged(() => target_func_code);
            }
        }

        private String _oper_mark;
        /// <summary>
        /// 操作标志
        /// </summary>
        public String oper_mark
        {
            get { return _oper_mark; }

            set
            {
                _oper_mark = value;
                RaisePropertyChanged(() => oper_mark);
            }
        }

        private String _error_code;
        /// <summary>
        /// 错误编码
        /// </summary>
        public String error_code
        {
            get { return _error_code; }

            set
            {
                _error_code = value;
                RaisePropertyChanged(() => error_code);
            }
        }

        private String _error_info;
        /// <summary>
        /// 错误信息
        /// </summary>
        public String error_info
        {
            get { return _error_info; }

            set
            {
                _error_info = value;
                RaisePropertyChanged(() => error_info);
            }
        }
    }

}
