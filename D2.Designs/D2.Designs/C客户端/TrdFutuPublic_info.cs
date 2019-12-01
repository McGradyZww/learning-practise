using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class tdfutuL_1_1_Info : ObservableObject
    {
    }

    public class tdfutuL_1_2_Info : ObservableObject
    {

        private ulong _curr_no;
        /// <summary>
        /// 当前编号
        /// </summary>
        public ulong curr_no
        {
            get { return _curr_no; }

            set
            {
                _curr_no = value;
                RaisePropertyChanged(() => curr_no);
            }
        }
    }

    public class tdfutuL_1_3_Info : ObservableObject
    {

        private String _task_strike_status;
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status
        {
            get { return _task_strike_status; }

            set
            {
                _task_strike_status = value;
                RaisePropertyChanged(() => task_strike_status);
            }
        }
    }

}
