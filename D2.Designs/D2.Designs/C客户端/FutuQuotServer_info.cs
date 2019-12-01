using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pubL_14_1_Info : ObservableObject
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

    public class pubL_14_2_Info : ObservableObject
    {
    }

}
