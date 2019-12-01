using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class rksecuL_1_1_Info : ObservableObject
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

        private int _tim_deal_flag;
        /// <summary>
        /// 定时处理标志
        /// </summary>
        public int tim_deal_flag
        {
            get { return _tim_deal_flag; }

            set
            {
                _tim_deal_flag = value;
                RaisePropertyChanged(() => tim_deal_flag);
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

    public class rksecuL_1_2_Info : ObservableObject
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

    public class rksecuL_1_3_Info : ObservableObject
    {
    }

    public class rksecuL_1_4_Info : ObservableObject
    {
    }

    public class rksecuL_1_5_Info : ObservableObject
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

        private String _exch_no_str;
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str
        {
            get { return _exch_no_str; }

            set
            {
                _exch_no_str = value;
                RaisePropertyChanged(() => exch_no_str);
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

        private ulong _dime_id;
        /// <summary>
        /// 维度序号
        /// </summary>
        public ulong dime_id
        {
            get { return _dime_id; }

            set
            {
                _dime_id = value;
                RaisePropertyChanged(() => dime_id);
            }
        }

        private String _trig_stage_type_str;
        /// <summary>
        /// 触发阶段类型串
        /// </summary>
        public String trig_stage_type_str
        {
            get { return _trig_stage_type_str; }

            set
            {
                _trig_stage_type_str = value;
                RaisePropertyChanged(() => trig_stage_type_str);
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

        private String _compli_rules_remark;
        /// <summary>
        /// 合规规则说明
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

        private String _risk_rule_value_str1;
        /// <summary>
        /// 风险规则值串1
        /// </summary>
        public String risk_rule_value_str1
        {
            get { return _risk_rule_value_str1; }

            set
            {
                _risk_rule_value_str1 = value;
                RaisePropertyChanged(() => risk_rule_value_str1);
            }
        }

        private String _risk_rule_action1;
        /// <summary>
        /// 风险采取行为1
        /// </summary>
        public String risk_rule_action1
        {
            get { return _risk_rule_action1; }

            set
            {
                _risk_rule_action1 = value;
                RaisePropertyChanged(() => risk_rule_action1);
            }
        }

        private String _risk_rule_value_str2;
        /// <summary>
        /// 风险规则值串2
        /// </summary>
        public String risk_rule_value_str2
        {
            get { return _risk_rule_value_str2; }

            set
            {
                _risk_rule_value_str2 = value;
                RaisePropertyChanged(() => risk_rule_value_str2);
            }
        }

        private String _risk_rule_action2;
        /// <summary>
        /// 风险采取行为2
        /// </summary>
        public String risk_rule_action2
        {
            get { return _risk_rule_action2; }

            set
            {
                _risk_rule_action2 = value;
                RaisePropertyChanged(() => risk_rule_action2);
            }
        }

        private String _risk_rule_value_str3;
        /// <summary>
        /// 风险规则值串3
        /// </summary>
        public String risk_rule_value_str3
        {
            get { return _risk_rule_value_str3; }

            set
            {
                _risk_rule_value_str3 = value;
                RaisePropertyChanged(() => risk_rule_value_str3);
            }
        }

        private String _risk_rule_action3;
        /// <summary>
        /// 风险采取行为3
        /// </summary>
        public String risk_rule_action3
        {
            get { return _risk_rule_action3; }

            set
            {
                _risk_rule_action3 = value;
                RaisePropertyChanged(() => risk_rule_action3);
            }
        }

        private String _risk_rule_value_str4;
        /// <summary>
        /// 风险规则值串4
        /// </summary>
        public String risk_rule_value_str4
        {
            get { return _risk_rule_value_str4; }

            set
            {
                _risk_rule_value_str4 = value;
                RaisePropertyChanged(() => risk_rule_value_str4);
            }
        }

        private String _risk_rule_action4;
        /// <summary>
        /// 风险采取行为4
        /// </summary>
        public String risk_rule_action4
        {
            get { return _risk_rule_action4; }

            set
            {
                _risk_rule_action4 = value;
                RaisePropertyChanged(() => risk_rule_action4);
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

        private ulong _risk_item_tmplat_id;
        /// <summary>
        /// 条目模板序号
        /// </summary>
        public ulong risk_item_tmplat_id
        {
            get { return _risk_item_tmplat_id; }

            set
            {
                _risk_item_tmplat_id = value;
                RaisePropertyChanged(() => risk_item_tmplat_id);
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

    public class rksecuL_1_6_Info : ObservableObject
    {
    }

    public class rksecuL_1_7_Info : ObservableObject
    {
    }

    public class rksecuL_1_8_Info : ObservableObject
    {
    }

    public class rksecuL_1_9_Info : ObservableObject
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

    public class rksecuL_1_10_Info : ObservableObject
    {
    }

    public class rksecuL_1_11_Info : ObservableObject
    {
    }

    public class rksecuL_1_12_Info : ObservableObject
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

        private String _exch_no_str;
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str
        {
            get { return _exch_no_str; }

            set
            {
                _exch_no_str = value;
                RaisePropertyChanged(() => exch_no_str);
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

        private ulong _dime_id;
        /// <summary>
        /// 维度序号
        /// </summary>
        public ulong dime_id
        {
            get { return _dime_id; }

            set
            {
                _dime_id = value;
                RaisePropertyChanged(() => dime_id);
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

        private String _trig_stage_type_str;
        /// <summary>
        /// 触发阶段类型串
        /// </summary>
        public String trig_stage_type_str
        {
            get { return _trig_stage_type_str; }

            set
            {
                _trig_stage_type_str = value;
                RaisePropertyChanged(() => trig_stage_type_str);
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

        private String _compli_rules_remark;
        /// <summary>
        /// 合规规则说明
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

        private String _risk_rule_value_str1;
        /// <summary>
        /// 风险规则值串1
        /// </summary>
        public String risk_rule_value_str1
        {
            get { return _risk_rule_value_str1; }

            set
            {
                _risk_rule_value_str1 = value;
                RaisePropertyChanged(() => risk_rule_value_str1);
            }
        }

        private String _risk_rule_action1;
        /// <summary>
        /// 风险采取行为1
        /// </summary>
        public String risk_rule_action1
        {
            get { return _risk_rule_action1; }

            set
            {
                _risk_rule_action1 = value;
                RaisePropertyChanged(() => risk_rule_action1);
            }
        }

        private String _risk_rule_value_str2;
        /// <summary>
        /// 风险规则值串2
        /// </summary>
        public String risk_rule_value_str2
        {
            get { return _risk_rule_value_str2; }

            set
            {
                _risk_rule_value_str2 = value;
                RaisePropertyChanged(() => risk_rule_value_str2);
            }
        }

        private String _risk_rule_action2;
        /// <summary>
        /// 风险采取行为2
        /// </summary>
        public String risk_rule_action2
        {
            get { return _risk_rule_action2; }

            set
            {
                _risk_rule_action2 = value;
                RaisePropertyChanged(() => risk_rule_action2);
            }
        }

        private String _risk_rule_value_str3;
        /// <summary>
        /// 风险规则值串3
        /// </summary>
        public String risk_rule_value_str3
        {
            get { return _risk_rule_value_str3; }

            set
            {
                _risk_rule_value_str3 = value;
                RaisePropertyChanged(() => risk_rule_value_str3);
            }
        }

        private String _risk_rule_action3;
        /// <summary>
        /// 风险采取行为3
        /// </summary>
        public String risk_rule_action3
        {
            get { return _risk_rule_action3; }

            set
            {
                _risk_rule_action3 = value;
                RaisePropertyChanged(() => risk_rule_action3);
            }
        }

        private String _risk_rule_value_str4;
        /// <summary>
        /// 风险规则值串4
        /// </summary>
        public String risk_rule_value_str4
        {
            get { return _risk_rule_value_str4; }

            set
            {
                _risk_rule_value_str4 = value;
                RaisePropertyChanged(() => risk_rule_value_str4);
            }
        }

        private String _risk_rule_action4;
        /// <summary>
        /// 风险采取行为4
        /// </summary>
        public String risk_rule_action4
        {
            get { return _risk_rule_action4; }

            set
            {
                _risk_rule_action4 = value;
                RaisePropertyChanged(() => risk_rule_action4);
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

    public class rksecuL_1_13_Info : ObservableObject
    {
    }

    public class rksecuL_1_14_Info : ObservableObject
    {
    }

    public class rksecuL_1_15_Info : ObservableObject
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

        private String _exch_no_str;
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str
        {
            get { return _exch_no_str; }

            set
            {
                _exch_no_str = value;
                RaisePropertyChanged(() => exch_no_str);
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

        private int _dime_type;
        /// <summary>
        /// 维度类型
        /// </summary>
        public int dime_type
        {
            get { return _dime_type; }

            set
            {
                _dime_type = value;
                RaisePropertyChanged(() => dime_type);
            }
        }

        private String _ctrl_cond_dim_code_str;
        /// <summary>
        /// 控制条件维度编码串
        /// </summary>
        public String ctrl_cond_dim_code_str
        {
            get { return _ctrl_cond_dim_code_str; }

            set
            {
                _ctrl_cond_dim_code_str = value;
                RaisePropertyChanged(() => ctrl_cond_dim_code_str);
            }
        }

        private String _trig_stage_type_str;
        /// <summary>
        /// 触发阶段类型串
        /// </summary>
        public String trig_stage_type_str
        {
            get { return _trig_stage_type_str; }

            set
            {
                _trig_stage_type_str = value;
                RaisePropertyChanged(() => trig_stage_type_str);
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

        private String _risk_item_tmplat_name;
        /// <summary>
        /// 条目模板名称
        /// </summary>
        public String risk_item_tmplat_name
        {
            get { return _risk_item_tmplat_name; }

            set
            {
                _risk_item_tmplat_name = value;
                RaisePropertyChanged(() => risk_item_tmplat_name);
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
    }

}
