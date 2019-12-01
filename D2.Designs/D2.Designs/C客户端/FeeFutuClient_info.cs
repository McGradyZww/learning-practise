using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pubL_18_41_Info : ObservableObject
    {

        private int _fee_tmplat_no;
        /// <summary>
        /// 费用模板编号
        /// </summary>
        public int fee_tmplat_no
        {
            get { return _fee_tmplat_no; }

            set
            {
                _fee_tmplat_no = value;
                RaisePropertyChanged(() => fee_tmplat_no);
            }
        }
    }

    public class pubL_18_42_Info : ObservableObject
    {
    }

    public class pubL_18_43_Info : ObservableObject
    {
    }

    public class pubL_18_44_Info : ObservableObject
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

        private int _fee_tmplat_no;
        /// <summary>
        /// 费用模板编号
        /// </summary>
        public int fee_tmplat_no
        {
            get { return _fee_tmplat_no; }

            set
            {
                _fee_tmplat_no = value;
                RaisePropertyChanged(() => fee_tmplat_no);
            }
        }

        private String _fee_tmplat_name;
        /// <summary>
        /// 费用模板名称
        /// </summary>
        public String fee_tmplat_name
        {
            get { return _fee_tmplat_name; }

            set
            {
                _fee_tmplat_name = value;
                RaisePropertyChanged(() => fee_tmplat_name);
            }
        }

        private int _fee_tmplat_kind;
        /// <summary>
        /// 费用模板类别
        /// </summary>
        public int fee_tmplat_kind
        {
            get { return _fee_tmplat_kind; }

            set
            {
                _fee_tmplat_kind = value;
                RaisePropertyChanged(() => fee_tmplat_kind);
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

    public class pubL_18_45_Info : ObservableObject
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

        private int _fee_tmplat_no;
        /// <summary>
        /// 费用模板编号
        /// </summary>
        public int fee_tmplat_no
        {
            get { return _fee_tmplat_no; }

            set
            {
                _fee_tmplat_no = value;
                RaisePropertyChanged(() => fee_tmplat_no);
            }
        }

        private String _fee_tmplat_name;
        /// <summary>
        /// 费用模板名称
        /// </summary>
        public String fee_tmplat_name
        {
            get { return _fee_tmplat_name; }

            set
            {
                _fee_tmplat_name = value;
                RaisePropertyChanged(() => fee_tmplat_name);
            }
        }

        private int _fee_tmplat_kind;
        /// <summary>
        /// 费用模板类别
        /// </summary>
        public int fee_tmplat_kind
        {
            get { return _fee_tmplat_kind; }

            set
            {
                _fee_tmplat_kind = value;
                RaisePropertyChanged(() => fee_tmplat_kind);
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

    public class pubL_18_46_Info : ObservableObject
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

        private int _fee_tmplat_no;
        /// <summary>
        /// 费用模板编号
        /// </summary>
        public int fee_tmplat_no
        {
            get { return _fee_tmplat_no; }

            set
            {
                _fee_tmplat_no = value;
                RaisePropertyChanged(() => fee_tmplat_no);
            }
        }

        private String _fee_tmplat_name;
        /// <summary>
        /// 费用模板名称
        /// </summary>
        public String fee_tmplat_name
        {
            get { return _fee_tmplat_name; }

            set
            {
                _fee_tmplat_name = value;
                RaisePropertyChanged(() => fee_tmplat_name);
            }
        }

        private int _fee_tmplat_kind;
        /// <summary>
        /// 费用模板类别
        /// </summary>
        public int fee_tmplat_kind
        {
            get { return _fee_tmplat_kind; }

            set
            {
                _fee_tmplat_kind = value;
                RaisePropertyChanged(() => fee_tmplat_kind);
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

    public class pubL_18_51_Info : ObservableObject
    {
    }

    public class pubL_18_52_Info : ObservableObject
    {
    }

    public class pubL_18_53_Info : ObservableObject
    {
    }

    public class pubL_18_54_Info : ObservableObject
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

        private int _fee_tmplat_no;
        /// <summary>
        /// 费用模板编号
        /// </summary>
        public int fee_tmplat_no
        {
            get { return _fee_tmplat_no; }

            set
            {
                _fee_tmplat_no = value;
                RaisePropertyChanged(() => fee_tmplat_no);
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

        private int _contrc_type;
        /// <summary>
        /// 合约类型
        /// </summary>
        public int contrc_type
        {
            get { return _contrc_type; }

            set
            {
                _contrc_type = value;
                RaisePropertyChanged(() => contrc_type);
            }
        }

        private int _fee_no;
        /// <summary>
        /// 费用编号
        /// </summary>
        public int fee_no
        {
            get { return _fee_no; }

            set
            {
                _fee_no = value;
                RaisePropertyChanged(() => fee_no);
            }
        }

        private int _futu_fee_type;
        /// <summary>
        /// 期货费用类型
        /// </summary>
        public int futu_fee_type
        {
            get { return _futu_fee_type; }

            set
            {
                _futu_fee_type = value;
                RaisePropertyChanged(() => futu_fee_type);
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

        private int _contrc_dir;
        /// <summary>
        /// 开平方向
        /// </summary>
        public int contrc_dir
        {
            get { return _contrc_dir; }

            set
            {
                _contrc_dir = value;
                RaisePropertyChanged(() => contrc_dir);
            }
        }

        private double _amt_ratio;
        /// <summary>
        /// 金额比例
        /// </summary>
        public double amt_ratio
        {
            get { return _amt_ratio; }

            set
            {
                _amt_ratio = value;
                RaisePropertyChanged(() => amt_ratio);
            }
        }

        private double _amt_value;
        /// <summary>
        /// 金额固定额
        /// </summary>
        public double amt_value
        {
            get { return _amt_value; }

            set
            {
                _amt_value = value;
                RaisePropertyChanged(() => amt_value);
            }
        }

        private double _par_value_ratio;
        /// <summary>
        /// 面值比例
        /// </summary>
        public double par_value_ratio
        {
            get { return _par_value_ratio; }

            set
            {
                _par_value_ratio = value;
                RaisePropertyChanged(() => par_value_ratio);
            }
        }

        private double _par_value_value;
        /// <summary>
        /// 面值固定额
        /// </summary>
        public double par_value_value
        {
            get { return _par_value_value; }

            set
            {
                _par_value_value = value;
                RaisePropertyChanged(() => par_value_value);
            }
        }

        private double _max_fee;
        /// <summary>
        /// 最高费用
        /// </summary>
        public double max_fee
        {
            get { return _max_fee; }

            set
            {
                _max_fee = value;
                RaisePropertyChanged(() => max_fee);
            }
        }

        private double _min_fee;
        /// <summary>
        /// 最低费用
        /// </summary>
        public double min_fee
        {
            get { return _min_fee; }

            set
            {
                _min_fee = value;
                RaisePropertyChanged(() => min_fee);
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

        private int _hedge_type;
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type
        {
            get { return _hedge_type; }

            set
            {
                _hedge_type = value;
                RaisePropertyChanged(() => hedge_type);
            }
        }
    }

    public class pubL_18_55_Info : ObservableObject
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

        private int _contrc_type;
        /// <summary>
        /// 合约类型
        /// </summary>
        public int contrc_type
        {
            get { return _contrc_type; }

            set
            {
                _contrc_type = value;
                RaisePropertyChanged(() => contrc_type);
            }
        }

        private int _fee_tmplat_no;
        /// <summary>
        /// 费用模板编号
        /// </summary>
        public int fee_tmplat_no
        {
            get { return _fee_tmplat_no; }

            set
            {
                _fee_tmplat_no = value;
                RaisePropertyChanged(() => fee_tmplat_no);
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

    public class pubL_18_56_Info : ObservableObject
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

        private int _contrc_type;
        /// <summary>
        /// 合约类型
        /// </summary>
        public int contrc_type
        {
            get { return _contrc_type; }

            set
            {
                _contrc_type = value;
                RaisePropertyChanged(() => contrc_type);
            }
        }

        private int _fee_tmplat_no;
        /// <summary>
        /// 费用模板编号
        /// </summary>
        public int fee_tmplat_no
        {
            get { return _fee_tmplat_no; }

            set
            {
                _fee_tmplat_no = value;
                RaisePropertyChanged(() => fee_tmplat_no);
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

    public class pubL_18_61_Info : ObservableObject
    {
    }

    public class pubL_18_62_Info : ObservableObject
    {
    }

    public class pubL_18_63_Info : ObservableObject
    {
    }

    public class pubL_18_64_Info : ObservableObject
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

        private int _fee_tmplat_no;
        /// <summary>
        /// 费用模板编号
        /// </summary>
        public int fee_tmplat_no
        {
            get { return _fee_tmplat_no; }

            set
            {
                _fee_tmplat_no = value;
                RaisePropertyChanged(() => fee_tmplat_no);
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

        private int _fee_no;
        /// <summary>
        /// 费用编号
        /// </summary>
        public int fee_no
        {
            get { return _fee_no; }

            set
            {
                _fee_no = value;
                RaisePropertyChanged(() => fee_no);
            }
        }

        private int _futu_fee_type;
        /// <summary>
        /// 期货费用类型
        /// </summary>
        public int futu_fee_type
        {
            get { return _futu_fee_type; }

            set
            {
                _futu_fee_type = value;
                RaisePropertyChanged(() => futu_fee_type);
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

        private int _contrc_dir;
        /// <summary>
        /// 开平方向
        /// </summary>
        public int contrc_dir
        {
            get { return _contrc_dir; }

            set
            {
                _contrc_dir = value;
                RaisePropertyChanged(() => contrc_dir);
            }
        }

        private double _amt_ratio;
        /// <summary>
        /// 金额比例
        /// </summary>
        public double amt_ratio
        {
            get { return _amt_ratio; }

            set
            {
                _amt_ratio = value;
                RaisePropertyChanged(() => amt_ratio);
            }
        }

        private double _amt_value;
        /// <summary>
        /// 金额固定额
        /// </summary>
        public double amt_value
        {
            get { return _amt_value; }

            set
            {
                _amt_value = value;
                RaisePropertyChanged(() => amt_value);
            }
        }

        private double _par_value_ratio;
        /// <summary>
        /// 面值比例
        /// </summary>
        public double par_value_ratio
        {
            get { return _par_value_ratio; }

            set
            {
                _par_value_ratio = value;
                RaisePropertyChanged(() => par_value_ratio);
            }
        }

        private double _par_value_value;
        /// <summary>
        /// 面值固定额
        /// </summary>
        public double par_value_value
        {
            get { return _par_value_value; }

            set
            {
                _par_value_value = value;
                RaisePropertyChanged(() => par_value_value);
            }
        }

        private double _max_fee;
        /// <summary>
        /// 最高费用
        /// </summary>
        public double max_fee
        {
            get { return _max_fee; }

            set
            {
                _max_fee = value;
                RaisePropertyChanged(() => max_fee);
            }
        }

        private double _min_fee;
        /// <summary>
        /// 最低费用
        /// </summary>
        public double min_fee
        {
            get { return _min_fee; }

            set
            {
                _min_fee = value;
                RaisePropertyChanged(() => min_fee);
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

        private int _hedge_type;
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type
        {
            get { return _hedge_type; }

            set
            {
                _hedge_type = value;
                RaisePropertyChanged(() => hedge_type);
            }
        }
    }

    public class pubL_18_65_Info : ObservableObject
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

        private int _fee_tmplat_no;
        /// <summary>
        /// 费用模板编号
        /// </summary>
        public int fee_tmplat_no
        {
            get { return _fee_tmplat_no; }

            set
            {
                _fee_tmplat_no = value;
                RaisePropertyChanged(() => fee_tmplat_no);
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

    public class pubL_18_66_Info : ObservableObject
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

        private int _fee_tmplat_no;
        /// <summary>
        /// 费用模板编号
        /// </summary>
        public int fee_tmplat_no
        {
            get { return _fee_tmplat_no; }

            set
            {
                _fee_tmplat_no = value;
                RaisePropertyChanged(() => fee_tmplat_no);
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

    public class pubL_18_71_Info : ObservableObject
    {
    }

    public class pubL_18_72_Info : ObservableObject
    {
    }

    public class pubL_18_73_Info : ObservableObject
    {
    }

    public class pubL_18_74_Info : ObservableObject
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

        private int _futu_code_spec_fee_tmplat_no;
        /// <summary>
        /// 期货代码特殊费用模板编号
        /// </summary>
        public int futu_code_spec_fee_tmplat_no
        {
            get { return _futu_code_spec_fee_tmplat_no; }

            set
            {
                _futu_code_spec_fee_tmplat_no = value;
                RaisePropertyChanged(() => futu_code_spec_fee_tmplat_no);
            }
        }

        private int _futu_type_spec_fee_tmplat_no;
        /// <summary>
        /// 期货类型特殊费用模板编号
        /// </summary>
        public int futu_type_spec_fee_tmplat_no
        {
            get { return _futu_type_spec_fee_tmplat_no; }

            set
            {
                _futu_type_spec_fee_tmplat_no = value;
                RaisePropertyChanged(() => futu_type_spec_fee_tmplat_no);
            }
        }

        private int _futu_code_fee_tmplat_no;
        /// <summary>
        /// 期货代码费用模板编号
        /// </summary>
        public int futu_code_fee_tmplat_no
        {
            get { return _futu_code_fee_tmplat_no; }

            set
            {
                _futu_code_fee_tmplat_no = value;
                RaisePropertyChanged(() => futu_code_fee_tmplat_no);
            }
        }

        private int _futu_type_fee_tmplat_no;
        /// <summary>
        /// 期货类型费用模板编号
        /// </summary>
        public int futu_type_fee_tmplat_no
        {
            get { return _futu_type_fee_tmplat_no; }

            set
            {
                _futu_type_fee_tmplat_no = value;
                RaisePropertyChanged(() => futu_type_fee_tmplat_no);
            }
        }

        private int _futu_code_out_fee_tmplat_no;
        /// <summary>
        /// 期货代码外部费用模板编号
        /// </summary>
        public int futu_code_out_fee_tmplat_no
        {
            get { return _futu_code_out_fee_tmplat_no; }

            set
            {
                _futu_code_out_fee_tmplat_no = value;
                RaisePropertyChanged(() => futu_code_out_fee_tmplat_no);
            }
        }

        private int _futu_type_out_fee_tmplat_no;
        /// <summary>
        /// 期货类型外部费用模板编号
        /// </summary>
        public int futu_type_out_fee_tmplat_no
        {
            get { return _futu_type_out_fee_tmplat_no; }

            set
            {
                _futu_type_out_fee_tmplat_no = value;
                RaisePropertyChanged(() => futu_type_out_fee_tmplat_no);
            }
        }
    }

    public class pubL_18_75_Info : ObservableObject
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

    public class pubL_18_76_Info : ObservableObject
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

    public class pubL_18_144_Info : ObservableObject
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

        private int _contrc_type;
        /// <summary>
        /// 合约类型
        /// </summary>
        public int contrc_type
        {
            get { return _contrc_type; }

            set
            {
                _contrc_type = value;
                RaisePropertyChanged(() => contrc_type);
            }
        }

        private int _fee_no;
        /// <summary>
        /// 费用编号
        /// </summary>
        public int fee_no
        {
            get { return _fee_no; }

            set
            {
                _fee_no = value;
                RaisePropertyChanged(() => fee_no);
            }
        }

        private int _futu_fee_type;
        /// <summary>
        /// 期货费用类型
        /// </summary>
        public int futu_fee_type
        {
            get { return _futu_fee_type; }

            set
            {
                _futu_fee_type = value;
                RaisePropertyChanged(() => futu_fee_type);
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

        private int _contrc_dir;
        /// <summary>
        /// 开平方向
        /// </summary>
        public int contrc_dir
        {
            get { return _contrc_dir; }

            set
            {
                _contrc_dir = value;
                RaisePropertyChanged(() => contrc_dir);
            }
        }

        private double _amt_ratio;
        /// <summary>
        /// 金额比例
        /// </summary>
        public double amt_ratio
        {
            get { return _amt_ratio; }

            set
            {
                _amt_ratio = value;
                RaisePropertyChanged(() => amt_ratio);
            }
        }

        private double _amt_value;
        /// <summary>
        /// 金额固定额
        /// </summary>
        public double amt_value
        {
            get { return _amt_value; }

            set
            {
                _amt_value = value;
                RaisePropertyChanged(() => amt_value);
            }
        }

        private double _par_value_ratio;
        /// <summary>
        /// 面值比例
        /// </summary>
        public double par_value_ratio
        {
            get { return _par_value_ratio; }

            set
            {
                _par_value_ratio = value;
                RaisePropertyChanged(() => par_value_ratio);
            }
        }

        private double _par_value_value;
        /// <summary>
        /// 面值固定额
        /// </summary>
        public double par_value_value
        {
            get { return _par_value_value; }

            set
            {
                _par_value_value = value;
                RaisePropertyChanged(() => par_value_value);
            }
        }

        private double _max_fee;
        /// <summary>
        /// 最高费用
        /// </summary>
        public double max_fee
        {
            get { return _max_fee; }

            set
            {
                _max_fee = value;
                RaisePropertyChanged(() => max_fee);
            }
        }

        private double _min_fee;
        /// <summary>
        /// 最低费用
        /// </summary>
        public double min_fee
        {
            get { return _min_fee; }

            set
            {
                _min_fee = value;
                RaisePropertyChanged(() => min_fee);
            }
        }
    }

    public class pubL_18_154_Info : ObservableObject
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

        private int _fee_no;
        /// <summary>
        /// 费用编号
        /// </summary>
        public int fee_no
        {
            get { return _fee_no; }

            set
            {
                _fee_no = value;
                RaisePropertyChanged(() => fee_no);
            }
        }

        private int _futu_fee_type;
        /// <summary>
        /// 期货费用类型
        /// </summary>
        public int futu_fee_type
        {
            get { return _futu_fee_type; }

            set
            {
                _futu_fee_type = value;
                RaisePropertyChanged(() => futu_fee_type);
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

        private int _contrc_dir;
        /// <summary>
        /// 开平方向
        /// </summary>
        public int contrc_dir
        {
            get { return _contrc_dir; }

            set
            {
                _contrc_dir = value;
                RaisePropertyChanged(() => contrc_dir);
            }
        }

        private double _amt_ratio;
        /// <summary>
        /// 金额比例
        /// </summary>
        public double amt_ratio
        {
            get { return _amt_ratio; }

            set
            {
                _amt_ratio = value;
                RaisePropertyChanged(() => amt_ratio);
            }
        }

        private double _amt_value;
        /// <summary>
        /// 金额固定额
        /// </summary>
        public double amt_value
        {
            get { return _amt_value; }

            set
            {
                _amt_value = value;
                RaisePropertyChanged(() => amt_value);
            }
        }

        private double _par_value_ratio;
        /// <summary>
        /// 面值比例
        /// </summary>
        public double par_value_ratio
        {
            get { return _par_value_ratio; }

            set
            {
                _par_value_ratio = value;
                RaisePropertyChanged(() => par_value_ratio);
            }
        }

        private double _par_value_value;
        /// <summary>
        /// 面值固定额
        /// </summary>
        public double par_value_value
        {
            get { return _par_value_value; }

            set
            {
                _par_value_value = value;
                RaisePropertyChanged(() => par_value_value);
            }
        }

        private double _max_fee;
        /// <summary>
        /// 最高费用
        /// </summary>
        public double max_fee
        {
            get { return _max_fee; }

            set
            {
                _max_fee = value;
                RaisePropertyChanged(() => max_fee);
            }
        }

        private double _min_fee;
        /// <summary>
        /// 最低费用
        /// </summary>
        public double min_fee
        {
            get { return _min_fee; }

            set
            {
                _min_fee = value;
                RaisePropertyChanged(() => min_fee);
            }
        }
    }

    public class pubL_18_203_Info : ObservableObject
    {

        private double _rece_margin;
        /// <summary>
        /// 应收保证金
        /// </summary>
        public double rece_margin
        {
            get { return _rece_margin; }

            set
            {
                _rece_margin = value;
                RaisePropertyChanged(() => rece_margin);
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

        private double _report_fee;
        /// <summary>
        /// 申报费用
        /// </summary>
        public double report_fee
        {
            get { return _report_fee; }

            set
            {
                _report_fee = value;
                RaisePropertyChanged(() => report_fee);
            }
        }

        private double _wtdraw_fee;
        /// <summary>
        /// 撤单费用
        /// </summary>
        public double wtdraw_fee
        {
            get { return _wtdraw_fee; }

            set
            {
                _wtdraw_fee = value;
                RaisePropertyChanged(() => wtdraw_fee);
            }
        }

        private double _deli_fee;
        /// <summary>
        /// 交割费用
        /// </summary>
        public double deli_fee
        {
            get { return _deli_fee; }

            set
            {
                _deli_fee = value;
                RaisePropertyChanged(() => deli_fee);
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
    }

    public class pubL_18_302_Info : ObservableObject
    {

        private int _fee_no;
        /// <summary>
        /// 费用编号
        /// </summary>
        public int fee_no
        {
            get { return _fee_no; }

            set
            {
                _fee_no = value;
                RaisePropertyChanged(() => fee_no);
            }
        }

        private int _futu_fee_type;
        /// <summary>
        /// 期货费用类型
        /// </summary>
        public int futu_fee_type
        {
            get { return _futu_fee_type; }

            set
            {
                _futu_fee_type = value;
                RaisePropertyChanged(() => futu_fee_type);
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

        private int _contrc_dir;
        /// <summary>
        /// 开平方向
        /// </summary>
        public int contrc_dir
        {
            get { return _contrc_dir; }

            set
            {
                _contrc_dir = value;
                RaisePropertyChanged(() => contrc_dir);
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

    public class pubL_18_303_Info : ObservableObject
    {

        private double _margin_ratio;
        /// <summary>
        /// 保证金比例
        /// </summary>
        public double margin_ratio
        {
            get { return _margin_ratio; }

            set
            {
                _margin_ratio = value;
                RaisePropertyChanged(() => margin_ratio);
            }
        }
    }

    public class pubL_18_77_Info : ObservableObject
    {
    }

    public class pubL_18_78_Info : ObservableObject
    {

        private int _fee_tmplat_no;
        /// <summary>
        /// 费用模板编号
        /// </summary>
        public int fee_tmplat_no
        {
            get { return _fee_tmplat_no; }

            set
            {
                _fee_tmplat_no = value;
                RaisePropertyChanged(() => fee_tmplat_no);
            }
        }
    }

}
