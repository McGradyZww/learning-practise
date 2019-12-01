using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pubL_29_1_Info : ObservableObject
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
    }

    public class pubL_29_2_Info : ObservableObject
    {
    }

    public class pubL_29_3_Info : ObservableObject
    {
    }

    public class pubL_29_4_Info : ObservableObject
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

        private int _pass_no;
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no
        {
            get { return _pass_no; }

            set
            {
                _pass_no = value;
                RaisePropertyChanged(() => pass_no);
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

        private int _exch_no;
        /// <summary>
        /// �г����
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
        /// ֤ȯ������
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
        /// ֤ȯ����
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

        private double _discount_rate;
        /// <summary>
        /// ������
        /// </summary>
        public double discount_rate
        {
            get { return _discount_rate; }

            set
            {
                _discount_rate = value;
                RaisePropertyChanged(() => discount_rate);
            }
        }

        private int _offset_status;
        /// <summary>
        /// ���״̬
        /// </summary>
        public int offset_status
        {
            get { return _offset_status; }

            set
            {
                _offset_status = value;
                RaisePropertyChanged(() => offset_status);
            }
        }
    }

    public class pubL_29_5_Info : ObservableObject
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
    }

    public class pubL_29_6_Info : ObservableObject
    {
    }

    public class pubL_29_7_Info : ObservableObject
    {
    }

    public class pubL_29_8_Info : ObservableObject
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

        private int _pass_no;
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no
        {
            get { return _pass_no; }

            set
            {
                _pass_no = value;
                RaisePropertyChanged(() => pass_no);
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

        private double _fina_year_intrst_rate;
        /// <summary>
        /// ����������
        /// </summary>
        public double fina_year_intrst_rate
        {
            get { return _fina_year_intrst_rate; }

            set
            {
                _fina_year_intrst_rate = value;
                RaisePropertyChanged(() => fina_year_intrst_rate);
            }
        }

        private double _secu_loan_year_intrst_rate;
        /// <summary>
        /// ��ȯ������
        /// </summary>
        public double secu_loan_year_intrst_rate
        {
            get { return _secu_loan_year_intrst_rate; }

            set
            {
                _secu_loan_year_intrst_rate = value;
                RaisePropertyChanged(() => secu_loan_year_intrst_rate);
            }
        }

        private double _fina_pen_intrst_rate;
        /// <summary>
        /// ���ʷ�Ϣ����
        /// </summary>
        public double fina_pen_intrst_rate
        {
            get { return _fina_pen_intrst_rate; }

            set
            {
                _fina_pen_intrst_rate = value;
                RaisePropertyChanged(() => fina_pen_intrst_rate);
            }
        }

        private double _secu_loan_pen_intrst_rate;
        /// <summary>
        /// ��ȯ��Ϣ����
        /// </summary>
        public double secu_loan_pen_intrst_rate
        {
            get { return _secu_loan_pen_intrst_rate; }

            set
            {
                _secu_loan_pen_intrst_rate = value;
                RaisePropertyChanged(() => secu_loan_pen_intrst_rate);
            }
        }

        private int _intrst_sett_day;
        /// <summary>
        /// ��Ϣ����
        /// </summary>
        public int intrst_sett_day
        {
            get { return _intrst_sett_day; }

            set
            {
                _intrst_sett_day = value;
                RaisePropertyChanged(() => intrst_sett_day);
            }
        }
    }

    public class pubL_29_9_Info : ObservableObject
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
    }

    public class pubL_29_10_Info : ObservableObject
    {
    }

    public class pubL_29_11_Info : ObservableObject
    {
    }

    public class pubL_29_12_Info : ObservableObject
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

        private int _stock_code_no;
        /// <summary>
        /// ֤ȯ������
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
        /// ֤ȯ����
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

        private int _exch_no;
        /// <summary>
        /// �г����
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

        private String _fina_status;
        /// <summary>
        /// ����״̬
        /// </summary>
        public String fina_status
        {
            get { return _fina_status; }

            set
            {
                _fina_status = value;
                RaisePropertyChanged(() => fina_status);
            }
        }

        private String _secu_loan_status;
        /// <summary>
        /// ��ȯ״̬
        /// </summary>
        public String secu_loan_status
        {
            get { return _secu_loan_status; }

            set
            {
                _secu_loan_status = value;
                RaisePropertyChanged(() => secu_loan_status);
            }
        }
    }

    public class pubL_29_13_Info : ObservableObject
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
    }

    public class pubL_29_14_Info : ObservableObject
    {
    }

    public class pubL_29_15_Info : ObservableObject
    {
    }

    public class pubL_29_16_Info : ObservableObject
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

        private int _pass_no;
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no
        {
            get { return _pass_no; }

            set
            {
                _pass_no = value;
                RaisePropertyChanged(() => pass_no);
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

        private int _stock_code_no;
        /// <summary>
        /// ֤ȯ������
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
        /// ֤ȯ����
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

        private int _exch_no;
        /// <summary>
        /// �г����
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

        private String _fina_status;
        /// <summary>
        /// ����״̬
        /// </summary>
        public String fina_status
        {
            get { return _fina_status; }

            set
            {
                _fina_status = value;
                RaisePropertyChanged(() => fina_status);
            }
        }

        private String _secu_loan_status;
        /// <summary>
        /// ��ȯ״̬
        /// </summary>
        public String secu_loan_status
        {
            get { return _secu_loan_status; }

            set
            {
                _secu_loan_status = value;
                RaisePropertyChanged(() => secu_loan_status);
            }
        }
    }

    public class pubL_29_17_Info : ObservableObject
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
    }

    public class pubL_29_18_Info : ObservableObject
    {
    }

    public class pubL_29_19_Info : ObservableObject
    {
    }

    public class pubL_29_20_Info : ObservableObject
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

        private int _pass_no;
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no
        {
            get { return _pass_no; }

            set
            {
                _pass_no = value;
                RaisePropertyChanged(() => pass_no);
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

        private int _stock_code_no;
        /// <summary>
        /// ֤ȯ������
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
        /// ֤ȯ����
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

        private int _exch_no;
        /// <summary>
        /// �г����
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

        private int _stock_type;
        /// <summary>
        /// ֤ȯ����
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

        private double _fina_marg_ratio;
        /// <summary>
        /// ���ʱ�֤�����
        /// </summary>
        public double fina_marg_ratio
        {
            get { return _fina_marg_ratio; }

            set
            {
                _fina_marg_ratio = value;
                RaisePropertyChanged(() => fina_marg_ratio);
            }
        }

        private double _secu_loan_marg_ratio;
        /// <summary>
        /// ��ȯ��֤�����
        /// </summary>
        public double secu_loan_marg_ratio
        {
            get { return _secu_loan_marg_ratio; }

            set
            {
                _secu_loan_marg_ratio = value;
                RaisePropertyChanged(() => secu_loan_marg_ratio);
            }
        }

        private double _secu_loan_price_limit;
        /// <summary>
        /// ��ȯ�۸�����
        /// </summary>
        public double secu_loan_price_limit
        {
            get { return _secu_loan_price_limit; }

            set
            {
                _secu_loan_price_limit = value;
                RaisePropertyChanged(() => secu_loan_price_limit);
            }
        }
    }

    public class pubL_29_21_Info : ObservableObject
    {

        private double _fina_marg_ratio;
        /// <summary>
        /// ���ʱ�֤�����
        /// </summary>
        public double fina_marg_ratio
        {
            get { return _fina_marg_ratio; }

            set
            {
                _fina_marg_ratio = value;
                RaisePropertyChanged(() => fina_marg_ratio);
            }
        }

        private double _secu_loan_marg_ratio;
        /// <summary>
        /// ��ȯ��֤�����
        /// </summary>
        public double secu_loan_marg_ratio
        {
            get { return _secu_loan_marg_ratio; }

            set
            {
                _secu_loan_marg_ratio = value;
                RaisePropertyChanged(() => secu_loan_marg_ratio);
            }
        }

        private double _secu_loan_price_limit;
        /// <summary>
        /// ��ȯ�۸�����
        /// </summary>
        public double secu_loan_price_limit
        {
            get { return _secu_loan_price_limit; }

            set
            {
                _secu_loan_price_limit = value;
                RaisePropertyChanged(() => secu_loan_price_limit);
            }
        }
    }

    public class pubL_29_22_Info : ObservableObject
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

        private int _pass_no;
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no
        {
            get { return _pass_no; }

            set
            {
                _pass_no = value;
                RaisePropertyChanged(() => pass_no);
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

        private int _exch_no;
        /// <summary>
        /// �г����
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
        /// ֤ȯ������
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
        /// ֤ȯ����
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

        private double _discount_rate;
        /// <summary>
        /// ������
        /// </summary>
        public double discount_rate
        {
            get { return _discount_rate; }

            set
            {
                _discount_rate = value;
                RaisePropertyChanged(() => discount_rate);
            }
        }

        private int _offset_status;
        /// <summary>
        /// ���״̬
        /// </summary>
        public int offset_status
        {
            get { return _offset_status; }

            set
            {
                _offset_status = value;
                RaisePropertyChanged(() => offset_status);
            }
        }
    }

    public class pubL_29_23_Info : ObservableObject
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

        private int _pass_no;
        /// <summary>
        /// ͨ�����
        /// </summary>
        public int pass_no
        {
            get { return _pass_no; }

            set
            {
                _pass_no = value;
                RaisePropertyChanged(() => pass_no);
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

        private int _stock_code_no;
        /// <summary>
        /// ֤ȯ������
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
        /// ֤ȯ����
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

        private int _exch_no;
        /// <summary>
        /// �г����
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

        private int _stock_type;
        /// <summary>
        /// ֤ȯ����
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

        private double _fina_marg_ratio;
        /// <summary>
        /// ���ʱ�֤�����
        /// </summary>
        public double fina_marg_ratio
        {
            get { return _fina_marg_ratio; }

            set
            {
                _fina_marg_ratio = value;
                RaisePropertyChanged(() => fina_marg_ratio);
            }
        }

        private double _secu_loan_marg_ratio;
        /// <summary>
        /// ��ȯ��֤�����
        /// </summary>
        public double secu_loan_marg_ratio
        {
            get { return _secu_loan_marg_ratio; }

            set
            {
                _secu_loan_marg_ratio = value;
                RaisePropertyChanged(() => secu_loan_marg_ratio);
            }
        }

        private double _secu_loan_price_limit;
        /// <summary>
        /// ��ȯ�۸�����
        /// </summary>
        public double secu_loan_price_limit
        {
            get { return _secu_loan_price_limit; }

            set
            {
                _secu_loan_price_limit = value;
                RaisePropertyChanged(() => secu_loan_price_limit);
            }
        }
    }

    public class pubL_29_24_Info : ObservableObject
    {
    }

    public class pubL_29_25_Info : ObservableObject
    {
    }

}
