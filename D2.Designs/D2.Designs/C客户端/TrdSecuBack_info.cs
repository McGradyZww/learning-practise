using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class tdsecuL_10_31_Info : ObservableObject
    {

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

        private int _comm_opor;
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private int _comm_executor;
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor
        {
            get { return _comm_executor; }

            set
            {
                _comm_executor = value;
                RaisePropertyChanged(() => comm_executor);
            }
        }

        private ulong _comm_id;
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id
        {
            get { return _comm_id; }

            set
            {
                _comm_id = value;
                RaisePropertyChanged(() => comm_id);
            }
        }

        private int _comm_date;
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date
        {
            get { return _comm_date; }

            set
            {
                _comm_date = value;
                RaisePropertyChanged(() => comm_date);
            }
        }

        private int _comm_time;
        /// <summary>
        /// 指令时间
        /// </summary>
        public int comm_time
        {
            get { return _comm_time; }

            set
            {
                _comm_time = value;
                RaisePropertyChanged(() => comm_time);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
            }
        }

        private int _comm_dir;
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir
        {
            get { return _comm_dir; }

            set
            {
                _comm_dir = value;
                RaisePropertyChanged(() => comm_dir);
            }
        }

        private double _comm_limit_price;
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price
        {
            get { return _comm_limit_price; }

            set
            {
                _comm_limit_price = value;
                RaisePropertyChanged(() => comm_limit_price);
            }
        }

        private double _limit_actual_price;
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price
        {
            get { return _limit_actual_price; }

            set
            {
                _limit_actual_price = value;
                RaisePropertyChanged(() => limit_actual_price);
            }
        }

        private double _comm_qty;
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty
        {
            get { return _comm_qty; }

            set
            {
                _comm_qty = value;
                RaisePropertyChanged(() => comm_qty);
            }
        }

        private double _comm_amt;
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt
        {
            get { return _comm_amt; }

            set
            {
                _comm_amt = value;
                RaisePropertyChanged(() => comm_amt);
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

        private double _comm_cancel_qty;
        /// <summary>
        /// 指令撤销数量
        /// </summary>
        public double comm_cancel_qty
        {
            get { return _comm_cancel_qty; }

            set
            {
                _comm_cancel_qty = value;
                RaisePropertyChanged(() => comm_cancel_qty);
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

        private double _comm_frozen_amt;
        /// <summary>
        /// 指令冻结金额
        /// </summary>
        public double comm_frozen_amt
        {
            get { return _comm_frozen_amt; }

            set
            {
                _comm_frozen_amt = value;
                RaisePropertyChanged(() => comm_frozen_amt);
            }
        }

        private double _comm_frozen_qty;
        /// <summary>
        /// 指令冻结数量
        /// </summary>
        public double comm_frozen_qty
        {
            get { return _comm_frozen_qty; }

            set
            {
                _comm_frozen_qty = value;
                RaisePropertyChanged(() => comm_frozen_qty);
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

        private double _par_value;
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value
        {
            get { return _par_value; }

            set
            {
                _par_value = value;
                RaisePropertyChanged(() => par_value);
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

        private String _strike_status;
        /// <summary>
        /// 成交状态
        /// </summary>
        public String strike_status
        {
            get { return _strike_status; }

            set
            {
                _strike_status = value;
                RaisePropertyChanged(() => strike_status);
            }
        }

        private String _comm_status;
        /// <summary>
        /// 指令状态
        /// </summary>
        public String comm_status
        {
            get { return _comm_status; }

            set
            {
                _comm_status = value;
                RaisePropertyChanged(() => comm_status);
            }
        }

        private int _comm_begin_date;
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date
        {
            get { return _comm_begin_date; }

            set
            {
                _comm_begin_date = value;
                RaisePropertyChanged(() => comm_begin_date);
            }
        }

        private int _comm_end_date;
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date
        {
            get { return _comm_end_date; }

            set
            {
                _comm_end_date = value;
                RaisePropertyChanged(() => comm_end_date);
            }
        }

        private int _comm_begin_time;
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time
        {
            get { return _comm_begin_time; }

            set
            {
                _comm_begin_time = value;
                RaisePropertyChanged(() => comm_begin_time);
            }
        }

        private int _comm_end_time;
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time
        {
            get { return _comm_end_time; }

            set
            {
                _comm_end_time = value;
                RaisePropertyChanged(() => comm_end_time);
            }
        }

        private int _comm_comple_date;
        /// <summary>
        /// 指令完成日期
        /// </summary>
        public int comm_comple_date
        {
            get { return _comm_comple_date; }

            set
            {
                _comm_comple_date = value;
                RaisePropertyChanged(() => comm_comple_date);
            }
        }

        private int _comm_comple_time;
        /// <summary>
        /// 指令完成时间
        /// </summary>
        public int comm_comple_time
        {
            get { return _comm_comple_time; }

            set
            {
                _comm_comple_time = value;
                RaisePropertyChanged(() => comm_comple_time);
            }
        }

        private int _comm_appr_date;
        /// <summary>
        /// 指令审批日期
        /// </summary>
        public int comm_appr_date
        {
            get { return _comm_appr_date; }

            set
            {
                _comm_appr_date = value;
                RaisePropertyChanged(() => comm_appr_date);
            }
        }

        private int _comm_appr_time;
        /// <summary>
        /// 指令审批时间
        /// </summary>
        public int comm_appr_time
        {
            get { return _comm_appr_time; }

            set
            {
                _comm_appr_time = value;
                RaisePropertyChanged(() => comm_appr_time);
            }
        }

        private String _comm_appr_status;
        /// <summary>
        /// 指令审批状态
        /// </summary>
        public String comm_appr_status
        {
            get { return _comm_appr_status; }

            set
            {
                _comm_appr_status = value;
                RaisePropertyChanged(() => comm_appr_status);
            }
        }

        private int _comm_appr_oper_no;
        /// <summary>
        /// 指令审批操作员序号
        /// </summary>
        public int comm_appr_oper_no
        {
            get { return _comm_appr_oper_no; }

            set
            {
                _comm_appr_oper_no = value;
                RaisePropertyChanged(() => comm_appr_oper_no);
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

        private String _comm_appr_remark;
        /// <summary>
        /// 指令审批说明
        /// </summary>
        public String comm_appr_remark
        {
            get { return _comm_appr_remark; }

            set
            {
                _comm_appr_remark = value;
                RaisePropertyChanged(() => comm_appr_remark);
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

        private String _comm_oper_way;
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way
        {
            get { return _comm_oper_way; }

            set
            {
                _comm_oper_way = value;
                RaisePropertyChanged(() => comm_oper_way);
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

        private int _comm_comple_flag;
        /// <summary>
        /// 指令完成标志
        /// </summary>
        public int comm_comple_flag
        {
            get { return _comm_comple_flag; }

            set
            {
                _comm_comple_flag = value;
                RaisePropertyChanged(() => comm_comple_flag);
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

    public class tdsecuL_10_32_Info : ObservableObject
    {

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

        private int _comm_opor;
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private int _comm_executor;
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor
        {
            get { return _comm_executor; }

            set
            {
                _comm_executor = value;
                RaisePropertyChanged(() => comm_executor);
            }
        }

        private ulong _comm_id;
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id
        {
            get { return _comm_id; }

            set
            {
                _comm_id = value;
                RaisePropertyChanged(() => comm_id);
            }
        }

        private int _comm_date;
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date
        {
            get { return _comm_date; }

            set
            {
                _comm_date = value;
                RaisePropertyChanged(() => comm_date);
            }
        }

        private int _comm_time;
        /// <summary>
        /// 指令时间
        /// </summary>
        public int comm_time
        {
            get { return _comm_time; }

            set
            {
                _comm_time = value;
                RaisePropertyChanged(() => comm_time);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
            }
        }

        private int _comm_dir;
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir
        {
            get { return _comm_dir; }

            set
            {
                _comm_dir = value;
                RaisePropertyChanged(() => comm_dir);
            }
        }

        private double _comm_limit_price;
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price
        {
            get { return _comm_limit_price; }

            set
            {
                _comm_limit_price = value;
                RaisePropertyChanged(() => comm_limit_price);
            }
        }

        private double _limit_actual_price;
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price
        {
            get { return _limit_actual_price; }

            set
            {
                _limit_actual_price = value;
                RaisePropertyChanged(() => limit_actual_price);
            }
        }

        private double _comm_qty;
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty
        {
            get { return _comm_qty; }

            set
            {
                _comm_qty = value;
                RaisePropertyChanged(() => comm_qty);
            }
        }

        private double _comm_amt;
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt
        {
            get { return _comm_amt; }

            set
            {
                _comm_amt = value;
                RaisePropertyChanged(() => comm_amt);
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

        private double _comm_cancel_qty;
        /// <summary>
        /// 指令撤销数量
        /// </summary>
        public double comm_cancel_qty
        {
            get { return _comm_cancel_qty; }

            set
            {
                _comm_cancel_qty = value;
                RaisePropertyChanged(() => comm_cancel_qty);
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

        private double _comm_frozen_amt;
        /// <summary>
        /// 指令冻结金额
        /// </summary>
        public double comm_frozen_amt
        {
            get { return _comm_frozen_amt; }

            set
            {
                _comm_frozen_amt = value;
                RaisePropertyChanged(() => comm_frozen_amt);
            }
        }

        private double _comm_frozen_qty;
        /// <summary>
        /// 指令冻结数量
        /// </summary>
        public double comm_frozen_qty
        {
            get { return _comm_frozen_qty; }

            set
            {
                _comm_frozen_qty = value;
                RaisePropertyChanged(() => comm_frozen_qty);
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

        private double _par_value;
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value
        {
            get { return _par_value; }

            set
            {
                _par_value = value;
                RaisePropertyChanged(() => par_value);
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

        private String _strike_status;
        /// <summary>
        /// 成交状态
        /// </summary>
        public String strike_status
        {
            get { return _strike_status; }

            set
            {
                _strike_status = value;
                RaisePropertyChanged(() => strike_status);
            }
        }

        private String _comm_status;
        /// <summary>
        /// 指令状态
        /// </summary>
        public String comm_status
        {
            get { return _comm_status; }

            set
            {
                _comm_status = value;
                RaisePropertyChanged(() => comm_status);
            }
        }

        private int _comm_begin_date;
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date
        {
            get { return _comm_begin_date; }

            set
            {
                _comm_begin_date = value;
                RaisePropertyChanged(() => comm_begin_date);
            }
        }

        private int _comm_end_date;
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date
        {
            get { return _comm_end_date; }

            set
            {
                _comm_end_date = value;
                RaisePropertyChanged(() => comm_end_date);
            }
        }

        private int _comm_begin_time;
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time
        {
            get { return _comm_begin_time; }

            set
            {
                _comm_begin_time = value;
                RaisePropertyChanged(() => comm_begin_time);
            }
        }

        private int _comm_end_time;
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time
        {
            get { return _comm_end_time; }

            set
            {
                _comm_end_time = value;
                RaisePropertyChanged(() => comm_end_time);
            }
        }

        private int _comm_comple_date;
        /// <summary>
        /// 指令完成日期
        /// </summary>
        public int comm_comple_date
        {
            get { return _comm_comple_date; }

            set
            {
                _comm_comple_date = value;
                RaisePropertyChanged(() => comm_comple_date);
            }
        }

        private int _comm_comple_time;
        /// <summary>
        /// 指令完成时间
        /// </summary>
        public int comm_comple_time
        {
            get { return _comm_comple_time; }

            set
            {
                _comm_comple_time = value;
                RaisePropertyChanged(() => comm_comple_time);
            }
        }

        private int _comm_appr_date;
        /// <summary>
        /// 指令审批日期
        /// </summary>
        public int comm_appr_date
        {
            get { return _comm_appr_date; }

            set
            {
                _comm_appr_date = value;
                RaisePropertyChanged(() => comm_appr_date);
            }
        }

        private int _comm_appr_time;
        /// <summary>
        /// 指令审批时间
        /// </summary>
        public int comm_appr_time
        {
            get { return _comm_appr_time; }

            set
            {
                _comm_appr_time = value;
                RaisePropertyChanged(() => comm_appr_time);
            }
        }

        private String _comm_appr_status;
        /// <summary>
        /// 指令审批状态
        /// </summary>
        public String comm_appr_status
        {
            get { return _comm_appr_status; }

            set
            {
                _comm_appr_status = value;
                RaisePropertyChanged(() => comm_appr_status);
            }
        }

        private int _comm_appr_oper_no;
        /// <summary>
        /// 指令审批操作员序号
        /// </summary>
        public int comm_appr_oper_no
        {
            get { return _comm_appr_oper_no; }

            set
            {
                _comm_appr_oper_no = value;
                RaisePropertyChanged(() => comm_appr_oper_no);
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

        private String _comm_appr_remark;
        /// <summary>
        /// 指令审批说明
        /// </summary>
        public String comm_appr_remark
        {
            get { return _comm_appr_remark; }

            set
            {
                _comm_appr_remark = value;
                RaisePropertyChanged(() => comm_appr_remark);
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

        private String _comm_oper_way;
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way
        {
            get { return _comm_oper_way; }

            set
            {
                _comm_oper_way = value;
                RaisePropertyChanged(() => comm_oper_way);
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

        private int _comm_comple_flag;
        /// <summary>
        /// 指令完成标志
        /// </summary>
        public int comm_comple_flag
        {
            get { return _comm_comple_flag; }

            set
            {
                _comm_comple_flag = value;
                RaisePropertyChanged(() => comm_comple_flag);
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

    public class tdsecuL_10_41_Info : ObservableObject
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

        private int _comm_opor;
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private ulong _external_no;
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no
        {
            get { return _external_no; }

            set
            {
                _external_no = value;
                RaisePropertyChanged(() => external_no);
            }
        }

        private ulong _comm_id;
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id
        {
            get { return _comm_id; }

            set
            {
                _comm_id = value;
                RaisePropertyChanged(() => comm_id);
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

        private int _order_batch_no;
        /// <summary>
        /// 订单批号
        /// </summary>
        public int order_batch_no
        {
            get { return _order_batch_no; }

            set
            {
                _order_batch_no = value;
                RaisePropertyChanged(() => order_batch_no);
            }
        }

        private ulong _order_id;
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id
        {
            get { return _order_id; }

            set
            {
                _order_id = value;
                RaisePropertyChanged(() => order_id);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
            }
        }

        private int _order_date;
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date
        {
            get { return _order_date; }

            set
            {
                _order_date = value;
                RaisePropertyChanged(() => order_date);
            }
        }

        private int _order_time;
        /// <summary>
        /// 订单时间
        /// </summary>
        public int order_time
        {
            get { return _order_time; }

            set
            {
                _order_time = value;
                RaisePropertyChanged(() => order_time);
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

        private int _price_type;
        /// <summary>
        /// 价格类型
        /// </summary>
        public int price_type
        {
            get { return _price_type; }

            set
            {
                _price_type = value;
                RaisePropertyChanged(() => price_type);
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

        private String _order_status;
        /// <summary>
        /// 订单状态
        /// </summary>
        public String order_status
        {
            get { return _order_status; }

            set
            {
                _order_status = value;
                RaisePropertyChanged(() => order_status);
            }
        }

        private double _wtdraw_qty;
        /// <summary>
        /// 撤单数量
        /// </summary>
        public double wtdraw_qty
        {
            get { return _wtdraw_qty; }

            set
            {
                _wtdraw_qty = value;
                RaisePropertyChanged(() => wtdraw_qty);
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

        private double _order_frozen_amt;
        /// <summary>
        /// 订单冻结金额
        /// </summary>
        public double order_frozen_amt
        {
            get { return _order_frozen_amt; }

            set
            {
                _order_frozen_amt = value;
                RaisePropertyChanged(() => order_frozen_amt);
            }
        }

        private double _order_frozen_qty;
        /// <summary>
        /// 订单冻结数量
        /// </summary>
        public double order_frozen_qty
        {
            get { return _order_frozen_qty; }

            set
            {
                _order_frozen_qty = value;
                RaisePropertyChanged(() => order_frozen_qty);
            }
        }

        private String _rsp_info;
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info
        {
            get { return _rsp_info; }

            set
            {
                _rsp_info = value;
                RaisePropertyChanged(() => rsp_info);
            }
        }

        private ulong _compli_trig_id;
        /// <summary>
        /// 合规触警序号
        /// </summary>
        public ulong compli_trig_id
        {
            get { return _compli_trig_id; }

            set
            {
                _compli_trig_id = value;
                RaisePropertyChanged(() => compli_trig_id);
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

        private String _order_oper_way;
        /// <summary>
        /// 订单操作方式
        /// </summary>
        public String order_oper_way
        {
            get { return _order_oper_way; }

            set
            {
                _order_oper_way = value;
                RaisePropertyChanged(() => order_oper_way);
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

    public class tdsecuL_10_42_Info : ObservableObject
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

        private int _comm_opor;
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private ulong _external_no;
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no
        {
            get { return _external_no; }

            set
            {
                _external_no = value;
                RaisePropertyChanged(() => external_no);
            }
        }

        private ulong _comm_id;
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id
        {
            get { return _comm_id; }

            set
            {
                _comm_id = value;
                RaisePropertyChanged(() => comm_id);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
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

        private int _order_batch_no;
        /// <summary>
        /// 订单批号
        /// </summary>
        public int order_batch_no
        {
            get { return _order_batch_no; }

            set
            {
                _order_batch_no = value;
                RaisePropertyChanged(() => order_batch_no);
            }
        }

        private ulong _order_id;
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id
        {
            get { return _order_id; }

            set
            {
                _order_id = value;
                RaisePropertyChanged(() => order_id);
            }
        }

        private int _order_date;
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date
        {
            get { return _order_date; }

            set
            {
                _order_date = value;
                RaisePropertyChanged(() => order_date);
            }
        }

        private int _order_time;
        /// <summary>
        /// 订单时间
        /// </summary>
        public int order_time
        {
            get { return _order_time; }

            set
            {
                _order_time = value;
                RaisePropertyChanged(() => order_time);
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

        private int _price_type;
        /// <summary>
        /// 价格类型
        /// </summary>
        public int price_type
        {
            get { return _price_type; }

            set
            {
                _price_type = value;
                RaisePropertyChanged(() => price_type);
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

        private String _order_status;
        /// <summary>
        /// 订单状态
        /// </summary>
        public String order_status
        {
            get { return _order_status; }

            set
            {
                _order_status = value;
                RaisePropertyChanged(() => order_status);
            }
        }

        private double _wtdraw_qty;
        /// <summary>
        /// 撤单数量
        /// </summary>
        public double wtdraw_qty
        {
            get { return _wtdraw_qty; }

            set
            {
                _wtdraw_qty = value;
                RaisePropertyChanged(() => wtdraw_qty);
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

        private double _order_frozen_amt;
        /// <summary>
        /// 订单冻结金额
        /// </summary>
        public double order_frozen_amt
        {
            get { return _order_frozen_amt; }

            set
            {
                _order_frozen_amt = value;
                RaisePropertyChanged(() => order_frozen_amt);
            }
        }

        private double _order_frozen_qty;
        /// <summary>
        /// 订单冻结数量
        /// </summary>
        public double order_frozen_qty
        {
            get { return _order_frozen_qty; }

            set
            {
                _order_frozen_qty = value;
                RaisePropertyChanged(() => order_frozen_qty);
            }
        }

        private String _rsp_info;
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info
        {
            get { return _rsp_info; }

            set
            {
                _rsp_info = value;
                RaisePropertyChanged(() => rsp_info);
            }
        }

        private ulong _compli_trig_id;
        /// <summary>
        /// 合规触警序号
        /// </summary>
        public ulong compli_trig_id
        {
            get { return _compli_trig_id; }

            set
            {
                _compli_trig_id = value;
                RaisePropertyChanged(() => compli_trig_id);
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

        private String _order_oper_way;
        /// <summary>
        /// 订单操作方式
        /// </summary>
        public String order_oper_way
        {
            get { return _order_oper_way; }

            set
            {
                _order_oper_way = value;
                RaisePropertyChanged(() => order_oper_way);
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

    public class tdsecuL_10_51_Info : ObservableObject
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

        private int _order_date;
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date
        {
            get { return _order_date; }

            set
            {
                _order_date = value;
                RaisePropertyChanged(() => order_date);
            }
        }

        private ulong _order_id;
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id
        {
            get { return _order_id; }

            set
            {
                _order_id = value;
                RaisePropertyChanged(() => order_id);
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

        private int _price_type;
        /// <summary>
        /// 价格类型
        /// </summary>
        public int price_type
        {
            get { return _price_type; }

            set
            {
                _price_type = value;
                RaisePropertyChanged(() => price_type);
            }
        }

        private String _order_rsp_status;
        /// <summary>
        /// 订单回报状态
        /// </summary>
        public String order_rsp_status
        {
            get { return _order_rsp_status; }

            set
            {
                _order_rsp_status = value;
                RaisePropertyChanged(() => order_rsp_status);
            }
        }

        private String _rsp_info;
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info
        {
            get { return _rsp_info; }

            set
            {
                _rsp_info = value;
                RaisePropertyChanged(() => rsp_info);
            }
        }

        private String _deal_status;
        /// <summary>
        /// 处理状态
        /// </summary>
        public String deal_status
        {
            get { return _deal_status; }

            set
            {
                _deal_status = value;
                RaisePropertyChanged(() => deal_status);
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

    public class tdsecuL_10_52_Info : ObservableObject
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

        private int _strike_deal_type;
        /// <summary>
        /// 成交处理方式
        /// </summary>
        public int strike_deal_type
        {
            get { return _strike_deal_type; }

            set
            {
                _strike_deal_type = value;
                RaisePropertyChanged(() => strike_deal_type);
            }
        }

        private String _rsp_info;
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info
        {
            get { return _rsp_info; }

            set
            {
                _rsp_info = value;
                RaisePropertyChanged(() => rsp_info);
            }
        }

        private String _deal_status;
        /// <summary>
        /// 处理状态
        /// </summary>
        public String deal_status
        {
            get { return _deal_status; }

            set
            {
                _deal_status = value;
                RaisePropertyChanged(() => deal_status);
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
    }

    public class tdsecuL_10_53_Info : ObservableObject
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

        private ulong _comm_id;
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id
        {
            get { return _comm_id; }

            set
            {
                _comm_id = value;
                RaisePropertyChanged(() => comm_id);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
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

        private int _order_date;
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date
        {
            get { return _order_date; }

            set
            {
                _order_date = value;
                RaisePropertyChanged(() => order_date);
            }
        }

        private int _order_time;
        /// <summary>
        /// 订单时间
        /// </summary>
        public int order_time
        {
            get { return _order_time; }

            set
            {
                _order_time = value;
                RaisePropertyChanged(() => order_time);
            }
        }

        private ulong _order_id;
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id
        {
            get { return _order_id; }

            set
            {
                _order_id = value;
                RaisePropertyChanged(() => order_id);
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

        private double _strike_bond_accr_intrst;
        /// <summary>
        /// 成交债券计提利息
        /// </summary>
        public double strike_bond_accr_intrst
        {
            get { return _strike_bond_accr_intrst; }

            set
            {
                _strike_bond_accr_intrst = value;
                RaisePropertyChanged(() => strike_bond_accr_intrst);
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

        private String _order_oper_way;
        /// <summary>
        /// 订单操作方式
        /// </summary>
        public String order_oper_way
        {
            get { return _order_oper_way; }

            set
            {
                _order_oper_way = value;
                RaisePropertyChanged(() => order_oper_way);
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

        private int _record_valid_flag;
        /// <summary>
        /// 记录有效标志
        /// </summary>
        public int record_valid_flag
        {
            get { return _record_valid_flag; }

            set
            {
                _record_valid_flag = value;
                RaisePropertyChanged(() => record_valid_flag);
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

    public class tdsecuL_10_54_Info : ObservableObject
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

        private ulong _comm_id;
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id
        {
            get { return _comm_id; }

            set
            {
                _comm_id = value;
                RaisePropertyChanged(() => comm_id);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
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

        private int _order_date;
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date
        {
            get { return _order_date; }

            set
            {
                _order_date = value;
                RaisePropertyChanged(() => order_date);
            }
        }

        private int _order_time;
        /// <summary>
        /// 订单时间
        /// </summary>
        public int order_time
        {
            get { return _order_time; }

            set
            {
                _order_time = value;
                RaisePropertyChanged(() => order_time);
            }
        }

        private ulong _order_id;
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id
        {
            get { return _order_id; }

            set
            {
                _order_id = value;
                RaisePropertyChanged(() => order_id);
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

        private double _strike_bond_accr_intrst;
        /// <summary>
        /// 成交债券计提利息
        /// </summary>
        public double strike_bond_accr_intrst
        {
            get { return _strike_bond_accr_intrst; }

            set
            {
                _strike_bond_accr_intrst = value;
                RaisePropertyChanged(() => strike_bond_accr_intrst);
            }
        }

        private String _order_oper_way;
        /// <summary>
        /// 订单操作方式
        /// </summary>
        public String order_oper_way
        {
            get { return _order_oper_way; }

            set
            {
                _order_oper_way = value;
                RaisePropertyChanged(() => order_oper_way);
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

        private int _record_valid_flag;
        /// <summary>
        /// 记录有效标志
        /// </summary>
        public int record_valid_flag
        {
            get { return _record_valid_flag; }

            set
            {
                _record_valid_flag = value;
                RaisePropertyChanged(() => record_valid_flag);
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

    public class tdsecuL_10_55_Info : ObservableObject
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

        private String _order_status;
        /// <summary>
        /// 订单状态
        /// </summary>
        public String order_status
        {
            get { return _order_status; }

            set
            {
                _order_status = value;
                RaisePropertyChanged(() => order_status);
            }
        }

        private String _order_oper_way;
        /// <summary>
        /// 订单操作方式
        /// </summary>
        public String order_oper_way
        {
            get { return _order_oper_way; }

            set
            {
                _order_oper_way = value;
                RaisePropertyChanged(() => order_oper_way);
            }
        }
    }

    public class tdsecuL_10_56_Info : ObservableObject
    {
    }

    public class tdsecuL_10_57_Info : ObservableObject
    {
    }

    public class tdsecuL_10_58_Info : ObservableObject
    {
    }

    public class tdsecuL_10_59_Info : ObservableObject
    {
    }

    public class tdsecuL_10_60_Info : ObservableObject
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

        private int _no_report_cnt;
        /// <summary>
        /// 未报记录数
        /// </summary>
        public int no_report_cnt
        {
            get { return _no_report_cnt; }

            set
            {
                _no_report_cnt = value;
                RaisePropertyChanged(() => no_report_cnt);
            }
        }

        private int _already_report_cnt;
        /// <summary>
        /// 已报记录数
        /// </summary>
        public int already_report_cnt
        {
            get { return _already_report_cnt; }

            set
            {
                _already_report_cnt = value;
                RaisePropertyChanged(() => already_report_cnt);
            }
        }

        private int _wait_report_cnt;
        /// <summary>
        /// 待报记录数
        /// </summary>
        public int wait_report_cnt
        {
            get { return _wait_report_cnt; }

            set
            {
                _wait_report_cnt = value;
                RaisePropertyChanged(() => wait_report_cnt);
            }
        }

        private int _wait_report_except_cnt;
        /// <summary>
        /// 待报异常数
        /// </summary>
        public int wait_report_except_cnt
        {
            get { return _wait_report_except_cnt; }

            set
            {
                _wait_report_except_cnt = value;
                RaisePropertyChanged(() => wait_report_except_cnt);
            }
        }

        private int _in_report_cnt;
        /// <summary>
        /// 正报记录数
        /// </summary>
        public int in_report_cnt
        {
            get { return _in_report_cnt; }

            set
            {
                _in_report_cnt = value;
                RaisePropertyChanged(() => in_report_cnt);
            }
        }

        private int _in_report_except_cnt;
        /// <summary>
        /// 正报异常数
        /// </summary>
        public int in_report_except_cnt
        {
            get { return _in_report_except_cnt; }

            set
            {
                _in_report_except_cnt = value;
                RaisePropertyChanged(() => in_report_except_cnt);
            }
        }

        private int _wait_cancel_cnt;
        /// <summary>
        /// 待撤记录数
        /// </summary>
        public int wait_cancel_cnt
        {
            get { return _wait_cancel_cnt; }

            set
            {
                _wait_cancel_cnt = value;
                RaisePropertyChanged(() => wait_cancel_cnt);
            }
        }

        private int _wait_cancel_except_cnt;
        /// <summary>
        /// 待撤异常数
        /// </summary>
        public int wait_cancel_except_cnt
        {
            get { return _wait_cancel_except_cnt; }

            set
            {
                _wait_cancel_except_cnt = value;
                RaisePropertyChanged(() => wait_cancel_except_cnt);
            }
        }

        private int _part_cancel_cnt;
        /// <summary>
        /// 部撤记录数
        /// </summary>
        public int part_cancel_cnt
        {
            get { return _part_cancel_cnt; }

            set
            {
                _part_cancel_cnt = value;
                RaisePropertyChanged(() => part_cancel_cnt);
            }
        }

        private int _all_cancel_cnt;
        /// <summary>
        /// 已撤记录数
        /// </summary>
        public int all_cancel_cnt
        {
            get { return _all_cancel_cnt; }

            set
            {
                _all_cancel_cnt = value;
                RaisePropertyChanged(() => all_cancel_cnt);
            }
        }

        private int _part_strike_cnt;
        /// <summary>
        /// 部成记录数
        /// </summary>
        public int part_strike_cnt
        {
            get { return _part_strike_cnt; }

            set
            {
                _part_strike_cnt = value;
                RaisePropertyChanged(() => part_strike_cnt);
            }
        }

        private int _all_strike_cnt;
        /// <summary>
        /// 已成记录数
        /// </summary>
        public int all_strike_cnt
        {
            get { return _all_strike_cnt; }

            set
            {
                _all_strike_cnt = value;
                RaisePropertyChanged(() => all_strike_cnt);
            }
        }

        private int _abolish_cnt;
        /// <summary>
        /// 废单记录数
        /// </summary>
        public int abolish_cnt
        {
            get { return _abolish_cnt; }

            set
            {
                _abolish_cnt = value;
                RaisePropertyChanged(() => abolish_cnt);
            }
        }
    }

    public class tdsecuL_10_61_Info : ObservableObject
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

        private int _comm_opor;
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private int _comm_executor;
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor
        {
            get { return _comm_executor; }

            set
            {
                _comm_executor = value;
                RaisePropertyChanged(() => comm_executor);
            }
        }

        private int _comm_date;
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date
        {
            get { return _comm_date; }

            set
            {
                _comm_date = value;
                RaisePropertyChanged(() => comm_date);
            }
        }

        private int _comm_time;
        /// <summary>
        /// 指令时间
        /// </summary>
        public int comm_time
        {
            get { return _comm_time; }

            set
            {
                _comm_time = value;
                RaisePropertyChanged(() => comm_time);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
            }
        }

        private int _comm_dir;
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir
        {
            get { return _comm_dir; }

            set
            {
                _comm_dir = value;
                RaisePropertyChanged(() => comm_dir);
            }
        }

        private double _comm_limit_price;
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price
        {
            get { return _comm_limit_price; }

            set
            {
                _comm_limit_price = value;
                RaisePropertyChanged(() => comm_limit_price);
            }
        }

        private double _limit_actual_price;
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price
        {
            get { return _limit_actual_price; }

            set
            {
                _limit_actual_price = value;
                RaisePropertyChanged(() => limit_actual_price);
            }
        }

        private double _comm_qty;
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty
        {
            get { return _comm_qty; }

            set
            {
                _comm_qty = value;
                RaisePropertyChanged(() => comm_qty);
            }
        }

        private double _comm_amt;
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt
        {
            get { return _comm_amt; }

            set
            {
                _comm_amt = value;
                RaisePropertyChanged(() => comm_amt);
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

        private double _comm_cancel_qty;
        /// <summary>
        /// 指令撤销数量
        /// </summary>
        public double comm_cancel_qty
        {
            get { return _comm_cancel_qty; }

            set
            {
                _comm_cancel_qty = value;
                RaisePropertyChanged(() => comm_cancel_qty);
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

        private double _par_value;
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value
        {
            get { return _par_value; }

            set
            {
                _par_value = value;
                RaisePropertyChanged(() => par_value);
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

        private String _strike_status;
        /// <summary>
        /// 成交状态
        /// </summary>
        public String strike_status
        {
            get { return _strike_status; }

            set
            {
                _strike_status = value;
                RaisePropertyChanged(() => strike_status);
            }
        }

        private String _comm_sum_status;
        /// <summary>
        /// 指令汇总状态
        /// </summary>
        public String comm_sum_status
        {
            get { return _comm_sum_status; }

            set
            {
                _comm_sum_status = value;
                RaisePropertyChanged(() => comm_sum_status);
            }
        }

        private int _comm_begin_date;
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date
        {
            get { return _comm_begin_date; }

            set
            {
                _comm_begin_date = value;
                RaisePropertyChanged(() => comm_begin_date);
            }
        }

        private int _comm_end_date;
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date
        {
            get { return _comm_end_date; }

            set
            {
                _comm_end_date = value;
                RaisePropertyChanged(() => comm_end_date);
            }
        }

        private int _comm_begin_time;
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time
        {
            get { return _comm_begin_time; }

            set
            {
                _comm_begin_time = value;
                RaisePropertyChanged(() => comm_begin_time);
            }
        }

        private int _comm_end_time;
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time
        {
            get { return _comm_end_time; }

            set
            {
                _comm_end_time = value;
                RaisePropertyChanged(() => comm_end_time);
            }
        }

        private int _comm_comple_date;
        /// <summary>
        /// 指令完成日期
        /// </summary>
        public int comm_comple_date
        {
            get { return _comm_comple_date; }

            set
            {
                _comm_comple_date = value;
                RaisePropertyChanged(() => comm_comple_date);
            }
        }

        private int _comm_comple_time;
        /// <summary>
        /// 指令完成时间
        /// </summary>
        public int comm_comple_time
        {
            get { return _comm_comple_time; }

            set
            {
                _comm_comple_time = value;
                RaisePropertyChanged(() => comm_comple_time);
            }
        }

        private int _max_comm_comple_date;
        /// <summary>
        /// 指令最大完成日期
        /// </summary>
        public int max_comm_comple_date
        {
            get { return _max_comm_comple_date; }

            set
            {
                _max_comm_comple_date = value;
                RaisePropertyChanged(() => max_comm_comple_date);
            }
        }

        private int _max_comm_comple_time;
        /// <summary>
        /// 指令最大完成时间
        /// </summary>
        public int max_comm_comple_time
        {
            get { return _max_comm_comple_time; }

            set
            {
                _max_comm_comple_time = value;
                RaisePropertyChanged(() => max_comm_comple_time);
            }
        }

        private int _comm_appr_date;
        /// <summary>
        /// 指令审批日期
        /// </summary>
        public int comm_appr_date
        {
            get { return _comm_appr_date; }

            set
            {
                _comm_appr_date = value;
                RaisePropertyChanged(() => comm_appr_date);
            }
        }

        private int _comm_appr_time;
        /// <summary>
        /// 指令审批时间
        /// </summary>
        public int comm_appr_time
        {
            get { return _comm_appr_time; }

            set
            {
                _comm_appr_time = value;
                RaisePropertyChanged(() => comm_appr_time);
            }
        }

        private String _comm_sum_approve_status;
        /// <summary>
        /// 指令汇总审批状态
        /// </summary>
        public String comm_sum_approve_status
        {
            get { return _comm_sum_approve_status; }

            set
            {
                _comm_sum_approve_status = value;
                RaisePropertyChanged(() => comm_sum_approve_status);
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

        private double _buy_order_qty;
        /// <summary>
        /// 买入订单数量
        /// </summary>
        public double buy_order_qty
        {
            get { return _buy_order_qty; }

            set
            {
                _buy_order_qty = value;
                RaisePropertyChanged(() => buy_order_qty);
            }
        }

        private double _sell_order_qty;
        /// <summary>
        /// 卖出订单数量
        /// </summary>
        public double sell_order_qty
        {
            get { return _sell_order_qty; }

            set
            {
                _sell_order_qty = value;
                RaisePropertyChanged(() => sell_order_qty);
            }
        }

        private double _buy_comm_qty;
        /// <summary>
        /// 买入指令数量
        /// </summary>
        public double buy_comm_qty
        {
            get { return _buy_comm_qty; }

            set
            {
                _buy_comm_qty = value;
                RaisePropertyChanged(() => buy_comm_qty);
            }
        }

        private double _sell_comm_qty;
        /// <summary>
        /// 卖出指令数量
        /// </summary>
        public double sell_comm_qty
        {
            get { return _sell_comm_qty; }

            set
            {
                _sell_comm_qty = value;
                RaisePropertyChanged(() => sell_comm_qty);
            }
        }

        private double _buy_strike_qty;
        /// <summary>
        /// 买入成交数量
        /// </summary>
        public double buy_strike_qty
        {
            get { return _buy_strike_qty; }

            set
            {
                _buy_strike_qty = value;
                RaisePropertyChanged(() => buy_strike_qty);
            }
        }

        private double _sell_strike_qty;
        /// <summary>
        /// 卖出成交数量
        /// </summary>
        public double sell_strike_qty
        {
            get { return _sell_strike_qty; }

            set
            {
                _sell_strike_qty = value;
                RaisePropertyChanged(() => sell_strike_qty);
            }
        }

        private double _buy_strike_amt;
        /// <summary>
        /// 买入成交金额
        /// </summary>
        public double buy_strike_amt
        {
            get { return _buy_strike_amt; }

            set
            {
                _buy_strike_amt = value;
                RaisePropertyChanged(() => buy_strike_amt);
            }
        }

        private double _sell_strike_amt;
        /// <summary>
        /// 卖出成交金额
        /// </summary>
        public double sell_strike_amt
        {
            get { return _sell_strike_amt; }

            set
            {
                _sell_strike_amt = value;
                RaisePropertyChanged(() => sell_strike_amt);
            }
        }

        private double _buy_comm_amt;
        /// <summary>
        /// 买入指令金额
        /// </summary>
        public double buy_comm_amt
        {
            get { return _buy_comm_amt; }

            set
            {
                _buy_comm_amt = value;
                RaisePropertyChanged(() => buy_comm_amt);
            }
        }

        private double _sell_comm_amt;
        /// <summary>
        /// 卖出指令金额
        /// </summary>
        public double sell_comm_amt
        {
            get { return _sell_comm_amt; }

            set
            {
                _sell_comm_amt = value;
                RaisePropertyChanged(() => sell_comm_amt);
            }
        }

        private String _comm_oper_way;
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way
        {
            get { return _comm_oper_way; }

            set
            {
                _comm_oper_way = value;
                RaisePropertyChanged(() => comm_oper_way);
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

        private double _valid_aver_price;
        /// <summary>
        /// 有效均价
        /// </summary>
        public double valid_aver_price
        {
            get { return _valid_aver_price; }

            set
            {
                _valid_aver_price = value;
                RaisePropertyChanged(() => valid_aver_price);
            }
        }

        private double _valid_aver_price_allday;
        /// <summary>
        /// 全天有效均价
        /// </summary>
        public double valid_aver_price_allday
        {
            get { return _valid_aver_price_allday; }

            set
            {
                _valid_aver_price_allday = value;
                RaisePropertyChanged(() => valid_aver_price_allday);
            }
        }

        private double _exec_price_diff;
        /// <summary>
        /// 执行价差
        /// </summary>
        public double exec_price_diff
        {
            get { return _exec_price_diff; }

            set
            {
                _exec_price_diff = value;
                RaisePropertyChanged(() => exec_price_diff);
            }
        }

        private double _exec_price_diff_allday;
        /// <summary>
        /// 全天执行价差
        /// </summary>
        public double exec_price_diff_allday
        {
            get { return _exec_price_diff_allday; }

            set
            {
                _exec_price_diff_allday = value;
                RaisePropertyChanged(() => exec_price_diff_allday);
            }
        }

        private double _valid_ratio;
        /// <summary>
        /// 有效占比
        /// </summary>
        public double valid_ratio
        {
            get { return _valid_ratio; }

            set
            {
                _valid_ratio = value;
                RaisePropertyChanged(() => valid_ratio);
            }
        }

        private double _valid_ratio_allday;
        /// <summary>
        /// 全天有效占比
        /// </summary>
        public double valid_ratio_allday
        {
            get { return _valid_ratio_allday; }

            set
            {
                _valid_ratio_allday = value;
                RaisePropertyChanged(() => valid_ratio_allday);
            }
        }

        private double _valid_qty;
        /// <summary>
        /// 有效数量
        /// </summary>
        public double valid_qty
        {
            get { return _valid_qty; }

            set
            {
                _valid_qty = value;
                RaisePropertyChanged(() => valid_qty);
            }
        }

        private double _valid_qty_allday;
        /// <summary>
        /// 全天有效数量
        /// </summary>
        public double valid_qty_allday
        {
            get { return _valid_qty_allday; }

            set
            {
                _valid_qty_allday = value;
                RaisePropertyChanged(() => valid_qty_allday);
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

        private String _comm_remark_info;
        /// <summary>
        /// 指令备注信息
        /// </summary>
        public String comm_remark_info
        {
            get { return _comm_remark_info; }

            set
            {
                _comm_remark_info = value;
                RaisePropertyChanged(() => comm_remark_info);
            }
        }
    }

    public class tdsecuL_10_62_Info : ObservableObject
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

        private int _comm_opor;
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private int _comm_executor;
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor
        {
            get { return _comm_executor; }

            set
            {
                _comm_executor = value;
                RaisePropertyChanged(() => comm_executor);
            }
        }

        private int _comm_date;
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date
        {
            get { return _comm_date; }

            set
            {
                _comm_date = value;
                RaisePropertyChanged(() => comm_date);
            }
        }

        private int _comm_time;
        /// <summary>
        /// 指令时间
        /// </summary>
        public int comm_time
        {
            get { return _comm_time; }

            set
            {
                _comm_time = value;
                RaisePropertyChanged(() => comm_time);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
            }
        }

        private int _comm_dir;
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir
        {
            get { return _comm_dir; }

            set
            {
                _comm_dir = value;
                RaisePropertyChanged(() => comm_dir);
            }
        }

        private double _comm_limit_price;
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price
        {
            get { return _comm_limit_price; }

            set
            {
                _comm_limit_price = value;
                RaisePropertyChanged(() => comm_limit_price);
            }
        }

        private double _limit_actual_price;
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price
        {
            get { return _limit_actual_price; }

            set
            {
                _limit_actual_price = value;
                RaisePropertyChanged(() => limit_actual_price);
            }
        }

        private double _comm_qty;
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty
        {
            get { return _comm_qty; }

            set
            {
                _comm_qty = value;
                RaisePropertyChanged(() => comm_qty);
            }
        }

        private double _comm_amt;
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt
        {
            get { return _comm_amt; }

            set
            {
                _comm_amt = value;
                RaisePropertyChanged(() => comm_amt);
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

        private double _comm_cancel_qty;
        /// <summary>
        /// 指令撤销数量
        /// </summary>
        public double comm_cancel_qty
        {
            get { return _comm_cancel_qty; }

            set
            {
                _comm_cancel_qty = value;
                RaisePropertyChanged(() => comm_cancel_qty);
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

        private double _par_value;
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value
        {
            get { return _par_value; }

            set
            {
                _par_value = value;
                RaisePropertyChanged(() => par_value);
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

        private String _strike_status;
        /// <summary>
        /// 成交状态
        /// </summary>
        public String strike_status
        {
            get { return _strike_status; }

            set
            {
                _strike_status = value;
                RaisePropertyChanged(() => strike_status);
            }
        }

        private String _comm_sum_status;
        /// <summary>
        /// 指令汇总状态
        /// </summary>
        public String comm_sum_status
        {
            get { return _comm_sum_status; }

            set
            {
                _comm_sum_status = value;
                RaisePropertyChanged(() => comm_sum_status);
            }
        }

        private int _comm_begin_date;
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date
        {
            get { return _comm_begin_date; }

            set
            {
                _comm_begin_date = value;
                RaisePropertyChanged(() => comm_begin_date);
            }
        }

        private int _comm_end_date;
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date
        {
            get { return _comm_end_date; }

            set
            {
                _comm_end_date = value;
                RaisePropertyChanged(() => comm_end_date);
            }
        }

        private int _comm_begin_time;
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time
        {
            get { return _comm_begin_time; }

            set
            {
                _comm_begin_time = value;
                RaisePropertyChanged(() => comm_begin_time);
            }
        }

        private int _comm_end_time;
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time
        {
            get { return _comm_end_time; }

            set
            {
                _comm_end_time = value;
                RaisePropertyChanged(() => comm_end_time);
            }
        }

        private int _comm_comple_date;
        /// <summary>
        /// 指令完成日期
        /// </summary>
        public int comm_comple_date
        {
            get { return _comm_comple_date; }

            set
            {
                _comm_comple_date = value;
                RaisePropertyChanged(() => comm_comple_date);
            }
        }

        private int _comm_comple_time;
        /// <summary>
        /// 指令完成时间
        /// </summary>
        public int comm_comple_time
        {
            get { return _comm_comple_time; }

            set
            {
                _comm_comple_time = value;
                RaisePropertyChanged(() => comm_comple_time);
            }
        }

        private int _max_comm_comple_date;
        /// <summary>
        /// 指令最大完成日期
        /// </summary>
        public int max_comm_comple_date
        {
            get { return _max_comm_comple_date; }

            set
            {
                _max_comm_comple_date = value;
                RaisePropertyChanged(() => max_comm_comple_date);
            }
        }

        private int _max_comm_comple_time;
        /// <summary>
        /// 指令最大完成时间
        /// </summary>
        public int max_comm_comple_time
        {
            get { return _max_comm_comple_time; }

            set
            {
                _max_comm_comple_time = value;
                RaisePropertyChanged(() => max_comm_comple_time);
            }
        }

        private int _comm_appr_date;
        /// <summary>
        /// 指令审批日期
        /// </summary>
        public int comm_appr_date
        {
            get { return _comm_appr_date; }

            set
            {
                _comm_appr_date = value;
                RaisePropertyChanged(() => comm_appr_date);
            }
        }

        private int _comm_appr_time;
        /// <summary>
        /// 指令审批时间
        /// </summary>
        public int comm_appr_time
        {
            get { return _comm_appr_time; }

            set
            {
                _comm_appr_time = value;
                RaisePropertyChanged(() => comm_appr_time);
            }
        }

        private String _comm_sum_approve_status;
        /// <summary>
        /// 指令汇总审批状态
        /// </summary>
        public String comm_sum_approve_status
        {
            get { return _comm_sum_approve_status; }

            set
            {
                _comm_sum_approve_status = value;
                RaisePropertyChanged(() => comm_sum_approve_status);
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

        private double _buy_order_qty;
        /// <summary>
        /// 买入订单数量
        /// </summary>
        public double buy_order_qty
        {
            get { return _buy_order_qty; }

            set
            {
                _buy_order_qty = value;
                RaisePropertyChanged(() => buy_order_qty);
            }
        }

        private double _sell_order_qty;
        /// <summary>
        /// 卖出订单数量
        /// </summary>
        public double sell_order_qty
        {
            get { return _sell_order_qty; }

            set
            {
                _sell_order_qty = value;
                RaisePropertyChanged(() => sell_order_qty);
            }
        }

        private double _buy_comm_qty;
        /// <summary>
        /// 买入指令数量
        /// </summary>
        public double buy_comm_qty
        {
            get { return _buy_comm_qty; }

            set
            {
                _buy_comm_qty = value;
                RaisePropertyChanged(() => buy_comm_qty);
            }
        }

        private double _sell_comm_qty;
        /// <summary>
        /// 卖出指令数量
        /// </summary>
        public double sell_comm_qty
        {
            get { return _sell_comm_qty; }

            set
            {
                _sell_comm_qty = value;
                RaisePropertyChanged(() => sell_comm_qty);
            }
        }

        private double _buy_strike_qty;
        /// <summary>
        /// 买入成交数量
        /// </summary>
        public double buy_strike_qty
        {
            get { return _buy_strike_qty; }

            set
            {
                _buy_strike_qty = value;
                RaisePropertyChanged(() => buy_strike_qty);
            }
        }

        private double _sell_strike_qty;
        /// <summary>
        /// 卖出成交数量
        /// </summary>
        public double sell_strike_qty
        {
            get { return _sell_strike_qty; }

            set
            {
                _sell_strike_qty = value;
                RaisePropertyChanged(() => sell_strike_qty);
            }
        }

        private double _buy_strike_amt;
        /// <summary>
        /// 买入成交金额
        /// </summary>
        public double buy_strike_amt
        {
            get { return _buy_strike_amt; }

            set
            {
                _buy_strike_amt = value;
                RaisePropertyChanged(() => buy_strike_amt);
            }
        }

        private double _sell_strike_amt;
        /// <summary>
        /// 卖出成交金额
        /// </summary>
        public double sell_strike_amt
        {
            get { return _sell_strike_amt; }

            set
            {
                _sell_strike_amt = value;
                RaisePropertyChanged(() => sell_strike_amt);
            }
        }

        private double _buy_comm_amt;
        /// <summary>
        /// 买入指令金额
        /// </summary>
        public double buy_comm_amt
        {
            get { return _buy_comm_amt; }

            set
            {
                _buy_comm_amt = value;
                RaisePropertyChanged(() => buy_comm_amt);
            }
        }

        private double _sell_comm_amt;
        /// <summary>
        /// 卖出指令金额
        /// </summary>
        public double sell_comm_amt
        {
            get { return _sell_comm_amt; }

            set
            {
                _sell_comm_amt = value;
                RaisePropertyChanged(() => sell_comm_amt);
            }
        }

        private String _comm_oper_way;
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way
        {
            get { return _comm_oper_way; }

            set
            {
                _comm_oper_way = value;
                RaisePropertyChanged(() => comm_oper_way);
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

        private double _valid_aver_price;
        /// <summary>
        /// 有效均价
        /// </summary>
        public double valid_aver_price
        {
            get { return _valid_aver_price; }

            set
            {
                _valid_aver_price = value;
                RaisePropertyChanged(() => valid_aver_price);
            }
        }

        private double _valid_aver_price_allday;
        /// <summary>
        /// 全天有效均价
        /// </summary>
        public double valid_aver_price_allday
        {
            get { return _valid_aver_price_allday; }

            set
            {
                _valid_aver_price_allday = value;
                RaisePropertyChanged(() => valid_aver_price_allday);
            }
        }

        private double _exec_price_diff;
        /// <summary>
        /// 执行价差
        /// </summary>
        public double exec_price_diff
        {
            get { return _exec_price_diff; }

            set
            {
                _exec_price_diff = value;
                RaisePropertyChanged(() => exec_price_diff);
            }
        }

        private double _exec_price_diff_allday;
        /// <summary>
        /// 全天执行价差
        /// </summary>
        public double exec_price_diff_allday
        {
            get { return _exec_price_diff_allday; }

            set
            {
                _exec_price_diff_allday = value;
                RaisePropertyChanged(() => exec_price_diff_allday);
            }
        }

        private double _valid_ratio;
        /// <summary>
        /// 有效占比
        /// </summary>
        public double valid_ratio
        {
            get { return _valid_ratio; }

            set
            {
                _valid_ratio = value;
                RaisePropertyChanged(() => valid_ratio);
            }
        }

        private double _valid_ratio_allday;
        /// <summary>
        /// 全天有效占比
        /// </summary>
        public double valid_ratio_allday
        {
            get { return _valid_ratio_allday; }

            set
            {
                _valid_ratio_allday = value;
                RaisePropertyChanged(() => valid_ratio_allday);
            }
        }

        private double _valid_qty;
        /// <summary>
        /// 有效数量
        /// </summary>
        public double valid_qty
        {
            get { return _valid_qty; }

            set
            {
                _valid_qty = value;
                RaisePropertyChanged(() => valid_qty);
            }
        }

        private double _valid_qty_allday;
        /// <summary>
        /// 全天有效数量
        /// </summary>
        public double valid_qty_allday
        {
            get { return _valid_qty_allday; }

            set
            {
                _valid_qty_allday = value;
                RaisePropertyChanged(() => valid_qty_allday);
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

        private String _comm_remark_info;
        /// <summary>
        /// 指令备注信息
        /// </summary>
        public String comm_remark_info
        {
            get { return _comm_remark_info; }

            set
            {
                _comm_remark_info = value;
                RaisePropertyChanged(() => comm_remark_info);
            }
        }
    }

    public class tdsecuL_10_63_Info : ObservableObject
    {
    }

    public class tdsecuL_10_64_Info : ObservableObject
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

        private int _comm_opor;
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor
        {
            get { return _comm_opor; }

            set
            {
                _comm_opor = value;
                RaisePropertyChanged(() => comm_opor);
            }
        }

        private int _comm_executor;
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor
        {
            get { return _comm_executor; }

            set
            {
                _comm_executor = value;
                RaisePropertyChanged(() => comm_executor);
            }
        }

        private int _comm_date;
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date
        {
            get { return _comm_date; }

            set
            {
                _comm_date = value;
                RaisePropertyChanged(() => comm_date);
            }
        }

        private int _comm_time;
        /// <summary>
        /// 指令时间
        /// </summary>
        public int comm_time
        {
            get { return _comm_time; }

            set
            {
                _comm_time = value;
                RaisePropertyChanged(() => comm_time);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
            }
        }

        private int _comm_dir;
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir
        {
            get { return _comm_dir; }

            set
            {
                _comm_dir = value;
                RaisePropertyChanged(() => comm_dir);
            }
        }

        private double _comm_limit_price;
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price
        {
            get { return _comm_limit_price; }

            set
            {
                _comm_limit_price = value;
                RaisePropertyChanged(() => comm_limit_price);
            }
        }

        private double _limit_actual_price;
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price
        {
            get { return _limit_actual_price; }

            set
            {
                _limit_actual_price = value;
                RaisePropertyChanged(() => limit_actual_price);
            }
        }

        private double _comm_qty;
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty
        {
            get { return _comm_qty; }

            set
            {
                _comm_qty = value;
                RaisePropertyChanged(() => comm_qty);
            }
        }

        private double _comm_amt;
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt
        {
            get { return _comm_amt; }

            set
            {
                _comm_amt = value;
                RaisePropertyChanged(() => comm_amt);
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

        private double _comm_cancel_qty;
        /// <summary>
        /// 指令撤销数量
        /// </summary>
        public double comm_cancel_qty
        {
            get { return _comm_cancel_qty; }

            set
            {
                _comm_cancel_qty = value;
                RaisePropertyChanged(() => comm_cancel_qty);
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

        private double _par_value;
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value
        {
            get { return _par_value; }

            set
            {
                _par_value = value;
                RaisePropertyChanged(() => par_value);
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

        private String _strike_status;
        /// <summary>
        /// 成交状态
        /// </summary>
        public String strike_status
        {
            get { return _strike_status; }

            set
            {
                _strike_status = value;
                RaisePropertyChanged(() => strike_status);
            }
        }

        private String _comm_sum_status;
        /// <summary>
        /// 指令汇总状态
        /// </summary>
        public String comm_sum_status
        {
            get { return _comm_sum_status; }

            set
            {
                _comm_sum_status = value;
                RaisePropertyChanged(() => comm_sum_status);
            }
        }

        private int _comm_begin_date;
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date
        {
            get { return _comm_begin_date; }

            set
            {
                _comm_begin_date = value;
                RaisePropertyChanged(() => comm_begin_date);
            }
        }

        private int _comm_end_date;
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date
        {
            get { return _comm_end_date; }

            set
            {
                _comm_end_date = value;
                RaisePropertyChanged(() => comm_end_date);
            }
        }

        private int _comm_begin_time;
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time
        {
            get { return _comm_begin_time; }

            set
            {
                _comm_begin_time = value;
                RaisePropertyChanged(() => comm_begin_time);
            }
        }

        private int _comm_end_time;
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time
        {
            get { return _comm_end_time; }

            set
            {
                _comm_end_time = value;
                RaisePropertyChanged(() => comm_end_time);
            }
        }

        private int _comm_comple_date;
        /// <summary>
        /// 指令完成日期
        /// </summary>
        public int comm_comple_date
        {
            get { return _comm_comple_date; }

            set
            {
                _comm_comple_date = value;
                RaisePropertyChanged(() => comm_comple_date);
            }
        }

        private int _comm_comple_time;
        /// <summary>
        /// 指令完成时间
        /// </summary>
        public int comm_comple_time
        {
            get { return _comm_comple_time; }

            set
            {
                _comm_comple_time = value;
                RaisePropertyChanged(() => comm_comple_time);
            }
        }

        private int _max_comm_comple_date;
        /// <summary>
        /// 指令最大完成日期
        /// </summary>
        public int max_comm_comple_date
        {
            get { return _max_comm_comple_date; }

            set
            {
                _max_comm_comple_date = value;
                RaisePropertyChanged(() => max_comm_comple_date);
            }
        }

        private int _max_comm_comple_time;
        /// <summary>
        /// 指令最大完成时间
        /// </summary>
        public int max_comm_comple_time
        {
            get { return _max_comm_comple_time; }

            set
            {
                _max_comm_comple_time = value;
                RaisePropertyChanged(() => max_comm_comple_time);
            }
        }

        private int _comm_appr_date;
        /// <summary>
        /// 指令审批日期
        /// </summary>
        public int comm_appr_date
        {
            get { return _comm_appr_date; }

            set
            {
                _comm_appr_date = value;
                RaisePropertyChanged(() => comm_appr_date);
            }
        }

        private int _comm_appr_time;
        /// <summary>
        /// 指令审批时间
        /// </summary>
        public int comm_appr_time
        {
            get { return _comm_appr_time; }

            set
            {
                _comm_appr_time = value;
                RaisePropertyChanged(() => comm_appr_time);
            }
        }

        private String _comm_sum_approve_status;
        /// <summary>
        /// 指令汇总审批状态
        /// </summary>
        public String comm_sum_approve_status
        {
            get { return _comm_sum_approve_status; }

            set
            {
                _comm_sum_approve_status = value;
                RaisePropertyChanged(() => comm_sum_approve_status);
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

        private double _buy_order_qty;
        /// <summary>
        /// 买入订单数量
        /// </summary>
        public double buy_order_qty
        {
            get { return _buy_order_qty; }

            set
            {
                _buy_order_qty = value;
                RaisePropertyChanged(() => buy_order_qty);
            }
        }

        private double _sell_order_qty;
        /// <summary>
        /// 卖出订单数量
        /// </summary>
        public double sell_order_qty
        {
            get { return _sell_order_qty; }

            set
            {
                _sell_order_qty = value;
                RaisePropertyChanged(() => sell_order_qty);
            }
        }

        private double _buy_comm_qty;
        /// <summary>
        /// 买入指令数量
        /// </summary>
        public double buy_comm_qty
        {
            get { return _buy_comm_qty; }

            set
            {
                _buy_comm_qty = value;
                RaisePropertyChanged(() => buy_comm_qty);
            }
        }

        private double _sell_comm_qty;
        /// <summary>
        /// 卖出指令数量
        /// </summary>
        public double sell_comm_qty
        {
            get { return _sell_comm_qty; }

            set
            {
                _sell_comm_qty = value;
                RaisePropertyChanged(() => sell_comm_qty);
            }
        }

        private double _buy_strike_qty;
        /// <summary>
        /// 买入成交数量
        /// </summary>
        public double buy_strike_qty
        {
            get { return _buy_strike_qty; }

            set
            {
                _buy_strike_qty = value;
                RaisePropertyChanged(() => buy_strike_qty);
            }
        }

        private double _sell_strike_qty;
        /// <summary>
        /// 卖出成交数量
        /// </summary>
        public double sell_strike_qty
        {
            get { return _sell_strike_qty; }

            set
            {
                _sell_strike_qty = value;
                RaisePropertyChanged(() => sell_strike_qty);
            }
        }

        private double _buy_strike_amt;
        /// <summary>
        /// 买入成交金额
        /// </summary>
        public double buy_strike_amt
        {
            get { return _buy_strike_amt; }

            set
            {
                _buy_strike_amt = value;
                RaisePropertyChanged(() => buy_strike_amt);
            }
        }

        private double _sell_strike_amt;
        /// <summary>
        /// 卖出成交金额
        /// </summary>
        public double sell_strike_amt
        {
            get { return _sell_strike_amt; }

            set
            {
                _sell_strike_amt = value;
                RaisePropertyChanged(() => sell_strike_amt);
            }
        }

        private double _buy_comm_amt;
        /// <summary>
        /// 买入指令金额
        /// </summary>
        public double buy_comm_amt
        {
            get { return _buy_comm_amt; }

            set
            {
                _buy_comm_amt = value;
                RaisePropertyChanged(() => buy_comm_amt);
            }
        }

        private double _sell_comm_amt;
        /// <summary>
        /// 卖出指令金额
        /// </summary>
        public double sell_comm_amt
        {
            get { return _sell_comm_amt; }

            set
            {
                _sell_comm_amt = value;
                RaisePropertyChanged(() => sell_comm_amt);
            }
        }

        private String _comm_oper_way;
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way
        {
            get { return _comm_oper_way; }

            set
            {
                _comm_oper_way = value;
                RaisePropertyChanged(() => comm_oper_way);
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

        private String _comm_remark_info;
        /// <summary>
        /// 指令备注信息
        /// </summary>
        public String comm_remark_info
        {
            get { return _comm_remark_info; }

            set
            {
                _comm_remark_info = value;
                RaisePropertyChanged(() => comm_remark_info);
            }
        }
    }

    public class tdsecuL_10_65_Info : ObservableObject
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

        private int _order_date;
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date
        {
            get { return _order_date; }

            set
            {
                _order_date = value;
                RaisePropertyChanged(() => order_date);
            }
        }

        private ulong _order_id;
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id
        {
            get { return _order_id; }

            set
            {
                _order_id = value;
                RaisePropertyChanged(() => order_id);
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

        private int _price_type;
        /// <summary>
        /// 价格类型
        /// </summary>
        public int price_type
        {
            get { return _price_type; }

            set
            {
                _price_type = value;
                RaisePropertyChanged(() => price_type);
            }
        }

        private String _order_rsp_status;
        /// <summary>
        /// 订单回报状态
        /// </summary>
        public String order_rsp_status
        {
            get { return _order_rsp_status; }

            set
            {
                _order_rsp_status = value;
                RaisePropertyChanged(() => order_rsp_status);
            }
        }

        private String _rsp_info;
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info
        {
            get { return _rsp_info; }

            set
            {
                _rsp_info = value;
                RaisePropertyChanged(() => rsp_info);
            }
        }

        private String _deal_status;
        /// <summary>
        /// 处理状态
        /// </summary>
        public String deal_status
        {
            get { return _deal_status; }

            set
            {
                _deal_status = value;
                RaisePropertyChanged(() => deal_status);
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

    public class tdsecuL_10_66_Info : ObservableObject
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

        private int _strike_deal_type;
        /// <summary>
        /// 成交处理方式
        /// </summary>
        public int strike_deal_type
        {
            get { return _strike_deal_type; }

            set
            {
                _strike_deal_type = value;
                RaisePropertyChanged(() => strike_deal_type);
            }
        }

        private String _rsp_info;
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info
        {
            get { return _rsp_info; }

            set
            {
                _rsp_info = value;
                RaisePropertyChanged(() => rsp_info);
            }
        }

        private String _deal_status;
        /// <summary>
        /// 处理状态
        /// </summary>
        public String deal_status
        {
            get { return _deal_status; }

            set
            {
                _deal_status = value;
                RaisePropertyChanged(() => deal_status);
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
    }

    public class tdsecuL_10_67_Info : ObservableObject
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

        private ulong _comm_id;
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id
        {
            get { return _comm_id; }

            set
            {
                _comm_id = value;
                RaisePropertyChanged(() => comm_id);
            }
        }

        private int _comm_batch_no;
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no
        {
            get { return _comm_batch_no; }

            set
            {
                _comm_batch_no = value;
                RaisePropertyChanged(() => comm_batch_no);
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

        private int _order_date;
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date
        {
            get { return _order_date; }

            set
            {
                _order_date = value;
                RaisePropertyChanged(() => order_date);
            }
        }

        private int _order_time;
        /// <summary>
        /// 订单时间
        /// </summary>
        public int order_time
        {
            get { return _order_time; }

            set
            {
                _order_time = value;
                RaisePropertyChanged(() => order_time);
            }
        }

        private ulong _order_id;
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id
        {
            get { return _order_id; }

            set
            {
                _order_id = value;
                RaisePropertyChanged(() => order_id);
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

        private double _strike_bond_accr_intrst;
        /// <summary>
        /// 成交债券计提利息
        /// </summary>
        public double strike_bond_accr_intrst
        {
            get { return _strike_bond_accr_intrst; }

            set
            {
                _strike_bond_accr_intrst = value;
                RaisePropertyChanged(() => strike_bond_accr_intrst);
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

        private String _order_oper_way;
        /// <summary>
        /// 订单操作方式
        /// </summary>
        public String order_oper_way
        {
            get { return _order_oper_way; }

            set
            {
                _order_oper_way = value;
                RaisePropertyChanged(() => order_oper_way);
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

        private int _record_valid_flag;
        /// <summary>
        /// 记录有效标志
        /// </summary>
        public int record_valid_flag
        {
            get { return _record_valid_flag; }

            set
            {
                _record_valid_flag = value;
                RaisePropertyChanged(() => record_valid_flag);
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

    public class tdsecuL_10_68_Info : ObservableObject
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

        private String _offer_type;
        /// <summary>
        /// 报盘类型
        /// </summary>
        public String offer_type
        {
            get { return _offer_type; }

            set
            {
                _offer_type = value;
                RaisePropertyChanged(() => offer_type);
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

        private int _offer_server_port;
        /// <summary>
        /// 报盘服务器端口
        /// </summary>
        public int offer_server_port
        {
            get { return _offer_server_port; }

            set
            {
                _offer_server_port = value;
                RaisePropertyChanged(() => offer_server_port);
            }
        }
    }

    public class tdsecuL_10_69_Info : ObservableObject
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

        private ulong _external_no;
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no
        {
            get { return _external_no; }

            set
            {
                _external_no = value;
                RaisePropertyChanged(() => external_no);
            }
        }

        private int _wtdraw_batch_no;
        /// <summary>
        /// 撤单批号
        /// </summary>
        public int wtdraw_batch_no
        {
            get { return _wtdraw_batch_no; }

            set
            {
                _wtdraw_batch_no = value;
                RaisePropertyChanged(() => wtdraw_batch_no);
            }
        }

        private int _wtdraw_date;
        /// <summary>
        /// 撤单日期
        /// </summary>
        public int wtdraw_date
        {
            get { return _wtdraw_date; }

            set
            {
                _wtdraw_date = value;
                RaisePropertyChanged(() => wtdraw_date);
            }
        }

        private int _wtdraw_time;
        /// <summary>
        /// 撤单时间
        /// </summary>
        public int wtdraw_time
        {
            get { return _wtdraw_time; }

            set
            {
                _wtdraw_time = value;
                RaisePropertyChanged(() => wtdraw_time);
            }
        }

        private int _order_date;
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date
        {
            get { return _order_date; }

            set
            {
                _order_date = value;
                RaisePropertyChanged(() => order_date);
            }
        }

        private ulong _order_id;
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id
        {
            get { return _order_id; }

            set
            {
                _order_id = value;
                RaisePropertyChanged(() => order_id);
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

        private String _wtdraw_status;
        /// <summary>
        /// 撤单状态
        /// </summary>
        public String wtdraw_status
        {
            get { return _wtdraw_status; }

            set
            {
                _wtdraw_status = value;
                RaisePropertyChanged(() => wtdraw_status);
            }
        }

        private double _wtdraw_qty;
        /// <summary>
        /// 撤单数量
        /// </summary>
        public double wtdraw_qty
        {
            get { return _wtdraw_qty; }

            set
            {
                _wtdraw_qty = value;
                RaisePropertyChanged(() => wtdraw_qty);
            }
        }

        private String _wtdraw_remark;
        /// <summary>
        /// 撤单说明
        /// </summary>
        public String wtdraw_remark
        {
            get { return _wtdraw_remark; }

            set
            {
                _wtdraw_remark = value;
                RaisePropertyChanged(() => wtdraw_remark);
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

    public class tdsecuL_10_70_Info : ObservableObject
    {
    }

    public class tdsecuL_10_71_Info : ObservableObject
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

        private int _strike_deal_type;
        /// <summary>
        /// 成交处理方式
        /// </summary>
        public int strike_deal_type
        {
            get { return _strike_deal_type; }

            set
            {
                _strike_deal_type = value;
                RaisePropertyChanged(() => strike_deal_type);
            }
        }

        private String _rsp_info;
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info
        {
            get { return _rsp_info; }

            set
            {
                _rsp_info = value;
                RaisePropertyChanged(() => rsp_info);
            }
        }
    }

    public class tdsecuL_10_72_Info : ObservableObject
    {
    }

    public class tdsecuL_10_73_Info : ObservableObject
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

        private double _comm_frozen_qty;
        /// <summary>
        /// 指令冻结数量
        /// </summary>
        public double comm_frozen_qty
        {
            get { return _comm_frozen_qty; }

            set
            {
                _comm_frozen_qty = value;
                RaisePropertyChanged(() => comm_frozen_qty);
            }
        }

        private double _comm_unfroz_qty;
        /// <summary>
        /// 指令解冻数量
        /// </summary>
        public double comm_unfroz_qty
        {
            get { return _comm_unfroz_qty; }

            set
            {
                _comm_unfroz_qty = value;
                RaisePropertyChanged(() => comm_unfroz_qty);
            }
        }

        private double _comm_capt_qty;
        /// <summary>
        /// 指令占用数量
        /// </summary>
        public double comm_capt_qty
        {
            get { return _comm_capt_qty; }

            set
            {
                _comm_capt_qty = value;
                RaisePropertyChanged(() => comm_capt_qty);
            }
        }

        private double _comm_releas_qty;
        /// <summary>
        /// 指令释放数量
        /// </summary>
        public double comm_releas_qty
        {
            get { return _comm_releas_qty; }

            set
            {
                _comm_releas_qty = value;
                RaisePropertyChanged(() => comm_releas_qty);
            }
        }

        private double _trade_frozen_qty;
        /// <summary>
        /// 交易冻结数量
        /// </summary>
        public double trade_frozen_qty
        {
            get { return _trade_frozen_qty; }

            set
            {
                _trade_frozen_qty = value;
                RaisePropertyChanged(() => trade_frozen_qty);
            }
        }

        private double _trade_unfroz_qty;
        /// <summary>
        /// 交易解冻数量
        /// </summary>
        public double trade_unfroz_qty
        {
            get { return _trade_unfroz_qty; }

            set
            {
                _trade_unfroz_qty = value;
                RaisePropertyChanged(() => trade_unfroz_qty);
            }
        }

        private double _trade_capt_qty;
        /// <summary>
        /// 交易占用数量
        /// </summary>
        public double trade_capt_qty
        {
            get { return _trade_capt_qty; }

            set
            {
                _trade_capt_qty = value;
                RaisePropertyChanged(() => trade_capt_qty);
            }
        }

        private double _trade_releas_qty;
        /// <summary>
        /// 交易释放数量
        /// </summary>
        public double trade_releas_qty
        {
            get { return _trade_releas_qty; }

            set
            {
                _trade_releas_qty = value;
                RaisePropertyChanged(() => trade_releas_qty);
            }
        }

        private double _strike_capt_qty;
        /// <summary>
        /// 成交占用数量
        /// </summary>
        public double strike_capt_qty
        {
            get { return _strike_capt_qty; }

            set
            {
                _strike_capt_qty = value;
                RaisePropertyChanged(() => strike_capt_qty);
            }
        }

        private double _strike_releas_qty;
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty
        {
            get { return _strike_releas_qty; }

            set
            {
                _strike_releas_qty = value;
                RaisePropertyChanged(() => strike_releas_qty);
            }
        }

        private double _strike_frozen_qty;
        /// <summary>
        /// 成交冻结数量
        /// </summary>
        public double strike_frozen_qty
        {
            get { return _strike_frozen_qty; }

            set
            {
                _strike_frozen_qty = value;
                RaisePropertyChanged(() => strike_frozen_qty);
            }
        }

        private double _strike_unfroz_qty;
        /// <summary>
        /// 成交解冻数量
        /// </summary>
        public double strike_unfroz_qty
        {
            get { return _strike_unfroz_qty; }

            set
            {
                _strike_unfroz_qty = value;
                RaisePropertyChanged(() => strike_unfroz_qty);
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
    }

    public class tdsecuL_10_74_Info : ObservableObject
    {
    }

    public class tdsecuL_10_75_Info : ObservableObject
    {
    }

}
