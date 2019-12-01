using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class rkfutuL_1_4_Info : ObservableObject
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

        private int _risk_rule_type;
        /// <summary>
        /// 风险规则类别
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
        /// 风险规则名称
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
        /// 风险规则代码
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
        /// 风险要素串
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

        private String _corrsp_plug;
        /// <summary>
        /// 对应插件
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
    }

    public class rkfutuL_1_5_Info : ObservableObject
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
    }

    public class rkfutuL_1_6_Info : ObservableObject
    {
    }

    public class rkfutuL_1_7_Info : ObservableObject
    {
    }

    public class rkfutuL_1_8_Info : ObservableObject
    {
    }

    public class rkfutuL_1_9_Info : ObservableObject
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

        private String _risk_item_name;
        /// <summary>
        /// 风险条目名称
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

        private int _contrc_type;
        /// <summary>
        /// 合约类型
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

        private String _order_dir_str;
        /// <summary>
        /// 订单方向串
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

        private int _trig_stage_type;
        /// <summary>
        /// 触发阶段类型
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
        /// 合规计算层级
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
        /// 单位净值标志
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
        /// 触发方向
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
        /// 风险规则序号
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
        /// 风险规则类别
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
        /// 风险规则名称
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
        /// 风险规则代码
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
        /// 风险要素串
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
        /// 风险规则值串
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
        /// 对应插件
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
        /// 风险采取行为
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
        /// 开始时间
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
        /// 结束时间
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
        /// 启用标志
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

    public class rkfutuL_1_10_Info : ObservableObject
    {
    }

    public class rkfutuL_1_11_Info : ObservableObject
    {
    }

    public class rkfutuL_1_12_Info : ObservableObject
    {
    }

    public class rkfutuL_1_13_Info : ObservableObject
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

        private String _model_name;
        /// <summary>
        /// 模板名称
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

    public class rkfutuL_1_14_Info : ObservableObject
    {
    }

    public class rkfutuL_1_15_Info : ObservableObject
    {
    }

    public class rkfutuL_1_16_Info : ObservableObject
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

        private ulong _model_id;
        /// <summary>
        /// 模板序号
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

        private int _risk_item_id;
        /// <summary>
        /// 风险条目序号
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

        private int _risk_rule_type;
        /// <summary>
        /// 风险规则类别
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

        private String _risk_item_name;
        /// <summary>
        /// 风险条目名称
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

        private int _contrc_type;
        /// <summary>
        /// 合约类型
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

        private String _order_dir_str;
        /// <summary>
        /// 订单方向串
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

        private int _trig_stage_type;
        /// <summary>
        /// 触发阶段类型
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
        /// 合规计算层级
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
        /// 单位净值标志
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
        /// 触发方向
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

        private String _risk_rule_value_str;
        /// <summary>
        /// 风险规则值串
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

        private String _risk_param_str;
        /// <summary>
        /// 风险要素串
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

        private String _risk_rule_action;
        /// <summary>
        /// 风险采取行为
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
        /// 开始时间
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
        /// 结束时间
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
        /// 启用标志
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

    public class rkfutuL_1_17_Info : ObservableObject
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
