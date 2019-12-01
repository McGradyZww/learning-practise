using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pdsecuL_7_1_Info : ObservableObject
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

        private String _stock_acco_name;
        /// <summary>
        /// 股东代码名称
        /// </summary>
        public String stock_acco_name
        {
            get { return _stock_acco_name; }

            set
            {
                _stock_acco_name = value;
                RaisePropertyChanged(() => stock_acco_name);
            }
        }

        private String _stock_acco_status;
        /// <summary>
        /// 股东代码状态
        /// </summary>
        public String stock_acco_status
        {
            get { return _stock_acco_status; }

            set
            {
                _stock_acco_status = value;
                RaisePropertyChanged(() => stock_acco_status);
            }
        }

        private String _stock_acco_apoint_status;
        /// <summary>
        /// 股东指定状态
        /// </summary>
        public String stock_acco_apoint_status
        {
            get { return _stock_acco_apoint_status; }

            set
            {
                _stock_acco_apoint_status = value;
                RaisePropertyChanged(() => stock_acco_apoint_status);
            }
        }
    }

    public class pdsecuL_7_11_Info : ObservableObject
    {
    }

    public class pdsecuL_7_12_Info : ObservableObject
    {
    }

    public class pdsecuL_7_13_Info : ObservableObject
    {
    }

    public class pdsecuL_7_14_Info : ObservableObject
    {
    }

    public class pdsecuL_7_15_Info : ObservableObject
    {
    }

    public class pdsecuL_7_16_Info : ObservableObject
    {
    }

    public class pdsecuL_7_17_Info : ObservableObject
    {
    }

    public class pdsecuL_7_18_Info : ObservableObject
    {

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
    }

    public class pdsecuL_7_19_Info : ObservableObject
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

        private String _stock_acco_name;
        /// <summary>
        /// 股东代码名称
        /// </summary>
        public String stock_acco_name
        {
            get { return _stock_acco_name; }

            set
            {
                _stock_acco_name = value;
                RaisePropertyChanged(() => stock_acco_name);
            }
        }

        private String _stock_acco_status;
        /// <summary>
        /// 股东代码状态
        /// </summary>
        public String stock_acco_status
        {
            get { return _stock_acco_status; }

            set
            {
                _stock_acco_status = value;
                RaisePropertyChanged(() => stock_acco_status);
            }
        }

        private String _stock_acco_apoint_status;
        /// <summary>
        /// 股东指定状态
        /// </summary>
        public String stock_acco_apoint_status
        {
            get { return _stock_acco_apoint_status; }

            set
            {
                _stock_acco_apoint_status = value;
                RaisePropertyChanged(() => stock_acco_apoint_status);
            }
        }

        private String _allow_stock_type;
        /// <summary>
        /// 允许操作证券类型
        /// </summary>
        public String allow_stock_type
        {
            get { return _allow_stock_type; }

            set
            {
                _allow_stock_type = value;
                RaisePropertyChanged(() => allow_stock_type);
            }
        }

        private String _busi_limit_str;
        /// <summary>
        /// 业务限制串
        /// </summary>
        public String busi_limit_str
        {
            get { return _busi_limit_str; }

            set
            {
                _busi_limit_str = value;
                RaisePropertyChanged(() => busi_limit_str);
            }
        }

        private String _registration_agency;
        /// <summary>
        /// 登记机构
        /// </summary>
        public String registration_agency
        {
            get { return _registration_agency; }

            set
            {
                _registration_agency = value;
                RaisePropertyChanged(() => registration_agency);
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

    public class pdsecuL_7_20_Info : ObservableObject
    {
    }

    public class pdsecuL_7_21_Info : ObservableObject
    {
    }

    public class pdsecuL_7_22_Info : ObservableObject
    {
    }

    public class pdsecuL_7_23_Info : ObservableObject
    {
    }

    public class pdsecuL_7_25_Info : ObservableObject
    {
    }

    public class pdsecuL_7_26_Info : ObservableObject
    {
    }

    public class pdsecuL_7_27_Info : ObservableObject
    {
    }

}
