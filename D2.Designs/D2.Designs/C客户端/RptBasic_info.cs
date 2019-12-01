using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class rptL_1_1_Info : ObservableObject
    {
    }

    public class rptL_1_2_Info : ObservableObject
    {
    }

    public class rptL_1_3_Info : ObservableObject
    {

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

        private int _last_init_date;
        /// <summary>
        /// 上日初始化日期
        /// </summary>
        public int last_init_date
        {
            get { return _last_init_date; }

            set
            {
                _last_init_date = value;
                RaisePropertyChanged(() => last_init_date);
            }
        }

        private int _next_init_date;
        /// <summary>
        /// 下日初始化日期
        /// </summary>
        public int next_init_date
        {
            get { return _next_init_date; }

            set
            {
                _next_init_date = value;
                RaisePropertyChanged(() => next_init_date);
            }
        }
    }

    public class rptL_1_21_Info : ObservableObject
    {
    }

    public class rptL_1_22_Info : ObservableObject
    {
    }

    public class rptL_1_23_Info : ObservableObject
    {
    }

    public class rptL_1_25_Info : ObservableObject
    {
    }

    public class rptL_1_27_Info : ObservableObject
    {
    }

    public class rptL_1_30_Info : ObservableObject
    {
    }

}
