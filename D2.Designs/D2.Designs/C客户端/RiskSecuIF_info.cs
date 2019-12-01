using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class rksecuL_5_16_Info : ObservableObject
    {
    }

    public class rksecuL_5_17_Info : ObservableObject
    {
    }

    public class rksecuL_5_18_Info : ObservableObject
    {
    }

    public class rksecuL_5_19_Info : ObservableObject
    {
    }

    public class rksecuL_5_20_Info : ObservableObject
    {
    }

    public class rksecuL_5_21_Info : ObservableObject
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
    }

    public class rksecuL_5_22_Info : ObservableObject
    {

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

}
