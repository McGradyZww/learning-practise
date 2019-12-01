using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class tdfutuL_4_11_Info : ObservableObject
    {

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
    }

    public class tdfutuL_4_12_Info : ObservableObject
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

        private String _contrc_code;
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code
        {
            get { return _contrc_code; }

            set
            {
                _contrc_code = value;
                RaisePropertyChanged(() => contrc_code);
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

    public class tdfutuL_4_21_Info : ObservableObject
    {
    }

    public class tdfutuL_4_31_Info : ObservableObject
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

        private String _futu_acco;
        /// <summary>
        /// 交易编码
        /// </summary>
        public String futu_acco
        {
            get { return _futu_acco; }

            set
            {
                _futu_acco = value;
                RaisePropertyChanged(() => futu_acco);
            }
        }

        private String _contrc_code;
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code
        {
            get { return _contrc_code; }

            set
            {
                _contrc_code = value;
                RaisePropertyChanged(() => contrc_code);
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

        private int _contrc_unit;
        /// <summary>
        /// 合约乘数
        /// </summary>
        public int contrc_unit
        {
            get { return _contrc_unit; }

            set
            {
                _contrc_unit = value;
                RaisePropertyChanged(() => contrc_unit);
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

    public class tdfutuL_4_32_Info : ObservableObject
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

        private String _contrc_code;
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code
        {
            get { return _contrc_code; }

            set
            {
                _contrc_code = value;
                RaisePropertyChanged(() => contrc_code);
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

    public class tdfutuL_4_101_Info : ObservableObject
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

        private int _futu_acco_no;
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no
        {
            get { return _futu_acco_no; }

            set
            {
                _futu_acco_no = value;
                RaisePropertyChanged(() => futu_acco_no);
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

        private int _contrc_unit;
        /// <summary>
        /// 合约乘数
        /// </summary>
        public int contrc_unit
        {
            get { return _contrc_unit; }

            set
            {
                _contrc_unit = value;
                RaisePropertyChanged(() => contrc_unit);
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

        private double _trade_fee;
        /// <summary>
        /// 交易费用
        /// </summary>
        public double trade_fee
        {
            get { return _trade_fee; }

            set
            {
                _trade_fee = value;
                RaisePropertyChanged(() => trade_fee);
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

        private double _strike_commis;
        /// <summary>
        /// 成交佣金
        /// </summary>
        public double strike_commis
        {
            get { return _strike_commis; }

            set
            {
                _strike_commis = value;
                RaisePropertyChanged(() => strike_commis);
            }
        }

        private double _strike_other_commis;
        /// <summary>
        /// 成交其他佣金
        /// </summary>
        public double strike_other_commis
        {
            get { return _strike_other_commis; }

            set
            {
                _strike_other_commis = value;
                RaisePropertyChanged(() => strike_other_commis);
            }
        }

        private double _strike_all_fee;
        /// <summary>
        /// 成交全部费用
        /// </summary>
        public double strike_all_fee
        {
            get { return _strike_all_fee; }

            set
            {
                _strike_all_fee = value;
                RaisePropertyChanged(() => strike_all_fee);
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

        private double _trade_occur_amt;
        /// <summary>
        /// 交易变动金额
        /// </summary>
        public double trade_occur_amt
        {
            get { return _trade_occur_amt; }

            set
            {
                _trade_occur_amt = value;
                RaisePropertyChanged(() => trade_occur_amt);
            }
        }

        private String _comb_code;
        /// <summary>
        /// 组合编码
        /// </summary>
        public String comb_code
        {
            get { return _comb_code; }

            set
            {
                _comb_code = value;
                RaisePropertyChanged(() => comb_code);
            }
        }

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

    public class tdfutuL_4_102_Info : ObservableObject
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

        private int _futu_acco_no;
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no
        {
            get { return _futu_acco_no; }

            set
            {
                _futu_acco_no = value;
                RaisePropertyChanged(() => futu_acco_no);
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

        private int _contrc_unit;
        /// <summary>
        /// 合约乘数
        /// </summary>
        public int contrc_unit
        {
            get { return _contrc_unit; }

            set
            {
                _contrc_unit = value;
                RaisePropertyChanged(() => contrc_unit);
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

        private double _trade_fee;
        /// <summary>
        /// 交易费用
        /// </summary>
        public double trade_fee
        {
            get { return _trade_fee; }

            set
            {
                _trade_fee = value;
                RaisePropertyChanged(() => trade_fee);
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

        private double _strike_commis;
        /// <summary>
        /// 成交佣金
        /// </summary>
        public double strike_commis
        {
            get { return _strike_commis; }

            set
            {
                _strike_commis = value;
                RaisePropertyChanged(() => strike_commis);
            }
        }

        private double _strike_other_commis;
        /// <summary>
        /// 成交其他佣金
        /// </summary>
        public double strike_other_commis
        {
            get { return _strike_other_commis; }

            set
            {
                _strike_other_commis = value;
                RaisePropertyChanged(() => strike_other_commis);
            }
        }

        private double _strike_all_fee;
        /// <summary>
        /// 成交全部费用
        /// </summary>
        public double strike_all_fee
        {
            get { return _strike_all_fee; }

            set
            {
                _strike_all_fee = value;
                RaisePropertyChanged(() => strike_all_fee);
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

        private double _trade_occur_amt;
        /// <summary>
        /// 交易变动金额
        /// </summary>
        public double trade_occur_amt
        {
            get { return _trade_occur_amt; }

            set
            {
                _trade_occur_amt = value;
                RaisePropertyChanged(() => trade_occur_amt);
            }
        }

        private String _comb_code;
        /// <summary>
        /// 组合编码
        /// </summary>
        public String comb_code
        {
            get { return _comb_code; }

            set
            {
                _comb_code = value;
                RaisePropertyChanged(() => comb_code);
            }
        }

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

    public class tdfutuL_4_103_Info : ObservableObject
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

        private String _contrc_code;
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code
        {
            get { return _contrc_code; }

            set
            {
                _contrc_code = value;
                RaisePropertyChanged(() => contrc_code);
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

        private int _contrc_unit;
        /// <summary>
        /// 合约乘数
        /// </summary>
        public int contrc_unit
        {
            get { return _contrc_unit; }

            set
            {
                _contrc_unit = value;
                RaisePropertyChanged(() => contrc_unit);
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

        private String _order_sum_status;
        /// <summary>
        /// 订单汇总状态
        /// </summary>
        public String order_sum_status
        {
            get { return _order_sum_status; }

            set
            {
                _order_sum_status = value;
                RaisePropertyChanged(() => order_sum_status);
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

        private double _waste_qty;
        /// <summary>
        /// 废单数量
        /// </summary>
        public double waste_qty
        {
            get { return _waste_qty; }

            set
            {
                _waste_qty = value;
                RaisePropertyChanged(() => waste_qty);
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

        private double _trade_fee;
        /// <summary>
        /// 交易费用
        /// </summary>
        public double trade_fee
        {
            get { return _trade_fee; }

            set
            {
                _trade_fee = value;
                RaisePropertyChanged(() => trade_fee);
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

        private double _strike_commis;
        /// <summary>
        /// 成交佣金
        /// </summary>
        public double strike_commis
        {
            get { return _strike_commis; }

            set
            {
                _strike_commis = value;
                RaisePropertyChanged(() => strike_commis);
            }
        }

        private double _strike_other_commis;
        /// <summary>
        /// 成交其他佣金
        /// </summary>
        public double strike_other_commis
        {
            get { return _strike_other_commis; }

            set
            {
                _strike_other_commis = value;
                RaisePropertyChanged(() => strike_other_commis);
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

        private double _strike_all_fee;
        /// <summary>
        /// 成交全部费用
        /// </summary>
        public double strike_all_fee
        {
            get { return _strike_all_fee; }

            set
            {
                _strike_all_fee = value;
                RaisePropertyChanged(() => strike_all_fee);
            }
        }

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

    public class tdfutuL_4_104_Info : ObservableObject
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

        private String _contrc_code;
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code
        {
            get { return _contrc_code; }

            set
            {
                _contrc_code = value;
                RaisePropertyChanged(() => contrc_code);
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

        private int _contrc_unit;
        /// <summary>
        /// 合约乘数
        /// </summary>
        public int contrc_unit
        {
            get { return _contrc_unit; }

            set
            {
                _contrc_unit = value;
                RaisePropertyChanged(() => contrc_unit);
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

        private String _order_sum_status;
        /// <summary>
        /// 订单汇总状态
        /// </summary>
        public String order_sum_status
        {
            get { return _order_sum_status; }

            set
            {
                _order_sum_status = value;
                RaisePropertyChanged(() => order_sum_status);
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

        private double _waste_qty;
        /// <summary>
        /// 废单数量
        /// </summary>
        public double waste_qty
        {
            get { return _waste_qty; }

            set
            {
                _waste_qty = value;
                RaisePropertyChanged(() => waste_qty);
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

        private double _trade_fee;
        /// <summary>
        /// 交易费用
        /// </summary>
        public double trade_fee
        {
            get { return _trade_fee; }

            set
            {
                _trade_fee = value;
                RaisePropertyChanged(() => trade_fee);
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

        private double _strike_commis;
        /// <summary>
        /// 成交佣金
        /// </summary>
        public double strike_commis
        {
            get { return _strike_commis; }

            set
            {
                _strike_commis = value;
                RaisePropertyChanged(() => strike_commis);
            }
        }

        private double _strike_other_commis;
        /// <summary>
        /// 成交其他佣金
        /// </summary>
        public double strike_other_commis
        {
            get { return _strike_other_commis; }

            set
            {
                _strike_other_commis = value;
                RaisePropertyChanged(() => strike_other_commis);
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

        private double _strike_all_fee;
        /// <summary>
        /// 成交全部费用
        /// </summary>
        public double strike_all_fee
        {
            get { return _strike_all_fee; }

            set
            {
                _strike_all_fee = value;
                RaisePropertyChanged(() => strike_all_fee);
            }
        }

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

    public class tdfutuL_4_33_Info : ObservableObject
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

        private ulong _modi_order_id;
        /// <summary>
        /// 改单序号
        /// </summary>
        public ulong modi_order_id
        {
            get { return _modi_order_id; }

            set
            {
                _modi_order_id = value;
                RaisePropertyChanged(() => modi_order_id);
            }
        }

        private ulong _new_order_id;
        /// <summary>
        /// 新订单序号
        /// </summary>
        public ulong new_order_id
        {
            get { return _new_order_id; }

            set
            {
                _new_order_id = value;
                RaisePropertyChanged(() => new_order_id);
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

        private ulong _wtdraw_id;
        /// <summary>
        /// 撤单序号
        /// </summary>
        public ulong wtdraw_id
        {
            get { return _wtdraw_id; }

            set
            {
                _wtdraw_id = value;
                RaisePropertyChanged(() => wtdraw_id);
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

        private String _old_order_status;
        /// <summary>
        /// 原订单状态
        /// </summary>
        public String old_order_status
        {
            get { return _old_order_status; }

            set
            {
                _old_order_status = value;
                RaisePropertyChanged(() => old_order_status);
            }
        }

        private String _new_order_status;
        /// <summary>
        /// 新订单状态
        /// </summary>
        public String new_order_status
        {
            get { return _new_order_status; }

            set
            {
                _new_order_status = value;
                RaisePropertyChanged(() => new_order_status);
            }
        }
    }

    public class tdfutuL_4_41_Info : ObservableObject
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

        private String _futu_acco;
        /// <summary>
        /// 交易编码
        /// </summary>
        public String futu_acco
        {
            get { return _futu_acco; }

            set
            {
                _futu_acco = value;
                RaisePropertyChanged(() => futu_acco);
            }
        }

        private String _contrc_code;
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code
        {
            get { return _contrc_code; }

            set
            {
                _contrc_code = value;
                RaisePropertyChanged(() => contrc_code);
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

        private int _contrc_unit;
        /// <summary>
        /// 合约乘数
        /// </summary>
        public int contrc_unit
        {
            get { return _contrc_unit; }

            set
            {
                _contrc_unit = value;
                RaisePropertyChanged(() => contrc_unit);
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

    public class tdfutuL_4_42_Info : ObservableObject
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

        private String _contrc_code;
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code
        {
            get { return _contrc_code; }

            set
            {
                _contrc_code = value;
                RaisePropertyChanged(() => contrc_code);
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

}
