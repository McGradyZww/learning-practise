using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class rksecuL_4_1_Info : ObservableObject
    {

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

        private int _update_times;
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times
        {
            get { return _update_times; }

            set
            {
                _update_times = value;
                RaisePropertyChanged(() => update_times);
            }
        }
    }

    public class rksecuL_4_2_Info : ObservableObject
    {
    }

    public class rksecuL_4_3_Info : ObservableObject
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

        private String _pd_no_str;
        /// <summary>
        /// 产品编号串
        /// </summary>
        public String pd_no_str
        {
            get { return _pd_no_str; }

            set
            {
                _pd_no_str = value;
                RaisePropertyChanged(() => pd_no_str);
            }
        }

        private String _exch_group_no_str;
        /// <summary>
        /// 交易组编号串
        /// </summary>
        public String exch_group_no_str
        {
            get { return _exch_group_no_str; }

            set
            {
                _exch_group_no_str = value;
                RaisePropertyChanged(() => exch_group_no_str);
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

        private int _templ_flag;
        /// <summary>
        /// 条目模板标志
        /// </summary>
        public int templ_flag
        {
            get { return _templ_flag; }

            set
            {
                _templ_flag = value;
                RaisePropertyChanged(() => templ_flag);
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

        private int _union_flag;
        /// <summary>
        /// 联合标志
        /// </summary>
        public int union_flag
        {
            get { return _union_flag; }

            set
            {
                _union_flag = value;
                RaisePropertyChanged(() => union_flag);
            }
        }
    }

    public class rksecuL_4_4_Info : ObservableObject
    {

        private int _client_risk_rule_id;
        /// <summary>
        /// 客户风险规则序号
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

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
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

        private String _risk_rule_calc_str;
        /// <summary>
        /// 风险计算值串
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _pd_no_str;
        /// <summary>
        /// 产品编号串
        /// </summary>
        public String pd_no_str
        {
            get { return _pd_no_str; }

            set
            {
                _pd_no_str = value;
                RaisePropertyChanged(() => pd_no_str);
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
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
    }

    public class rksecuL_4_5_Info : ObservableObject
    {

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

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
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

        private int _order_dir;
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir
        {
            get { return _order_dir; }

            set
            {
                _order_dir = value;
                RaisePropertyChanged(() => order_dir);
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

        private String _risk_rule_calc_str;
        /// <summary>
        /// 风险计算值串
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _pd_no_str;
        /// <summary>
        /// 产品编号串
        /// </summary>
        public String pd_no_str
        {
            get { return _pd_no_str; }

            set
            {
                _pd_no_str = value;
                RaisePropertyChanged(() => pd_no_str);
            }
        }

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
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
    }

    public class rksecuL_4_6_Info : ObservableObject
    {

        private String _pd_no_str;
        /// <summary>
        /// 产品编号串
        /// </summary>
        public String pd_no_str
        {
            get { return _pd_no_str; }

            set
            {
                _pd_no_str = value;
                RaisePropertyChanged(() => pd_no_str);
            }
        }

        private String _exch_group_no_str;
        /// <summary>
        /// 交易组编号串
        /// </summary>
        public String exch_group_no_str
        {
            get { return _exch_group_no_str; }

            set
            {
                _exch_group_no_str = value;
                RaisePropertyChanged(() => exch_group_no_str);
            }
        }
    }

    public class rksecuL_4_7_Info : ObservableObject
    {

        private int _client_risk_rule_id;
        /// <summary>
        /// 客户风险规则序号
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

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
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

        private String _risk_rule_calc_str;
        /// <summary>
        /// 风险计算值串
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

    public class rksecuL_4_8_Info : ObservableObject
    {
    }

    public class rksecuL_4_9_Info : ObservableObject
    {
    }

    public class rksecuL_4_10_Info : ObservableObject
    {
    }

    public class rksecuL_4_11_Info : ObservableObject
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

        private String _pd_no_str;
        /// <summary>
        /// 产品编号串
        /// </summary>
        public String pd_no_str
        {
            get { return _pd_no_str; }

            set
            {
                _pd_no_str = value;
                RaisePropertyChanged(() => pd_no_str);
            }
        }

        private String _exch_group_no_str;
        /// <summary>
        /// 交易组编号串
        /// </summary>
        public String exch_group_no_str
        {
            get { return _exch_group_no_str; }

            set
            {
                _exch_group_no_str = value;
                RaisePropertyChanged(() => exch_group_no_str);
            }
        }

        private int _moni_role_type;
        /// <summary>
        /// 监控角色
        /// </summary>
        public int moni_role_type
        {
            get { return _moni_role_type; }

            set
            {
                _moni_role_type = value;
                RaisePropertyChanged(() => moni_role_type);
            }
        }

        private int _moni_value_flag;
        /// <summary>
        /// 监控值方式
        /// </summary>
        public int moni_value_flag
        {
            get { return _moni_value_flag; }

            set
            {
                _moni_value_flag = value;
                RaisePropertyChanged(() => moni_value_flag);
            }
        }

        private int _moni_value_type;
        /// <summary>
        /// 监控值类型
        /// </summary>
        public int moni_value_type
        {
            get { return _moni_value_type; }

            set
            {
                _moni_value_type = value;
                RaisePropertyChanged(() => moni_value_type);
            }
        }

        private double _warn_posi_value;
        /// <summary>
        /// 预警线
        /// </summary>
        public double warn_posi_value
        {
            get { return _warn_posi_value; }

            set
            {
                _warn_posi_value = value;
                RaisePropertyChanged(() => warn_posi_value);
            }
        }

        private int _warn_trig_oper_type;
        /// <summary>
        /// 预警触警操作方式
        /// </summary>
        public int warn_trig_oper_type
        {
            get { return _warn_trig_oper_type; }

            set
            {
                _warn_trig_oper_type = value;
                RaisePropertyChanged(() => warn_trig_oper_type);
            }
        }

        private double _close_posi_value;
        /// <summary>
        /// 平仓线
        /// </summary>
        public double close_posi_value
        {
            get { return _close_posi_value; }

            set
            {
                _close_posi_value = value;
                RaisePropertyChanged(() => close_posi_value);
            }
        }

        private int _close_trig_oper_type;
        /// <summary>
        /// 平仓触警操作方式
        /// </summary>
        public int close_trig_oper_type
        {
            get { return _close_trig_oper_type; }

            set
            {
                _close_trig_oper_type = value;
                RaisePropertyChanged(() => close_trig_oper_type);
            }
        }

        private double _appd_value;
        /// <summary>
        /// 追加线
        /// </summary>
        public double appd_value
        {
            get { return _appd_value; }

            set
            {
                _appd_value = value;
                RaisePropertyChanged(() => appd_value);
            }
        }

        private int _appd_trig_oper_type;
        /// <summary>
        /// 追加触警操作方式
        /// </summary>
        public int appd_trig_oper_type
        {
            get { return _appd_trig_oper_type; }

            set
            {
                _appd_trig_oper_type = value;
                RaisePropertyChanged(() => appd_trig_oper_type);
            }
        }

        private int _begin_moni_date;
        /// <summary>
        /// 起始监控日期
        /// </summary>
        public int begin_moni_date
        {
            get { return _begin_moni_date; }

            set
            {
                _begin_moni_date = value;
                RaisePropertyChanged(() => begin_moni_date);
            }
        }

        private double _begin_moni_value;
        /// <summary>
        /// 起始监控值
        /// </summary>
        public double begin_moni_value
        {
            get { return _begin_moni_value; }

            set
            {
                _begin_moni_value = value;
                RaisePropertyChanged(() => begin_moni_value);
            }
        }

        private double _max_moni_value;
        /// <summary>
        /// 最大监控值
        /// </summary>
        public double max_moni_value
        {
            get { return _max_moni_value; }

            set
            {
                _max_moni_value = value;
                RaisePropertyChanged(() => max_moni_value);
            }
        }

        private double _curr_moni_value;
        /// <summary>
        /// 当前监控值
        /// </summary>
        public double curr_moni_value
        {
            get { return _curr_moni_value; }

            set
            {
                _curr_moni_value = value;
                RaisePropertyChanged(() => curr_moni_value);
            }
        }

        private double _curr_result_moni_value;
        /// <summary>
        /// 当前监控结果
        /// </summary>
        public double curr_result_moni_value
        {
            get { return _curr_result_moni_value; }

            set
            {
                _curr_result_moni_value = value;
                RaisePropertyChanged(() => curr_result_moni_value);
            }
        }

        private String _contrs_stock_code;
        /// <summary>
        /// 对比证券代码
        /// </summary>
        public String contrs_stock_code
        {
            get { return _contrs_stock_code; }

            set
            {
                _contrs_stock_code = value;
                RaisePropertyChanged(() => contrs_stock_code);
            }
        }

        private int _contrs_exch_no;
        /// <summary>
        /// 对比市场编号
        /// </summary>
        public int contrs_exch_no
        {
            get { return _contrs_exch_no; }

            set
            {
                _contrs_exch_no = value;
                RaisePropertyChanged(() => contrs_exch_no);
            }
        }

        private double _contrs_max_moni_value;
        /// <summary>
        /// 对比最大监控值
        /// </summary>
        public double contrs_max_moni_value
        {
            get { return _contrs_max_moni_value; }

            set
            {
                _contrs_max_moni_value = value;
                RaisePropertyChanged(() => contrs_max_moni_value);
            }
        }

        private double _contrs_curr_moni_value;
        /// <summary>
        /// 对比当前监控值
        /// </summary>
        public double contrs_curr_moni_value
        {
            get { return _contrs_curr_moni_value; }

            set
            {
                _contrs_curr_moni_value = value;
                RaisePropertyChanged(() => contrs_curr_moni_value);
            }
        }

        private double _contrs_result_moni_value;
        /// <summary>
        /// 对比监控结果
        /// </summary>
        public double contrs_result_moni_value
        {
            get { return _contrs_result_moni_value; }

            set
            {
                _contrs_result_moni_value = value;
                RaisePropertyChanged(() => contrs_result_moni_value);
            }
        }

        private double _moni_result_value;
        /// <summary>
        /// 监控结果
        /// </summary>
        public double moni_result_value
        {
            get { return _moni_result_value; }

            set
            {
                _moni_result_value = value;
                RaisePropertyChanged(() => moni_result_value);
            }
        }

        private String _moni_result_status;
        /// <summary>
        /// 监控结果状态
        /// </summary>
        public String moni_result_status
        {
            get { return _moni_result_status; }

            set
            {
                _moni_result_status = value;
                RaisePropertyChanged(() => moni_result_status);
            }
        }

        private String _moni_set_status;
        /// <summary>
        /// 监控设置状态
        /// </summary>
        public String moni_set_status
        {
            get { return _moni_set_status; }

            set
            {
                _moni_set_status = value;
                RaisePropertyChanged(() => moni_set_status);
            }
        }

        private double _cash_asset;
        /// <summary>
        /// 现金资产
        /// </summary>
        public double cash_asset
        {
            get { return _cash_asset; }

            set
            {
                _cash_asset = value;
                RaisePropertyChanged(() => cash_asset);
            }
        }

        private double _fund_asset;
        /// <summary>
        /// 基金资产
        /// </summary>
        public double fund_asset
        {
            get { return _fund_asset; }

            set
            {
                _fund_asset = value;
                RaisePropertyChanged(() => fund_asset);
            }
        }

        private double _bond_asset;
        /// <summary>
        /// 债券资产
        /// </summary>
        public double bond_asset
        {
            get { return _bond_asset; }

            set
            {
                _bond_asset = value;
                RaisePropertyChanged(() => bond_asset);
            }
        }

        private double _stock_asset;
        /// <summary>
        /// 股票资产
        /// </summary>
        public double stock_asset
        {
            get { return _stock_asset; }

            set
            {
                _stock_asset = value;
                RaisePropertyChanged(() => stock_asset);
            }
        }

        private double _repo_asset;
        /// <summary>
        /// 回购资产
        /// </summary>
        public double repo_asset
        {
            get { return _repo_asset; }

            set
            {
                _repo_asset = value;
                RaisePropertyChanged(() => repo_asset);
            }
        }

        private double _nav_asset;
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset
        {
            get { return _nav_asset; }

            set
            {
                _nav_asset = value;
                RaisePropertyChanged(() => nav_asset);
            }
        }

        private double _stock_asset_ratio;
        /// <summary>
        /// 股票资产占比
        /// </summary>
        public double stock_asset_ratio
        {
            get { return _stock_asset_ratio; }

            set
            {
                _stock_asset_ratio = value;
                RaisePropertyChanged(() => stock_asset_ratio);
            }
        }

        private int _close_posi_flag;
        /// <summary>
        /// 平仓方式
        /// </summary>
        public int close_posi_flag
        {
            get { return _close_posi_flag; }

            set
            {
                _close_posi_flag = value;
                RaisePropertyChanged(() => close_posi_flag);
            }
        }

        private double _close_ratio_level_one;
        /// <summary>
        /// 一级平仓比例
        /// </summary>
        public double close_ratio_level_one
        {
            get { return _close_ratio_level_one; }

            set
            {
                _close_ratio_level_one = value;
                RaisePropertyChanged(() => close_ratio_level_one);
            }
        }

        private double _close_ratio_level_two;
        /// <summary>
        /// 二级平仓比例
        /// </summary>
        public double close_ratio_level_two
        {
            get { return _close_ratio_level_two; }

            set
            {
                _close_ratio_level_two = value;
                RaisePropertyChanged(() => close_ratio_level_two);
            }
        }

        private double _close_ratio_level_three;
        /// <summary>
        /// 三级平仓比例
        /// </summary>
        public double close_ratio_level_three
        {
            get { return _close_ratio_level_three; }

            set
            {
                _close_ratio_level_three = value;
                RaisePropertyChanged(() => close_ratio_level_three);
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

        private double _pd_share;
        /// <summary>
        /// 产品份额
        /// </summary>
        public double pd_share
        {
            get { return _pd_share; }

            set
            {
                _pd_share = value;
                RaisePropertyChanged(() => pd_share);
            }
        }

        private double _begin_asset_value;
        /// <summary>
        /// 期初资产值
        /// </summary>
        public double begin_asset_value
        {
            get { return _begin_asset_value; }

            set
            {
                _begin_asset_value = value;
                RaisePropertyChanged(() => begin_asset_value);
            }
        }

        private double _hk_thrgh_stock_asset;
        /// <summary>
        /// 港股通资产
        /// </summary>
        public double hk_thrgh_stock_asset
        {
            get { return _hk_thrgh_stock_asset; }

            set
            {
                _hk_thrgh_stock_asset = value;
                RaisePropertyChanged(() => hk_thrgh_stock_asset);
            }
        }
    }

    public class rksecuL_4_12_Info : ObservableObject
    {
    }

    public class rksecuL_4_13_Info : ObservableObject
    {
    }

    public class rksecuL_4_14_Info : ObservableObject
    {
    }

    public class rksecuL_4_15_Info : ObservableObject
    {
    }

    public class rksecuL_4_16_Info : ObservableObject
    {
    }

    public class rksecuL_4_17_Info : ObservableObject
    {
    }

    public class rksecuL_4_18_Info : ObservableObject
    {

        private ulong _moni_set_id;
        /// <summary>
        /// 监控设置序号
        /// </summary>
        public ulong moni_set_id
        {
            get { return _moni_set_id; }

            set
            {
                _moni_set_id = value;
                RaisePropertyChanged(() => moni_set_id);
            }
        }
    }

    public class rksecuL_4_19_Info : ObservableObject
    {
    }

    public class rksecuL_4_20_Info : ObservableObject
    {
    }

    public class rksecuL_4_21_Info : ObservableObject
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _pd_no_str;
        /// <summary>
        /// 产品编号串
        /// </summary>
        public String pd_no_str
        {
            get { return _pd_no_str; }

            set
            {
                _pd_no_str = value;
                RaisePropertyChanged(() => pd_no_str);
            }
        }

        private String _exch_group_no_str;
        /// <summary>
        /// 交易组编号串
        /// </summary>
        public String exch_group_no_str
        {
            get { return _exch_group_no_str; }

            set
            {
                _exch_group_no_str = value;
                RaisePropertyChanged(() => exch_group_no_str);
            }
        }

        private int _monitor_ctrl_type;
        /// <summary>
        /// 监控控制方式
        /// </summary>
        public int monitor_ctrl_type
        {
            get { return _monitor_ctrl_type; }

            set
            {
                _monitor_ctrl_type = value;
                RaisePropertyChanged(() => monitor_ctrl_type);
            }
        }

        private int _moni_value_type;
        /// <summary>
        /// 监控值类型
        /// </summary>
        public int moni_value_type
        {
            get { return _moni_value_type; }

            set
            {
                _moni_value_type = value;
                RaisePropertyChanged(() => moni_value_type);
            }
        }

        private int _monitor_param_value;
        /// <summary>
        /// 监控参数值
        /// </summary>
        public int monitor_param_value
        {
            get { return _monitor_param_value; }

            set
            {
                _monitor_param_value = value;
                RaisePropertyChanged(() => monitor_param_value);
            }
        }

        private int _moni_value_flag;
        /// <summary>
        /// 监控值方式
        /// </summary>
        public int moni_value_flag
        {
            get { return _moni_value_flag; }

            set
            {
                _moni_value_flag = value;
                RaisePropertyChanged(() => moni_value_flag);
            }
        }

        private double _warn_posi_value;
        /// <summary>
        /// 预警线
        /// </summary>
        public double warn_posi_value
        {
            get { return _warn_posi_value; }

            set
            {
                _warn_posi_value = value;
                RaisePropertyChanged(() => warn_posi_value);
            }
        }

        private double _appd_value;
        /// <summary>
        /// 追加线
        /// </summary>
        public double appd_value
        {
            get { return _appd_value; }

            set
            {
                _appd_value = value;
                RaisePropertyChanged(() => appd_value);
            }
        }

        private double _close_posi_value;
        /// <summary>
        /// 平仓线
        /// </summary>
        public double close_posi_value
        {
            get { return _close_posi_value; }

            set
            {
                _close_posi_value = value;
                RaisePropertyChanged(() => close_posi_value);
            }
        }

        private double _max_moni_value;
        /// <summary>
        /// 最大监控值
        /// </summary>
        public double max_moni_value
        {
            get { return _max_moni_value; }

            set
            {
                _max_moni_value = value;
                RaisePropertyChanged(() => max_moni_value);
            }
        }

        private double _curr_moni_value;
        /// <summary>
        /// 当前监控值
        /// </summary>
        public double curr_moni_value
        {
            get { return _curr_moni_value; }

            set
            {
                _curr_moni_value = value;
                RaisePropertyChanged(() => curr_moni_value);
            }
        }

        private double _curr_result_moni_value;
        /// <summary>
        /// 当前监控结果
        /// </summary>
        public double curr_result_moni_value
        {
            get { return _curr_result_moni_value; }

            set
            {
                _curr_result_moni_value = value;
                RaisePropertyChanged(() => curr_result_moni_value);
            }
        }

        private String _contrs_stock_code;
        /// <summary>
        /// 对比证券代码
        /// </summary>
        public String contrs_stock_code
        {
            get { return _contrs_stock_code; }

            set
            {
                _contrs_stock_code = value;
                RaisePropertyChanged(() => contrs_stock_code);
            }
        }

        private int _contrs_exch_no;
        /// <summary>
        /// 对比市场编号
        /// </summary>
        public int contrs_exch_no
        {
            get { return _contrs_exch_no; }

            set
            {
                _contrs_exch_no = value;
                RaisePropertyChanged(() => contrs_exch_no);
            }
        }

        private double _contrs_max_moni_value;
        /// <summary>
        /// 对比最大监控值
        /// </summary>
        public double contrs_max_moni_value
        {
            get { return _contrs_max_moni_value; }

            set
            {
                _contrs_max_moni_value = value;
                RaisePropertyChanged(() => contrs_max_moni_value);
            }
        }

        private double _contrs_curr_moni_value;
        /// <summary>
        /// 对比当前监控值
        /// </summary>
        public double contrs_curr_moni_value
        {
            get { return _contrs_curr_moni_value; }

            set
            {
                _contrs_curr_moni_value = value;
                RaisePropertyChanged(() => contrs_curr_moni_value);
            }
        }

        private double _contrs_result_moni_value;
        /// <summary>
        /// 对比监控结果
        /// </summary>
        public double contrs_result_moni_value
        {
            get { return _contrs_result_moni_value; }

            set
            {
                _contrs_result_moni_value = value;
                RaisePropertyChanged(() => contrs_result_moni_value);
            }
        }

        private double _moni_result_value;
        /// <summary>
        /// 监控结果
        /// </summary>
        public double moni_result_value
        {
            get { return _moni_result_value; }

            set
            {
                _moni_result_value = value;
                RaisePropertyChanged(() => moni_result_value);
            }
        }

        private String _moni_result_status;
        /// <summary>
        /// 监控结果状态
        /// </summary>
        public String moni_result_status
        {
            get { return _moni_result_status; }

            set
            {
                _moni_result_status = value;
                RaisePropertyChanged(() => moni_result_status);
            }
        }

        private String _moni_set_status;
        /// <summary>
        /// 监控设置状态
        /// </summary>
        public String moni_set_status
        {
            get { return _moni_set_status; }

            set
            {
                _moni_set_status = value;
                RaisePropertyChanged(() => moni_set_status);
            }
        }

        private int _close_posi_flag;
        /// <summary>
        /// 平仓方式
        /// </summary>
        public int close_posi_flag
        {
            get { return _close_posi_flag; }

            set
            {
                _close_posi_flag = value;
                RaisePropertyChanged(() => close_posi_flag);
            }
        }

        private double _close_ratio_level_one;
        /// <summary>
        /// 一级平仓比例
        /// </summary>
        public double close_ratio_level_one
        {
            get { return _close_ratio_level_one; }

            set
            {
                _close_ratio_level_one = value;
                RaisePropertyChanged(() => close_ratio_level_one);
            }
        }

        private double _close_ratio_level_two;
        /// <summary>
        /// 二级平仓比例
        /// </summary>
        public double close_ratio_level_two
        {
            get { return _close_ratio_level_two; }

            set
            {
                _close_ratio_level_two = value;
                RaisePropertyChanged(() => close_ratio_level_two);
            }
        }

        private double _close_ratio_level_three;
        /// <summary>
        /// 三级平仓比例
        /// </summary>
        public double close_ratio_level_three
        {
            get { return _close_ratio_level_three; }

            set
            {
                _close_ratio_level_three = value;
                RaisePropertyChanged(() => close_ratio_level_three);
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

    public class rksecuL_4_22_Info : ObservableObject
    {
    }

    public class rksecuL_4_23_Info : ObservableObject
    {
    }

    public class rksecuL_4_24_Info : ObservableObject
    {
    }

    public class rksecuL_4_25_Info : ObservableObject
    {
    }

    public class rksecuL_4_26_Info : ObservableObject
    {
    }

    public class rksecuL_4_27_Info : ObservableObject
    {
    }

    public class rksecuL_4_28_Info : ObservableObject
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

    public class rksecuL_4_29_Info : ObservableObject
    {

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

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
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

        private int _order_dir;
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir
        {
            get { return _order_dir; }

            set
            {
                _order_dir = value;
                RaisePropertyChanged(() => order_dir);
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

        private String _risk_rule_calc_str;
        /// <summary>
        /// 风险计算值串
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private String _pd_no_str;
        /// <summary>
        /// 产品编号串
        /// </summary>
        public String pd_no_str
        {
            get { return _pd_no_str; }

            set
            {
                _pd_no_str = value;
                RaisePropertyChanged(() => pd_no_str);
            }
        }

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
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
    }

    public class rksecuL_4_30_Info : ObservableObject
    {

        private String _pd_no_str;
        /// <summary>
        /// 产品编号串
        /// </summary>
        public String pd_no_str
        {
            get { return _pd_no_str; }

            set
            {
                _pd_no_str = value;
                RaisePropertyChanged(() => pd_no_str);
            }
        }

        private String _exch_group_no_str;
        /// <summary>
        /// 交易组编号串
        /// </summary>
        public String exch_group_no_str
        {
            get { return _exch_group_no_str; }

            set
            {
                _exch_group_no_str = value;
                RaisePropertyChanged(() => exch_group_no_str);
            }
        }

        private int _union_flag;
        /// <summary>
        /// 联合标志
        /// </summary>
        public int union_flag
        {
            get { return _union_flag; }

            set
            {
                _union_flag = value;
                RaisePropertyChanged(() => union_flag);
            }
        }
    }

    public class rksecuL_4_31_Info : ObservableObject
    {
    }

    public class rksecuL_4_32_Info : ObservableObject
    {

        private int _client_risk_rule_id;
        /// <summary>
        /// 客户风险规则序号
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

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
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

        private String _risk_rule_calc_str;
        /// <summary>
        /// 风险计算值串
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

    public class rksecuL_4_33_Info : ObservableObject
    {

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private ulong _detail_posi_id;
        /// <summary>
        /// 明细持仓序号
        /// </summary>
        public ulong detail_posi_id
        {
            get { return _detail_posi_id; }

            set
            {
                _detail_posi_id = value;
                RaisePropertyChanged(() => detail_posi_id);
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

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
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

        private String _stock_code;
        /// <summary>
        /// 证券代码
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
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

        private int _lngsht_type;
        /// <summary>
        /// 多空类型
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
            }
        }

        private double _curr_qty;
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty
        {
            get { return _curr_qty; }

            set
            {
                _curr_qty = value;
                RaisePropertyChanged(() => curr_qty);
            }
        }

        private int _open_posi_date;
        /// <summary>
        /// 开仓日期
        /// </summary>
        public int open_posi_date
        {
            get { return _open_posi_date; }

            set
            {
                _open_posi_date = value;
                RaisePropertyChanged(() => open_posi_date);
            }
        }

        private int _open_posi_time;
        /// <summary>
        /// 开仓时间
        /// </summary>
        public int open_posi_time
        {
            get { return _open_posi_time; }

            set
            {
                _open_posi_time = value;
                RaisePropertyChanged(() => open_posi_time);
            }
        }

        private double _open_posi_price;
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price
        {
            get { return _open_posi_price; }

            set
            {
                _open_posi_price = value;
                RaisePropertyChanged(() => open_posi_price);
            }
        }

        private double _open_posi_value;
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value
        {
            get { return _open_posi_value; }

            set
            {
                _open_posi_value = value;
                RaisePropertyChanged(() => open_posi_value);
            }
        }

        private double _open_posi_fee;
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee
        {
            get { return _open_posi_fee; }

            set
            {
                _open_posi_fee = value;
                RaisePropertyChanged(() => open_posi_fee);
            }
        }

        private double _close_posi_qty;
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty
        {
            get { return _close_posi_qty; }

            set
            {
                _close_posi_qty = value;
                RaisePropertyChanged(() => close_posi_qty);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
            }
        }

        private double _close_posi_fee;
        /// <summary>
        /// 平仓费用
        /// </summary>
        public double close_posi_fee
        {
            get { return _close_posi_fee; }

            set
            {
                _close_posi_fee = value;
                RaisePropertyChanged(() => close_posi_fee);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _pandl_ratio;
        /// <summary>
        /// 盈亏比例
        /// </summary>
        public double pandl_ratio
        {
            get { return _pandl_ratio; }

            set
            {
                _pandl_ratio = value;
                RaisePropertyChanged(() => pandl_ratio);
            }
        }

        private double _un_close_posi_qty;
        /// <summary>
        /// 未平仓数量
        /// </summary>
        public double un_close_posi_qty
        {
            get { return _un_close_posi_qty; }

            set
            {
                _un_close_posi_qty = value;
                RaisePropertyChanged(() => un_close_posi_qty);
            }
        }

        private double _un_close_marke_value;
        /// <summary>
        /// 未平仓市值
        /// </summary>
        public double un_close_marke_value
        {
            get { return _un_close_marke_value; }

            set
            {
                _un_close_marke_value = value;
                RaisePropertyChanged(() => un_close_marke_value);
            }
        }

        private double _last_price;
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _up_limit_price;
        /// <summary>
        /// 涨停价
        /// </summary>
        public double up_limit_price
        {
            get { return _up_limit_price; }

            set
            {
                _up_limit_price = value;
                RaisePropertyChanged(() => up_limit_price);
            }
        }

        private double _down_limit_price;
        /// <summary>
        /// 跌停价
        /// </summary>
        public double down_limit_price
        {
            get { return _down_limit_price; }

            set
            {
                _down_limit_price = value;
                RaisePropertyChanged(() => down_limit_price);
            }
        }

        private double _cost_price;
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price
        {
            get { return _cost_price; }

            set
            {
                _cost_price = value;
                RaisePropertyChanged(() => cost_price);
            }
        }

        private double _last_tshold_value;
        /// <summary>
        /// 最新阈值
        /// </summary>
        public double last_tshold_value
        {
            get { return _last_tshold_value; }

            set
            {
                _last_tshold_value = value;
                RaisePropertyChanged(() => last_tshold_value);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
        /// </summary>
        public double float_pandl
        {
            get { return _float_pandl; }

            set
            {
                _float_pandl = value;
                RaisePropertyChanged(() => float_pandl);
            }
        }

        private String _posi_status;
        /// <summary>
        /// 持仓状态
        /// </summary>
        public String posi_status
        {
            get { return _posi_status; }

            set
            {
                _posi_status = value;
                RaisePropertyChanged(() => posi_status);
            }
        }

        private String _moni_result_status;
        /// <summary>
        /// 监控结果状态
        /// </summary>
        public String moni_result_status
        {
            get { return _moni_result_status; }

            set
            {
                _moni_result_status = value;
                RaisePropertyChanged(() => moni_result_status);
            }
        }

        private String _posi_limit_status;
        /// <summary>
        /// 持仓时限状态
        /// </summary>
        public String posi_limit_status
        {
            get { return _posi_limit_status; }

            set
            {
                _posi_limit_status = value;
                RaisePropertyChanged(() => posi_limit_status);
            }
        }

        private double _opor_warn_tshold;
        /// <summary>
        /// 操作员预警阈值
        /// </summary>
        public double opor_warn_tshold
        {
            get { return _opor_warn_tshold; }

            set
            {
                _opor_warn_tshold = value;
                RaisePropertyChanged(() => opor_warn_tshold);
            }
        }

        private double _opor_stop_tshold;
        /// <summary>
        /// 操作员止损阈值
        /// </summary>
        public double opor_stop_tshold
        {
            get { return _opor_stop_tshold; }

            set
            {
                _opor_stop_tshold = value;
                RaisePropertyChanged(() => opor_stop_tshold);
            }
        }

        private double _stock_warn_ratio;
        /// <summary>
        /// 单券预警比例
        /// </summary>
        public double stock_warn_ratio
        {
            get { return _stock_warn_ratio; }

            set
            {
                _stock_warn_ratio = value;
                RaisePropertyChanged(() => stock_warn_ratio);
            }
        }

        private double _stock_stop_ratio;
        /// <summary>
        /// 单券止损比例
        /// </summary>
        public double stock_stop_ratio
        {
            get { return _stock_stop_ratio; }

            set
            {
                _stock_stop_ratio = value;
                RaisePropertyChanged(() => stock_stop_ratio);
            }
        }

        private double _stock_warn_amt;
        /// <summary>
        /// 单券预警金额
        /// </summary>
        public double stock_warn_amt
        {
            get { return _stock_warn_amt; }

            set
            {
                _stock_warn_amt = value;
                RaisePropertyChanged(() => stock_warn_amt);
            }
        }

        private double _stock_stop_amt;
        /// <summary>
        /// 单券止损金额
        /// </summary>
        public double stock_stop_amt
        {
            get { return _stock_stop_amt; }

            set
            {
                _stock_stop_amt = value;
                RaisePropertyChanged(() => stock_stop_amt);
            }
        }

        private int _open_close_permission;
        /// <summary>
        /// 开平仓权限
        /// </summary>
        public int open_close_permission
        {
            get { return _open_close_permission; }

            set
            {
                _open_close_permission = value;
                RaisePropertyChanged(() => open_close_permission);
            }
        }

        private int _posi_limit_time;
        /// <summary>
        /// 持仓时限
        /// </summary>
        public int posi_limit_time
        {
            get { return _posi_limit_time; }

            set
            {
                _posi_limit_time = value;
                RaisePropertyChanged(() => posi_limit_time);
            }
        }
    }

    public class rksecuL_4_34_Info : ObservableObject
    {

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private ulong _detail_posi_id;
        /// <summary>
        /// 明细持仓序号
        /// </summary>
        public ulong detail_posi_id
        {
            get { return _detail_posi_id; }

            set
            {
                _detail_posi_id = value;
                RaisePropertyChanged(() => detail_posi_id);
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

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
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

        private String _stock_code;
        /// <summary>
        /// 证券代码
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
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

        private int _lngsht_type;
        /// <summary>
        /// 多空类型
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
            }
        }

        private double _curr_qty;
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty
        {
            get { return _curr_qty; }

            set
            {
                _curr_qty = value;
                RaisePropertyChanged(() => curr_qty);
            }
        }

        private int _open_posi_date;
        /// <summary>
        /// 开仓日期
        /// </summary>
        public int open_posi_date
        {
            get { return _open_posi_date; }

            set
            {
                _open_posi_date = value;
                RaisePropertyChanged(() => open_posi_date);
            }
        }

        private int _open_posi_time;
        /// <summary>
        /// 开仓时间
        /// </summary>
        public int open_posi_time
        {
            get { return _open_posi_time; }

            set
            {
                _open_posi_time = value;
                RaisePropertyChanged(() => open_posi_time);
            }
        }

        private double _open_posi_price;
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price
        {
            get { return _open_posi_price; }

            set
            {
                _open_posi_price = value;
                RaisePropertyChanged(() => open_posi_price);
            }
        }

        private double _open_posi_value;
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value
        {
            get { return _open_posi_value; }

            set
            {
                _open_posi_value = value;
                RaisePropertyChanged(() => open_posi_value);
            }
        }

        private double _open_posi_fee;
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee
        {
            get { return _open_posi_fee; }

            set
            {
                _open_posi_fee = value;
                RaisePropertyChanged(() => open_posi_fee);
            }
        }

        private double _close_posi_qty;
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty
        {
            get { return _close_posi_qty; }

            set
            {
                _close_posi_qty = value;
                RaisePropertyChanged(() => close_posi_qty);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
            }
        }

        private double _close_posi_fee;
        /// <summary>
        /// 平仓费用
        /// </summary>
        public double close_posi_fee
        {
            get { return _close_posi_fee; }

            set
            {
                _close_posi_fee = value;
                RaisePropertyChanged(() => close_posi_fee);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _pandl_ratio;
        /// <summary>
        /// 盈亏比例
        /// </summary>
        public double pandl_ratio
        {
            get { return _pandl_ratio; }

            set
            {
                _pandl_ratio = value;
                RaisePropertyChanged(() => pandl_ratio);
            }
        }

        private double _un_close_posi_qty;
        /// <summary>
        /// 未平仓数量
        /// </summary>
        public double un_close_posi_qty
        {
            get { return _un_close_posi_qty; }

            set
            {
                _un_close_posi_qty = value;
                RaisePropertyChanged(() => un_close_posi_qty);
            }
        }

        private double _un_close_marke_value;
        /// <summary>
        /// 未平仓市值
        /// </summary>
        public double un_close_marke_value
        {
            get { return _un_close_marke_value; }

            set
            {
                _un_close_marke_value = value;
                RaisePropertyChanged(() => un_close_marke_value);
            }
        }

        private double _last_price;
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _up_limit_price;
        /// <summary>
        /// 涨停价
        /// </summary>
        public double up_limit_price
        {
            get { return _up_limit_price; }

            set
            {
                _up_limit_price = value;
                RaisePropertyChanged(() => up_limit_price);
            }
        }

        private double _down_limit_price;
        /// <summary>
        /// 跌停价
        /// </summary>
        public double down_limit_price
        {
            get { return _down_limit_price; }

            set
            {
                _down_limit_price = value;
                RaisePropertyChanged(() => down_limit_price);
            }
        }

        private double _last_tshold_value;
        /// <summary>
        /// 最新阈值
        /// </summary>
        public double last_tshold_value
        {
            get { return _last_tshold_value; }

            set
            {
                _last_tshold_value = value;
                RaisePropertyChanged(() => last_tshold_value);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
        /// </summary>
        public double float_pandl
        {
            get { return _float_pandl; }

            set
            {
                _float_pandl = value;
                RaisePropertyChanged(() => float_pandl);
            }
        }

        private String _posi_status;
        /// <summary>
        /// 持仓状态
        /// </summary>
        public String posi_status
        {
            get { return _posi_status; }

            set
            {
                _posi_status = value;
                RaisePropertyChanged(() => posi_status);
            }
        }

        private String _moni_result_status;
        /// <summary>
        /// 监控结果状态
        /// </summary>
        public String moni_result_status
        {
            get { return _moni_result_status; }

            set
            {
                _moni_result_status = value;
                RaisePropertyChanged(() => moni_result_status);
            }
        }

        private String _posi_limit_status;
        /// <summary>
        /// 持仓时限状态
        /// </summary>
        public String posi_limit_status
        {
            get { return _posi_limit_status; }

            set
            {
                _posi_limit_status = value;
                RaisePropertyChanged(() => posi_limit_status);
            }
        }

        private double _opor_warn_tshold;
        /// <summary>
        /// 操作员预警阈值
        /// </summary>
        public double opor_warn_tshold
        {
            get { return _opor_warn_tshold; }

            set
            {
                _opor_warn_tshold = value;
                RaisePropertyChanged(() => opor_warn_tshold);
            }
        }

        private double _opor_stop_tshold;
        /// <summary>
        /// 操作员止损阈值
        /// </summary>
        public double opor_stop_tshold
        {
            get { return _opor_stop_tshold; }

            set
            {
                _opor_stop_tshold = value;
                RaisePropertyChanged(() => opor_stop_tshold);
            }
        }

        private double _stock_warn_ratio;
        /// <summary>
        /// 单券预警比例
        /// </summary>
        public double stock_warn_ratio
        {
            get { return _stock_warn_ratio; }

            set
            {
                _stock_warn_ratio = value;
                RaisePropertyChanged(() => stock_warn_ratio);
            }
        }

        private double _stock_stop_ratio;
        /// <summary>
        /// 单券止损比例
        /// </summary>
        public double stock_stop_ratio
        {
            get { return _stock_stop_ratio; }

            set
            {
                _stock_stop_ratio = value;
                RaisePropertyChanged(() => stock_stop_ratio);
            }
        }

        private double _stock_warn_amt;
        /// <summary>
        /// 单券预警金额
        /// </summary>
        public double stock_warn_amt
        {
            get { return _stock_warn_amt; }

            set
            {
                _stock_warn_amt = value;
                RaisePropertyChanged(() => stock_warn_amt);
            }
        }

        private double _stock_stop_amt;
        /// <summary>
        /// 单券止损金额
        /// </summary>
        public double stock_stop_amt
        {
            get { return _stock_stop_amt; }

            set
            {
                _stock_stop_amt = value;
                RaisePropertyChanged(() => stock_stop_amt);
            }
        }

        private int _open_close_permission;
        /// <summary>
        /// 开平仓权限
        /// </summary>
        public int open_close_permission
        {
            get { return _open_close_permission; }

            set
            {
                _open_close_permission = value;
                RaisePropertyChanged(() => open_close_permission);
            }
        }

        private int _posi_limit_time;
        /// <summary>
        /// 持仓时限
        /// </summary>
        public int posi_limit_time
        {
            get { return _posi_limit_time; }

            set
            {
                _posi_limit_time = value;
                RaisePropertyChanged(() => posi_limit_time);
            }
        }
    }

    public class rksecuL_4_35_Info : ObservableObject
    {
    }

    public class rksecuL_4_36_Info : ObservableObject
    {
    }

    public class rksecuL_4_37_Info : ObservableObject
    {
    }

    public class rksecuL_4_38_Info : ObservableObject
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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private int _moni_role_type;
        /// <summary>
        /// 监控角色
        /// </summary>
        public int moni_role_type
        {
            get { return _moni_role_type; }

            set
            {
                _moni_role_type = value;
                RaisePropertyChanged(() => moni_role_type);
            }
        }

        private int _moni_value_flag;
        /// <summary>
        /// 监控值方式
        /// </summary>
        public int moni_value_flag
        {
            get { return _moni_value_flag; }

            set
            {
                _moni_value_flag = value;
                RaisePropertyChanged(() => moni_value_flag);
            }
        }

        private int _moni_value_type;
        /// <summary>
        /// 监控值类型
        /// </summary>
        public int moni_value_type
        {
            get { return _moni_value_type; }

            set
            {
                _moni_value_type = value;
                RaisePropertyChanged(() => moni_value_type);
            }
        }

        private double _warn_posi_value;
        /// <summary>
        /// 预警线
        /// </summary>
        public double warn_posi_value
        {
            get { return _warn_posi_value; }

            set
            {
                _warn_posi_value = value;
                RaisePropertyChanged(() => warn_posi_value);
            }
        }

        private int _warn_trig_oper_type;
        /// <summary>
        /// 预警触警操作方式
        /// </summary>
        public int warn_trig_oper_type
        {
            get { return _warn_trig_oper_type; }

            set
            {
                _warn_trig_oper_type = value;
                RaisePropertyChanged(() => warn_trig_oper_type);
            }
        }

        private double _close_posi_value;
        /// <summary>
        /// 平仓线
        /// </summary>
        public double close_posi_value
        {
            get { return _close_posi_value; }

            set
            {
                _close_posi_value = value;
                RaisePropertyChanged(() => close_posi_value);
            }
        }

        private int _close_trig_oper_type;
        /// <summary>
        /// 平仓触警操作方式
        /// </summary>
        public int close_trig_oper_type
        {
            get { return _close_trig_oper_type; }

            set
            {
                _close_trig_oper_type = value;
                RaisePropertyChanged(() => close_trig_oper_type);
            }
        }

        private double _appd_value;
        /// <summary>
        /// 追加线
        /// </summary>
        public double appd_value
        {
            get { return _appd_value; }

            set
            {
                _appd_value = value;
                RaisePropertyChanged(() => appd_value);
            }
        }

        private int _appd_trig_oper_type;
        /// <summary>
        /// 追加触警操作方式
        /// </summary>
        public int appd_trig_oper_type
        {
            get { return _appd_trig_oper_type; }

            set
            {
                _appd_trig_oper_type = value;
                RaisePropertyChanged(() => appd_trig_oper_type);
            }
        }

        private int _begin_moni_date;
        /// <summary>
        /// 起始监控日期
        /// </summary>
        public int begin_moni_date
        {
            get { return _begin_moni_date; }

            set
            {
                _begin_moni_date = value;
                RaisePropertyChanged(() => begin_moni_date);
            }
        }

        private double _begin_moni_value;
        /// <summary>
        /// 起始监控值
        /// </summary>
        public double begin_moni_value
        {
            get { return _begin_moni_value; }

            set
            {
                _begin_moni_value = value;
                RaisePropertyChanged(() => begin_moni_value);
            }
        }

        private double _max_moni_value;
        /// <summary>
        /// 最大监控值
        /// </summary>
        public double max_moni_value
        {
            get { return _max_moni_value; }

            set
            {
                _max_moni_value = value;
                RaisePropertyChanged(() => max_moni_value);
            }
        }

        private double _curr_moni_value;
        /// <summary>
        /// 当前监控值
        /// </summary>
        public double curr_moni_value
        {
            get { return _curr_moni_value; }

            set
            {
                _curr_moni_value = value;
                RaisePropertyChanged(() => curr_moni_value);
            }
        }

        private double _curr_result_moni_value;
        /// <summary>
        /// 当前监控结果
        /// </summary>
        public double curr_result_moni_value
        {
            get { return _curr_result_moni_value; }

            set
            {
                _curr_result_moni_value = value;
                RaisePropertyChanged(() => curr_result_moni_value);
            }
        }

        private String _contrs_stock_code;
        /// <summary>
        /// 对比证券代码
        /// </summary>
        public String contrs_stock_code
        {
            get { return _contrs_stock_code; }

            set
            {
                _contrs_stock_code = value;
                RaisePropertyChanged(() => contrs_stock_code);
            }
        }

        private int _contrs_exch_no;
        /// <summary>
        /// 对比市场编号
        /// </summary>
        public int contrs_exch_no
        {
            get { return _contrs_exch_no; }

            set
            {
                _contrs_exch_no = value;
                RaisePropertyChanged(() => contrs_exch_no);
            }
        }

        private double _contrs_max_moni_value;
        /// <summary>
        /// 对比最大监控值
        /// </summary>
        public double contrs_max_moni_value
        {
            get { return _contrs_max_moni_value; }

            set
            {
                _contrs_max_moni_value = value;
                RaisePropertyChanged(() => contrs_max_moni_value);
            }
        }

        private double _contrs_curr_moni_value;
        /// <summary>
        /// 对比当前监控值
        /// </summary>
        public double contrs_curr_moni_value
        {
            get { return _contrs_curr_moni_value; }

            set
            {
                _contrs_curr_moni_value = value;
                RaisePropertyChanged(() => contrs_curr_moni_value);
            }
        }

        private double _contrs_result_moni_value;
        /// <summary>
        /// 对比监控结果
        /// </summary>
        public double contrs_result_moni_value
        {
            get { return _contrs_result_moni_value; }

            set
            {
                _contrs_result_moni_value = value;
                RaisePropertyChanged(() => contrs_result_moni_value);
            }
        }

        private double _moni_result_value;
        /// <summary>
        /// 监控结果
        /// </summary>
        public double moni_result_value
        {
            get { return _moni_result_value; }

            set
            {
                _moni_result_value = value;
                RaisePropertyChanged(() => moni_result_value);
            }
        }

        private String _moni_result_status;
        /// <summary>
        /// 监控结果状态
        /// </summary>
        public String moni_result_status
        {
            get { return _moni_result_status; }

            set
            {
                _moni_result_status = value;
                RaisePropertyChanged(() => moni_result_status);
            }
        }

        private String _moni_set_status;
        /// <summary>
        /// 监控设置状态
        /// </summary>
        public String moni_set_status
        {
            get { return _moni_set_status; }

            set
            {
                _moni_set_status = value;
                RaisePropertyChanged(() => moni_set_status);
            }
        }

        private double _cash_asset;
        /// <summary>
        /// 现金资产
        /// </summary>
        public double cash_asset
        {
            get { return _cash_asset; }

            set
            {
                _cash_asset = value;
                RaisePropertyChanged(() => cash_asset);
            }
        }

        private double _fund_asset;
        /// <summary>
        /// 基金资产
        /// </summary>
        public double fund_asset
        {
            get { return _fund_asset; }

            set
            {
                _fund_asset = value;
                RaisePropertyChanged(() => fund_asset);
            }
        }

        private double _bond_asset;
        /// <summary>
        /// 债券资产
        /// </summary>
        public double bond_asset
        {
            get { return _bond_asset; }

            set
            {
                _bond_asset = value;
                RaisePropertyChanged(() => bond_asset);
            }
        }

        private double _stock_asset;
        /// <summary>
        /// 股票资产
        /// </summary>
        public double stock_asset
        {
            get { return _stock_asset; }

            set
            {
                _stock_asset = value;
                RaisePropertyChanged(() => stock_asset);
            }
        }

        private double _repo_asset;
        /// <summary>
        /// 回购资产
        /// </summary>
        public double repo_asset
        {
            get { return _repo_asset; }

            set
            {
                _repo_asset = value;
                RaisePropertyChanged(() => repo_asset);
            }
        }

        private double _nav_asset;
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset
        {
            get { return _nav_asset; }

            set
            {
                _nav_asset = value;
                RaisePropertyChanged(() => nav_asset);
            }
        }

        private double _stock_asset_ratio;
        /// <summary>
        /// 股票资产占比
        /// </summary>
        public double stock_asset_ratio
        {
            get { return _stock_asset_ratio; }

            set
            {
                _stock_asset_ratio = value;
                RaisePropertyChanged(() => stock_asset_ratio);
            }
        }

        private int _close_posi_flag;
        /// <summary>
        /// 平仓方式
        /// </summary>
        public int close_posi_flag
        {
            get { return _close_posi_flag; }

            set
            {
                _close_posi_flag = value;
                RaisePropertyChanged(() => close_posi_flag);
            }
        }

        private double _close_ratio_level_one;
        /// <summary>
        /// 一级平仓比例
        /// </summary>
        public double close_ratio_level_one
        {
            get { return _close_ratio_level_one; }

            set
            {
                _close_ratio_level_one = value;
                RaisePropertyChanged(() => close_ratio_level_one);
            }
        }

        private double _close_ratio_level_two;
        /// <summary>
        /// 二级平仓比例
        /// </summary>
        public double close_ratio_level_two
        {
            get { return _close_ratio_level_two; }

            set
            {
                _close_ratio_level_two = value;
                RaisePropertyChanged(() => close_ratio_level_two);
            }
        }

        private double _close_ratio_level_three;
        /// <summary>
        /// 三级平仓比例
        /// </summary>
        public double close_ratio_level_three
        {
            get { return _close_ratio_level_three; }

            set
            {
                _close_ratio_level_three = value;
                RaisePropertyChanged(() => close_ratio_level_three);
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

    public class rksecuL_4_39_Info : ObservableObject
    {
    }

    public class rksecuL_4_40_Info : ObservableObject
    {
    }

    public class rksecuL_4_41_Info : ObservableObject
    {

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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
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

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
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

        private int _lngsht_type;
        /// <summary>
        /// 多空类型
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
            }
        }

        private double _curr_qty;
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty
        {
            get { return _curr_qty; }

            set
            {
                _curr_qty = value;
                RaisePropertyChanged(() => curr_qty);
            }
        }

        private double _open_posi_price;
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price
        {
            get { return _open_posi_price; }

            set
            {
                _open_posi_price = value;
                RaisePropertyChanged(() => open_posi_price);
            }
        }

        private double _open_posi_value;
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value
        {
            get { return _open_posi_value; }

            set
            {
                _open_posi_value = value;
                RaisePropertyChanged(() => open_posi_value);
            }
        }

        private double _open_posi_fee;
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee
        {
            get { return _open_posi_fee; }

            set
            {
                _open_posi_fee = value;
                RaisePropertyChanged(() => open_posi_fee);
            }
        }

        private double _close_posi_qty;
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty
        {
            get { return _close_posi_qty; }

            set
            {
                _close_posi_qty = value;
                RaisePropertyChanged(() => close_posi_qty);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
            }
        }

        private double _close_posi_fee;
        /// <summary>
        /// 平仓费用
        /// </summary>
        public double close_posi_fee
        {
            get { return _close_posi_fee; }

            set
            {
                _close_posi_fee = value;
                RaisePropertyChanged(() => close_posi_fee);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _pandl_ratio;
        /// <summary>
        /// 盈亏比例
        /// </summary>
        public double pandl_ratio
        {
            get { return _pandl_ratio; }

            set
            {
                _pandl_ratio = value;
                RaisePropertyChanged(() => pandl_ratio);
            }
        }

        private double _un_close_posi_qty;
        /// <summary>
        /// 未平仓数量
        /// </summary>
        public double un_close_posi_qty
        {
            get { return _un_close_posi_qty; }

            set
            {
                _un_close_posi_qty = value;
                RaisePropertyChanged(() => un_close_posi_qty);
            }
        }

        private double _un_close_marke_value;
        /// <summary>
        /// 未平仓市值
        /// </summary>
        public double un_close_marke_value
        {
            get { return _un_close_marke_value; }

            set
            {
                _un_close_marke_value = value;
                RaisePropertyChanged(() => un_close_marke_value);
            }
        }

        private double _last_price;
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _cost_price;
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price
        {
            get { return _cost_price; }

            set
            {
                _cost_price = value;
                RaisePropertyChanged(() => cost_price);
            }
        }

        private double _last_tshold_value;
        /// <summary>
        /// 最新阈值
        /// </summary>
        public double last_tshold_value
        {
            get { return _last_tshold_value; }

            set
            {
                _last_tshold_value = value;
                RaisePropertyChanged(() => last_tshold_value);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
        /// </summary>
        public double float_pandl
        {
            get { return _float_pandl; }

            set
            {
                _float_pandl = value;
                RaisePropertyChanged(() => float_pandl);
            }
        }

        private String _moni_result_status;
        /// <summary>
        /// 监控结果状态
        /// </summary>
        public String moni_result_status
        {
            get { return _moni_result_status; }

            set
            {
                _moni_result_status = value;
                RaisePropertyChanged(() => moni_result_status);
            }
        }

        private double _opor_warn_tshold;
        /// <summary>
        /// 操作员预警阈值
        /// </summary>
        public double opor_warn_tshold
        {
            get { return _opor_warn_tshold; }

            set
            {
                _opor_warn_tshold = value;
                RaisePropertyChanged(() => opor_warn_tshold);
            }
        }

        private double _opor_stop_tshold;
        /// <summary>
        /// 操作员止损阈值
        /// </summary>
        public double opor_stop_tshold
        {
            get { return _opor_stop_tshold; }

            set
            {
                _opor_stop_tshold = value;
                RaisePropertyChanged(() => opor_stop_tshold);
            }
        }

        private double _stock_warn_ratio;
        /// <summary>
        /// 单券预警比例
        /// </summary>
        public double stock_warn_ratio
        {
            get { return _stock_warn_ratio; }

            set
            {
                _stock_warn_ratio = value;
                RaisePropertyChanged(() => stock_warn_ratio);
            }
        }

        private double _stock_stop_ratio;
        /// <summary>
        /// 单券止损比例
        /// </summary>
        public double stock_stop_ratio
        {
            get { return _stock_stop_ratio; }

            set
            {
                _stock_stop_ratio = value;
                RaisePropertyChanged(() => stock_stop_ratio);
            }
        }

        private double _stock_warn_amt;
        /// <summary>
        /// 单券预警金额
        /// </summary>
        public double stock_warn_amt
        {
            get { return _stock_warn_amt; }

            set
            {
                _stock_warn_amt = value;
                RaisePropertyChanged(() => stock_warn_amt);
            }
        }

        private double _stock_stop_amt;
        /// <summary>
        /// 单券止损金额
        /// </summary>
        public double stock_stop_amt
        {
            get { return _stock_stop_amt; }

            set
            {
                _stock_stop_amt = value;
                RaisePropertyChanged(() => stock_stop_amt);
            }
        }

        private int _open_close_permission;
        /// <summary>
        /// 开平仓权限
        /// </summary>
        public int open_close_permission
        {
            get { return _open_close_permission; }

            set
            {
                _open_close_permission = value;
                RaisePropertyChanged(() => open_close_permission);
            }
        }
    }

    public class rksecuL_4_42_Info : ObservableObject
    {

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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private double _curr_qty;
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty
        {
            get { return _curr_qty; }

            set
            {
                _curr_qty = value;
                RaisePropertyChanged(() => curr_qty);
            }
        }

        private double _open_posi_value;
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value
        {
            get { return _open_posi_value; }

            set
            {
                _open_posi_value = value;
                RaisePropertyChanged(() => open_posi_value);
            }
        }

        private double _open_posi_fee;
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee
        {
            get { return _open_posi_fee; }

            set
            {
                _open_posi_fee = value;
                RaisePropertyChanged(() => open_posi_fee);
            }
        }

        private double _close_posi_qty;
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty
        {
            get { return _close_posi_qty; }

            set
            {
                _close_posi_qty = value;
                RaisePropertyChanged(() => close_posi_qty);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
            }
        }

        private double _close_posi_fee;
        /// <summary>
        /// 平仓费用
        /// </summary>
        public double close_posi_fee
        {
            get { return _close_posi_fee; }

            set
            {
                _close_posi_fee = value;
                RaisePropertyChanged(() => close_posi_fee);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
        /// </summary>
        public double float_pandl
        {
            get { return _float_pandl; }

            set
            {
                _float_pandl = value;
                RaisePropertyChanged(() => float_pandl);
            }
        }

        private double _pandl_ratio;
        /// <summary>
        /// 盈亏比例
        /// </summary>
        public double pandl_ratio
        {
            get { return _pandl_ratio; }

            set
            {
                _pandl_ratio = value;
                RaisePropertyChanged(() => pandl_ratio);
            }
        }

        private double _un_close_posi_qty;
        /// <summary>
        /// 未平仓数量
        /// </summary>
        public double un_close_posi_qty
        {
            get { return _un_close_posi_qty; }

            set
            {
                _un_close_posi_qty = value;
                RaisePropertyChanged(() => un_close_posi_qty);
            }
        }

        private double _un_close_marke_value;
        /// <summary>
        /// 未平仓市值
        /// </summary>
        public double un_close_marke_value
        {
            get { return _un_close_marke_value; }

            set
            {
                _un_close_marke_value = value;
                RaisePropertyChanged(() => un_close_marke_value);
            }
        }

        private double _last_tshold_value;
        /// <summary>
        /// 最新阈值
        /// </summary>
        public double last_tshold_value
        {
            get { return _last_tshold_value; }

            set
            {
                _last_tshold_value = value;
                RaisePropertyChanged(() => last_tshold_value);
            }
        }

        private String _moni_result_status;
        /// <summary>
        /// 监控结果状态
        /// </summary>
        public String moni_result_status
        {
            get { return _moni_result_status; }

            set
            {
                _moni_result_status = value;
                RaisePropertyChanged(() => moni_result_status);
            }
        }

        private double _opor_warn_tshold;
        /// <summary>
        /// 操作员预警阈值
        /// </summary>
        public double opor_warn_tshold
        {
            get { return _opor_warn_tshold; }

            set
            {
                _opor_warn_tshold = value;
                RaisePropertyChanged(() => opor_warn_tshold);
            }
        }

        private double _opor_stop_tshold;
        /// <summary>
        /// 操作员止损阈值
        /// </summary>
        public double opor_stop_tshold
        {
            get { return _opor_stop_tshold; }

            set
            {
                _opor_stop_tshold = value;
                RaisePropertyChanged(() => opor_stop_tshold);
            }
        }

        private int _open_close_permission;
        /// <summary>
        /// 开平仓权限
        /// </summary>
        public int open_close_permission
        {
            get { return _open_close_permission; }

            set
            {
                _open_close_permission = value;
                RaisePropertyChanged(() => open_close_permission);
            }
        }
    }

    public class rksecuL_4_43_Info : ObservableObject
    {

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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
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

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
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

        private int _stock_code_no;
        /// <summary>
        /// 证券代码编号
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

        private int _lngsht_type;
        /// <summary>
        /// 多空类型
        /// </summary>
        public int lngsht_type
        {
            get { return _lngsht_type; }

            set
            {
                _lngsht_type = value;
                RaisePropertyChanged(() => lngsht_type);
            }
        }

        private double _curr_qty;
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty
        {
            get { return _curr_qty; }

            set
            {
                _curr_qty = value;
                RaisePropertyChanged(() => curr_qty);
            }
        }

        private double _open_posi_price;
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price
        {
            get { return _open_posi_price; }

            set
            {
                _open_posi_price = value;
                RaisePropertyChanged(() => open_posi_price);
            }
        }

        private double _open_posi_value;
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value
        {
            get { return _open_posi_value; }

            set
            {
                _open_posi_value = value;
                RaisePropertyChanged(() => open_posi_value);
            }
        }

        private double _open_posi_fee;
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee
        {
            get { return _open_posi_fee; }

            set
            {
                _open_posi_fee = value;
                RaisePropertyChanged(() => open_posi_fee);
            }
        }

        private double _close_posi_qty;
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty
        {
            get { return _close_posi_qty; }

            set
            {
                _close_posi_qty = value;
                RaisePropertyChanged(() => close_posi_qty);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
            }
        }

        private double _close_posi_fee;
        /// <summary>
        /// 平仓费用
        /// </summary>
        public double close_posi_fee
        {
            get { return _close_posi_fee; }

            set
            {
                _close_posi_fee = value;
                RaisePropertyChanged(() => close_posi_fee);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _pandl_ratio;
        /// <summary>
        /// 盈亏比例
        /// </summary>
        public double pandl_ratio
        {
            get { return _pandl_ratio; }

            set
            {
                _pandl_ratio = value;
                RaisePropertyChanged(() => pandl_ratio);
            }
        }

        private double _un_close_posi_qty;
        /// <summary>
        /// 未平仓数量
        /// </summary>
        public double un_close_posi_qty
        {
            get { return _un_close_posi_qty; }

            set
            {
                _un_close_posi_qty = value;
                RaisePropertyChanged(() => un_close_posi_qty);
            }
        }

        private double _un_close_marke_value;
        /// <summary>
        /// 未平仓市值
        /// </summary>
        public double un_close_marke_value
        {
            get { return _un_close_marke_value; }

            set
            {
                _un_close_marke_value = value;
                RaisePropertyChanged(() => un_close_marke_value);
            }
        }

        private double _last_price;
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price
        {
            get { return _last_price; }

            set
            {
                _last_price = value;
                RaisePropertyChanged(() => last_price);
            }
        }

        private double _cost_price;
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price
        {
            get { return _cost_price; }

            set
            {
                _cost_price = value;
                RaisePropertyChanged(() => cost_price);
            }
        }

        private double _last_tshold_value;
        /// <summary>
        /// 最新阈值
        /// </summary>
        public double last_tshold_value
        {
            get { return _last_tshold_value; }

            set
            {
                _last_tshold_value = value;
                RaisePropertyChanged(() => last_tshold_value);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
        /// </summary>
        public double float_pandl
        {
            get { return _float_pandl; }

            set
            {
                _float_pandl = value;
                RaisePropertyChanged(() => float_pandl);
            }
        }

        private String _moni_result_status;
        /// <summary>
        /// 监控结果状态
        /// </summary>
        public String moni_result_status
        {
            get { return _moni_result_status; }

            set
            {
                _moni_result_status = value;
                RaisePropertyChanged(() => moni_result_status);
            }
        }

        private double _opor_warn_tshold;
        /// <summary>
        /// 操作员预警阈值
        /// </summary>
        public double opor_warn_tshold
        {
            get { return _opor_warn_tshold; }

            set
            {
                _opor_warn_tshold = value;
                RaisePropertyChanged(() => opor_warn_tshold);
            }
        }

        private double _opor_stop_tshold;
        /// <summary>
        /// 操作员止损阈值
        /// </summary>
        public double opor_stop_tshold
        {
            get { return _opor_stop_tshold; }

            set
            {
                _opor_stop_tshold = value;
                RaisePropertyChanged(() => opor_stop_tshold);
            }
        }

        private double _stock_warn_ratio;
        /// <summary>
        /// 单券预警比例
        /// </summary>
        public double stock_warn_ratio
        {
            get { return _stock_warn_ratio; }

            set
            {
                _stock_warn_ratio = value;
                RaisePropertyChanged(() => stock_warn_ratio);
            }
        }

        private double _stock_stop_ratio;
        /// <summary>
        /// 单券止损比例
        /// </summary>
        public double stock_stop_ratio
        {
            get { return _stock_stop_ratio; }

            set
            {
                _stock_stop_ratio = value;
                RaisePropertyChanged(() => stock_stop_ratio);
            }
        }

        private double _stock_warn_amt;
        /// <summary>
        /// 单券预警金额
        /// </summary>
        public double stock_warn_amt
        {
            get { return _stock_warn_amt; }

            set
            {
                _stock_warn_amt = value;
                RaisePropertyChanged(() => stock_warn_amt);
            }
        }

        private double _stock_stop_amt;
        /// <summary>
        /// 单券止损金额
        /// </summary>
        public double stock_stop_amt
        {
            get { return _stock_stop_amt; }

            set
            {
                _stock_stop_amt = value;
                RaisePropertyChanged(() => stock_stop_amt);
            }
        }

        private int _open_close_permission;
        /// <summary>
        /// 开平仓权限
        /// </summary>
        public int open_close_permission
        {
            get { return _open_close_permission; }

            set
            {
                _open_close_permission = value;
                RaisePropertyChanged(() => open_close_permission);
            }
        }
    }

    public class rksecuL_4_44_Info : ObservableObject
    {

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

        private int _opor_no;
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no
        {
            get { return _opor_no; }

            set
            {
                _opor_no = value;
                RaisePropertyChanged(() => opor_no);
            }
        }

        private double _curr_qty;
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty
        {
            get { return _curr_qty; }

            set
            {
                _curr_qty = value;
                RaisePropertyChanged(() => curr_qty);
            }
        }

        private double _open_posi_value;
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value
        {
            get { return _open_posi_value; }

            set
            {
                _open_posi_value = value;
                RaisePropertyChanged(() => open_posi_value);
            }
        }

        private double _open_posi_fee;
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee
        {
            get { return _open_posi_fee; }

            set
            {
                _open_posi_fee = value;
                RaisePropertyChanged(() => open_posi_fee);
            }
        }

        private double _close_posi_qty;
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty
        {
            get { return _close_posi_qty; }

            set
            {
                _close_posi_qty = value;
                RaisePropertyChanged(() => close_posi_qty);
            }
        }

        private double _close_posi_market_value;
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value
        {
            get { return _close_posi_market_value; }

            set
            {
                _close_posi_market_value = value;
                RaisePropertyChanged(() => close_posi_market_value);
            }
        }

        private double _close_posi_fee;
        /// <summary>
        /// 平仓费用
        /// </summary>
        public double close_posi_fee
        {
            get { return _close_posi_fee; }

            set
            {
                _close_posi_fee = value;
                RaisePropertyChanged(() => close_posi_fee);
            }
        }

        private double _realize_pandl;
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl
        {
            get { return _realize_pandl; }

            set
            {
                _realize_pandl = value;
                RaisePropertyChanged(() => realize_pandl);
            }
        }

        private double _float_pandl;
        /// <summary>
        /// 浮动盈亏
        /// </summary>
        public double float_pandl
        {
            get { return _float_pandl; }

            set
            {
                _float_pandl = value;
                RaisePropertyChanged(() => float_pandl);
            }
        }

        private double _pandl_ratio;
        /// <summary>
        /// 盈亏比例
        /// </summary>
        public double pandl_ratio
        {
            get { return _pandl_ratio; }

            set
            {
                _pandl_ratio = value;
                RaisePropertyChanged(() => pandl_ratio);
            }
        }

        private double _un_close_posi_qty;
        /// <summary>
        /// 未平仓数量
        /// </summary>
        public double un_close_posi_qty
        {
            get { return _un_close_posi_qty; }

            set
            {
                _un_close_posi_qty = value;
                RaisePropertyChanged(() => un_close_posi_qty);
            }
        }

        private double _un_close_marke_value;
        /// <summary>
        /// 未平仓市值
        /// </summary>
        public double un_close_marke_value
        {
            get { return _un_close_marke_value; }

            set
            {
                _un_close_marke_value = value;
                RaisePropertyChanged(() => un_close_marke_value);
            }
        }

        private double _last_tshold_value;
        /// <summary>
        /// 最新阈值
        /// </summary>
        public double last_tshold_value
        {
            get { return _last_tshold_value; }

            set
            {
                _last_tshold_value = value;
                RaisePropertyChanged(() => last_tshold_value);
            }
        }

        private String _moni_result_status;
        /// <summary>
        /// 监控结果状态
        /// </summary>
        public String moni_result_status
        {
            get { return _moni_result_status; }

            set
            {
                _moni_result_status = value;
                RaisePropertyChanged(() => moni_result_status);
            }
        }

        private double _opor_warn_tshold;
        /// <summary>
        /// 操作员预警阈值
        /// </summary>
        public double opor_warn_tshold
        {
            get { return _opor_warn_tshold; }

            set
            {
                _opor_warn_tshold = value;
                RaisePropertyChanged(() => opor_warn_tshold);
            }
        }

        private double _opor_stop_tshold;
        /// <summary>
        /// 操作员止损阈值
        /// </summary>
        public double opor_stop_tshold
        {
            get { return _opor_stop_tshold; }

            set
            {
                _opor_stop_tshold = value;
                RaisePropertyChanged(() => opor_stop_tshold);
            }
        }

        private int _open_close_permission;
        /// <summary>
        /// 开平仓权限
        /// </summary>
        public int open_close_permission
        {
            get { return _open_close_permission; }

            set
            {
                _open_close_permission = value;
                RaisePropertyChanged(() => open_close_permission);
            }
        }
    }

    public class rksecuL_4_45_Info : ObservableObject
    {
    }

    public class rksecuL_4_51_Info : ObservableObject
    {
    }

    public class rksecuL_4_54_Info : ObservableObject
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

        private double _curr_converted_margin;
        /// <summary>
        /// 可用保证金
        /// </summary>
        public double curr_converted_margin
        {
            get { return _curr_converted_margin; }

            set
            {
                _curr_converted_margin = value;
                RaisePropertyChanged(() => curr_converted_margin);
            }
        }

        private double _cmmd_converted_margin;
        /// <summary>
        /// 指令可用保证金
        /// </summary>
        public double cmmd_converted_margin
        {
            get { return _cmmd_converted_margin; }

            set
            {
                _cmmd_converted_margin = value;
                RaisePropertyChanged(() => cmmd_converted_margin);
            }
        }

        private double _order_converted_margin;
        /// <summary>
        /// 订单可用保证金
        /// </summary>
        public double order_converted_margin
        {
            get { return _order_converted_margin; }

            set
            {
                _order_converted_margin = value;
                RaisePropertyChanged(() => order_converted_margin);
            }
        }

        private double _fina_market_value;
        /// <summary>
        /// 融资证券市值
        /// </summary>
        public double fina_market_value
        {
            get { return _fina_market_value; }

            set
            {
                _fina_market_value = value;
                RaisePropertyChanged(() => fina_market_value);
            }
        }

        private double _fina_profit;
        /// <summary>
        /// 融资盈亏
        /// </summary>
        public double fina_profit
        {
            get { return _fina_profit; }

            set
            {
                _fina_profit = value;
                RaisePropertyChanged(() => fina_profit);
            }
        }

        private double _fina_converted_pandl;
        /// <summary>
        /// 融资折算盈亏
        /// </summary>
        public double fina_converted_pandl
        {
            get { return _fina_converted_pandl; }

            set
            {
                _fina_converted_pandl = value;
                RaisePropertyChanged(() => fina_converted_pandl);
            }
        }

        private double _loan_market_value;
        /// <summary>
        /// 融券证券市值
        /// </summary>
        public double loan_market_value
        {
            get { return _loan_market_value; }

            set
            {
                _loan_market_value = value;
                RaisePropertyChanged(() => loan_market_value);
            }
        }

        private double _loan_profit;
        /// <summary>
        /// 融券盈亏
        /// </summary>
        public double loan_profit
        {
            get { return _loan_profit; }

            set
            {
                _loan_profit = value;
                RaisePropertyChanged(() => loan_profit);
            }
        }

        private double _loan_converted_pandl;
        /// <summary>
        /// 融券折算盈亏
        /// </summary>
        public double loan_converted_pandl
        {
            get { return _loan_converted_pandl; }

            set
            {
                _loan_converted_pandl = value;
                RaisePropertyChanged(() => loan_converted_pandl);
            }
        }

        private double _fina_capt_margin;
        /// <summary>
        /// 融资占用保证金
        /// </summary>
        public double fina_capt_margin
        {
            get { return _fina_capt_margin; }

            set
            {
                _fina_capt_margin = value;
                RaisePropertyChanged(() => fina_capt_margin);
            }
        }

        private double _loan_capt_margin;
        /// <summary>
        /// 融券占用保证金
        /// </summary>
        public double loan_capt_margin
        {
            get { return _loan_capt_margin; }

            set
            {
                _loan_capt_margin = value;
                RaisePropertyChanged(() => loan_capt_margin);
            }
        }

        private double _keep_guarantee_ratio;
        /// <summary>
        /// 维持担保比例
        /// </summary>
        public double keep_guarantee_ratio
        {
            get { return _keep_guarantee_ratio; }

            set
            {
                _keep_guarantee_ratio = value;
                RaisePropertyChanged(() => keep_guarantee_ratio);
            }
        }

        private double _loan_sell_amt;
        /// <summary>
        /// 融券卖出金额
        /// </summary>
        public double loan_sell_amt
        {
            get { return _loan_sell_amt; }

            set
            {
                _loan_sell_amt = value;
                RaisePropertyChanged(() => loan_sell_amt);
            }
        }

        private double _margin_ratio_market_value;
        /// <summary>
        /// 冲抵证券折算市值
        /// </summary>
        public double margin_ratio_market_value
        {
            get { return _margin_ratio_market_value; }

            set
            {
                _margin_ratio_market_value = value;
                RaisePropertyChanged(() => margin_ratio_market_value);
            }
        }

        private double _fina_interest;
        /// <summary>
        /// 融资利息
        /// </summary>
        public double fina_interest
        {
            get { return _fina_interest; }

            set
            {
                _fina_interest = value;
                RaisePropertyChanged(() => fina_interest);
            }
        }

        private double _loan_interest;
        /// <summary>
        /// 融券利息
        /// </summary>
        public double loan_interest
        {
            get { return _loan_interest; }

            set
            {
                _loan_interest = value;
                RaisePropertyChanged(() => loan_interest);
            }
        }

        private int _update_times;
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times
        {
            get { return _update_times; }

            set
            {
                _update_times = value;
                RaisePropertyChanged(() => update_times);
            }
        }
    }

    public class rksecuL_4_61_Info : ObservableObject
    {
    }

    public class rksecuL_4_64_Info : ObservableObject
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

        private int _exch_group_no;
        /// <summary>
        /// 交易组编号
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

        private double _curr_converted_margin;
        /// <summary>
        /// 可用保证金
        /// </summary>
        public double curr_converted_margin
        {
            get { return _curr_converted_margin; }

            set
            {
                _curr_converted_margin = value;
                RaisePropertyChanged(() => curr_converted_margin);
            }
        }

        private double _cmmd_converted_margin;
        /// <summary>
        /// 指令可用保证金
        /// </summary>
        public double cmmd_converted_margin
        {
            get { return _cmmd_converted_margin; }

            set
            {
                _cmmd_converted_margin = value;
                RaisePropertyChanged(() => cmmd_converted_margin);
            }
        }

        private double _order_converted_margin;
        /// <summary>
        /// 订单可用保证金
        /// </summary>
        public double order_converted_margin
        {
            get { return _order_converted_margin; }

            set
            {
                _order_converted_margin = value;
                RaisePropertyChanged(() => order_converted_margin);
            }
        }

        private double _fina_market_value;
        /// <summary>
        /// 融资证券市值
        /// </summary>
        public double fina_market_value
        {
            get { return _fina_market_value; }

            set
            {
                _fina_market_value = value;
                RaisePropertyChanged(() => fina_market_value);
            }
        }

        private double _fina_profit;
        /// <summary>
        /// 融资盈亏
        /// </summary>
        public double fina_profit
        {
            get { return _fina_profit; }

            set
            {
                _fina_profit = value;
                RaisePropertyChanged(() => fina_profit);
            }
        }

        private double _fina_converted_pandl;
        /// <summary>
        /// 融资折算盈亏
        /// </summary>
        public double fina_converted_pandl
        {
            get { return _fina_converted_pandl; }

            set
            {
                _fina_converted_pandl = value;
                RaisePropertyChanged(() => fina_converted_pandl);
            }
        }

        private double _loan_market_value;
        /// <summary>
        /// 融券证券市值
        /// </summary>
        public double loan_market_value
        {
            get { return _loan_market_value; }

            set
            {
                _loan_market_value = value;
                RaisePropertyChanged(() => loan_market_value);
            }
        }

        private double _loan_profit;
        /// <summary>
        /// 融券盈亏
        /// </summary>
        public double loan_profit
        {
            get { return _loan_profit; }

            set
            {
                _loan_profit = value;
                RaisePropertyChanged(() => loan_profit);
            }
        }

        private double _loan_converted_pandl;
        /// <summary>
        /// 融券折算盈亏
        /// </summary>
        public double loan_converted_pandl
        {
            get { return _loan_converted_pandl; }

            set
            {
                _loan_converted_pandl = value;
                RaisePropertyChanged(() => loan_converted_pandl);
            }
        }

        private double _fina_capt_margin;
        /// <summary>
        /// 融资占用保证金
        /// </summary>
        public double fina_capt_margin
        {
            get { return _fina_capt_margin; }

            set
            {
                _fina_capt_margin = value;
                RaisePropertyChanged(() => fina_capt_margin);
            }
        }

        private double _loan_capt_margin;
        /// <summary>
        /// 融券占用保证金
        /// </summary>
        public double loan_capt_margin
        {
            get { return _loan_capt_margin; }

            set
            {
                _loan_capt_margin = value;
                RaisePropertyChanged(() => loan_capt_margin);
            }
        }

        private double _keep_guarantee_ratio;
        /// <summary>
        /// 维持担保比例
        /// </summary>
        public double keep_guarantee_ratio
        {
            get { return _keep_guarantee_ratio; }

            set
            {
                _keep_guarantee_ratio = value;
                RaisePropertyChanged(() => keep_guarantee_ratio);
            }
        }

        private double _loan_sell_amt;
        /// <summary>
        /// 融券卖出金额
        /// </summary>
        public double loan_sell_amt
        {
            get { return _loan_sell_amt; }

            set
            {
                _loan_sell_amt = value;
                RaisePropertyChanged(() => loan_sell_amt);
            }
        }

        private double _margin_ratio_market_value;
        /// <summary>
        /// 冲抵证券折算市值
        /// </summary>
        public double margin_ratio_market_value
        {
            get { return _margin_ratio_market_value; }

            set
            {
                _margin_ratio_market_value = value;
                RaisePropertyChanged(() => margin_ratio_market_value);
            }
        }

        private double _fina_interest;
        /// <summary>
        /// 融资利息
        /// </summary>
        public double fina_interest
        {
            get { return _fina_interest; }

            set
            {
                _fina_interest = value;
                RaisePropertyChanged(() => fina_interest);
            }
        }

        private double _loan_interest;
        /// <summary>
        /// 融券利息
        /// </summary>
        public double loan_interest
        {
            get { return _loan_interest; }

            set
            {
                _loan_interest = value;
                RaisePropertyChanged(() => loan_interest);
            }
        }

        private int _update_times;
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times
        {
            get { return _update_times; }

            set
            {
                _update_times = value;
                RaisePropertyChanged(() => update_times);
            }
        }
    }

    public class rksecuL_4_65_Info : ObservableObject
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

        private String _pd_no_str;
        /// <summary>
        /// 产品编号串
        /// </summary>
        public String pd_no_str
        {
            get { return _pd_no_str; }

            set
            {
                _pd_no_str = value;
                RaisePropertyChanged(() => pd_no_str);
            }
        }

        private String _exch_group_no_str;
        /// <summary>
        /// 交易组编号串
        /// </summary>
        public String exch_group_no_str
        {
            get { return _exch_group_no_str; }

            set
            {
                _exch_group_no_str = value;
                RaisePropertyChanged(() => exch_group_no_str);
            }
        }

        private int _moni_role_type;
        /// <summary>
        /// 监控角色
        /// </summary>
        public int moni_role_type
        {
            get { return _moni_role_type; }

            set
            {
                _moni_role_type = value;
                RaisePropertyChanged(() => moni_role_type);
            }
        }

        private int _moni_value_flag;
        /// <summary>
        /// 监控值方式
        /// </summary>
        public int moni_value_flag
        {
            get { return _moni_value_flag; }

            set
            {
                _moni_value_flag = value;
                RaisePropertyChanged(() => moni_value_flag);
            }
        }

        private int _moni_value_type;
        /// <summary>
        /// 监控值类型
        /// </summary>
        public int moni_value_type
        {
            get { return _moni_value_type; }

            set
            {
                _moni_value_type = value;
                RaisePropertyChanged(() => moni_value_type);
            }
        }

        private double _warn_posi_value;
        /// <summary>
        /// 预警线
        /// </summary>
        public double warn_posi_value
        {
            get { return _warn_posi_value; }

            set
            {
                _warn_posi_value = value;
                RaisePropertyChanged(() => warn_posi_value);
            }
        }

        private int _warn_trig_oper_type;
        /// <summary>
        /// 预警触警操作方式
        /// </summary>
        public int warn_trig_oper_type
        {
            get { return _warn_trig_oper_type; }

            set
            {
                _warn_trig_oper_type = value;
                RaisePropertyChanged(() => warn_trig_oper_type);
            }
        }

        private double _close_posi_value;
        /// <summary>
        /// 平仓线
        /// </summary>
        public double close_posi_value
        {
            get { return _close_posi_value; }

            set
            {
                _close_posi_value = value;
                RaisePropertyChanged(() => close_posi_value);
            }
        }

        private int _close_trig_oper_type;
        /// <summary>
        /// 平仓触警操作方式
        /// </summary>
        public int close_trig_oper_type
        {
            get { return _close_trig_oper_type; }

            set
            {
                _close_trig_oper_type = value;
                RaisePropertyChanged(() => close_trig_oper_type);
            }
        }

        private double _appd_value;
        /// <summary>
        /// 追加线
        /// </summary>
        public double appd_value
        {
            get { return _appd_value; }

            set
            {
                _appd_value = value;
                RaisePropertyChanged(() => appd_value);
            }
        }

        private int _appd_trig_oper_type;
        /// <summary>
        /// 追加触警操作方式
        /// </summary>
        public int appd_trig_oper_type
        {
            get { return _appd_trig_oper_type; }

            set
            {
                _appd_trig_oper_type = value;
                RaisePropertyChanged(() => appd_trig_oper_type);
            }
        }

        private int _begin_moni_date;
        /// <summary>
        /// 起始监控日期
        /// </summary>
        public int begin_moni_date
        {
            get { return _begin_moni_date; }

            set
            {
                _begin_moni_date = value;
                RaisePropertyChanged(() => begin_moni_date);
            }
        }

        private double _begin_moni_value;
        /// <summary>
        /// 起始监控值
        /// </summary>
        public double begin_moni_value
        {
            get { return _begin_moni_value; }

            set
            {
                _begin_moni_value = value;
                RaisePropertyChanged(() => begin_moni_value);
            }
        }

        private double _max_moni_value;
        /// <summary>
        /// 最大监控值
        /// </summary>
        public double max_moni_value
        {
            get { return _max_moni_value; }

            set
            {
                _max_moni_value = value;
                RaisePropertyChanged(() => max_moni_value);
            }
        }

        private double _curr_moni_value;
        /// <summary>
        /// 当前监控值
        /// </summary>
        public double curr_moni_value
        {
            get { return _curr_moni_value; }

            set
            {
                _curr_moni_value = value;
                RaisePropertyChanged(() => curr_moni_value);
            }
        }

        private double _curr_result_moni_value;
        /// <summary>
        /// 当前监控结果
        /// </summary>
        public double curr_result_moni_value
        {
            get { return _curr_result_moni_value; }

            set
            {
                _curr_result_moni_value = value;
                RaisePropertyChanged(() => curr_result_moni_value);
            }
        }

        private String _contrs_stock_code;
        /// <summary>
        /// 对比证券代码
        /// </summary>
        public String contrs_stock_code
        {
            get { return _contrs_stock_code; }

            set
            {
                _contrs_stock_code = value;
                RaisePropertyChanged(() => contrs_stock_code);
            }
        }

        private int _contrs_exch_no;
        /// <summary>
        /// 对比市场编号
        /// </summary>
        public int contrs_exch_no
        {
            get { return _contrs_exch_no; }

            set
            {
                _contrs_exch_no = value;
                RaisePropertyChanged(() => contrs_exch_no);
            }
        }

        private double _contrs_max_moni_value;
        /// <summary>
        /// 对比最大监控值
        /// </summary>
        public double contrs_max_moni_value
        {
            get { return _contrs_max_moni_value; }

            set
            {
                _contrs_max_moni_value = value;
                RaisePropertyChanged(() => contrs_max_moni_value);
            }
        }

        private double _contrs_curr_moni_value;
        /// <summary>
        /// 对比当前监控值
        /// </summary>
        public double contrs_curr_moni_value
        {
            get { return _contrs_curr_moni_value; }

            set
            {
                _contrs_curr_moni_value = value;
                RaisePropertyChanged(() => contrs_curr_moni_value);
            }
        }

        private double _contrs_result_moni_value;
        /// <summary>
        /// 对比监控结果
        /// </summary>
        public double contrs_result_moni_value
        {
            get { return _contrs_result_moni_value; }

            set
            {
                _contrs_result_moni_value = value;
                RaisePropertyChanged(() => contrs_result_moni_value);
            }
        }

        private double _moni_result_value;
        /// <summary>
        /// 监控结果
        /// </summary>
        public double moni_result_value
        {
            get { return _moni_result_value; }

            set
            {
                _moni_result_value = value;
                RaisePropertyChanged(() => moni_result_value);
            }
        }

        private String _moni_result_status;
        /// <summary>
        /// 监控结果状态
        /// </summary>
        public String moni_result_status
        {
            get { return _moni_result_status; }

            set
            {
                _moni_result_status = value;
                RaisePropertyChanged(() => moni_result_status);
            }
        }

        private String _moni_set_status;
        /// <summary>
        /// 监控设置状态
        /// </summary>
        public String moni_set_status
        {
            get { return _moni_set_status; }

            set
            {
                _moni_set_status = value;
                RaisePropertyChanged(() => moni_set_status);
            }
        }

        private double _cash_asset;
        /// <summary>
        /// 现金资产
        /// </summary>
        public double cash_asset
        {
            get { return _cash_asset; }

            set
            {
                _cash_asset = value;
                RaisePropertyChanged(() => cash_asset);
            }
        }

        private double _fund_asset;
        /// <summary>
        /// 基金资产
        /// </summary>
        public double fund_asset
        {
            get { return _fund_asset; }

            set
            {
                _fund_asset = value;
                RaisePropertyChanged(() => fund_asset);
            }
        }

        private double _bond_asset;
        /// <summary>
        /// 债券资产
        /// </summary>
        public double bond_asset
        {
            get { return _bond_asset; }

            set
            {
                _bond_asset = value;
                RaisePropertyChanged(() => bond_asset);
            }
        }

        private double _stock_asset;
        /// <summary>
        /// 股票资产
        /// </summary>
        public double stock_asset
        {
            get { return _stock_asset; }

            set
            {
                _stock_asset = value;
                RaisePropertyChanged(() => stock_asset);
            }
        }

        private double _repo_asset;
        /// <summary>
        /// 回购资产
        /// </summary>
        public double repo_asset
        {
            get { return _repo_asset; }

            set
            {
                _repo_asset = value;
                RaisePropertyChanged(() => repo_asset);
            }
        }

        private double _nav_asset;
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset
        {
            get { return _nav_asset; }

            set
            {
                _nav_asset = value;
                RaisePropertyChanged(() => nav_asset);
            }
        }

        private double _stock_asset_ratio;
        /// <summary>
        /// 股票资产占比
        /// </summary>
        public double stock_asset_ratio
        {
            get { return _stock_asset_ratio; }

            set
            {
                _stock_asset_ratio = value;
                RaisePropertyChanged(() => stock_asset_ratio);
            }
        }

        private int _close_posi_flag;
        /// <summary>
        /// 平仓方式
        /// </summary>
        public int close_posi_flag
        {
            get { return _close_posi_flag; }

            set
            {
                _close_posi_flag = value;
                RaisePropertyChanged(() => close_posi_flag);
            }
        }

        private double _close_ratio_level_one;
        /// <summary>
        /// 一级平仓比例
        /// </summary>
        public double close_ratio_level_one
        {
            get { return _close_ratio_level_one; }

            set
            {
                _close_ratio_level_one = value;
                RaisePropertyChanged(() => close_ratio_level_one);
            }
        }

        private double _close_ratio_level_two;
        /// <summary>
        /// 二级平仓比例
        /// </summary>
        public double close_ratio_level_two
        {
            get { return _close_ratio_level_two; }

            set
            {
                _close_ratio_level_two = value;
                RaisePropertyChanged(() => close_ratio_level_two);
            }
        }

        private double _close_ratio_level_three;
        /// <summary>
        /// 三级平仓比例
        /// </summary>
        public double close_ratio_level_three
        {
            get { return _close_ratio_level_three; }

            set
            {
                _close_ratio_level_three = value;
                RaisePropertyChanged(() => close_ratio_level_three);
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

        private double _pd_share;
        /// <summary>
        /// 产品份额
        /// </summary>
        public double pd_share
        {
            get { return _pd_share; }

            set
            {
                _pd_share = value;
                RaisePropertyChanged(() => pd_share);
            }
        }

        private double _begin_asset_value;
        /// <summary>
        /// 期初资产值
        /// </summary>
        public double begin_asset_value
        {
            get { return _begin_asset_value; }

            set
            {
                _begin_asset_value = value;
                RaisePropertyChanged(() => begin_asset_value);
            }
        }

        private double _hk_thrgh_stock_asset;
        /// <summary>
        /// 港股通资产
        /// </summary>
        public double hk_thrgh_stock_asset
        {
            get { return _hk_thrgh_stock_asset; }

            set
            {
                _hk_thrgh_stock_asset = value;
                RaisePropertyChanged(() => hk_thrgh_stock_asset);
            }
        }
    }

    public class rksecuL_4_66_Info : ObservableObject
    {
    }

    public class rksecuL_4_67_Info : ObservableObject
    {
    }

    public class rksecuL_4_68_Info : ObservableObject
    {

        private ulong _compli_trig_id;
        /// <summary>
        /// 合规触警序号
        /// </summary>
        public ulong compli_trig_id
        {
            get { return _compli_trig_id; }

            set
            {
                _compli_trig_id = value;
                RaisePropertyChanged(() => compli_trig_id);
            }
        }
    }

    public class rksecuL_4_69_Info : ObservableObject
    {
    }

}
