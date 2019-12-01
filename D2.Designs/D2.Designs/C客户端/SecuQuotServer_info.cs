using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pubL_16_1_Info : ObservableObject
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
    }

    public class pubL_16_2_Info : ObservableObject
    {
    }

    public class pubL_16_3_Info : ObservableObject
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

        private double _ask_exec_qty;
        /// <summary>
        /// 请求总成交量
        /// </summary>
        public double ask_exec_qty
        {
            get { return _ask_exec_qty; }

            set
            {
                _ask_exec_qty = value;
                RaisePropertyChanged(() => ask_exec_qty);
            }
        }

        private double _ask_exec_qty1;
        /// <summary>
        /// 指定时间段内总成交量
        /// </summary>
        public double ask_exec_qty1
        {
            get { return _ask_exec_qty1; }

            set
            {
                _ask_exec_qty1 = value;
                RaisePropertyChanged(() => ask_exec_qty1);
            }
        }

        private double _ask_exec_qty2;
        /// <summary>
        /// 指定时间段内符合价格要求的成交量
        /// </summary>
        public double ask_exec_qty2
        {
            get { return _ask_exec_qty2; }

            set
            {
                _ask_exec_qty2 = value;
                RaisePropertyChanged(() => ask_exec_qty2);
            }
        }

        private double _ask_exec_qty3;
        /// <summary>
        /// 开始到当前时间范围内总成交量
        /// </summary>
        public double ask_exec_qty3
        {
            get { return _ask_exec_qty3; }

            set
            {
                _ask_exec_qty3 = value;
                RaisePropertyChanged(() => ask_exec_qty3);
            }
        }

        private double _ask_exec_qty4;
        /// <summary>
        /// 开始到当前时间范围内符合价格要求的成交量
        /// </summary>
        public double ask_exec_qty4
        {
            get { return _ask_exec_qty4; }

            set
            {
                _ask_exec_qty4 = value;
                RaisePropertyChanged(() => ask_exec_qty4);
            }
        }

        private double _ask_avg_price1;
        /// <summary>
        /// 开始到收市符合价格要求的所有成交的成交均价
        /// </summary>
        public double ask_avg_price1
        {
            get { return _ask_avg_price1; }

            set
            {
                _ask_avg_price1 = value;
                RaisePropertyChanged(() => ask_avg_price1);
            }
        }

        private double _ask_avg_price2;
        /// <summary>
        /// 指定时间段内符合价格要求的所有成交的成交均价
        /// </summary>
        public double ask_avg_price2
        {
            get { return _ask_avg_price2; }

            set
            {
                _ask_avg_price2 = value;
                RaisePropertyChanged(() => ask_avg_price2);
            }
        }
    }

    public class pubL_16_4_Info : ObservableObject
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

        private String _quot_price_info;
        /// <summary>
        /// 行情价格信息
        /// </summary>
        public String quot_price_info
        {
            get { return _quot_price_info; }

            set
            {
                _quot_price_info = value;
                RaisePropertyChanged(() => quot_price_info);
            }
        }
    }

    public class pubL_16_5_Info : ObservableObject
    {
    }

    public class pubL_16_11_Info : ObservableObject
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

        private String _quot_price_info;
        /// <summary>
        /// 行情价格信息
        /// </summary>
        public String quot_price_info
        {
            get { return _quot_price_info; }

            set
            {
                _quot_price_info = value;
                RaisePropertyChanged(() => quot_price_info);
            }
        }
    }

    public class pubL_16_12_Info : ObservableObject
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

        private String _quot_price_info;
        /// <summary>
        /// 行情价格信息
        /// </summary>
        public String quot_price_info
        {
            get { return _quot_price_info; }

            set
            {
                _quot_price_info = value;
                RaisePropertyChanged(() => quot_price_info);
            }
        }
    }

    public class pubL_16_15_Info : ObservableObject
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

        private String _quot_price_info;
        /// <summary>
        /// 行情价格信息
        /// </summary>
        public String quot_price_info
        {
            get { return _quot_price_info; }

            set
            {
                _quot_price_info = value;
                RaisePropertyChanged(() => quot_price_info);
            }
        }
    }

    public class pubL_16_16_Info : ObservableObject
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

        private double _ask_exec_qty;
        /// <summary>
        /// 请求总成交量
        /// </summary>
        public double ask_exec_qty
        {
            get { return _ask_exec_qty; }

            set
            {
                _ask_exec_qty = value;
                RaisePropertyChanged(() => ask_exec_qty);
            }
        }

        private double _ask_exec_qty1;
        /// <summary>
        /// 指定时间段内总成交量
        /// </summary>
        public double ask_exec_qty1
        {
            get { return _ask_exec_qty1; }

            set
            {
                _ask_exec_qty1 = value;
                RaisePropertyChanged(() => ask_exec_qty1);
            }
        }

        private double _ask_exec_qty2;
        /// <summary>
        /// 指定时间段内符合价格要求的成交量
        /// </summary>
        public double ask_exec_qty2
        {
            get { return _ask_exec_qty2; }

            set
            {
                _ask_exec_qty2 = value;
                RaisePropertyChanged(() => ask_exec_qty2);
            }
        }

        private double _ask_exec_qty3;
        /// <summary>
        /// 开始到当前时间范围内总成交量
        /// </summary>
        public double ask_exec_qty3
        {
            get { return _ask_exec_qty3; }

            set
            {
                _ask_exec_qty3 = value;
                RaisePropertyChanged(() => ask_exec_qty3);
            }
        }

        private double _ask_exec_qty4;
        /// <summary>
        /// 开始到当前时间范围内符合价格要求的成交量
        /// </summary>
        public double ask_exec_qty4
        {
            get { return _ask_exec_qty4; }

            set
            {
                _ask_exec_qty4 = value;
                RaisePropertyChanged(() => ask_exec_qty4);
            }
        }

        private double _ask_avg_price1;
        /// <summary>
        /// 开始到收市符合价格要求的所有成交的成交均价
        /// </summary>
        public double ask_avg_price1
        {
            get { return _ask_avg_price1; }

            set
            {
                _ask_avg_price1 = value;
                RaisePropertyChanged(() => ask_avg_price1);
            }
        }

        private double _ask_avg_price2;
        /// <summary>
        /// 指定时间段内符合价格要求的所有成交的成交均价
        /// </summary>
        public double ask_avg_price2
        {
            get { return _ask_avg_price2; }

            set
            {
                _ask_avg_price2 = value;
                RaisePropertyChanged(() => ask_avg_price2);
            }
        }
    }

    public class pubL_16_17_Info : ObservableObject
    {
    }

    public class pubL_16_18_Info : ObservableObject
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

        private String _quot_price_info;
        /// <summary>
        /// 行情价格信息
        /// </summary>
        public String quot_price_info
        {
            get { return _quot_price_info; }

            set
            {
                _quot_price_info = value;
                RaisePropertyChanged(() => quot_price_info);
            }
        }
    }

    public class pubL_16_19_Info : ObservableObject
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

        private double _ask_exec_qty;
        /// <summary>
        /// 请求总成交量
        /// </summary>
        public double ask_exec_qty
        {
            get { return _ask_exec_qty; }

            set
            {
                _ask_exec_qty = value;
                RaisePropertyChanged(() => ask_exec_qty);
            }
        }

        private double _ask_exec_qty1;
        /// <summary>
        /// 指定时间段内总成交量
        /// </summary>
        public double ask_exec_qty1
        {
            get { return _ask_exec_qty1; }

            set
            {
                _ask_exec_qty1 = value;
                RaisePropertyChanged(() => ask_exec_qty1);
            }
        }

        private double _ask_exec_qty2;
        /// <summary>
        /// 指定时间段内符合价格要求的成交量
        /// </summary>
        public double ask_exec_qty2
        {
            get { return _ask_exec_qty2; }

            set
            {
                _ask_exec_qty2 = value;
                RaisePropertyChanged(() => ask_exec_qty2);
            }
        }

        private double _ask_exec_qty3;
        /// <summary>
        /// 开始到当前时间范围内总成交量
        /// </summary>
        public double ask_exec_qty3
        {
            get { return _ask_exec_qty3; }

            set
            {
                _ask_exec_qty3 = value;
                RaisePropertyChanged(() => ask_exec_qty3);
            }
        }

        private double _ask_exec_qty4;
        /// <summary>
        /// 开始到当前时间范围内符合价格要求的成交量
        /// </summary>
        public double ask_exec_qty4
        {
            get { return _ask_exec_qty4; }

            set
            {
                _ask_exec_qty4 = value;
                RaisePropertyChanged(() => ask_exec_qty4);
            }
        }

        private double _ask_avg_price1;
        /// <summary>
        /// 开始到收市符合价格要求的所有成交的成交均价
        /// </summary>
        public double ask_avg_price1
        {
            get { return _ask_avg_price1; }

            set
            {
                _ask_avg_price1 = value;
                RaisePropertyChanged(() => ask_avg_price1);
            }
        }

        private double _ask_avg_price2;
        /// <summary>
        /// 指定时间段内符合价格要求的所有成交的成交均价
        /// </summary>
        public double ask_avg_price2
        {
            get { return _ask_avg_price2; }

            set
            {
                _ask_avg_price2 = value;
                RaisePropertyChanged(() => ask_avg_price2);
            }
        }
    }

}
