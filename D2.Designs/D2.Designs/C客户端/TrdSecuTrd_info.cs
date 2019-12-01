using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class tdsecuL_4_11_Info : ObservableObject
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

    public class tdsecuL_4_12_Info : ObservableObject
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
    }

    public class tdsecuL_4_14_Info : ObservableObject
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

    public class tdsecuL_4_15_Info : ObservableObject
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

        private String _oper_statn;
        /// <summary>
        /// 操作站点
        /// </summary>
        public String oper_statn
        {
            get { return _oper_statn; }

            set
            {
                _oper_statn = value;
                RaisePropertyChanged(() => oper_statn);
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

        private String _order_id_str;
        /// <summary>
        /// 订单序号串
        /// </summary>
        public String order_id_str
        {
            get { return _order_id_str; }

            set
            {
                _order_id_str = value;
                RaisePropertyChanged(() => order_id_str);
            }
        }

        private String _order_status_str;
        /// <summary>
        /// 订单状态串
        /// </summary>
        public String order_status_str
        {
            get { return _order_status_str; }

            set
            {
                _order_status_str = value;
                RaisePropertyChanged(() => order_status_str);
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

    public class tdsecuL_4_16_Info : ObservableObject
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

        private ulong _pend_order_id;
        /// <summary>
        /// 待执行订单序号
        /// </summary>
        public ulong pend_order_id
        {
            get { return _pend_order_id; }

            set
            {
                _pend_order_id = value;
                RaisePropertyChanged(() => pend_order_id);
            }
        }
    }

    public class tdsecuL_4_17_Info : ObservableObject
    {
    }

    public class tdsecuL_4_21_Info : ObservableObject
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
    }

    public class tdsecuL_4_22_Info : ObservableObject
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
    }

    public class tdsecuL_4_23_Info : ObservableObject
    {

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
    }

    public class tdsecuL_4_31_Info : ObservableObject
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
    }

    public class tdsecuL_4_32_Info : ObservableObject
    {

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
    }

    public class tdsecuL_4_33_Info : ObservableObject
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

        private String _oper_statn;
        /// <summary>
        /// 操作站点
        /// </summary>
        public String oper_statn
        {
            get { return _oper_statn; }

            set
            {
                _oper_statn = value;
                RaisePropertyChanged(() => oper_statn);
            }
        }
    }

    public class tdsecuL_4_41_Info : ObservableObject
    {

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
    }

    public class tdsecuL_4_42_Info : ObservableObject
    {

        private ulong _pre_order_id;
        /// <summary>
        /// 预埋订单序号
        /// </summary>
        public ulong pre_order_id
        {
            get { return _pre_order_id; }

            set
            {
                _pre_order_id = value;
                RaisePropertyChanged(() => pre_order_id);
            }
        }

        private int _pre_order_date;
        /// <summary>
        /// 预埋订单日期
        /// </summary>
        public int pre_order_date
        {
            get { return _pre_order_date; }

            set
            {
                _pre_order_date = value;
                RaisePropertyChanged(() => pre_order_date);
            }
        }

        private int _pre_order_time;
        /// <summary>
        /// 预埋订单时间
        /// </summary>
        public int pre_order_time
        {
            get { return _pre_order_time; }

            set
            {
                _pre_order_time = value;
                RaisePropertyChanged(() => pre_order_time);
            }
        }

        private String _pre_order_status;
        /// <summary>
        /// 预埋订单状态
        /// </summary>
        public String pre_order_status
        {
            get { return _pre_order_status; }

            set
            {
                _pre_order_status = value;
                RaisePropertyChanged(() => pre_order_status);
            }
        }
    }

    public class tdsecuL_4_43_Info : ObservableObject
    {
    }

    public class tdsecuL_4_44_Info : ObservableObject
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

        private String _oper_statn;
        /// <summary>
        /// 操作站点
        /// </summary>
        public String oper_statn
        {
            get { return _oper_statn; }

            set
            {
                _oper_statn = value;
                RaisePropertyChanged(() => oper_statn);
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

        private String _order_id_str;
        /// <summary>
        /// 订单序号串
        /// </summary>
        public String order_id_str
        {
            get { return _order_id_str; }

            set
            {
                _order_id_str = value;
                RaisePropertyChanged(() => order_id_str);
            }
        }

        private String _order_status_str;
        /// <summary>
        /// 订单状态串
        /// </summary>
        public String order_status_str
        {
            get { return _order_status_str; }

            set
            {
                _order_status_str = value;
                RaisePropertyChanged(() => order_status_str);
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

    public class tdsecuL_4_45_Info : ObservableObject
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
    }

    public class tdsecuL_4_46_Info : ObservableObject
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
    }

    public class tdsecuL_4_47_Info : ObservableObject
    {
    }

    public class tdsecuL_4_101_Info : ObservableObject
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

        private String _combo_code;
        /// <summary>
        /// 组合代码
        /// </summary>
        public String combo_code
        {
            get { return _combo_code; }

            set
            {
                _combo_code = value;
                RaisePropertyChanged(() => combo_code);
            }
        }

        private ulong _combo_posi_id;
        /// <summary>
        /// 组合持仓序号
        /// </summary>
        public ulong combo_posi_id
        {
            get { return _combo_posi_id; }

            set
            {
                _combo_posi_id = value;
                RaisePropertyChanged(() => combo_posi_id);
            }
        }

        private ulong _strategy_id;
        /// <summary>
        /// 策略序号
        /// </summary>
        public ulong strategy_id
        {
            get { return _strategy_id; }

            set
            {
                _strategy_id = value;
                RaisePropertyChanged(() => strategy_id);
            }
        }

        private String _contra_no;
        /// <summary>
        /// 合同编号
        /// </summary>
        public String contra_no
        {
            get { return _contra_no; }

            set
            {
                _contra_no = value;
                RaisePropertyChanged(() => contra_no);
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

    public class tdsecuL_4_102_Info : ObservableObject
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

        private String _combo_code;
        /// <summary>
        /// 组合代码
        /// </summary>
        public String combo_code
        {
            get { return _combo_code; }

            set
            {
                _combo_code = value;
                RaisePropertyChanged(() => combo_code);
            }
        }

        private ulong _combo_posi_id;
        /// <summary>
        /// 组合持仓序号
        /// </summary>
        public ulong combo_posi_id
        {
            get { return _combo_posi_id; }

            set
            {
                _combo_posi_id = value;
                RaisePropertyChanged(() => combo_posi_id);
            }
        }

        private String _contra_no;
        /// <summary>
        /// 合同编号
        /// </summary>
        public String contra_no
        {
            get { return _contra_no; }

            set
            {
                _contra_no = value;
                RaisePropertyChanged(() => contra_no);
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

    public class tdsecuL_4_103_Info : ObservableObject
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

        private int _intrst_days;
        /// <summary>
        /// 计息天数
        /// </summary>
        public int intrst_days
        {
            get { return _intrst_days; }

            set
            {
                _intrst_days = value;
                RaisePropertyChanged(() => intrst_days);
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

        private int _bond_rate_type;
        /// <summary>
        /// 债券利率类型
        /// </summary>
        public int bond_rate_type
        {
            get { return _bond_rate_type; }

            set
            {
                _bond_rate_type = value;
                RaisePropertyChanged(() => bond_rate_type);
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
    }

    public class tdsecuL_4_104_Info : ObservableObject
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

        private int _basket_trade_type;
        /// <summary>
        /// 篮子交易类型
        /// </summary>
        public int basket_trade_type
        {
            get { return _basket_trade_type; }

            set
            {
                _basket_trade_type = value;
                RaisePropertyChanged(() => basket_trade_type);
            }
        }

        private double _basket_trade_amt;
        /// <summary>
        /// 篮子交易数值
        /// </summary>
        public double basket_trade_amt
        {
            get { return _basket_trade_amt; }

            set
            {
                _basket_trade_amt = value;
                RaisePropertyChanged(() => basket_trade_amt);
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

    public class tdsecuL_4_105_Info : ObservableObject
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

        private ulong _pre_order_id;
        /// <summary>
        /// 预埋订单序号
        /// </summary>
        public ulong pre_order_id
        {
            get { return _pre_order_id; }

            set
            {
                _pre_order_id = value;
                RaisePropertyChanged(() => pre_order_id);
            }
        }

        private int _pre_order_date;
        /// <summary>
        /// 预埋订单日期
        /// </summary>
        public int pre_order_date
        {
            get { return _pre_order_date; }

            set
            {
                _pre_order_date = value;
                RaisePropertyChanged(() => pre_order_date);
            }
        }

        private int _pre_order_time;
        /// <summary>
        /// 预埋订单时间
        /// </summary>
        public int pre_order_time
        {
            get { return _pre_order_time; }

            set
            {
                _pre_order_time = value;
                RaisePropertyChanged(() => pre_order_time);
            }
        }

        private int _pre_order_dir;
        /// <summary>
        /// 预埋订单方向
        /// </summary>
        public int pre_order_dir
        {
            get { return _pre_order_dir; }

            set
            {
                _pre_order_dir = value;
                RaisePropertyChanged(() => pre_order_dir);
            }
        }

        private int _pre_order_type;
        /// <summary>
        /// 预埋订单方式
        /// </summary>
        public int pre_order_type
        {
            get { return _pre_order_type; }

            set
            {
                _pre_order_type = value;
                RaisePropertyChanged(() => pre_order_type);
            }
        }

        private double _pre_order_price;
        /// <summary>
        /// 预埋订单价格
        /// </summary>
        public double pre_order_price
        {
            get { return _pre_order_price; }

            set
            {
                _pre_order_price = value;
                RaisePropertyChanged(() => pre_order_price);
            }
        }

        private double _pre_order_qty;
        /// <summary>
        /// 预埋订单数量
        /// </summary>
        public double pre_order_qty
        {
            get { return _pre_order_qty; }

            set
            {
                _pre_order_qty = value;
                RaisePropertyChanged(() => pre_order_qty);
            }
        }

        private String _pre_order_status;
        /// <summary>
        /// 预埋订单状态
        /// </summary>
        public String pre_order_status
        {
            get { return _pre_order_status; }

            set
            {
                _pre_order_status = value;
                RaisePropertyChanged(() => pre_order_status);
            }
        }

        private int _pre_price_type;
        /// <summary>
        /// 预埋价格类型
        /// </summary>
        public int pre_price_type
        {
            get { return _pre_price_type; }

            set
            {
                _pre_price_type = value;
                RaisePropertyChanged(() => pre_price_type);
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

        private int _pre_begin_date;
        /// <summary>
        /// 预埋开始日期
        /// </summary>
        public int pre_begin_date
        {
            get { return _pre_begin_date; }

            set
            {
                _pre_begin_date = value;
                RaisePropertyChanged(() => pre_begin_date);
            }
        }

        private int _pre_end_date;
        /// <summary>
        /// 预埋结束日期
        /// </summary>
        public int pre_end_date
        {
            get { return _pre_end_date; }

            set
            {
                _pre_end_date = value;
                RaisePropertyChanged(() => pre_end_date);
            }
        }

        private int _pre_begin_time;
        /// <summary>
        /// 预埋开始时间
        /// </summary>
        public int pre_begin_time
        {
            get { return _pre_begin_time; }

            set
            {
                _pre_begin_time = value;
                RaisePropertyChanged(() => pre_begin_time);
            }
        }

        private int _pre_end_time;
        /// <summary>
        /// 预埋结束时间
        /// </summary>
        public int pre_end_time
        {
            get { return _pre_end_time; }

            set
            {
                _pre_end_time = value;
                RaisePropertyChanged(() => pre_end_time);
            }
        }

        private int _trig_type;
        /// <summary>
        /// 触发方向
        /// </summary>
        public int trig_type
        {
            get { return _trig_type; }

            set
            {
                _trig_type = value;
                RaisePropertyChanged(() => trig_type);
            }
        }

        private double _trig_price;
        /// <summary>
        /// 触发价格
        /// </summary>
        public double trig_price
        {
            get { return _trig_price; }

            set
            {
                _trig_price = value;
                RaisePropertyChanged(() => trig_price);
            }
        }

        private int _trig_date;
        /// <summary>
        /// 触发日期
        /// </summary>
        public int trig_date
        {
            get { return _trig_date; }

            set
            {
                _trig_date = value;
                RaisePropertyChanged(() => trig_date);
            }
        }

        private int _trig_time;
        /// <summary>
        /// 触发时间
        /// </summary>
        public int trig_time
        {
            get { return _trig_time; }

            set
            {
                _trig_time = value;
                RaisePropertyChanged(() => trig_time);
            }
        }

        private int _is_trace;
        /// <summary>
        /// 是否追单
        /// </summary>
        public int is_trace
        {
            get { return _is_trace; }

            set
            {
                _is_trace = value;
                RaisePropertyChanged(() => is_trace);
            }
        }

        private double _price_up;
        /// <summary>
        /// 价格上限
        /// </summary>
        public double price_up
        {
            get { return _price_up; }

            set
            {
                _price_up = value;
                RaisePropertyChanged(() => price_up);
            }
        }

        private int _keep_trace;
        /// <summary>
        /// 持续追单
        /// </summary>
        public int keep_trace
        {
            get { return _keep_trace; }

            set
            {
                _keep_trace = value;
                RaisePropertyChanged(() => keep_trace);
            }
        }

        private String _order_no_str;
        /// <summary>
        /// 订单编号串
        /// </summary>
        public String order_no_str
        {
            get { return _order_no_str; }

            set
            {
                _order_no_str = value;
                RaisePropertyChanged(() => order_no_str);
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

    public class tdsecuL_4_106_Info : ObservableObject
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

        private int _modi_order_date;
        /// <summary>
        /// 改单日期
        /// </summary>
        public int modi_order_date
        {
            get { return _modi_order_date; }

            set
            {
                _modi_order_date = value;
                RaisePropertyChanged(() => modi_order_date);
            }
        }

        private int _modi_order_time;
        /// <summary>
        /// 改单时间
        /// </summary>
        public int modi_order_time
        {
            get { return _modi_order_time; }

            set
            {
                _modi_order_time = value;
                RaisePropertyChanged(() => modi_order_time);
            }
        }

        private int _modi_batch_no;
        /// <summary>
        /// 改单批号
        /// </summary>
        public int modi_batch_no
        {
            get { return _modi_batch_no; }

            set
            {
                _modi_batch_no = value;
                RaisePropertyChanged(() => modi_batch_no);
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

        private double _modi_order_price;
        /// <summary>
        /// 改单价格
        /// </summary>
        public double modi_order_price
        {
            get { return _modi_order_price; }

            set
            {
                _modi_order_price = value;
                RaisePropertyChanged(() => modi_order_price);
            }
        }

        private double _modi_order_qty;
        /// <summary>
        /// 改单数量
        /// </summary>
        public double modi_order_qty
        {
            get { return _modi_order_qty; }

            set
            {
                _modi_order_qty = value;
                RaisePropertyChanged(() => modi_order_qty);
            }
        }

        private String _modi_order_status;
        /// <summary>
        /// 改单状态
        /// </summary>
        public String modi_order_status
        {
            get { return _modi_order_status; }

            set
            {
                _modi_order_status = value;
                RaisePropertyChanged(() => modi_order_status);
            }
        }

        private int _modi_price_type;
        /// <summary>
        /// 改单价格类型
        /// </summary>
        public int modi_price_type
        {
            get { return _modi_price_type; }

            set
            {
                _modi_price_type = value;
                RaisePropertyChanged(() => modi_price_type);
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

    public class tdsecuL_4_107_Info : ObservableObject
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

        private int _modi_order_date;
        /// <summary>
        /// 改单日期
        /// </summary>
        public int modi_order_date
        {
            get { return _modi_order_date; }

            set
            {
                _modi_order_date = value;
                RaisePropertyChanged(() => modi_order_date);
            }
        }

        private int _modi_order_time;
        /// <summary>
        /// 改单时间
        /// </summary>
        public int modi_order_time
        {
            get { return _modi_order_time; }

            set
            {
                _modi_order_time = value;
                RaisePropertyChanged(() => modi_order_time);
            }
        }

        private int _modi_batch_no;
        /// <summary>
        /// 改单批号
        /// </summary>
        public int modi_batch_no
        {
            get { return _modi_batch_no; }

            set
            {
                _modi_batch_no = value;
                RaisePropertyChanged(() => modi_batch_no);
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

        private double _modi_order_price;
        /// <summary>
        /// 改单价格
        /// </summary>
        public double modi_order_price
        {
            get { return _modi_order_price; }

            set
            {
                _modi_order_price = value;
                RaisePropertyChanged(() => modi_order_price);
            }
        }

        private double _modi_order_qty;
        /// <summary>
        /// 改单数量
        /// </summary>
        public double modi_order_qty
        {
            get { return _modi_order_qty; }

            set
            {
                _modi_order_qty = value;
                RaisePropertyChanged(() => modi_order_qty);
            }
        }

        private String _modi_order_status;
        /// <summary>
        /// 改单状态
        /// </summary>
        public String modi_order_status
        {
            get { return _modi_order_status; }

            set
            {
                _modi_order_status = value;
                RaisePropertyChanged(() => modi_order_status);
            }
        }

        private int _modi_price_type;
        /// <summary>
        /// 改单价格类型
        /// </summary>
        public int modi_price_type
        {
            get { return _modi_price_type; }

            set
            {
                _modi_price_type = value;
                RaisePropertyChanged(() => modi_price_type);
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

    public class tdsecuL_4_108_Info : ObservableObject
    {

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
    }

    public class tdsecuL_4_109_Info : ObservableObject
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

        private String _offer_oper_way;
        /// <summary>
        /// 报盘操作方式
        /// </summary>
        public String offer_oper_way
        {
            get { return _offer_oper_way; }

            set
            {
                _offer_oper_way = value;
                RaisePropertyChanged(() => offer_oper_way);
            }
        }
    }

    public class tdsecuL_4_110_Info : ObservableObject
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

        private int _intrst_days;
        /// <summary>
        /// 计息天数
        /// </summary>
        public int intrst_days
        {
            get { return _intrst_days; }

            set
            {
                _intrst_days = value;
                RaisePropertyChanged(() => intrst_days);
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

        private int _bond_rate_type;
        /// <summary>
        /// 债券利率类型
        /// </summary>
        public int bond_rate_type
        {
            get { return _bond_rate_type; }

            set
            {
                _bond_rate_type = value;
                RaisePropertyChanged(() => bond_rate_type);
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

    public class tdsecuL_4_111_Info : ObservableObject
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

        private int _exec_price_type;
        /// <summary>
        /// 执行价格类型
        /// </summary>
        public int exec_price_type
        {
            get { return _exec_price_type; }

            set
            {
                _exec_price_type = value;
                RaisePropertyChanged(() => exec_price_type);
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

        private String _pend_order_status;
        /// <summary>
        /// 待执行订单状态
        /// </summary>
        public String pend_order_status
        {
            get { return _pend_order_status; }

            set
            {
                _pend_order_status = value;
                RaisePropertyChanged(() => pend_order_status);
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
    }

    public class tdsecuL_4_112_Info : ObservableObject
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

        private int _exec_price_type;
        /// <summary>
        /// 执行价格类型
        /// </summary>
        public int exec_price_type
        {
            get { return _exec_price_type; }

            set
            {
                _exec_price_type = value;
                RaisePropertyChanged(() => exec_price_type);
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

        private String _pend_order_status;
        /// <summary>
        /// 待执行订单状态
        /// </summary>
        public String pend_order_status
        {
            get { return _pend_order_status; }

            set
            {
                _pend_order_status = value;
                RaisePropertyChanged(() => pend_order_status);
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
    }

    public class tdsecuL_4_113_Info : ObservableObject
    {

        private int _order_count;
        /// <summary>
        /// 订单记录数
        /// </summary>
        public int order_count
        {
            get { return _order_count; }

            set
            {
                _order_count = value;
                RaisePropertyChanged(() => order_count);
            }
        }
    }

    public class tdsecuL_4_114_Info : ObservableObject
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

    public class tdsecuL_4_115_Info : ObservableObject
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

    public class tdsecuL_4_120_Info : ObservableObject
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

        private String _combo_code;
        /// <summary>
        /// 组合代码
        /// </summary>
        public String combo_code
        {
            get { return _combo_code; }

            set
            {
                _combo_code = value;
                RaisePropertyChanged(() => combo_code);
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

        private double _combo_copies;
        /// <summary>
        /// 组合份数
        /// </summary>
        public double combo_copies
        {
            get { return _combo_copies; }

            set
            {
                _combo_copies = value;
                RaisePropertyChanged(() => combo_copies);
            }
        }

        private int _combo_date;
        /// <summary>
        /// 组合日期
        /// </summary>
        public int combo_date
        {
            get { return _combo_date; }

            set
            {
                _combo_date = value;
                RaisePropertyChanged(() => combo_date);
            }
        }

        private int _combo_time;
        /// <summary>
        /// 组合时间
        /// </summary>
        public int combo_time
        {
            get { return _combo_time; }

            set
            {
                _combo_time = value;
                RaisePropertyChanged(() => combo_time);
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

    public class tdsecuL_4_121_Info : ObservableObject
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

        private String _combo_code;
        /// <summary>
        /// 组合代码
        /// </summary>
        public String combo_code
        {
            get { return _combo_code; }

            set
            {
                _combo_code = value;
                RaisePropertyChanged(() => combo_code);
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

        private double _combo_copies;
        /// <summary>
        /// 组合份数
        /// </summary>
        public double combo_copies
        {
            get { return _combo_copies; }

            set
            {
                _combo_copies = value;
                RaisePropertyChanged(() => combo_copies);
            }
        }

        private int _combo_date;
        /// <summary>
        /// 组合日期
        /// </summary>
        public int combo_date
        {
            get { return _combo_date; }

            set
            {
                _combo_date = value;
                RaisePropertyChanged(() => combo_date);
            }
        }

        private int _combo_time;
        /// <summary>
        /// 组合时间
        /// </summary>
        public int combo_time
        {
            get { return _combo_time; }

            set
            {
                _combo_time = value;
                RaisePropertyChanged(() => combo_time);
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

    public class tdsecuL_4_122_Info : ObservableObject
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

        private String _oper_statn;
        /// <summary>
        /// 操作站点
        /// </summary>
        public String oper_statn
        {
            get { return _oper_statn; }

            set
            {
                _oper_statn = value;
                RaisePropertyChanged(() => oper_statn);
            }
        }
    }

    public class tdsecuL_4_123_Info : ObservableObject
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

    public class tdsecuL_4_124_Info : ObservableObject
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

    public class tdsecuL_4_125_Info : ObservableObject
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

    public class tdsecuL_4_126_Info : ObservableObject
    {
    }

    public class tdsecuL_4_127_Info : ObservableObject
    {
    }

    public class tdsecuL_4_128_Info : ObservableObject
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

        private int _am_trd_begin_time;
        /// <summary>
        /// 上午交易开始时间
        /// </summary>
        public int am_trd_begin_time
        {
            get { return _am_trd_begin_time; }

            set
            {
                _am_trd_begin_time = value;
                RaisePropertyChanged(() => am_trd_begin_time);
            }
        }

        private int _am_trd_end_time;
        /// <summary>
        /// 上午交易结束时间
        /// </summary>
        public int am_trd_end_time
        {
            get { return _am_trd_end_time; }

            set
            {
                _am_trd_end_time = value;
                RaisePropertyChanged(() => am_trd_end_time);
            }
        }

        private int _pm_trd_begin_time;
        /// <summary>
        /// 下午交易开始时间
        /// </summary>
        public int pm_trd_begin_time
        {
            get { return _pm_trd_begin_time; }

            set
            {
                _pm_trd_begin_time = value;
                RaisePropertyChanged(() => pm_trd_begin_time);
            }
        }

        private int _pm_trd_end_time;
        /// <summary>
        /// 下午交易结束时间
        /// </summary>
        public int pm_trd_end_time
        {
            get { return _pm_trd_end_time; }

            set
            {
                _pm_trd_end_time = value;
                RaisePropertyChanged(() => pm_trd_end_time);
            }
        }
    }

    public class tdsecuL_4_129_Info : ObservableObject
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

    public class tdsecuL_4_130_Info : ObservableObject
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

    public class tdsecuL_4_131_Info : ObservableObject
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
    }

    public class tdsecuL_4_132_Info : ObservableObject
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

    public class tdsecuL_4_133_Info : ObservableObject
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
    }

    public class tdsecuL_4_134_Info : ObservableObject
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

    public class tdsecuL_4_135_Info : ObservableObject
    {
    }

    public class tdsecuL_4_136_Info : ObservableObject
    {
    }

    public class tdsecuL_4_137_Info : ObservableObject
    {
    }

    public class tdsecuL_4_138_Info : ObservableObject
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

    public class tdsecuL_4_139_Info : ObservableObject
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

}
