using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pdsecuL_21_1_Info : ObservableObject
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

        private int _invest_type;
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type
        {
            get { return _invest_type; }

            set
            {
                _invest_type = value;
                RaisePropertyChanged(() => invest_type);
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

        private int _debt_type;
        /// <summary>
        /// 负债类型
        /// </summary>
        public int debt_type
        {
            get { return _debt_type; }

            set
            {
                _debt_type = value;
                RaisePropertyChanged(() => debt_type);
            }
        }

        private double _begin_debt_qty;
        /// <summary>
        /// 期初负债数量
        /// </summary>
        public double begin_debt_qty
        {
            get { return _begin_debt_qty; }

            set
            {
                _begin_debt_qty = value;
                RaisePropertyChanged(() => begin_debt_qty);
            }
        }

        private double _curr_debt_qty;
        /// <summary>
        /// 当前负债数量
        /// </summary>
        public double curr_debt_qty
        {
            get { return _curr_debt_qty; }

            set
            {
                _curr_debt_qty = value;
                RaisePropertyChanged(() => curr_debt_qty);
            }
        }

        private double _posi_qty_check_diff;
        /// <summary>
        /// 持仓核对差额
        /// </summary>
        public double posi_qty_check_diff
        {
            get { return _posi_qty_check_diff; }

            set
            {
                _posi_qty_check_diff = value;
                RaisePropertyChanged(() => posi_qty_check_diff);
            }
        }

        private double _begin_debt_amt;
        /// <summary>
        /// 期初负债金额
        /// </summary>
        public double begin_debt_amt
        {
            get { return _begin_debt_amt; }

            set
            {
                _begin_debt_amt = value;
                RaisePropertyChanged(() => begin_debt_amt);
            }
        }

        private double _curr_debt_amt;
        /// <summary>
        /// 当前负债金额
        /// </summary>
        public double curr_debt_amt
        {
            get { return _curr_debt_amt; }

            set
            {
                _curr_debt_amt = value;
                RaisePropertyChanged(() => curr_debt_amt);
            }
        }

        private double _debt_interest_amt;
        /// <summary>
        /// 负债利息金额
        /// </summary>
        public double debt_interest_amt
        {
            get { return _debt_interest_amt; }

            set
            {
                _debt_interest_amt = value;
                RaisePropertyChanged(() => debt_interest_amt);
            }
        }

        private double _debt_return_amt;
        /// <summary>
        /// 已归还金额
        /// </summary>
        public double debt_return_amt
        {
            get { return _debt_return_amt; }

            set
            {
                _debt_return_amt = value;
                RaisePropertyChanged(() => debt_return_amt);
            }
        }

        private double _debt_return_qty;
        /// <summary>
        /// 已归还数量
        /// </summary>
        public double debt_return_qty
        {
            get { return _debt_return_qty; }

            set
            {
                _debt_return_qty = value;
                RaisePropertyChanged(() => debt_return_qty);
            }
        }

        private double _return_interest_amt;
        /// <summary>
        /// 归还利息金额
        /// </summary>
        public double return_interest_amt
        {
            get { return _return_interest_amt; }

            set
            {
                _return_interest_amt = value;
                RaisePropertyChanged(() => return_interest_amt);
            }
        }
    }

    public class pdsecuL_21_2_Info : ObservableObject
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

        private int _invest_type;
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type
        {
            get { return _invest_type; }

            set
            {
                _invest_type = value;
                RaisePropertyChanged(() => invest_type);
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

        private int _debt_type;
        /// <summary>
        /// 负债类型
        /// </summary>
        public int debt_type
        {
            get { return _debt_type; }

            set
            {
                _debt_type = value;
                RaisePropertyChanged(() => debt_type);
            }
        }

        private double _begin_debt_qty;
        /// <summary>
        /// 期初负债数量
        /// </summary>
        public double begin_debt_qty
        {
            get { return _begin_debt_qty; }

            set
            {
                _begin_debt_qty = value;
                RaisePropertyChanged(() => begin_debt_qty);
            }
        }

        private double _curr_debt_qty;
        /// <summary>
        /// 当前负债数量
        /// </summary>
        public double curr_debt_qty
        {
            get { return _curr_debt_qty; }

            set
            {
                _curr_debt_qty = value;
                RaisePropertyChanged(() => curr_debt_qty);
            }
        }

        private double _posi_qty_check_diff;
        /// <summary>
        /// 持仓核对差额
        /// </summary>
        public double posi_qty_check_diff
        {
            get { return _posi_qty_check_diff; }

            set
            {
                _posi_qty_check_diff = value;
                RaisePropertyChanged(() => posi_qty_check_diff);
            }
        }

        private double _begin_debt_amt;
        /// <summary>
        /// 期初负债金额
        /// </summary>
        public double begin_debt_amt
        {
            get { return _begin_debt_amt; }

            set
            {
                _begin_debt_amt = value;
                RaisePropertyChanged(() => begin_debt_amt);
            }
        }

        private double _curr_debt_amt;
        /// <summary>
        /// 当前负债金额
        /// </summary>
        public double curr_debt_amt
        {
            get { return _curr_debt_amt; }

            set
            {
                _curr_debt_amt = value;
                RaisePropertyChanged(() => curr_debt_amt);
            }
        }

        private double _debt_interest_amt;
        /// <summary>
        /// 负债利息金额
        /// </summary>
        public double debt_interest_amt
        {
            get { return _debt_interest_amt; }

            set
            {
                _debt_interest_amt = value;
                RaisePropertyChanged(() => debt_interest_amt);
            }
        }

        private double _debt_return_amt;
        /// <summary>
        /// 已归还金额
        /// </summary>
        public double debt_return_amt
        {
            get { return _debt_return_amt; }

            set
            {
                _debt_return_amt = value;
                RaisePropertyChanged(() => debt_return_amt);
            }
        }

        private double _debt_return_qty;
        /// <summary>
        /// 已归还数量
        /// </summary>
        public double debt_return_qty
        {
            get { return _debt_return_qty; }

            set
            {
                _debt_return_qty = value;
                RaisePropertyChanged(() => debt_return_qty);
            }
        }

        private double _return_interest_amt;
        /// <summary>
        /// 归还利息金额
        /// </summary>
        public double return_interest_amt
        {
            get { return _return_interest_amt; }

            set
            {
                _return_interest_amt = value;
                RaisePropertyChanged(() => return_interest_amt);
            }
        }
    }

    public class pdsecuL_21_3_Info : ObservableObject
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

        private double _loan_sell_amt;
        /// <summary>
        /// 融券卖出金额
        /// </summary>
        public double loan_sell_amt
        {
            get { return _loan_sell_amt; }

            set
            {
                _loan_sell_amt = value;
                RaisePropertyChanged(() => loan_sell_amt);
            }
        }

        private double _debt_interest_amt;
        /// <summary>
        /// 负债利息金额
        /// </summary>
        public double debt_interest_amt
        {
            get { return _debt_interest_amt; }

            set
            {
                _debt_interest_amt = value;
                RaisePropertyChanged(() => debt_interest_amt);
            }
        }
    }

    public class pdsecuL_21_4_Info : ObservableObject
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

        private double _loan_sell_amt;
        /// <summary>
        /// 融券卖出金额
        /// </summary>
        public double loan_sell_amt
        {
            get { return _loan_sell_amt; }

            set
            {
                _loan_sell_amt = value;
                RaisePropertyChanged(() => loan_sell_amt);
            }
        }

        private double _debt_interest_amt;
        /// <summary>
        /// 负债利息金额
        /// </summary>
        public double debt_interest_amt
        {
            get { return _debt_interest_amt; }

            set
            {
                _debt_interest_amt = value;
                RaisePropertyChanged(() => debt_interest_amt);
            }
        }
    }

    public class pdsecuL_21_5_Info : ObservableObject
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

        private int _debt_type;
        /// <summary>
        /// 负债类型
        /// </summary>
        public int debt_type
        {
            get { return _debt_type; }

            set
            {
                _debt_type = value;
                RaisePropertyChanged(() => debt_type);
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

        private double _strike_fee;
        /// <summary>
        /// 成交费用
        /// </summary>
        public double strike_fee
        {
            get { return _strike_fee; }

            set
            {
                _strike_fee = value;
                RaisePropertyChanged(() => strike_fee);
            }
        }

        private int _order_no;
        /// <summary>
        /// 订单编号
        /// </summary>
        public int order_no
        {
            get { return _order_no; }

            set
            {
                _order_no = value;
                RaisePropertyChanged(() => order_no);
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

        private double _debt_intrst_rate;
        /// <summary>
        /// 负债年利率
        /// </summary>
        public double debt_intrst_rate
        {
            get { return _debt_intrst_rate; }

            set
            {
                _debt_intrst_rate = value;
                RaisePropertyChanged(() => debt_intrst_rate);
            }
        }

        private double _begin_debt_amt;
        /// <summary>
        /// 期初负债金额
        /// </summary>
        public double begin_debt_amt
        {
            get { return _begin_debt_amt; }

            set
            {
                _begin_debt_amt = value;
                RaisePropertyChanged(() => begin_debt_amt);
            }
        }

        private double _begin_debt_qty;
        /// <summary>
        /// 期初负债数量
        /// </summary>
        public double begin_debt_qty
        {
            get { return _begin_debt_qty; }

            set
            {
                _begin_debt_qty = value;
                RaisePropertyChanged(() => begin_debt_qty);
            }
        }

        private double _debt_amt;
        /// <summary>
        /// 负债金额
        /// </summary>
        public double debt_amt
        {
            get { return _debt_amt; }

            set
            {
                _debt_amt = value;
                RaisePropertyChanged(() => debt_amt);
            }
        }

        private double _debt_qty;
        /// <summary>
        /// 负债数量
        /// </summary>
        public double debt_qty
        {
            get { return _debt_qty; }

            set
            {
                _debt_qty = value;
                RaisePropertyChanged(() => debt_qty);
            }
        }

        private double _debt_fee;
        /// <summary>
        /// 负债费用
        /// </summary>
        public double debt_fee
        {
            get { return _debt_fee; }

            set
            {
                _debt_fee = value;
                RaisePropertyChanged(() => debt_fee);
            }
        }

        private double _debt_interest;
        /// <summary>
        /// 负债利息
        /// </summary>
        public double debt_interest
        {
            get { return _debt_interest; }

            set
            {
                _debt_interest = value;
                RaisePropertyChanged(() => debt_interest);
            }
        }

        private double _intrst_base_amt;
        /// <summary>
        /// 利息积数
        /// </summary>
        public double intrst_base_amt
        {
            get { return _intrst_base_amt; }

            set
            {
                _intrst_base_amt = value;
                RaisePropertyChanged(() => intrst_base_amt);
            }
        }

        private double _debt_return_amt;
        /// <summary>
        /// 已归还金额
        /// </summary>
        public double debt_return_amt
        {
            get { return _debt_return_amt; }

            set
            {
                _debt_return_amt = value;
                RaisePropertyChanged(() => debt_return_amt);
            }
        }

        private double _debt_return_qty;
        /// <summary>
        /// 已归还数量
        /// </summary>
        public double debt_return_qty
        {
            get { return _debt_return_qty; }

            set
            {
                _debt_return_qty = value;
                RaisePropertyChanged(() => debt_return_qty);
            }
        }

        private double _return_interest_amt;
        /// <summary>
        /// 归还利息金额
        /// </summary>
        public double return_interest_amt
        {
            get { return _return_interest_amt; }

            set
            {
                _return_interest_amt = value;
                RaisePropertyChanged(() => return_interest_amt);
            }
        }

        private int _interest_update_date;
        /// <summary>
        /// 利息积数更改日期
        /// </summary>
        public int interest_update_date
        {
            get { return _interest_update_date; }

            set
            {
                _interest_update_date = value;
                RaisePropertyChanged(() => interest_update_date);
            }
        }

        private int _debt_end_date;
        /// <summary>
        /// 负债截止日期
        /// </summary>
        public int debt_end_date
        {
            get { return _debt_end_date; }

            set
            {
                _debt_end_date = value;
                RaisePropertyChanged(() => debt_end_date);
            }
        }

        private int _orign_debt_end_date;
        /// <summary>
        /// 原负债截止日期
        /// </summary>
        public int orign_debt_end_date
        {
            get { return _orign_debt_end_date; }

            set
            {
                _orign_debt_end_date = value;
                RaisePropertyChanged(() => orign_debt_end_date);
            }
        }

        private int _defer_times;
        /// <summary>
        /// 展期次数
        /// </summary>
        public int defer_times
        {
            get { return _defer_times; }

            set
            {
                _defer_times = value;
                RaisePropertyChanged(() => defer_times);
            }
        }

        private int _debt_return_date;
        /// <summary>
        /// 负债归还日期
        /// </summary>
        public int debt_return_date
        {
            get { return _debt_return_date; }

            set
            {
                _debt_return_date = value;
                RaisePropertyChanged(() => debt_return_date);
            }
        }

        private int _debt_status;
        /// <summary>
        /// 负债状态
        /// </summary>
        public int debt_status
        {
            get { return _debt_status; }

            set
            {
                _debt_status = value;
                RaisePropertyChanged(() => debt_status);
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

    public class pdsecuL_21_6_Info : ObservableObject
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

        private int _debt_type;
        /// <summary>
        /// 负债类型
        /// </summary>
        public int debt_type
        {
            get { return _debt_type; }

            set
            {
                _debt_type = value;
                RaisePropertyChanged(() => debt_type);
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

        private double _strike_fee;
        /// <summary>
        /// 成交费用
        /// </summary>
        public double strike_fee
        {
            get { return _strike_fee; }

            set
            {
                _strike_fee = value;
                RaisePropertyChanged(() => strike_fee);
            }
        }

        private int _order_no;
        /// <summary>
        /// 订单编号
        /// </summary>
        public int order_no
        {
            get { return _order_no; }

            set
            {
                _order_no = value;
                RaisePropertyChanged(() => order_no);
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

        private double _debt_intrst_rate;
        /// <summary>
        /// 负债年利率
        /// </summary>
        public double debt_intrst_rate
        {
            get { return _debt_intrst_rate; }

            set
            {
                _debt_intrst_rate = value;
                RaisePropertyChanged(() => debt_intrst_rate);
            }
        }

        private double _begin_debt_amt;
        /// <summary>
        /// 期初负债金额
        /// </summary>
        public double begin_debt_amt
        {
            get { return _begin_debt_amt; }

            set
            {
                _begin_debt_amt = value;
                RaisePropertyChanged(() => begin_debt_amt);
            }
        }

        private double _begin_debt_qty;
        /// <summary>
        /// 期初负债数量
        /// </summary>
        public double begin_debt_qty
        {
            get { return _begin_debt_qty; }

            set
            {
                _begin_debt_qty = value;
                RaisePropertyChanged(() => begin_debt_qty);
            }
        }

        private double _debt_amt;
        /// <summary>
        /// 负债金额
        /// </summary>
        public double debt_amt
        {
            get { return _debt_amt; }

            set
            {
                _debt_amt = value;
                RaisePropertyChanged(() => debt_amt);
            }
        }

        private double _debt_qty;
        /// <summary>
        /// 负债数量
        /// </summary>
        public double debt_qty
        {
            get { return _debt_qty; }

            set
            {
                _debt_qty = value;
                RaisePropertyChanged(() => debt_qty);
            }
        }

        private double _debt_fee;
        /// <summary>
        /// 负债费用
        /// </summary>
        public double debt_fee
        {
            get { return _debt_fee; }

            set
            {
                _debt_fee = value;
                RaisePropertyChanged(() => debt_fee);
            }
        }

        private double _debt_interest;
        /// <summary>
        /// 负债利息
        /// </summary>
        public double debt_interest
        {
            get { return _debt_interest; }

            set
            {
                _debt_interest = value;
                RaisePropertyChanged(() => debt_interest);
            }
        }

        private double _intrst_base_amt;
        /// <summary>
        /// 利息积数
        /// </summary>
        public double intrst_base_amt
        {
            get { return _intrst_base_amt; }

            set
            {
                _intrst_base_amt = value;
                RaisePropertyChanged(() => intrst_base_amt);
            }
        }

        private double _debt_return_amt;
        /// <summary>
        /// 已归还金额
        /// </summary>
        public double debt_return_amt
        {
            get { return _debt_return_amt; }

            set
            {
                _debt_return_amt = value;
                RaisePropertyChanged(() => debt_return_amt);
            }
        }

        private double _debt_return_qty;
        /// <summary>
        /// 已归还数量
        /// </summary>
        public double debt_return_qty
        {
            get { return _debt_return_qty; }

            set
            {
                _debt_return_qty = value;
                RaisePropertyChanged(() => debt_return_qty);
            }
        }

        private double _return_interest_amt;
        /// <summary>
        /// 归还利息金额
        /// </summary>
        public double return_interest_amt
        {
            get { return _return_interest_amt; }

            set
            {
                _return_interest_amt = value;
                RaisePropertyChanged(() => return_interest_amt);
            }
        }

        private int _interest_update_date;
        /// <summary>
        /// 利息积数更改日期
        /// </summary>
        public int interest_update_date
        {
            get { return _interest_update_date; }

            set
            {
                _interest_update_date = value;
                RaisePropertyChanged(() => interest_update_date);
            }
        }

        private int _debt_end_date;
        /// <summary>
        /// 负债截止日期
        /// </summary>
        public int debt_end_date
        {
            get { return _debt_end_date; }

            set
            {
                _debt_end_date = value;
                RaisePropertyChanged(() => debt_end_date);
            }
        }

        private int _orign_debt_end_date;
        /// <summary>
        /// 原负债截止日期
        /// </summary>
        public int orign_debt_end_date
        {
            get { return _orign_debt_end_date; }

            set
            {
                _orign_debt_end_date = value;
                RaisePropertyChanged(() => orign_debt_end_date);
            }
        }

        private int _defer_times;
        /// <summary>
        /// 展期次数
        /// </summary>
        public int defer_times
        {
            get { return _defer_times; }

            set
            {
                _defer_times = value;
                RaisePropertyChanged(() => defer_times);
            }
        }

        private int _debt_return_date;
        /// <summary>
        /// 负债归还日期
        /// </summary>
        public int debt_return_date
        {
            get { return _debt_return_date; }

            set
            {
                _debt_return_date = value;
                RaisePropertyChanged(() => debt_return_date);
            }
        }

        private int _debt_status;
        /// <summary>
        /// 负债状态
        /// </summary>
        public int debt_status
        {
            get { return _debt_status; }

            set
            {
                _debt_status = value;
                RaisePropertyChanged(() => debt_status);
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

    public class pdsecuL_21_21_Info : ObservableObject
    {
    }

    public class pdsecuL_21_22_Info : ObservableObject
    {
    }

    public class pdsecuL_21_7_Info : ObservableObject
    {
    }

}
