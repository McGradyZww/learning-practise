using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class prodL_4_1_Info : ObservableObject
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

        private double _pd_dist_amt;
        /// <summary>
        /// 产品已分配金额
        /// </summary>
        public double pd_dist_amt
        {
            get { return _pd_dist_amt; }

            set
            {
                _pd_dist_amt = value;
                RaisePropertyChanged(() => pd_dist_amt);
            }
        }

        private double _pd_auth_amt;
        /// <summary>
        /// 产品已授权金额
        /// </summary>
        public double pd_auth_amt
        {
            get { return _pd_auth_amt; }

            set
            {
                _pd_auth_amt = value;
                RaisePropertyChanged(() => pd_auth_amt);
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

        private double _total_pre_fee;
        /// <summary>
        /// 累计计提费用
        /// </summary>
        public double total_pre_fee
        {
            get { return _total_pre_fee; }

            set
            {
                _total_pre_fee = value;
                RaisePropertyChanged(() => total_pre_fee);
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

    public class prodL_4_2_Info : ObservableObject
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

        private double _pd_dist_amt;
        /// <summary>
        /// 产品已分配金额
        /// </summary>
        public double pd_dist_amt
        {
            get { return _pd_dist_amt; }

            set
            {
                _pd_dist_amt = value;
                RaisePropertyChanged(() => pd_dist_amt);
            }
        }

        private double _pd_auth_amt;
        /// <summary>
        /// 产品已授权金额
        /// </summary>
        public double pd_auth_amt
        {
            get { return _pd_auth_amt; }

            set
            {
                _pd_auth_amt = value;
                RaisePropertyChanged(() => pd_auth_amt);
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

        private double _total_pre_fee;
        /// <summary>
        /// 累计计提费用
        /// </summary>
        public double total_pre_fee
        {
            get { return _total_pre_fee; }

            set
            {
                _total_pre_fee = value;
                RaisePropertyChanged(() => total_pre_fee);
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

    public class prodL_4_5_Info : ObservableObject
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

    public class prodL_4_6_Info : ObservableObject
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

    public class prodL_4_7_Info : ObservableObject
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
    }

    public class prodL_4_8_Info : ObservableObject
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
    }

}
