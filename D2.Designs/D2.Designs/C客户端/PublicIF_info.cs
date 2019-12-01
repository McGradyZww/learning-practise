using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pubL_24_1_Info : ObservableObject
    {

        private int _last_init_date;
        /// <summary>
        /// ���ճ�ʼ������
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
    }

    public class pubL_24_2_Info : ObservableObject
    {

        private String _co_no_rights_str;
        /// <summary>
        /// �������Ȩ�޴�
        /// </summary>
        public String co_no_rights_str
        {
            get { return _co_no_rights_str; }

            set
            {
                _co_no_rights_str = value;
                RaisePropertyChanged(() => co_no_rights_str);
            }
        }

        private String _pd_no_rights_str;
        /// <summary>
        /// ��Ʒ���Ȩ�޴�
        /// </summary>
        public String pd_no_rights_str
        {
            get { return _pd_no_rights_str; }

            set
            {
                _pd_no_rights_str = value;
                RaisePropertyChanged(() => pd_no_rights_str);
            }
        }

        private String _exch_group_no_rights_str;
        /// <summary>
        /// ��������Ȩ�޴�
        /// </summary>
        public String exch_group_no_rights_str
        {
            get { return _exch_group_no_rights_str; }

            set
            {
                _exch_group_no_rights_str = value;
                RaisePropertyChanged(() => exch_group_no_rights_str);
            }
        }
    }

}
