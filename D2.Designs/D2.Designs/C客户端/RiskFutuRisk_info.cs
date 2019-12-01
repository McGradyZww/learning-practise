using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class rkfutuL_3_1_Info : ObservableObject
    {
    }

    public class rkfutuL_3_2_Info : ObservableObject
    {
    }

    public class rkfutuL_3_3_Info : ObservableObject
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

        private int _exch_group_no;
        /// <summary>
        /// ��������
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

        private int _asset_acco_no;
        /// <summary>
        /// �ʲ��˻����
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

        private ulong _model_id;
        /// <summary>
        /// ģ�����
        /// </summary>
        public ulong model_id
        {
            get { return _model_id; }

            set
            {
                _model_id = value;
                RaisePropertyChanged(() => model_id);
            }
        }

        private String _model_name;
        /// <summary>
        /// ģ������
        /// </summary>
        public String model_name
        {
            get { return _model_name; }

            set
            {
                _model_name = value;
                RaisePropertyChanged(() => model_name);
            }
        }

        private int _risk_item_id;
        /// <summary>
        /// ������Ŀ���
        /// </summary>
        public int risk_item_id
        {
            get { return _risk_item_id; }

            set
            {
                _risk_item_id = value;
                RaisePropertyChanged(() => risk_item_id);
            }
        }

        private String _risk_item_name;
        /// <summary>
        /// ������Ŀ����
        /// </summary>
        public String risk_item_name
        {
            get { return _risk_item_name; }

            set
            {
                _risk_item_name = value;
                RaisePropertyChanged(() => risk_item_name);
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

        private String _order_dir_str;
        /// <summary>
        /// ��������
        /// </summary>
        public String order_dir_str
        {
            get { return _order_dir_str; }

            set
            {
                _order_dir_str = value;
                RaisePropertyChanged(() => order_dir_str);
            }
        }

        private int _contrc_type;
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type
        {
            get { return _contrc_type; }

            set
            {
                _contrc_type = value;
                RaisePropertyChanged(() => contrc_type);
            }
        }

        private int _trig_stage_type;
        /// <summary>
        /// �����׶�����
        /// </summary>
        public int trig_stage_type
        {
            get { return _trig_stage_type; }

            set
            {
                _trig_stage_type = value;
                RaisePropertyChanged(() => trig_stage_type);
            }
        }

        private int _compli_calc_level;
        /// <summary>
        /// �Ϲ����㼶
        /// </summary>
        public int compli_calc_level
        {
            get { return _compli_calc_level; }

            set
            {
                _compli_calc_level = value;
                RaisePropertyChanged(() => compli_calc_level);
            }
        }

        private int _unit_nav_flag;
        /// <summary>
        /// ��λ��ֵ��־
        /// </summary>
        public int unit_nav_flag
        {
            get { return _unit_nav_flag; }

            set
            {
                _unit_nav_flag = value;
                RaisePropertyChanged(() => unit_nav_flag);
            }
        }

        private int _trig_type;
        /// <summary>
        /// ��������
        /// </summary>
        public int trig_type
        {
            get { return _trig_type; }

            set
            {
                _trig_type = value;
                RaisePropertyChanged(() => trig_type);
            }
        }

        private int _risk_rule_id;
        /// <summary>
        /// ���չ������
        /// </summary>
        public int risk_rule_id
        {
            get { return _risk_rule_id; }

            set
            {
                _risk_rule_id = value;
                RaisePropertyChanged(() => risk_rule_id);
            }
        }

        private int _risk_rule_type;
        /// <summary>
        /// ���չ������
        /// </summary>
        public int risk_rule_type
        {
            get { return _risk_rule_type; }

            set
            {
                _risk_rule_type = value;
                RaisePropertyChanged(() => risk_rule_type);
            }
        }

        private String _risk_rule_name;
        /// <summary>
        /// ���չ�������
        /// </summary>
        public String risk_rule_name
        {
            get { return _risk_rule_name; }

            set
            {
                _risk_rule_name = value;
                RaisePropertyChanged(() => risk_rule_name);
            }
        }

        private String _risk_rule_code;
        /// <summary>
        /// ���չ������
        /// </summary>
        public String risk_rule_code
        {
            get { return _risk_rule_code; }

            set
            {
                _risk_rule_code = value;
                RaisePropertyChanged(() => risk_rule_code);
            }
        }

        private String _risk_param_str;
        /// <summary>
        /// ����Ҫ�ش�
        /// </summary>
        public String risk_param_str
        {
            get { return _risk_param_str; }

            set
            {
                _risk_param_str = value;
                RaisePropertyChanged(() => risk_param_str);
            }
        }

        private String _risk_rule_value_str;
        /// <summary>
        /// ���չ���ֵ��
        /// </summary>
        public String risk_rule_value_str
        {
            get { return _risk_rule_value_str; }

            set
            {
                _risk_rule_value_str = value;
                RaisePropertyChanged(() => risk_rule_value_str);
            }
        }

        private String _corrsp_plug;
        /// <summary>
        /// ��Ӧ���
        /// </summary>
        public String corrsp_plug
        {
            get { return _corrsp_plug; }

            set
            {
                _corrsp_plug = value;
                RaisePropertyChanged(() => corrsp_plug);
            }
        }

        private String _risk_rule_action;
        /// <summary>
        /// ���ղ�ȡ��Ϊ
        /// </summary>
        public String risk_rule_action
        {
            get { return _risk_rule_action; }

            set
            {
                _risk_rule_action = value;
                RaisePropertyChanged(() => risk_rule_action);
            }
        }

        private int _begin_time;
        /// <summary>
        /// ��ʼʱ��
        /// </summary>
        public int begin_time
        {
            get { return _begin_time; }

            set
            {
                _begin_time = value;
                RaisePropertyChanged(() => begin_time);
            }
        }

        private int _end_time;
        /// <summary>
        /// ����ʱ��
        /// </summary>
        public int end_time
        {
            get { return _end_time; }

            set
            {
                _end_time = value;
                RaisePropertyChanged(() => end_time);
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

    public class rkfutuL_3_4_Info : ObservableObject
    {

        private String _risk_param_str;
        /// <summary>
        /// ����Ҫ�ش�
        /// </summary>
        public String risk_param_str
        {
            get { return _risk_param_str; }

            set
            {
                _risk_param_str = value;
                RaisePropertyChanged(() => risk_param_str);
            }
        }
    }

    public class rkfutuL_3_5_Info : ObservableObject
    {
    }

    public class rkfutuL_3_6_Info : ObservableObject
    {

        private int _create_date;
        /// <summary>
        /// ��������
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
        /// ����ʱ��
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

        private int _client_risk_rule_id;
        /// <summary>
        /// �ͻ����չ������
        /// </summary>
        public int client_risk_rule_id
        {
            get { return _client_risk_rule_id; }

            set
            {
                _client_risk_rule_id = value;
                RaisePropertyChanged(() => client_risk_rule_id);
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

        private int _exch_group_no;
        /// <summary>
        /// ��������
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

        private String _order_dir_str;
        /// <summary>
        /// ��������
        /// </summary>
        public String order_dir_str
        {
            get { return _order_dir_str; }

            set
            {
                _order_dir_str = value;
                RaisePropertyChanged(() => order_dir_str);
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

        private int _contrc_type;
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type
        {
            get { return _contrc_type; }

            set
            {
                _contrc_type = value;
                RaisePropertyChanged(() => contrc_type);
            }
        }

        private int _trig_stage_type;
        /// <summary>
        /// �����׶�����
        /// </summary>
        public int trig_stage_type
        {
            get { return _trig_stage_type; }

            set
            {
                _trig_stage_type = value;
                RaisePropertyChanged(() => trig_stage_type);
            }
        }

        private int _compli_calc_level;
        /// <summary>
        /// �Ϲ����㼶
        /// </summary>
        public int compli_calc_level
        {
            get { return _compli_calc_level; }

            set
            {
                _compli_calc_level = value;
                RaisePropertyChanged(() => compli_calc_level);
            }
        }

        private int _unit_nav_flag;
        /// <summary>
        /// ��λ��ֵ��־
        /// </summary>
        public int unit_nav_flag
        {
            get { return _unit_nav_flag; }

            set
            {
                _unit_nav_flag = value;
                RaisePropertyChanged(() => unit_nav_flag);
            }
        }

        private int _trig_type;
        /// <summary>
        /// ��������
        /// </summary>
        public int trig_type
        {
            get { return _trig_type; }

            set
            {
                _trig_type = value;
                RaisePropertyChanged(() => trig_type);
            }
        }

        private String _compli_rules_remark;
        /// <summary>
        /// �Ϲ����˵��
        /// </summary>
        public String compli_rules_remark
        {
            get { return _compli_rules_remark; }

            set
            {
                _compli_rules_remark = value;
                RaisePropertyChanged(() => compli_rules_remark);
            }
        }

        private String _risk_rule_action;
        /// <summary>
        /// ���ղ�ȡ��Ϊ
        /// </summary>
        public String risk_rule_action
        {
            get { return _risk_rule_action; }

            set
            {
                _risk_rule_action = value;
                RaisePropertyChanged(() => risk_rule_action);
            }
        }

        private int _risk_rule_type;
        /// <summary>
        /// ���չ������
        /// </summary>
        public int risk_rule_type
        {
            get { return _risk_rule_type; }

            set
            {
                _risk_rule_type = value;
                RaisePropertyChanged(() => risk_rule_type);
            }
        }

        private String _risk_rule_value_str;
        /// <summary>
        /// ���չ���ֵ��
        /// </summary>
        public String risk_rule_value_str
        {
            get { return _risk_rule_value_str; }

            set
            {
                _risk_rule_value_str = value;
                RaisePropertyChanged(() => risk_rule_value_str);
            }
        }

        private double _risk_trig_value;
        /// <summary>
        /// ��ش���ֵ
        /// </summary>
        public double risk_trig_value
        {
            get { return _risk_trig_value; }

            set
            {
                _risk_trig_value = value;
                RaisePropertyChanged(() => risk_trig_value);
            }
        }

        private String _remark_info;
        /// <summary>
        /// ��ע��Ϣ
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

    public class rkfutuL_3_7_Info : ObservableObject
    {

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

        private int _exch_group_no;
        /// <summary>
        /// ��������
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
    }

    public class rkfutuL_3_8_Info : ObservableObject
    {

        private int _create_date;
        /// <summary>
        /// ��������
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
        /// ����ʱ��
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

        private int _client_risk_rule_id;
        /// <summary>
        /// �ͻ����չ������
        /// </summary>
        public int client_risk_rule_id
        {
            get { return _client_risk_rule_id; }

            set
            {
                _client_risk_rule_id = value;
                RaisePropertyChanged(() => client_risk_rule_id);
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

        private int _exch_group_no;
        /// <summary>
        /// ��������
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

        private String _order_dir_str;
        /// <summary>
        /// ��������
        /// </summary>
        public String order_dir_str
        {
            get { return _order_dir_str; }

            set
            {
                _order_dir_str = value;
                RaisePropertyChanged(() => order_dir_str);
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

        private int _contrc_type;
        /// <summary>
        /// ��Լ����
        /// </summary>
        public int contrc_type
        {
            get { return _contrc_type; }

            set
            {
                _contrc_type = value;
                RaisePropertyChanged(() => contrc_type);
            }
        }

        private int _trig_stage_type;
        /// <summary>
        /// �����׶�����
        /// </summary>
        public int trig_stage_type
        {
            get { return _trig_stage_type; }

            set
            {
                _trig_stage_type = value;
                RaisePropertyChanged(() => trig_stage_type);
            }
        }

        private int _compli_calc_level;
        /// <summary>
        /// �Ϲ����㼶
        /// </summary>
        public int compli_calc_level
        {
            get { return _compli_calc_level; }

            set
            {
                _compli_calc_level = value;
                RaisePropertyChanged(() => compli_calc_level);
            }
        }

        private int _unit_nav_flag;
        /// <summary>
        /// ��λ��ֵ��־
        /// </summary>
        public int unit_nav_flag
        {
            get { return _unit_nav_flag; }

            set
            {
                _unit_nav_flag = value;
                RaisePropertyChanged(() => unit_nav_flag);
            }
        }

        private int _trig_type;
        /// <summary>
        /// ��������
        /// </summary>
        public int trig_type
        {
            get { return _trig_type; }

            set
            {
                _trig_type = value;
                RaisePropertyChanged(() => trig_type);
            }
        }

        private String _compli_rules_remark;
        /// <summary>
        /// �Ϲ����˵��
        /// </summary>
        public String compli_rules_remark
        {
            get { return _compli_rules_remark; }

            set
            {
                _compli_rules_remark = value;
                RaisePropertyChanged(() => compli_rules_remark);
            }
        }

        private String _risk_rule_action;
        /// <summary>
        /// ���ղ�ȡ��Ϊ
        /// </summary>
        public String risk_rule_action
        {
            get { return _risk_rule_action; }

            set
            {
                _risk_rule_action = value;
                RaisePropertyChanged(() => risk_rule_action);
            }
        }

        private int _risk_rule_type;
        /// <summary>
        /// ���չ������
        /// </summary>
        public int risk_rule_type
        {
            get { return _risk_rule_type; }

            set
            {
                _risk_rule_type = value;
                RaisePropertyChanged(() => risk_rule_type);
            }
        }

        private String _risk_rule_value_str;
        /// <summary>
        /// ���չ���ֵ��
        /// </summary>
        public String risk_rule_value_str
        {
            get { return _risk_rule_value_str; }

            set
            {
                _risk_rule_value_str = value;
                RaisePropertyChanged(() => risk_rule_value_str);
            }
        }

        private double _risk_trig_value;
        /// <summary>
        /// ��ش���ֵ
        /// </summary>
        public double risk_trig_value
        {
            get { return _risk_trig_value; }

            set
            {
                _risk_trig_value = value;
                RaisePropertyChanged(() => risk_trig_value);
            }
        }

        private String _remark_info;
        /// <summary>
        /// ��ע��Ϣ
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

    public class rkfutuL_3_9_Info : ObservableObject
    {

        private int _client_risk_rule_id;
        /// <summary>
        /// �ͻ����չ������
        /// </summary>
        public int client_risk_rule_id
        {
            get { return _client_risk_rule_id; }

            set
            {
                _client_risk_rule_id = value;
                RaisePropertyChanged(() => client_risk_rule_id);
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

        private int _exch_group_no;
        /// <summary>
        /// ��������
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

        private String _compli_rules_remark;
        /// <summary>
        /// �Ϲ����˵��
        /// </summary>
        public String compli_rules_remark
        {
            get { return _compli_rules_remark; }

            set
            {
                _compli_rules_remark = value;
                RaisePropertyChanged(() => compli_rules_remark);
            }
        }

        private String _risk_rule_action;
        /// <summary>
        /// ���ղ�ȡ��Ϊ
        /// </summary>
        public String risk_rule_action
        {
            get { return _risk_rule_action; }

            set
            {
                _risk_rule_action = value;
                RaisePropertyChanged(() => risk_rule_action);
            }
        }

        private String _risk_rule_value_str;
        /// <summary>
        /// ���չ���ֵ��
        /// </summary>
        public String risk_rule_value_str
        {
            get { return _risk_rule_value_str; }

            set
            {
                _risk_rule_value_str = value;
                RaisePropertyChanged(() => risk_rule_value_str);
            }
        }

        private String _risk_rule_calc_str;
        /// <summary>
        /// ���ռ���ֵ��
        /// </summary>
        public String risk_rule_calc_str
        {
            get { return _risk_rule_calc_str; }

            set
            {
                _risk_rule_calc_str = value;
                RaisePropertyChanged(() => risk_rule_calc_str);
            }
        }

        private String _remark_info;
        /// <summary>
        /// ��ע��Ϣ
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

}
