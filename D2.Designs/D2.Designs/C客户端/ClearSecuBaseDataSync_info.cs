using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class clsecuL_4_101_Info : ObservableObject
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

        private int _divi_cacl_num;
        /// <summary>
        /// 行为单位
        /// </summary>
        public int divi_cacl_num
        {
            get { return _divi_cacl_num; }

            set
            {
                _divi_cacl_num = value;
                RaisePropertyChanged(() => divi_cacl_num);
            }
        }

        private double _divi_amt;
        /// <summary>
        /// 分红金额
        /// </summary>
        public double divi_amt
        {
            get { return _divi_amt; }

            set
            {
                _divi_amt = value;
                RaisePropertyChanged(() => divi_amt);
            }
        }

        private double _divi_qty;
        /// <summary>
        /// 红股数量
        /// </summary>
        public double divi_qty
        {
            get { return _divi_qty; }

            set
            {
                _divi_qty = value;
                RaisePropertyChanged(() => divi_qty);
            }
        }

        private double _equity_trans_qty;
        /// <summary>
        /// 转赠数量
        /// </summary>
        public double equity_trans_qty
        {
            get { return _equity_trans_qty; }

            set
            {
                _equity_trans_qty = value;
                RaisePropertyChanged(() => equity_trans_qty);
            }
        }

        private double _rights_issue_qty;
        /// <summary>
        /// 配股数量
        /// </summary>
        public double rights_issue_qty
        {
            get { return _rights_issue_qty; }

            set
            {
                _rights_issue_qty = value;
                RaisePropertyChanged(() => rights_issue_qty);
            }
        }

        private double _placement_price;
        /// <summary>
        /// 配股价格
        /// </summary>
        public double placement_price
        {
            get { return _placement_price; }

            set
            {
                _placement_price = value;
                RaisePropertyChanged(() => placement_price);
            }
        }

        private int _notice_date;
        /// <summary>
        /// 公告日期
        /// </summary>
        public int notice_date
        {
            get { return _notice_date; }

            set
            {
                _notice_date = value;
                RaisePropertyChanged(() => notice_date);
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

        private int _ex_date;
        /// <summary>
        /// 除权日期
        /// </summary>
        public int ex_date
        {
            get { return _ex_date; }

            set
            {
                _ex_date = value;
                RaisePropertyChanged(() => ex_date);
            }
        }

        private int _arrive_date;
        /// <summary>
        /// 到账日期
        /// </summary>
        public int arrive_date
        {
            get { return _arrive_date; }

            set
            {
                _arrive_date = value;
                RaisePropertyChanged(() => arrive_date);
            }
        }

        private int _begin_trade_date;
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date
        {
            get { return _begin_trade_date; }

            set
            {
                _begin_trade_date = value;
                RaisePropertyChanged(() => begin_trade_date);
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
    }

    public class clsecuL_4_102_Info : ObservableObject
    {
    }

    public class clsecuL_4_103_Info : ObservableObject
    {
    }

    public class clsecuL_4_104_Info : ObservableObject
    {
    }

    public class clsecuL_4_105_Info : ObservableObject
    {
    }

}
