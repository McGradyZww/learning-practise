using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class valL_4_1_Info : ObservableObject
    {
    }

    public class valL_4_2_Info : ObservableObject
    {
    }

    public class valL_4_3_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// ��¼���
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

        private int _co_no;
        /// <summary>
        /// �������
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

        private String _mail_server;
        /// <summary>
        /// �ʼ�������
        /// </summary>
        public String mail_server
        {
            get { return _mail_server; }

            set
            {
                _mail_server = value;
                RaisePropertyChanged(() => mail_server);
            }
        }

        private int _server_type;
        /// <summary>
        /// ����������
        /// </summary>
        public int server_type
        {
            get { return _server_type; }

            set
            {
                _server_type = value;
                RaisePropertyChanged(() => server_type);
            }
        }

        private String _mail_server_protocol;
        /// <summary>
        /// �ʼ�������Э��
        /// </summary>
        public String mail_server_protocol
        {
            get { return _mail_server_protocol; }

            set
            {
                _mail_server_protocol = value;
                RaisePropertyChanged(() => mail_server_protocol);
            }
        }

        private int _mail_server_port;
        /// <summary>
        /// �ʼ��������˿�
        /// </summary>
        public int mail_server_port
        {
            get { return _mail_server_port; }

            set
            {
                _mail_server_port = value;
                RaisePropertyChanged(() => mail_server_port);
            }
        }

        private String _mail_server_username;
        /// <summary>
        /// �ʼ��������û���
        /// </summary>
        public String mail_server_username
        {
            get { return _mail_server_username; }

            set
            {
                _mail_server_username = value;
                RaisePropertyChanged(() => mail_server_username);
            }
        }

        private String _mail_server_password;
        /// <summary>
        /// �ʼ�����������
        /// </summary>
        public String mail_server_password
        {
            get { return _mail_server_password; }

            set
            {
                _mail_server_password = value;
                RaisePropertyChanged(() => mail_server_password);
            }
        }

        private int _ssl_type;
        /// <summary>
        /// SSL��־
        /// </summary>
        public int ssl_type
        {
            get { return _ssl_type; }

            set
            {
                _ssl_type = value;
                RaisePropertyChanged(() => ssl_type);
            }
        }

        private int _rule_flag;
        /// <summary>
        /// ���ñ�־
        /// </summary>
        public int rule_flag
        {
            get { return _rule_flag; }

            set
            {
                _rule_flag = value;
                RaisePropertyChanged(() => rule_flag);
            }
        }
    }

    public class valL_4_11_Info : ObservableObject
    {
    }

    public class valL_4_12_Info : ObservableObject
    {
    }

    public class valL_4_13_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// ��¼���
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

        private int _co_no;
        /// <summary>
        /// �������
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
        /// ��Ʒ���
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

        private String _file_name;
        /// <summary>
        /// �ļ�����
        /// </summary>
        public String file_name
        {
            get { return _file_name; }

            set
            {
                _file_name = value;
                RaisePropertyChanged(() => file_name);
            }
        }

        private String _netvalue_date_posi;
        /// <summary>
        /// ��ֵ����λ��
        /// </summary>
        public String netvalue_date_posi
        {
            get { return _netvalue_date_posi; }

            set
            {
                _netvalue_date_posi = value;
                RaisePropertyChanged(() => netvalue_date_posi);
            }
        }

        private int _valtable_begin_row;
        /// <summary>
        /// ��ֵ����ʼ�к�
        /// </summary>
        public int valtable_begin_row
        {
            get { return _valtable_begin_row; }

            set
            {
                _valtable_begin_row = value;
                RaisePropertyChanged(() => valtable_begin_row);
            }
        }

        private String _fina_acco_code;
        /// <summary>
        /// ��Ŀ����
        /// </summary>
        public String fina_acco_code
        {
            get { return _fina_acco_code; }

            set
            {
                _fina_acco_code = value;
                RaisePropertyChanged(() => fina_acco_code);
            }
        }

        private String _fina_acco_name;
        /// <summary>
        /// ��Ŀ����
        /// </summary>
        public String fina_acco_name
        {
            get { return _fina_acco_name; }

            set
            {
                _fina_acco_name = value;
                RaisePropertyChanged(() => fina_acco_name);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// ���ұ���
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

        private String _amount;
        /// <summary>
        /// ����
        /// </summary>
        public String amount
        {
            get { return _amount; }

            set
            {
                _amount = value;
                RaisePropertyChanged(() => amount);
            }
        }

        private String _unit_cost;
        /// <summary>
        /// ��λ�ɱ�
        /// </summary>
        public String unit_cost
        {
            get { return _unit_cost; }

            set
            {
                _unit_cost = value;
                RaisePropertyChanged(() => unit_cost);
            }
        }

        private String _prime_cost_original;
        /// <summary>
        /// �ɱ�ԭ��
        /// </summary>
        public String prime_cost_original
        {
            get { return _prime_cost_original; }

            set
            {
                _prime_cost_original = value;
                RaisePropertyChanged(() => prime_cost_original);
            }
        }

        private String _prime_cost_crncy;
        /// <summary>
        /// �ɱ�����
        /// </summary>
        public String prime_cost_crncy
        {
            get { return _prime_cost_crncy; }

            set
            {
                _prime_cost_crncy = value;
                RaisePropertyChanged(() => prime_cost_crncy);
            }
        }

        private String _cost_net_ratio;
        /// <summary>
        /// �ɱ�ռ��ֵ
        /// </summary>
        public String cost_net_ratio
        {
            get { return _cost_net_ratio; }

            set
            {
                _cost_net_ratio = value;
                RaisePropertyChanged(() => cost_net_ratio);
            }
        }

        private String _market_price;
        /// <summary>
        /// �м�
        /// </summary>
        public String market_price
        {
            get { return _market_price; }

            set
            {
                _market_price = value;
                RaisePropertyChanged(() => market_price);
            }
        }

        private String _market_value_original;
        /// <summary>
        /// ��ֵԭ��
        /// </summary>
        public String market_value_original
        {
            get { return _market_value_original; }

            set
            {
                _market_value_original = value;
                RaisePropertyChanged(() => market_value_original);
            }
        }

        private String _market_value_crncy;
        /// <summary>
        /// ��ֵ����
        /// </summary>
        public String market_value_crncy
        {
            get { return _market_value_crncy; }

            set
            {
                _market_value_crncy = value;
                RaisePropertyChanged(() => market_value_crncy);
            }
        }

        private String _market_net_ratio;
        /// <summary>
        /// ��ֵռ��ֵ
        /// </summary>
        public String market_net_ratio
        {
            get { return _market_net_ratio; }

            set
            {
                _market_net_ratio = value;
                RaisePropertyChanged(() => market_net_ratio);
            }
        }

        private String _evalu_add_original;
        /// <summary>
        /// ��ֵ��ֵԭ��
        /// </summary>
        public String evalu_add_original
        {
            get { return _evalu_add_original; }

            set
            {
                _evalu_add_original = value;
                RaisePropertyChanged(() => evalu_add_original);
            }
        }

        private String _evalu_add_crncy;
        /// <summary>
        /// ��ֵ��ֵ����
        /// </summary>
        public String evalu_add_crncy
        {
            get { return _evalu_add_crncy; }

            set
            {
                _evalu_add_crncy = value;
                RaisePropertyChanged(() => evalu_add_crncy);
            }
        }

        private String _stop_info;
        /// <summary>
        /// ͣ����Ϣ
        /// </summary>
        public String stop_info
        {
            get { return _stop_info; }

            set
            {
                _stop_info = value;
                RaisePropertyChanged(() => stop_info);
            }
        }

        private String _rights_info;
        /// <summary>
        /// Ȩ����Ϣ
        /// </summary>
        public String rights_info
        {
            get { return _rights_info; }

            set
            {
                _rights_info = value;
                RaisePropertyChanged(() => rights_info);
            }
        }
    }

    public class valL_4_21_Info : ObservableObject
    {
    }

    public class valL_4_22_Info : ObservableObject
    {

        private ulong _row_id;
        /// <summary>
        /// ��¼���
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

        private int _evalu_date;
        /// <summary>
        /// ��ֵ����
        /// </summary>
        public int evalu_date
        {
            get { return _evalu_date; }

            set
            {
                _evalu_date = value;
                RaisePropertyChanged(() => evalu_date);
            }
        }

        private int _co_no;
        /// <summary>
        /// �������
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
        /// ��Ʒ���
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

        private int _valtable_no;
        /// <summary>
        /// ��ֵ���к�
        /// </summary>
        public int valtable_no
        {
            get { return _valtable_no; }

            set
            {
                _valtable_no = value;
                RaisePropertyChanged(() => valtable_no);
            }
        }

        private String _fina_acco_code;
        /// <summary>
        /// ��Ŀ����
        /// </summary>
        public String fina_acco_code
        {
            get { return _fina_acco_code; }

            set
            {
                _fina_acco_code = value;
                RaisePropertyChanged(() => fina_acco_code);
            }
        }

        private String _fina_acco_name;
        /// <summary>
        /// ��Ŀ����
        /// </summary>
        public String fina_acco_name
        {
            get { return _fina_acco_name; }

            set
            {
                _fina_acco_name = value;
                RaisePropertyChanged(() => fina_acco_name);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// ���ұ���
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

        private String _amount;
        /// <summary>
        /// ����
        /// </summary>
        public String amount
        {
            get { return _amount; }

            set
            {
                _amount = value;
                RaisePropertyChanged(() => amount);
            }
        }

        private String _unit_cost;
        /// <summary>
        /// ��λ�ɱ�
        /// </summary>
        public String unit_cost
        {
            get { return _unit_cost; }

            set
            {
                _unit_cost = value;
                RaisePropertyChanged(() => unit_cost);
            }
        }

        private String _prime_cost_original;
        /// <summary>
        /// �ɱ�ԭ��
        /// </summary>
        public String prime_cost_original
        {
            get { return _prime_cost_original; }

            set
            {
                _prime_cost_original = value;
                RaisePropertyChanged(() => prime_cost_original);
            }
        }

        private String _prime_cost_crncy;
        /// <summary>
        /// �ɱ�����
        /// </summary>
        public String prime_cost_crncy
        {
            get { return _prime_cost_crncy; }

            set
            {
                _prime_cost_crncy = value;
                RaisePropertyChanged(() => prime_cost_crncy);
            }
        }

        private String _cost_net_ratio;
        /// <summary>
        /// �ɱ�ռ��ֵ
        /// </summary>
        public String cost_net_ratio
        {
            get { return _cost_net_ratio; }

            set
            {
                _cost_net_ratio = value;
                RaisePropertyChanged(() => cost_net_ratio);
            }
        }

        private String _market_price;
        /// <summary>
        /// �м�
        /// </summary>
        public String market_price
        {
            get { return _market_price; }

            set
            {
                _market_price = value;
                RaisePropertyChanged(() => market_price);
            }
        }

        private String _market_value_original;
        /// <summary>
        /// ��ֵԭ��
        /// </summary>
        public String market_value_original
        {
            get { return _market_value_original; }

            set
            {
                _market_value_original = value;
                RaisePropertyChanged(() => market_value_original);
            }
        }

        private String _market_value_crncy;
        /// <summary>
        /// ��ֵ����
        /// </summary>
        public String market_value_crncy
        {
            get { return _market_value_crncy; }

            set
            {
                _market_value_crncy = value;
                RaisePropertyChanged(() => market_value_crncy);
            }
        }

        private String _market_net_ratio;
        /// <summary>
        /// ��ֵռ��ֵ
        /// </summary>
        public String market_net_ratio
        {
            get { return _market_net_ratio; }

            set
            {
                _market_net_ratio = value;
                RaisePropertyChanged(() => market_net_ratio);
            }
        }

        private String _evalu_add_original;
        /// <summary>
        /// ��ֵ��ֵԭ��
        /// </summary>
        public String evalu_add_original
        {
            get { return _evalu_add_original; }

            set
            {
                _evalu_add_original = value;
                RaisePropertyChanged(() => evalu_add_original);
            }
        }

        private String _evalu_add_crncy;
        /// <summary>
        /// ��ֵ��ֵ����
        /// </summary>
        public String evalu_add_crncy
        {
            get { return _evalu_add_crncy; }

            set
            {
                _evalu_add_crncy = value;
                RaisePropertyChanged(() => evalu_add_crncy);
            }
        }

        private String _stop_info;
        /// <summary>
        /// ͣ����Ϣ
        /// </summary>
        public String stop_info
        {
            get { return _stop_info; }

            set
            {
                _stop_info = value;
                RaisePropertyChanged(() => stop_info);
            }
        }

        private String _rights_info;
        /// <summary>
        /// Ȩ����Ϣ
        /// </summary>
        public String rights_info
        {
            get { return _rights_info; }

            set
            {
                _rights_info = value;
                RaisePropertyChanged(() => rights_info);
            }
        }
    }

}
