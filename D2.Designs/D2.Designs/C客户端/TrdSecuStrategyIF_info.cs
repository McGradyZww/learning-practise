using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class tdsecuL_11_11_Info : ObservableObject
    {
    }

    public class tdsecuL_11_12_Info : ObservableObject
    {
    }

    public class tdsecuL_11_13_Info : ObservableObject
    {
    }

    public class tdsecuL_11_101_Info : ObservableObject
    {

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

        private ulong _algo_order_id;
        /// <summary>
        /// 母单序号
        /// </summary>
        public ulong algo_order_id
        {
            get { return _algo_order_id; }

            set
            {
                _algo_order_id = value;
                RaisePropertyChanged(() => algo_order_id);
            }
        }

        private ulong _seco_algo_order_id;
        /// <summary>
        /// 第二母单序号
        /// </summary>
        public ulong seco_algo_order_id
        {
            get { return _seco_algo_order_id; }

            set
            {
                _seco_algo_order_id = value;
                RaisePropertyChanged(() => seco_algo_order_id);
            }
        }

        private String _algo_exec_broker;
        /// <summary>
        /// 策略执行商
        /// </summary>
        public String algo_exec_broker
        {
            get { return _algo_exec_broker; }

            set
            {
                _algo_exec_broker = value;
                RaisePropertyChanged(() => algo_exec_broker);
            }
        }

        private String _algo_exec_comm_str;
        /// <summary>
        /// 策略执行指令串
        /// </summary>
        public String algo_exec_comm_str
        {
            get { return _algo_exec_comm_str; }

            set
            {
                _algo_exec_comm_str = value;
                RaisePropertyChanged(() => algo_exec_comm_str);
            }
        }

        private int _algo_exec_kind;
        /// <summary>
        /// 策略执行方式
        /// </summary>
        public int algo_exec_kind
        {
            get { return _algo_exec_kind; }

            set
            {
                _algo_exec_kind = value;
                RaisePropertyChanged(() => algo_exec_kind);
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

        private String _algo_busi_type;
        /// <summary>
        /// 策略业务类别
        /// </summary>
        public String algo_busi_type
        {
            get { return _algo_busi_type; }

            set
            {
                _algo_busi_type = value;
                RaisePropertyChanged(() => algo_busi_type);
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

        private double _cash_order_qty;
        /// <summary>
        /// 资金订单数量
        /// </summary>
        public double cash_order_qty
        {
            get { return _cash_order_qty; }

            set
            {
                _cash_order_qty = value;
                RaisePropertyChanged(() => cash_order_qty);
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

        private int _algo_valid_type;
        /// <summary>
        /// 策略有效期限
        /// </summary>
        public int algo_valid_type
        {
            get { return _algo_valid_type; }

            set
            {
                _algo_valid_type = value;
                RaisePropertyChanged(() => algo_valid_type);
            }
        }

        private String _algo_rule_way;
        /// <summary>
        /// 策略规则方式
        /// </summary>
        public String algo_rule_way
        {
            get { return _algo_rule_way; }

            set
            {
                _algo_rule_way = value;
                RaisePropertyChanged(() => algo_rule_way);
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

        private int _algo_order_time;
        /// <summary>
        /// 母单时间
        /// </summary>
        public int algo_order_time
        {
            get { return _algo_order_time; }

            set
            {
                _algo_order_time = value;
                RaisePropertyChanged(() => algo_order_time);
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

        private int _busi_opor_no;
        /// <summary>
        /// 业务操作员编号
        /// </summary>
        public int busi_opor_no
        {
            get { return _busi_opor_no; }

            set
            {
                _busi_opor_no = value;
                RaisePropertyChanged(() => busi_opor_no);
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

        private int _margin_trade_type;
        /// <summary>
        /// 信用交易方式
        /// </summary>
        public int margin_trade_type
        {
            get { return _margin_trade_type; }

            set
            {
                _margin_trade_type = value;
                RaisePropertyChanged(() => margin_trade_type);
            }
        }

        private String _target_strategy_type;
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type
        {
            get { return _target_strategy_type; }

            set
            {
                _target_strategy_type = value;
                RaisePropertyChanged(() => target_strategy_type);
            }
        }

        private String _target_strategy_param;
        /// <summary>
        /// 目标策略参数
        /// </summary>
        public String target_strategy_param
        {
            get { return _target_strategy_param; }

            set
            {
                _target_strategy_param = value;
                RaisePropertyChanged(() => target_strategy_param);
            }
        }

        private int _external_no;
        /// <summary>
        /// 外部编号
        /// </summary>
        public int external_no
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

}
