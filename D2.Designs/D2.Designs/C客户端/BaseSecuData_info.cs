using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pubL_1_6_Info : ObservableObject
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

        private String _stock_code_feature;
        /// <summary>
        /// 证券代码特征
        /// </summary>
        public String stock_code_feature
        {
            get { return _stock_code_feature; }

            set
            {
                _stock_code_feature = value;
                RaisePropertyChanged(() => stock_code_feature);
            }
        }

        private String _stock_name_feature;
        /// <summary>
        /// 证券名称特征
        /// </summary>
        public String stock_name_feature
        {
            get { return _stock_name_feature; }

            set
            {
                _stock_name_feature = value;
                RaisePropertyChanged(() => stock_name_feature);
            }
        }

        private int _stock_type;
        /// <summary>
        /// 证券类型
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
    }

    public class pubL_1_12_Info : ObservableObject
    {
    }

    public class pubL_1_14_Info : ObservableObject
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

        private int _stock_type;
        /// <summary>
        /// 证券类型
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

        private String _stock_type_name;
        /// <summary>
        /// 证券类型简称
        /// </summary>
        public String stock_type_name
        {
            get { return _stock_type_name; }

            set
            {
                _stock_type_name = value;
                RaisePropertyChanged(() => stock_type_name);
            }
        }

        private int _asset_type;
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type
        {
            get { return _asset_type; }

            set
            {
                _asset_type = value;
                RaisePropertyChanged(() => asset_type);
            }
        }

        private double _par_value;
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value
        {
            get { return _par_value; }

            set
            {
                _par_value = value;
                RaisePropertyChanged(() => par_value);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
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

        private String _exch_crncy_type;
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type
        {
            get { return _exch_crncy_type; }

            set
            {
                _exch_crncy_type = value;
                RaisePropertyChanged(() => exch_crncy_type);
            }
        }

        private int _capit_reback_days;
        /// <summary>
        /// 资金回转天数
        /// </summary>
        public int capit_reback_days
        {
            get { return _capit_reback_days; }

            set
            {
                _capit_reback_days = value;
                RaisePropertyChanged(() => capit_reback_days);
            }
        }

        private int _posi_reback_days;
        /// <summary>
        /// 持仓回转天数
        /// </summary>
        public int posi_reback_days
        {
            get { return _posi_reback_days; }

            set
            {
                _posi_reback_days = value;
                RaisePropertyChanged(() => posi_reback_days);
            }
        }

        private int _type_unit;
        /// <summary>
        /// 类型单位
        /// </summary>
        public int type_unit
        {
            get { return _type_unit; }

            set
            {
                _type_unit = value;
                RaisePropertyChanged(() => type_unit);
            }
        }

        private int _report_unit;
        /// <summary>
        /// 申报单位
        /// </summary>
        public int report_unit
        {
            get { return _report_unit; }

            set
            {
                _report_unit = value;
                RaisePropertyChanged(() => report_unit);
            }
        }

        private int _min_unit;
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit
        {
            get { return _min_unit; }

            set
            {
                _min_unit = value;
                RaisePropertyChanged(() => min_unit);
            }
        }

        private double _max_qty;
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty
        {
            get { return _max_qty; }

            set
            {
                _max_qty = value;
                RaisePropertyChanged(() => max_qty);
            }
        }

        private double _min_qty;
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty
        {
            get { return _min_qty; }

            set
            {
                _min_qty = value;
                RaisePropertyChanged(() => min_qty);
            }
        }

        private int _is_order_dir_flag;
        /// <summary>
        /// 区分订单方向标志
        /// </summary>
        public int is_order_dir_flag
        {
            get { return _is_order_dir_flag; }

            set
            {
                _is_order_dir_flag = value;
                RaisePropertyChanged(() => is_order_dir_flag);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class pubL_1_15_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private int _stock_type;
        /// <summary>
        /// 证券类型
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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_16_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private int _stock_type;
        /// <summary>
        /// 证券类型
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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_24_Info : ObservableObject
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

        private int _stock_type;
        /// <summary>
        /// 证券类型
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

        private int _cash_frozen_type;
        /// <summary>
        /// 资金冻结方式
        /// </summary>
        public int cash_frozen_type
        {
            get { return _cash_frozen_type; }

            set
            {
                _cash_frozen_type = value;
                RaisePropertyChanged(() => cash_frozen_type);
            }
        }

        private int _order_split_flag;
        /// <summary>
        /// 订单数量拆分标志
        /// </summary>
        public int order_split_flag
        {
            get { return _order_split_flag; }

            set
            {
                _order_split_flag = value;
                RaisePropertyChanged(() => order_split_flag);
            }
        }

        private int _min_unit;
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit
        {
            get { return _min_unit; }

            set
            {
                _min_unit = value;
                RaisePropertyChanged(() => min_unit);
            }
        }

        private double _min_qty;
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty
        {
            get { return _min_qty; }

            set
            {
                _min_qty = value;
                RaisePropertyChanged(() => min_qty);
            }
        }

        private double _max_qty;
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty
        {
            get { return _max_qty; }

            set
            {
                _max_qty = value;
                RaisePropertyChanged(() => max_qty);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class pubL_1_41_Info : ObservableObject
    {

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

    public class pubL_1_42_Info : ObservableObject
    {
    }

    public class pubL_1_43_Info : ObservableObject
    {

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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private String _pinyin_short;
        /// <summary>
        /// 拼音简称
        /// </summary>
        public String pinyin_short
        {
            get { return _pinyin_short; }

            set
            {
                _pinyin_short = value;
                RaisePropertyChanged(() => pinyin_short);
            }
        }
    }

    public class pubL_1_44_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private String _pinyin_short;
        /// <summary>
        /// 拼音简称
        /// </summary>
        public String pinyin_short
        {
            get { return _pinyin_short; }

            set
            {
                _pinyin_short = value;
                RaisePropertyChanged(() => pinyin_short);
            }
        }

        private int _stock_type;
        /// <summary>
        /// 证券类型
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

        private int _asset_type;
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type
        {
            get { return _asset_type; }

            set
            {
                _asset_type = value;
                RaisePropertyChanged(() => asset_type);
            }
        }

        private double _par_value;
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value
        {
            get { return _par_value; }

            set
            {
                _par_value = value;
                RaisePropertyChanged(() => par_value);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
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

        private String _exch_crncy_type;
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type
        {
            get { return _exch_crncy_type; }

            set
            {
                _exch_crncy_type = value;
                RaisePropertyChanged(() => exch_crncy_type);
            }
        }

        private double _total_stock_issue;
        /// <summary>
        /// 总股本
        /// </summary>
        public double total_stock_issue
        {
            get { return _total_stock_issue; }

            set
            {
                _total_stock_issue = value;
                RaisePropertyChanged(() => total_stock_issue);
            }
        }

        private double _circl_stock_capit;
        /// <summary>
        /// 流通股本
        /// </summary>
        public double circl_stock_capit
        {
            get { return _circl_stock_capit; }

            set
            {
                _circl_stock_capit = value;
                RaisePropertyChanged(() => circl_stock_capit);
            }
        }

        private int _capit_reback_days;
        /// <summary>
        /// 资金回转天数
        /// </summary>
        public int capit_reback_days
        {
            get { return _capit_reback_days; }

            set
            {
                _capit_reback_days = value;
                RaisePropertyChanged(() => capit_reback_days);
            }
        }

        private int _posi_reback_days;
        /// <summary>
        /// 持仓回转天数
        /// </summary>
        public int posi_reback_days
        {
            get { return _posi_reback_days; }

            set
            {
                _posi_reback_days = value;
                RaisePropertyChanged(() => posi_reback_days);
            }
        }

        private int _type_unit;
        /// <summary>
        /// 类型单位
        /// </summary>
        public int type_unit
        {
            get { return _type_unit; }

            set
            {
                _type_unit = value;
                RaisePropertyChanged(() => type_unit);
            }
        }

        private int _report_unit;
        /// <summary>
        /// 申报单位
        /// </summary>
        public int report_unit
        {
            get { return _report_unit; }

            set
            {
                _report_unit = value;
                RaisePropertyChanged(() => report_unit);
            }
        }

        private int _min_unit;
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit
        {
            get { return _min_unit; }

            set
            {
                _min_unit = value;
                RaisePropertyChanged(() => min_unit);
            }
        }

        private double _max_qty;
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty
        {
            get { return _max_qty; }

            set
            {
                _max_qty = value;
                RaisePropertyChanged(() => max_qty);
            }
        }

        private double _min_qty;
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty
        {
            get { return _min_qty; }

            set
            {
                _min_qty = value;
                RaisePropertyChanged(() => min_qty);
            }
        }

        private int _is_order_dir_flag;
        /// <summary>
        /// 区分订单方向标志
        /// </summary>
        public int is_order_dir_flag
        {
            get { return _is_order_dir_flag; }

            set
            {
                _is_order_dir_flag = value;
                RaisePropertyChanged(() => is_order_dir_flag);
            }
        }

        private double _price_up;
        /// <summary>
        /// 价格上限
        /// </summary>
        public double price_up
        {
            get { return _price_up; }

            set
            {
                _price_up = value;
                RaisePropertyChanged(() => price_up);
            }
        }

        private double _price_down;
        /// <summary>
        /// 价格下限
        /// </summary>
        public double price_down
        {
            get { return _price_down; }

            set
            {
                _price_down = value;
                RaisePropertyChanged(() => price_down);
            }
        }

        private double _step_price;
        /// <summary>
        /// 最小价差
        /// </summary>
        public double step_price
        {
            get { return _step_price; }

            set
            {
                _step_price = value;
                RaisePropertyChanged(() => step_price);
            }
        }

        private double _fair_price;
        /// <summary>
        /// 公允价格
        /// </summary>
        public double fair_price
        {
            get { return _fair_price; }

            set
            {
                _fair_price = value;
                RaisePropertyChanged(() => fair_price);
            }
        }

        private String _stop_status;
        /// <summary>
        /// 停牌标志
        /// </summary>
        public String stop_status
        {
            get { return _stop_status; }

            set
            {
                _stop_status = value;
                RaisePropertyChanged(() => stop_status);
            }
        }

        private int _hk_stock_flag;
        /// <summary>
        /// 港股通标的
        /// </summary>
        public int hk_stock_flag
        {
            get { return _hk_stock_flag; }

            set
            {
                _hk_stock_flag = value;
                RaisePropertyChanged(() => hk_stock_flag);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class pubL_1_45_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_46_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_47_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private int _stock_type;
        /// <summary>
        /// 证券类型
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

        private int _asset_type;
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type
        {
            get { return _asset_type; }

            set
            {
                _asset_type = value;
                RaisePropertyChanged(() => asset_type);
            }
        }

        private int _hk_stock_flag;
        /// <summary>
        /// 港股通标的
        /// </summary>
        public int hk_stock_flag
        {
            get { return _hk_stock_flag; }

            set
            {
                _hk_stock_flag = value;
                RaisePropertyChanged(() => hk_stock_flag);
            }
        }
    }

    public class pubL_1_49_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private String _pinyin_short;
        /// <summary>
        /// 拼音简称
        /// </summary>
        public String pinyin_short
        {
            get { return _pinyin_short; }

            set
            {
                _pinyin_short = value;
                RaisePropertyChanged(() => pinyin_short);
            }
        }

        private int _stock_type;
        /// <summary>
        /// 证券类型
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

        private int _asset_type;
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type
        {
            get { return _asset_type; }

            set
            {
                _asset_type = value;
                RaisePropertyChanged(() => asset_type);
            }
        }

        private String _crncy_type;
        /// <summary>
        /// 本币币种
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

        private int _capit_reback_days;
        /// <summary>
        /// 资金回转天数
        /// </summary>
        public int capit_reback_days
        {
            get { return _capit_reback_days; }

            set
            {
                _capit_reback_days = value;
                RaisePropertyChanged(() => capit_reback_days);
            }
        }

        private int _posi_reback_days;
        /// <summary>
        /// 持仓回转天数
        /// </summary>
        public int posi_reback_days
        {
            get { return _posi_reback_days; }

            set
            {
                _posi_reback_days = value;
                RaisePropertyChanged(() => posi_reback_days);
            }
        }

        private int _min_unit;
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit
        {
            get { return _min_unit; }

            set
            {
                _min_unit = value;
                RaisePropertyChanged(() => min_unit);
            }
        }

        private double _max_qty;
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty
        {
            get { return _max_qty; }

            set
            {
                _max_qty = value;
                RaisePropertyChanged(() => max_qty);
            }
        }

        private double _min_qty;
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty
        {
            get { return _min_qty; }

            set
            {
                _min_qty = value;
                RaisePropertyChanged(() => min_qty);
            }
        }

        private double _step_price;
        /// <summary>
        /// 最小价差
        /// </summary>
        public double step_price
        {
            get { return _step_price; }

            set
            {
                _step_price = value;
                RaisePropertyChanged(() => step_price);
            }
        }

        private String _stop_status;
        /// <summary>
        /// 停牌标志
        /// </summary>
        public String stop_status
        {
            get { return _stop_status; }

            set
            {
                _stop_status = value;
                RaisePropertyChanged(() => stop_status);
            }
        }

        private int _hk_stock_flag;
        /// <summary>
        /// 港股通标的
        /// </summary>
        public int hk_stock_flag
        {
            get { return _hk_stock_flag; }

            set
            {
                _hk_stock_flag = value;
                RaisePropertyChanged(() => hk_stock_flag);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class pubL_1_51_Info : ObservableObject
    {
    }

    public class pubL_1_52_Info : ObservableObject
    {
    }

    public class pubL_1_53_Info : ObservableObject
    {
    }

    public class pubL_1_54_Info : ObservableObject
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

        private int _cash_frozen_type;
        /// <summary>
        /// 资金冻结方式
        /// </summary>
        public int cash_frozen_type
        {
            get { return _cash_frozen_type; }

            set
            {
                _cash_frozen_type = value;
                RaisePropertyChanged(() => cash_frozen_type);
            }
        }

        private int _order_split_flag;
        /// <summary>
        /// 订单数量拆分标志
        /// </summary>
        public int order_split_flag
        {
            get { return _order_split_flag; }

            set
            {
                _order_split_flag = value;
                RaisePropertyChanged(() => order_split_flag);
            }
        }

        private int _min_unit;
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit
        {
            get { return _min_unit; }

            set
            {
                _min_unit = value;
                RaisePropertyChanged(() => min_unit);
            }
        }

        private double _min_qty;
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty
        {
            get { return _min_qty; }

            set
            {
                _min_qty = value;
                RaisePropertyChanged(() => min_qty);
            }
        }

        private double _max_qty;
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty
        {
            get { return _max_qty; }

            set
            {
                _max_qty = value;
                RaisePropertyChanged(() => max_qty);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class pubL_1_55_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_56_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_61_Info : ObservableObject
    {
    }

    public class pubL_1_62_Info : ObservableObject
    {
    }

    public class pubL_1_63_Info : ObservableObject
    {
    }

    public class pubL_1_64_Info : ObservableObject
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

        private String _trade_code;
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code
        {
            get { return _trade_code; }

            set
            {
                _trade_code = value;
                RaisePropertyChanged(() => trade_code);
            }
        }

        private String _target_code;
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code
        {
            get { return _target_code; }

            set
            {
                _target_code = value;
                RaisePropertyChanged(() => target_code);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class pubL_1_65_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private String _trade_code;
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code
        {
            get { return _trade_code; }

            set
            {
                _trade_code = value;
                RaisePropertyChanged(() => trade_code);
            }
        }

        private String _target_code;
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code
        {
            get { return _target_code; }

            set
            {
                _target_code = value;
                RaisePropertyChanged(() => target_code);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_66_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private String _trade_code;
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code
        {
            get { return _trade_code; }

            set
            {
                _trade_code = value;
                RaisePropertyChanged(() => trade_code);
            }
        }

        private String _target_code;
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code
        {
            get { return _target_code; }

            set
            {
                _target_code = value;
                RaisePropertyChanged(() => target_code);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_34_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private String _trade_code;
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code
        {
            get { return _trade_code; }

            set
            {
                _trade_code = value;
                RaisePropertyChanged(() => trade_code);
            }
        }

        private String _target_code;
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code
        {
            get { return _target_code; }

            set
            {
                _target_code = value;
                RaisePropertyChanged(() => target_code);
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

        private int _trade_code_no;
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no
        {
            get { return _trade_code_no; }

            set
            {
                _trade_code_no = value;
                RaisePropertyChanged(() => trade_code_no);
            }
        }

        private int _target_code_no;
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no
        {
            get { return _target_code_no; }

            set
            {
                _target_code_no = value;
                RaisePropertyChanged(() => target_code_no);
            }
        }

        private int _apply_date;
        /// <summary>
        /// 申购日期
        /// </summary>
        public int apply_date
        {
            get { return _apply_date; }

            set
            {
                _apply_date = value;
                RaisePropertyChanged(() => apply_date);
            }
        }

        private double _apply_limit;
        /// <summary>
        /// 申购上限
        /// </summary>
        public double apply_limit
        {
            get { return _apply_limit; }

            set
            {
                _apply_limit = value;
                RaisePropertyChanged(() => apply_limit);
            }
        }

        private int _begin_trade_date;
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date
        {
            get { return _begin_trade_date; }

            set
            {
                _begin_trade_date = value;
                RaisePropertyChanged(() => begin_trade_date);
            }
        }

        private double _issue_price;
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price
        {
            get { return _issue_price; }

            set
            {
                _issue_price = value;
                RaisePropertyChanged(() => issue_price);
            }
        }
    }

    public class pubL_1_35_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private String _trade_code;
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code
        {
            get { return _trade_code; }

            set
            {
                _trade_code = value;
                RaisePropertyChanged(() => trade_code);
            }
        }

        private String _target_code;
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code
        {
            get { return _target_code; }

            set
            {
                _target_code = value;
                RaisePropertyChanged(() => target_code);
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

        private int _trade_code_no;
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no
        {
            get { return _trade_code_no; }

            set
            {
                _trade_code_no = value;
                RaisePropertyChanged(() => trade_code_no);
            }
        }

        private int _target_code_no;
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no
        {
            get { return _target_code_no; }

            set
            {
                _target_code_no = value;
                RaisePropertyChanged(() => target_code_no);
            }
        }

        private int _apply_date;
        /// <summary>
        /// 申购日期
        /// </summary>
        public int apply_date
        {
            get { return _apply_date; }

            set
            {
                _apply_date = value;
                RaisePropertyChanged(() => apply_date);
            }
        }

        private double _apply_limit;
        /// <summary>
        /// 申购上限
        /// </summary>
        public double apply_limit
        {
            get { return _apply_limit; }

            set
            {
                _apply_limit = value;
                RaisePropertyChanged(() => apply_limit);
            }
        }

        private int _begin_trade_date;
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date
        {
            get { return _begin_trade_date; }

            set
            {
                _begin_trade_date = value;
                RaisePropertyChanged(() => begin_trade_date);
            }
        }

        private double _issue_price;
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price
        {
            get { return _issue_price; }

            set
            {
                _issue_price = value;
                RaisePropertyChanged(() => issue_price);
            }
        }
    }

    public class pubL_1_36_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private String _trade_code;
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code
        {
            get { return _trade_code; }

            set
            {
                _trade_code = value;
                RaisePropertyChanged(() => trade_code);
            }
        }

        private String _target_code;
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code
        {
            get { return _target_code; }

            set
            {
                _target_code = value;
                RaisePropertyChanged(() => target_code);
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

        private int _trade_code_no;
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no
        {
            get { return _trade_code_no; }

            set
            {
                _trade_code_no = value;
                RaisePropertyChanged(() => trade_code_no);
            }
        }

        private int _target_code_no;
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no
        {
            get { return _target_code_no; }

            set
            {
                _target_code_no = value;
                RaisePropertyChanged(() => target_code_no);
            }
        }

        private int _apply_date;
        /// <summary>
        /// 申购日期
        /// </summary>
        public int apply_date
        {
            get { return _apply_date; }

            set
            {
                _apply_date = value;
                RaisePropertyChanged(() => apply_date);
            }
        }

        private double _apply_limit;
        /// <summary>
        /// 申购上限
        /// </summary>
        public double apply_limit
        {
            get { return _apply_limit; }

            set
            {
                _apply_limit = value;
                RaisePropertyChanged(() => apply_limit);
            }
        }

        private int _begin_trade_date;
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date
        {
            get { return _begin_trade_date; }

            set
            {
                _begin_trade_date = value;
                RaisePropertyChanged(() => begin_trade_date);
            }
        }

        private double _issue_price;
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price
        {
            get { return _issue_price; }

            set
            {
                _issue_price = value;
                RaisePropertyChanged(() => issue_price);
            }
        }
    }

    public class pubL_1_37_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private String _trade_code;
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code
        {
            get { return _trade_code; }

            set
            {
                _trade_code = value;
                RaisePropertyChanged(() => trade_code);
            }
        }

        private String _target_code;
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code
        {
            get { return _target_code; }

            set
            {
                _target_code = value;
                RaisePropertyChanged(() => target_code);
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

        private int _trade_code_no;
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no
        {
            get { return _trade_code_no; }

            set
            {
                _trade_code_no = value;
                RaisePropertyChanged(() => trade_code_no);
            }
        }

        private int _target_code_no;
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no
        {
            get { return _target_code_no; }

            set
            {
                _target_code_no = value;
                RaisePropertyChanged(() => target_code_no);
            }
        }

        private int _apply_date;
        /// <summary>
        /// 申购日期
        /// </summary>
        public int apply_date
        {
            get { return _apply_date; }

            set
            {
                _apply_date = value;
                RaisePropertyChanged(() => apply_date);
            }
        }

        private double _apply_limit;
        /// <summary>
        /// 申购上限
        /// </summary>
        public double apply_limit
        {
            get { return _apply_limit; }

            set
            {
                _apply_limit = value;
                RaisePropertyChanged(() => apply_limit);
            }
        }

        private int _begin_trade_date;
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date
        {
            get { return _begin_trade_date; }

            set
            {
                _begin_trade_date = value;
                RaisePropertyChanged(() => begin_trade_date);
            }
        }

        private double _issue_price;
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price
        {
            get { return _issue_price; }

            set
            {
                _issue_price = value;
                RaisePropertyChanged(() => issue_price);
            }
        }
    }

    public class pubL_1_71_Info : ObservableObject
    {
    }

    public class pubL_1_72_Info : ObservableObject
    {
    }

    public class pubL_1_73_Info : ObservableObject
    {
    }

    public class pubL_1_74_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
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

        private double _pre_close_price;
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price
        {
            get { return _pre_close_price; }

            set
            {
                _pre_close_price = value;
                RaisePropertyChanged(() => pre_close_price);
            }
        }

        private double _today_open_price;
        /// <summary>
        /// 今开盘价
        /// </summary>
        public double today_open_price
        {
            get { return _today_open_price; }

            set
            {
                _today_open_price = value;
                RaisePropertyChanged(() => today_open_price);
            }
        }

        private double _today_close_price;
        /// <summary>
        /// 今收盘价
        /// </summary>
        public double today_close_price
        {
            get { return _today_close_price; }

            set
            {
                _today_close_price = value;
                RaisePropertyChanged(() => today_close_price);
            }
        }

        private double _today_max_price;
        /// <summary>
        /// 今最高价
        /// </summary>
        public double today_max_price
        {
            get { return _today_max_price; }

            set
            {
                _today_max_price = value;
                RaisePropertyChanged(() => today_max_price);
            }
        }

        private double _today_min_price;
        /// <summary>
        /// 今最低价
        /// </summary>
        public double today_min_price
        {
            get { return _today_min_price; }

            set
            {
                _today_min_price = value;
                RaisePropertyChanged(() => today_min_price);
            }
        }

        private double _buy_price_1;
        /// <summary>
        /// 买一价
        /// </summary>
        public double buy_price_1
        {
            get { return _buy_price_1; }

            set
            {
                _buy_price_1 = value;
                RaisePropertyChanged(() => buy_price_1);
            }
        }

        private double _buy_qty_1;
        /// <summary>
        /// 买一量
        /// </summary>
        public double buy_qty_1
        {
            get { return _buy_qty_1; }

            set
            {
                _buy_qty_1 = value;
                RaisePropertyChanged(() => buy_qty_1);
            }
        }

        private double _buy_price_2;
        /// <summary>
        /// 买二价
        /// </summary>
        public double buy_price_2
        {
            get { return _buy_price_2; }

            set
            {
                _buy_price_2 = value;
                RaisePropertyChanged(() => buy_price_2);
            }
        }

        private double _buy_qty_2;
        /// <summary>
        /// 买二量
        /// </summary>
        public double buy_qty_2
        {
            get { return _buy_qty_2; }

            set
            {
                _buy_qty_2 = value;
                RaisePropertyChanged(() => buy_qty_2);
            }
        }

        private double _buy_price_3;
        /// <summary>
        /// 买三价
        /// </summary>
        public double buy_price_3
        {
            get { return _buy_price_3; }

            set
            {
                _buy_price_3 = value;
                RaisePropertyChanged(() => buy_price_3);
            }
        }

        private double _buy_qty_3;
        /// <summary>
        /// 买三量
        /// </summary>
        public double buy_qty_3
        {
            get { return _buy_qty_3; }

            set
            {
                _buy_qty_3 = value;
                RaisePropertyChanged(() => buy_qty_3);
            }
        }

        private double _buy_price_4;
        /// <summary>
        /// 买四价
        /// </summary>
        public double buy_price_4
        {
            get { return _buy_price_4; }

            set
            {
                _buy_price_4 = value;
                RaisePropertyChanged(() => buy_price_4);
            }
        }

        private double _buy_qty_4;
        /// <summary>
        /// 买四量
        /// </summary>
        public double buy_qty_4
        {
            get { return _buy_qty_4; }

            set
            {
                _buy_qty_4 = value;
                RaisePropertyChanged(() => buy_qty_4);
            }
        }

        private double _buy_price_5;
        /// <summary>
        /// 买五价
        /// </summary>
        public double buy_price_5
        {
            get { return _buy_price_5; }

            set
            {
                _buy_price_5 = value;
                RaisePropertyChanged(() => buy_price_5);
            }
        }

        private double _buy_qty_5;
        /// <summary>
        /// 买五量
        /// </summary>
        public double buy_qty_5
        {
            get { return _buy_qty_5; }

            set
            {
                _buy_qty_5 = value;
                RaisePropertyChanged(() => buy_qty_5);
            }
        }

        private double _sell_price_1;
        /// <summary>
        /// 卖一价
        /// </summary>
        public double sell_price_1
        {
            get { return _sell_price_1; }

            set
            {
                _sell_price_1 = value;
                RaisePropertyChanged(() => sell_price_1);
            }
        }

        private double _sell_qty_1;
        /// <summary>
        /// 卖一量
        /// </summary>
        public double sell_qty_1
        {
            get { return _sell_qty_1; }

            set
            {
                _sell_qty_1 = value;
                RaisePropertyChanged(() => sell_qty_1);
            }
        }

        private double _sell_price_2;
        /// <summary>
        /// 卖二价
        /// </summary>
        public double sell_price_2
        {
            get { return _sell_price_2; }

            set
            {
                _sell_price_2 = value;
                RaisePropertyChanged(() => sell_price_2);
            }
        }

        private double _sell_qty_2;
        /// <summary>
        /// 卖二量
        /// </summary>
        public double sell_qty_2
        {
            get { return _sell_qty_2; }

            set
            {
                _sell_qty_2 = value;
                RaisePropertyChanged(() => sell_qty_2);
            }
        }

        private double _sell_price_3;
        /// <summary>
        /// 卖三价
        /// </summary>
        public double sell_price_3
        {
            get { return _sell_price_3; }

            set
            {
                _sell_price_3 = value;
                RaisePropertyChanged(() => sell_price_3);
            }
        }

        private double _sell_qty_3;
        /// <summary>
        /// 卖三量
        /// </summary>
        public double sell_qty_3
        {
            get { return _sell_qty_3; }

            set
            {
                _sell_qty_3 = value;
                RaisePropertyChanged(() => sell_qty_3);
            }
        }

        private double _sell_price_4;
        /// <summary>
        /// 卖四价
        /// </summary>
        public double sell_price_4
        {
            get { return _sell_price_4; }

            set
            {
                _sell_price_4 = value;
                RaisePropertyChanged(() => sell_price_4);
            }
        }

        private double _sell_qty_4;
        /// <summary>
        /// 卖四量
        /// </summary>
        public double sell_qty_4
        {
            get { return _sell_qty_4; }

            set
            {
                _sell_qty_4 = value;
                RaisePropertyChanged(() => sell_qty_4);
            }
        }

        private double _sell_price_5;
        /// <summary>
        /// 卖五价
        /// </summary>
        public double sell_price_5
        {
            get { return _sell_price_5; }

            set
            {
                _sell_price_5 = value;
                RaisePropertyChanged(() => sell_price_5);
            }
        }

        private double _sell_qty_5;
        /// <summary>
        /// 卖五量
        /// </summary>
        public double sell_qty_5
        {
            get { return _sell_qty_5; }

            set
            {
                _sell_qty_5 = value;
                RaisePropertyChanged(() => sell_qty_5);
            }
        }

        private double _strike_qty;
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty
        {
            get { return _strike_qty; }

            set
            {
                _strike_qty = value;
                RaisePropertyChanged(() => strike_qty);
            }
        }

        private double _strike_amt;
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt
        {
            get { return _strike_amt; }

            set
            {
                _strike_amt = value;
                RaisePropertyChanged(() => strike_amt);
            }
        }

        private double _pe_ratio;
        /// <summary>
        /// 市盈率
        /// </summary>
        public double pe_ratio
        {
            get { return _pe_ratio; }

            set
            {
                _pe_ratio = value;
                RaisePropertyChanged(() => pe_ratio);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class pubL_1_77_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
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

        private double _pre_close_price;
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price
        {
            get { return _pre_close_price; }

            set
            {
                _pre_close_price = value;
                RaisePropertyChanged(() => pre_close_price);
            }
        }

        private double _today_open_price;
        /// <summary>
        /// 今开盘价
        /// </summary>
        public double today_open_price
        {
            get { return _today_open_price; }

            set
            {
                _today_open_price = value;
                RaisePropertyChanged(() => today_open_price);
            }
        }

        private double _today_close_price;
        /// <summary>
        /// 今收盘价
        /// </summary>
        public double today_close_price
        {
            get { return _today_close_price; }

            set
            {
                _today_close_price = value;
                RaisePropertyChanged(() => today_close_price);
            }
        }

        private double _today_max_price;
        /// <summary>
        /// 今最高价
        /// </summary>
        public double today_max_price
        {
            get { return _today_max_price; }

            set
            {
                _today_max_price = value;
                RaisePropertyChanged(() => today_max_price);
            }
        }

        private double _today_min_price;
        /// <summary>
        /// 今最低价
        /// </summary>
        public double today_min_price
        {
            get { return _today_min_price; }

            set
            {
                _today_min_price = value;
                RaisePropertyChanged(() => today_min_price);
            }
        }

        private double _buy_price_1;
        /// <summary>
        /// 买一价
        /// </summary>
        public double buy_price_1
        {
            get { return _buy_price_1; }

            set
            {
                _buy_price_1 = value;
                RaisePropertyChanged(() => buy_price_1);
            }
        }

        private double _buy_qty_1;
        /// <summary>
        /// 买一量
        /// </summary>
        public double buy_qty_1
        {
            get { return _buy_qty_1; }

            set
            {
                _buy_qty_1 = value;
                RaisePropertyChanged(() => buy_qty_1);
            }
        }

        private double _buy_price_2;
        /// <summary>
        /// 买二价
        /// </summary>
        public double buy_price_2
        {
            get { return _buy_price_2; }

            set
            {
                _buy_price_2 = value;
                RaisePropertyChanged(() => buy_price_2);
            }
        }

        private double _buy_qty_2;
        /// <summary>
        /// 买二量
        /// </summary>
        public double buy_qty_2
        {
            get { return _buy_qty_2; }

            set
            {
                _buy_qty_2 = value;
                RaisePropertyChanged(() => buy_qty_2);
            }
        }

        private double _buy_price_3;
        /// <summary>
        /// 买三价
        /// </summary>
        public double buy_price_3
        {
            get { return _buy_price_3; }

            set
            {
                _buy_price_3 = value;
                RaisePropertyChanged(() => buy_price_3);
            }
        }

        private double _buy_qty_3;
        /// <summary>
        /// 买三量
        /// </summary>
        public double buy_qty_3
        {
            get { return _buy_qty_3; }

            set
            {
                _buy_qty_3 = value;
                RaisePropertyChanged(() => buy_qty_3);
            }
        }

        private double _buy_price_4;
        /// <summary>
        /// 买四价
        /// </summary>
        public double buy_price_4
        {
            get { return _buy_price_4; }

            set
            {
                _buy_price_4 = value;
                RaisePropertyChanged(() => buy_price_4);
            }
        }

        private double _buy_qty_4;
        /// <summary>
        /// 买四量
        /// </summary>
        public double buy_qty_4
        {
            get { return _buy_qty_4; }

            set
            {
                _buy_qty_4 = value;
                RaisePropertyChanged(() => buy_qty_4);
            }
        }

        private double _buy_price_5;
        /// <summary>
        /// 买五价
        /// </summary>
        public double buy_price_5
        {
            get { return _buy_price_5; }

            set
            {
                _buy_price_5 = value;
                RaisePropertyChanged(() => buy_price_5);
            }
        }

        private double _buy_qty_5;
        /// <summary>
        /// 买五量
        /// </summary>
        public double buy_qty_5
        {
            get { return _buy_qty_5; }

            set
            {
                _buy_qty_5 = value;
                RaisePropertyChanged(() => buy_qty_5);
            }
        }

        private double _sell_price_1;
        /// <summary>
        /// 卖一价
        /// </summary>
        public double sell_price_1
        {
            get { return _sell_price_1; }

            set
            {
                _sell_price_1 = value;
                RaisePropertyChanged(() => sell_price_1);
            }
        }

        private double _sell_qty_1;
        /// <summary>
        /// 卖一量
        /// </summary>
        public double sell_qty_1
        {
            get { return _sell_qty_1; }

            set
            {
                _sell_qty_1 = value;
                RaisePropertyChanged(() => sell_qty_1);
            }
        }

        private double _sell_price_2;
        /// <summary>
        /// 卖二价
        /// </summary>
        public double sell_price_2
        {
            get { return _sell_price_2; }

            set
            {
                _sell_price_2 = value;
                RaisePropertyChanged(() => sell_price_2);
            }
        }

        private double _sell_qty_2;
        /// <summary>
        /// 卖二量
        /// </summary>
        public double sell_qty_2
        {
            get { return _sell_qty_2; }

            set
            {
                _sell_qty_2 = value;
                RaisePropertyChanged(() => sell_qty_2);
            }
        }

        private double _sell_price_3;
        /// <summary>
        /// 卖三价
        /// </summary>
        public double sell_price_3
        {
            get { return _sell_price_3; }

            set
            {
                _sell_price_3 = value;
                RaisePropertyChanged(() => sell_price_3);
            }
        }

        private double _sell_qty_3;
        /// <summary>
        /// 卖三量
        /// </summary>
        public double sell_qty_3
        {
            get { return _sell_qty_3; }

            set
            {
                _sell_qty_3 = value;
                RaisePropertyChanged(() => sell_qty_3);
            }
        }

        private double _sell_price_4;
        /// <summary>
        /// 卖四价
        /// </summary>
        public double sell_price_4
        {
            get { return _sell_price_4; }

            set
            {
                _sell_price_4 = value;
                RaisePropertyChanged(() => sell_price_4);
            }
        }

        private double _sell_qty_4;
        /// <summary>
        /// 卖四量
        /// </summary>
        public double sell_qty_4
        {
            get { return _sell_qty_4; }

            set
            {
                _sell_qty_4 = value;
                RaisePropertyChanged(() => sell_qty_4);
            }
        }

        private double _sell_price_5;
        /// <summary>
        /// 卖五价
        /// </summary>
        public double sell_price_5
        {
            get { return _sell_price_5; }

            set
            {
                _sell_price_5 = value;
                RaisePropertyChanged(() => sell_price_5);
            }
        }

        private double _sell_qty_5;
        /// <summary>
        /// 卖五量
        /// </summary>
        public double sell_qty_5
        {
            get { return _sell_qty_5; }

            set
            {
                _sell_qty_5 = value;
                RaisePropertyChanged(() => sell_qty_5);
            }
        }

        private double _strike_qty;
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty
        {
            get { return _strike_qty; }

            set
            {
                _strike_qty = value;
                RaisePropertyChanged(() => strike_qty);
            }
        }

        private double _strike_amt;
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt
        {
            get { return _strike_amt; }

            set
            {
                _strike_amt = value;
                RaisePropertyChanged(() => strike_amt);
            }
        }

        private double _pe_ratio;
        /// <summary>
        /// 市盈率
        /// </summary>
        public double pe_ratio
        {
            get { return _pe_ratio; }

            set
            {
                _pe_ratio = value;
                RaisePropertyChanged(() => pe_ratio);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class pubL_1_78_Info : ObservableObject
    {

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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
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

        private double _pre_close_price;
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price
        {
            get { return _pre_close_price; }

            set
            {
                _pre_close_price = value;
                RaisePropertyChanged(() => pre_close_price);
            }
        }
    }

    public class pubL_1_75_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_76_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_79_Info : ObservableObject
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

    public class pubL_1_81_Info : ObservableObject
    {
    }

    public class pubL_1_82_Info : ObservableObject
    {
    }

    public class pubL_1_83_Info : ObservableObject
    {
    }

    public class pubL_1_84_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private int _issue_date;
        /// <summary>
        /// 发行日期
        /// </summary>
        public int issue_date
        {
            get { return _issue_date; }

            set
            {
                _issue_date = value;
                RaisePropertyChanged(() => issue_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
            }
        }

        private int _value_date;
        /// <summary>
        /// 起息日期
        /// </summary>
        public int value_date
        {
            get { return _value_date; }

            set
            {
                _value_date = value;
                RaisePropertyChanged(() => value_date);
            }
        }

        private int _next_value_date;
        /// <summary>
        /// 下一起息日期
        /// </summary>
        public int next_value_date
        {
            get { return _next_value_date; }

            set
            {
                _next_value_date = value;
                RaisePropertyChanged(() => next_value_date);
            }
        }

        private int _begin_trade_date;
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date
        {
            get { return _begin_trade_date; }

            set
            {
                _begin_trade_date = value;
                RaisePropertyChanged(() => begin_trade_date);
            }
        }

        private double _bond_limit;
        /// <summary>
        /// 债券期限
        /// </summary>
        public double bond_limit
        {
            get { return _bond_limit; }

            set
            {
                _bond_limit = value;
                RaisePropertyChanged(() => bond_limit);
            }
        }

        private double _issue_price;
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price
        {
            get { return _issue_price; }

            set
            {
                _issue_price = value;
                RaisePropertyChanged(() => issue_price);
            }
        }

        private double _par_value;
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value
        {
            get { return _par_value; }

            set
            {
                _par_value = value;
                RaisePropertyChanged(() => par_value);
            }
        }

        private double _intrst_ratio;
        /// <summary>
        /// 年利率
        /// </summary>
        public double intrst_ratio
        {
            get { return _intrst_ratio; }

            set
            {
                _intrst_ratio = value;
                RaisePropertyChanged(() => intrst_ratio);
            }
        }

        private int _intrst_days;
        /// <summary>
        /// 计息天数
        /// </summary>
        public int intrst_days
        {
            get { return _intrst_days; }

            set
            {
                _intrst_days = value;
                RaisePropertyChanged(() => intrst_days);
            }
        }

        private int _pay_inteval;
        /// <summary>
        /// 付息间隔
        /// </summary>
        public int pay_inteval
        {
            get { return _pay_inteval; }

            set
            {
                _pay_inteval = value;
                RaisePropertyChanged(() => pay_inteval);
            }
        }

        private double _bond_accr_intrst;
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst
        {
            get { return _bond_accr_intrst; }

            set
            {
                _bond_accr_intrst = value;
                RaisePropertyChanged(() => bond_accr_intrst);
            }
        }

        private int _bond_rate_type;
        /// <summary>
        /// 债券利率类型
        /// </summary>
        public int bond_rate_type
        {
            get { return _bond_rate_type; }

            set
            {
                _bond_rate_type = value;
                RaisePropertyChanged(() => bond_rate_type);
            }
        }

        private int _inteval_days;
        /// <summary>
        /// 间隔天数
        /// </summary>
        public int inteval_days
        {
            get { return _inteval_days; }

            set
            {
                _inteval_days = value;
                RaisePropertyChanged(() => inteval_days);
            }
        }

        private int _net_price_flag;
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag
        {
            get { return _net_price_flag; }

            set
            {
                _net_price_flag = value;
                RaisePropertyChanged(() => net_price_flag);
            }
        }

        private int _last_trade_date;
        /// <summary>
        /// 最后交易日
        /// </summary>
        public int last_trade_date
        {
            get { return _last_trade_date; }

            set
            {
                _last_trade_date = value;
                RaisePropertyChanged(() => last_trade_date);
            }
        }

        private int _rights_type;
        /// <summary>
        /// 权益类型
        /// </summary>
        public int rights_type
        {
            get { return _rights_type; }

            set
            {
                _rights_type = value;
                RaisePropertyChanged(() => rights_type);
            }
        }

        private int _trans_begin_date;
        /// <summary>
        /// 转股开始日期
        /// </summary>
        public int trans_begin_date
        {
            get { return _trans_begin_date; }

            set
            {
                _trans_begin_date = value;
                RaisePropertyChanged(() => trans_begin_date);
            }
        }

        private int _trans_end_date;
        /// <summary>
        /// 转股结束日期
        /// </summary>
        public int trans_end_date
        {
            get { return _trans_end_date; }

            set
            {
                _trans_end_date = value;
                RaisePropertyChanged(() => trans_end_date);
            }
        }

        private int _exec_begin_date;
        /// <summary>
        /// 行权开始日期
        /// </summary>
        public int exec_begin_date
        {
            get { return _exec_begin_date; }

            set
            {
                _exec_begin_date = value;
                RaisePropertyChanged(() => exec_begin_date);
            }
        }

        private int _exec_end_date;
        /// <summary>
        /// 行权结束日期
        /// </summary>
        public int exec_end_date
        {
            get { return _exec_end_date; }

            set
            {
                _exec_end_date = value;
                RaisePropertyChanged(() => exec_end_date);
            }
        }

        private double _impawn_ratio;
        /// <summary>
        /// 质押比例
        /// </summary>
        public double impawn_ratio
        {
            get { return _impawn_ratio; }

            set
            {
                _impawn_ratio = value;
                RaisePropertyChanged(() => impawn_ratio);
            }
        }

        private String _trade_code;
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code
        {
            get { return _trade_code; }

            set
            {
                _trade_code = value;
                RaisePropertyChanged(() => trade_code);
            }
        }

        private String _target_code;
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code
        {
            get { return _target_code; }

            set
            {
                _target_code = value;
                RaisePropertyChanged(() => target_code);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class pubL_1_88_Info : ObservableObject
    {

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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private int _issue_date;
        /// <summary>
        /// 发行日期
        /// </summary>
        public int issue_date
        {
            get { return _issue_date; }

            set
            {
                _issue_date = value;
                RaisePropertyChanged(() => issue_date);
            }
        }

        private int _end_date;
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date
        {
            get { return _end_date; }

            set
            {
                _end_date = value;
                RaisePropertyChanged(() => end_date);
            }
        }

        private int _value_date;
        /// <summary>
        /// 起息日期
        /// </summary>
        public int value_date
        {
            get { return _value_date; }

            set
            {
                _value_date = value;
                RaisePropertyChanged(() => value_date);
            }
        }

        private int _next_value_date;
        /// <summary>
        /// 下一起息日期
        /// </summary>
        public int next_value_date
        {
            get { return _next_value_date; }

            set
            {
                _next_value_date = value;
                RaisePropertyChanged(() => next_value_date);
            }
        }

        private int _begin_trade_date;
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date
        {
            get { return _begin_trade_date; }

            set
            {
                _begin_trade_date = value;
                RaisePropertyChanged(() => begin_trade_date);
            }
        }

        private double _bond_limit;
        /// <summary>
        /// 债券期限
        /// </summary>
        public double bond_limit
        {
            get { return _bond_limit; }

            set
            {
                _bond_limit = value;
                RaisePropertyChanged(() => bond_limit);
            }
        }

        private double _issue_price;
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price
        {
            get { return _issue_price; }

            set
            {
                _issue_price = value;
                RaisePropertyChanged(() => issue_price);
            }
        }

        private double _par_value;
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value
        {
            get { return _par_value; }

            set
            {
                _par_value = value;
                RaisePropertyChanged(() => par_value);
            }
        }

        private double _intrst_ratio;
        /// <summary>
        /// 年利率
        /// </summary>
        public double intrst_ratio
        {
            get { return _intrst_ratio; }

            set
            {
                _intrst_ratio = value;
                RaisePropertyChanged(() => intrst_ratio);
            }
        }

        private int _intrst_days;
        /// <summary>
        /// 计息天数
        /// </summary>
        public int intrst_days
        {
            get { return _intrst_days; }

            set
            {
                _intrst_days = value;
                RaisePropertyChanged(() => intrst_days);
            }
        }

        private int _pay_inteval;
        /// <summary>
        /// 付息间隔
        /// </summary>
        public int pay_inteval
        {
            get { return _pay_inteval; }

            set
            {
                _pay_inteval = value;
                RaisePropertyChanged(() => pay_inteval);
            }
        }

        private double _bond_accr_intrst;
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst
        {
            get { return _bond_accr_intrst; }

            set
            {
                _bond_accr_intrst = value;
                RaisePropertyChanged(() => bond_accr_intrst);
            }
        }

        private int _bond_rate_type;
        /// <summary>
        /// 债券利率类型
        /// </summary>
        public int bond_rate_type
        {
            get { return _bond_rate_type; }

            set
            {
                _bond_rate_type = value;
                RaisePropertyChanged(() => bond_rate_type);
            }
        }

        private int _inteval_days;
        /// <summary>
        /// 间隔天数
        /// </summary>
        public int inteval_days
        {
            get { return _inteval_days; }

            set
            {
                _inteval_days = value;
                RaisePropertyChanged(() => inteval_days);
            }
        }

        private int _net_price_flag;
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag
        {
            get { return _net_price_flag; }

            set
            {
                _net_price_flag = value;
                RaisePropertyChanged(() => net_price_flag);
            }
        }

        private int _last_trade_date;
        /// <summary>
        /// 最后交易日
        /// </summary>
        public int last_trade_date
        {
            get { return _last_trade_date; }

            set
            {
                _last_trade_date = value;
                RaisePropertyChanged(() => last_trade_date);
            }
        }

        private int _rights_type;
        /// <summary>
        /// 权益类型
        /// </summary>
        public int rights_type
        {
            get { return _rights_type; }

            set
            {
                _rights_type = value;
                RaisePropertyChanged(() => rights_type);
            }
        }

        private int _trans_begin_date;
        /// <summary>
        /// 转股开始日期
        /// </summary>
        public int trans_begin_date
        {
            get { return _trans_begin_date; }

            set
            {
                _trans_begin_date = value;
                RaisePropertyChanged(() => trans_begin_date);
            }
        }

        private int _trans_end_date;
        /// <summary>
        /// 转股结束日期
        /// </summary>
        public int trans_end_date
        {
            get { return _trans_end_date; }

            set
            {
                _trans_end_date = value;
                RaisePropertyChanged(() => trans_end_date);
            }
        }

        private int _exec_begin_date;
        /// <summary>
        /// 行权开始日期
        /// </summary>
        public int exec_begin_date
        {
            get { return _exec_begin_date; }

            set
            {
                _exec_begin_date = value;
                RaisePropertyChanged(() => exec_begin_date);
            }
        }

        private int _exec_end_date;
        /// <summary>
        /// 行权结束日期
        /// </summary>
        public int exec_end_date
        {
            get { return _exec_end_date; }

            set
            {
                _exec_end_date = value;
                RaisePropertyChanged(() => exec_end_date);
            }
        }

        private double _impawn_ratio;
        /// <summary>
        /// 质押比例
        /// </summary>
        public double impawn_ratio
        {
            get { return _impawn_ratio; }

            set
            {
                _impawn_ratio = value;
                RaisePropertyChanged(() => impawn_ratio);
            }
        }

        private String _trade_code;
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code
        {
            get { return _trade_code; }

            set
            {
                _trade_code = value;
                RaisePropertyChanged(() => trade_code);
            }
        }

        private String _target_code;
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code
        {
            get { return _target_code; }

            set
            {
                _target_code = value;
                RaisePropertyChanged(() => target_code);
            }
        }
    }

    public class pubL_1_85_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_86_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_87_Info : ObservableObject
    {

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

        private int _impawn_code_no;
        /// <summary>
        /// 质押代码编号
        /// </summary>
        public int impawn_code_no
        {
            get { return _impawn_code_no; }

            set
            {
                _impawn_code_no = value;
                RaisePropertyChanged(() => impawn_code_no);
            }
        }

        private String _impawn_code;
        /// <summary>
        /// 质押代码
        /// </summary>
        public String impawn_code
        {
            get { return _impawn_code; }

            set
            {
                _impawn_code = value;
                RaisePropertyChanged(() => impawn_code);
            }
        }

        private double _impawn_ratio;
        /// <summary>
        /// 质押比例
        /// </summary>
        public double impawn_ratio
        {
            get { return _impawn_ratio; }

            set
            {
                _impawn_ratio = value;
                RaisePropertyChanged(() => impawn_ratio);
            }
        }
    }

    public class pubL_1_91_Info : ObservableObject
    {
    }

    public class pubL_1_92_Info : ObservableObject
    {
    }

    public class pubL_1_93_Info : ObservableObject
    {
    }

    public class pubL_1_94_Info : ObservableObject
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

        private int _intrst_begin_date;
        /// <summary>
        /// 利率开始日期
        /// </summary>
        public int intrst_begin_date
        {
            get { return _intrst_begin_date; }

            set
            {
                _intrst_begin_date = value;
                RaisePropertyChanged(() => intrst_begin_date);
            }
        }

        private double _intrst_ratio;
        /// <summary>
        /// 年利率
        /// </summary>
        public double intrst_ratio
        {
            get { return _intrst_ratio; }

            set
            {
                _intrst_ratio = value;
                RaisePropertyChanged(() => intrst_ratio);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class pubL_1_95_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private int _intrst_begin_date;
        /// <summary>
        /// 利率开始日期
        /// </summary>
        public int intrst_begin_date
        {
            get { return _intrst_begin_date; }

            set
            {
                _intrst_begin_date = value;
                RaisePropertyChanged(() => intrst_begin_date);
            }
        }

        private double _intrst_ratio;
        /// <summary>
        /// 年利率
        /// </summary>
        public double intrst_ratio
        {
            get { return _intrst_ratio; }

            set
            {
                _intrst_ratio = value;
                RaisePropertyChanged(() => intrst_ratio);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_96_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private int _intrst_begin_date;
        /// <summary>
        /// 利率开始日期
        /// </summary>
        public int intrst_begin_date
        {
            get { return _intrst_begin_date; }

            set
            {
                _intrst_begin_date = value;
                RaisePropertyChanged(() => intrst_begin_date);
            }
        }

        private double _intrst_ratio;
        /// <summary>
        /// 年利率
        /// </summary>
        public double intrst_ratio
        {
            get { return _intrst_ratio; }

            set
            {
                _intrst_ratio = value;
                RaisePropertyChanged(() => intrst_ratio);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_101_Info : ObservableObject
    {
    }

    public class pubL_1_102_Info : ObservableObject
    {
    }

    public class pubL_1_103_Info : ObservableObject
    {
    }

    public class pubL_1_104_Info : ObservableObject
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

        private String _rating_agency;
        /// <summary>
        /// 评级机构
        /// </summary>
        public String rating_agency
        {
            get { return _rating_agency; }

            set
            {
                _rating_agency = value;
                RaisePropertyChanged(() => rating_agency);
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

        private int _bond_level;
        /// <summary>
        /// 债券等级
        /// </summary>
        public int bond_level
        {
            get { return _bond_level; }

            set
            {
                _bond_level = value;
                RaisePropertyChanged(() => bond_level);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class pubL_1_105_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private String _rating_agency;
        /// <summary>
        /// 评级机构
        /// </summary>
        public String rating_agency
        {
            get { return _rating_agency; }

            set
            {
                _rating_agency = value;
                RaisePropertyChanged(() => rating_agency);
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

        private int _bond_level;
        /// <summary>
        /// 债券等级
        /// </summary>
        public int bond_level
        {
            get { return _bond_level; }

            set
            {
                _bond_level = value;
                RaisePropertyChanged(() => bond_level);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_106_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private String _rating_agency;
        /// <summary>
        /// 评级机构
        /// </summary>
        public String rating_agency
        {
            get { return _rating_agency; }

            set
            {
                _rating_agency = value;
                RaisePropertyChanged(() => rating_agency);
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

        private int _bond_level;
        /// <summary>
        /// 债券等级
        /// </summary>
        public int bond_level
        {
            get { return _bond_level; }

            set
            {
                _bond_level = value;
                RaisePropertyChanged(() => bond_level);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_130_Info : ObservableObject
    {

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

        private int _stock_type;
        /// <summary>
        /// 证券类型
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private int _repo_days;
        /// <summary>
        /// 回购天数
        /// </summary>
        public int repo_days
        {
            get { return _repo_days; }

            set
            {
                _repo_days = value;
                RaisePropertyChanged(() => repo_days);
            }
        }

        private int _cash_capt_days;
        /// <summary>
        /// 资金占款天数
        /// </summary>
        public int cash_capt_days
        {
            get { return _cash_capt_days; }

            set
            {
                _cash_capt_days = value;
                RaisePropertyChanged(() => cash_capt_days);
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
    }

    public class pubL_1_131_Info : ObservableObject
    {

        private String _amt_ratio_str;
        /// <summary>
        /// 金额比例串
        /// </summary>
        public String amt_ratio_str
        {
            get { return _amt_ratio_str; }

            set
            {
                _amt_ratio_str = value;
                RaisePropertyChanged(() => amt_ratio_str);
            }
        }

        private String _amt_value_str;
        /// <summary>
        /// 金额固定额串
        /// </summary>
        public String amt_value_str
        {
            get { return _amt_value_str; }

            set
            {
                _amt_value_str = value;
                RaisePropertyChanged(() => amt_value_str);
            }
        }

        private String _max_fee_str;
        /// <summary>
        /// 最高费用串
        /// </summary>
        public String max_fee_str
        {
            get { return _max_fee_str; }

            set
            {
                _max_fee_str = value;
                RaisePropertyChanged(() => max_fee_str);
            }
        }

        private String _min_fee_str;
        /// <summary>
        /// 最低费用串
        /// </summary>
        public String min_fee_str
        {
            get { return _min_fee_str; }

            set
            {
                _min_fee_str = value;
                RaisePropertyChanged(() => min_fee_str);
            }
        }

        private double _par_value;
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value
        {
            get { return _par_value; }

            set
            {
                _par_value = value;
                RaisePropertyChanged(() => par_value);
            }
        }
    }

    public class pubL_1_140_Info : ObservableObject
    {

        private double _begin_price;
        /// <summary>
        /// 起始价位
        /// </summary>
        public double begin_price
        {
            get { return _begin_price; }

            set
            {
                _begin_price = value;
                RaisePropertyChanged(() => begin_price);
            }
        }

        private double _end_price;
        /// <summary>
        /// 结束价位
        /// </summary>
        public double end_price
        {
            get { return _end_price; }

            set
            {
                _end_price = value;
                RaisePropertyChanged(() => end_price);
            }
        }

        private double _step_price;
        /// <summary>
        /// 最小价差
        /// </summary>
        public double step_price
        {
            get { return _step_price; }

            set
            {
                _step_price = value;
                RaisePropertyChanged(() => step_price);
            }
        }
    }

    public class pubL_1_141_Info : ObservableObject
    {

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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }
    }

    public class pubL_1_142_Info : ObservableObject
    {
    }

    public class pubL_1_143_Info : ObservableObject
    {
    }

    public class pubL_1_144_Info : ObservableObject
    {
    }

    public class pubL_1_145_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private int _fund_kind;
        /// <summary>
        /// 基金类别
        /// </summary>
        public int fund_kind
        {
            get { return _fund_kind; }

            set
            {
                _fund_kind = value;
                RaisePropertyChanged(() => fund_kind);
            }
        }

        private String _fund_manager;
        /// <summary>
        /// 基金管理人
        /// </summary>
        public String fund_manager
        {
            get { return _fund_manager; }

            set
            {
                _fund_manager = value;
                RaisePropertyChanged(() => fund_manager);
            }
        }

        private String _fund_trustee;
        /// <summary>
        /// 基金托管人
        /// </summary>
        public String fund_trustee
        {
            get { return _fund_trustee; }

            set
            {
                _fund_trustee = value;
                RaisePropertyChanged(() => fund_trustee);
            }
        }

        private double _distribution_scale;
        /// <summary>
        /// 发行规模
        /// </summary>
        public double distribution_scale
        {
            get { return _distribution_scale; }

            set
            {
                _distribution_scale = value;
                RaisePropertyChanged(() => distribution_scale);
            }
        }

        private int _charging_method;
        /// <summary>
        /// 收费方式
        /// </summary>
        public int charging_method
        {
            get { return _charging_method; }

            set
            {
                _charging_method = value;
                RaisePropertyChanged(() => charging_method);
            }
        }

        private int _default_divide_type;
        /// <summary>
        /// 默认分红方式
        /// </summary>
        public int default_divide_type
        {
            get { return _default_divide_type; }

            set
            {
                _default_divide_type = value;
                RaisePropertyChanged(() => default_divide_type);
            }
        }

        private int _fund_found_date;
        /// <summary>
        /// 基金成立日期
        /// </summary>
        public int fund_found_date
        {
            get { return _fund_found_date; }

            set
            {
                _fund_found_date = value;
                RaisePropertyChanged(() => fund_found_date);
            }
        }

        private int _fund_expire_date;
        /// <summary>
        /// 基金到期日期
        /// </summary>
        public int fund_expire_date
        {
            get { return _fund_expire_date; }

            set
            {
                _fund_expire_date = value;
                RaisePropertyChanged(() => fund_expire_date);
            }
        }

        private int _subscription_trade_mark;
        /// <summary>
        /// 认购交易标志
        /// </summary>
        public int subscription_trade_mark
        {
            get { return _subscription_trade_mark; }

            set
            {
                _subscription_trade_mark = value;
                RaisePropertyChanged(() => subscription_trade_mark);
            }
        }

        private int _purchase_trade_mark;
        /// <summary>
        /// 申购交易标志
        /// </summary>
        public int purchase_trade_mark
        {
            get { return _purchase_trade_mark; }

            set
            {
                _purchase_trade_mark = value;
                RaisePropertyChanged(() => purchase_trade_mark);
            }
        }

        private int _rede_trade_mark;
        /// <summary>
        /// 赎回交易标志
        /// </summary>
        public int rede_trade_mark
        {
            get { return _rede_trade_mark; }

            set
            {
                _rede_trade_mark = value;
                RaisePropertyChanged(() => rede_trade_mark);
            }
        }

        private double _first_minimum_amt;
        /// <summary>
        /// 首次最低金额
        /// </summary>
        public double first_minimum_amt
        {
            get { return _first_minimum_amt; }

            set
            {
                _first_minimum_amt = value;
                RaisePropertyChanged(() => first_minimum_amt);
            }
        }

        private double _minimum_subscription_amt;
        /// <summary>
        /// 最低认购金额
        /// </summary>
        public double minimum_subscription_amt
        {
            get { return _minimum_subscription_amt; }

            set
            {
                _minimum_subscription_amt = value;
                RaisePropertyChanged(() => minimum_subscription_amt);
            }
        }

        private double _minimum_purchase_amt;
        /// <summary>
        /// 最低申购金额
        /// </summary>
        public double minimum_purchase_amt
        {
            get { return _minimum_purchase_amt; }

            set
            {
                _minimum_purchase_amt = value;
                RaisePropertyChanged(() => minimum_purchase_amt);
            }
        }

        private double _minimum_rede_share;
        /// <summary>
        /// 最低赎回份额
        /// </summary>
        public double minimum_rede_share
        {
            get { return _minimum_rede_share; }

            set
            {
                _minimum_rede_share = value;
                RaisePropertyChanged(() => minimum_rede_share);
            }
        }

        private double _minimum_holding_share;
        /// <summary>
        /// 最低持有份额
        /// </summary>
        public double minimum_holding_share
        {
            get { return _minimum_holding_share; }

            set
            {
                _minimum_holding_share = value;
                RaisePropertyChanged(() => minimum_holding_share);
            }
        }

        private double _minimum_turning_out_share;
        /// <summary>
        /// 最低转出份额
        /// </summary>
        public double minimum_turning_out_share
        {
            get { return _minimum_turning_out_share; }

            set
            {
                _minimum_turning_out_share = value;
                RaisePropertyChanged(() => minimum_turning_out_share);
            }
        }

        private int _rede_money_to_account_days;
        /// <summary>
        /// 赎回款到账天数
        /// </summary>
        public int rede_money_to_account_days
        {
            get { return _rede_money_to_account_days; }

            set
            {
                _rede_money_to_account_days = value;
                RaisePropertyChanged(() => rede_money_to_account_days);
            }
        }

        private String _registration_agency;
        /// <summary>
        /// 登记机构
        /// </summary>
        public String registration_agency
        {
            get { return _registration_agency; }

            set
            {
                _registration_agency = value;
                RaisePropertyChanged(() => registration_agency);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class pubL_1_146_Info : ObservableObject
    {

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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private int _fund_kind;
        /// <summary>
        /// 基金类别
        /// </summary>
        public int fund_kind
        {
            get { return _fund_kind; }

            set
            {
                _fund_kind = value;
                RaisePropertyChanged(() => fund_kind);
            }
        }

        private String _fund_manager;
        /// <summary>
        /// 基金管理人
        /// </summary>
        public String fund_manager
        {
            get { return _fund_manager; }

            set
            {
                _fund_manager = value;
                RaisePropertyChanged(() => fund_manager);
            }
        }

        private String _fund_trustee;
        /// <summary>
        /// 基金托管人
        /// </summary>
        public String fund_trustee
        {
            get { return _fund_trustee; }

            set
            {
                _fund_trustee = value;
                RaisePropertyChanged(() => fund_trustee);
            }
        }

        private double _distribution_scale;
        /// <summary>
        /// 发行规模
        /// </summary>
        public double distribution_scale
        {
            get { return _distribution_scale; }

            set
            {
                _distribution_scale = value;
                RaisePropertyChanged(() => distribution_scale);
            }
        }

        private int _charging_method;
        /// <summary>
        /// 收费方式
        /// </summary>
        public int charging_method
        {
            get { return _charging_method; }

            set
            {
                _charging_method = value;
                RaisePropertyChanged(() => charging_method);
            }
        }

        private int _default_divide_type;
        /// <summary>
        /// 默认分红方式
        /// </summary>
        public int default_divide_type
        {
            get { return _default_divide_type; }

            set
            {
                _default_divide_type = value;
                RaisePropertyChanged(() => default_divide_type);
            }
        }

        private int _fund_found_date;
        /// <summary>
        /// 基金成立日期
        /// </summary>
        public int fund_found_date
        {
            get { return _fund_found_date; }

            set
            {
                _fund_found_date = value;
                RaisePropertyChanged(() => fund_found_date);
            }
        }

        private int _fund_expire_date;
        /// <summary>
        /// 基金到期日期
        /// </summary>
        public int fund_expire_date
        {
            get { return _fund_expire_date; }

            set
            {
                _fund_expire_date = value;
                RaisePropertyChanged(() => fund_expire_date);
            }
        }

        private int _subscription_trade_mark;
        /// <summary>
        /// 认购交易标志
        /// </summary>
        public int subscription_trade_mark
        {
            get { return _subscription_trade_mark; }

            set
            {
                _subscription_trade_mark = value;
                RaisePropertyChanged(() => subscription_trade_mark);
            }
        }

        private int _purchase_trade_mark;
        /// <summary>
        /// 申购交易标志
        /// </summary>
        public int purchase_trade_mark
        {
            get { return _purchase_trade_mark; }

            set
            {
                _purchase_trade_mark = value;
                RaisePropertyChanged(() => purchase_trade_mark);
            }
        }

        private int _rede_trade_mark;
        /// <summary>
        /// 赎回交易标志
        /// </summary>
        public int rede_trade_mark
        {
            get { return _rede_trade_mark; }

            set
            {
                _rede_trade_mark = value;
                RaisePropertyChanged(() => rede_trade_mark);
            }
        }

        private double _first_minimum_amt;
        /// <summary>
        /// 首次最低金额
        /// </summary>
        public double first_minimum_amt
        {
            get { return _first_minimum_amt; }

            set
            {
                _first_minimum_amt = value;
                RaisePropertyChanged(() => first_minimum_amt);
            }
        }

        private double _minimum_subscription_amt;
        /// <summary>
        /// 最低认购金额
        /// </summary>
        public double minimum_subscription_amt
        {
            get { return _minimum_subscription_amt; }

            set
            {
                _minimum_subscription_amt = value;
                RaisePropertyChanged(() => minimum_subscription_amt);
            }
        }

        private double _minimum_purchase_amt;
        /// <summary>
        /// 最低申购金额
        /// </summary>
        public double minimum_purchase_amt
        {
            get { return _minimum_purchase_amt; }

            set
            {
                _minimum_purchase_amt = value;
                RaisePropertyChanged(() => minimum_purchase_amt);
            }
        }

        private double _minimum_rede_share;
        /// <summary>
        /// 最低赎回份额
        /// </summary>
        public double minimum_rede_share
        {
            get { return _minimum_rede_share; }

            set
            {
                _minimum_rede_share = value;
                RaisePropertyChanged(() => minimum_rede_share);
            }
        }

        private double _minimum_holding_share;
        /// <summary>
        /// 最低持有份额
        /// </summary>
        public double minimum_holding_share
        {
            get { return _minimum_holding_share; }

            set
            {
                _minimum_holding_share = value;
                RaisePropertyChanged(() => minimum_holding_share);
            }
        }

        private double _minimum_turning_out_share;
        /// <summary>
        /// 最低转出份额
        /// </summary>
        public double minimum_turning_out_share
        {
            get { return _minimum_turning_out_share; }

            set
            {
                _minimum_turning_out_share = value;
                RaisePropertyChanged(() => minimum_turning_out_share);
            }
        }

        private int _rede_money_to_account_days;
        /// <summary>
        /// 赎回款到账天数
        /// </summary>
        public int rede_money_to_account_days
        {
            get { return _rede_money_to_account_days; }

            set
            {
                _rede_money_to_account_days = value;
                RaisePropertyChanged(() => rede_money_to_account_days);
            }
        }

        private String _registration_agency;
        /// <summary>
        /// 登记机构
        /// </summary>
        public String registration_agency
        {
            get { return _registration_agency; }

            set
            {
                _registration_agency = value;
                RaisePropertyChanged(() => registration_agency);
            }
        }

        private int _time_stamp;
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp
        {
            get { return _time_stamp; }

            set
            {
                _time_stamp = value;
                RaisePropertyChanged(() => time_stamp);
            }
        }
    }

    public class pubL_1_147_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_148_Info : ObservableObject
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

        private int _opor_co_no;
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no
        {
            get { return _opor_co_no; }

            set
            {
                _opor_co_no = value;
                RaisePropertyChanged(() => opor_co_no);
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

        private String _oper_mac;
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac
        {
            get { return _oper_mac; }

            set
            {
                _oper_mac = value;
                RaisePropertyChanged(() => oper_mac);
            }
        }

        private String _oper_ip_addr;
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr
        {
            get { return _oper_ip_addr; }

            set
            {
                _oper_ip_addr = value;
                RaisePropertyChanged(() => oper_ip_addr);
            }
        }

        private String _oper_info;
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info
        {
            get { return _oper_info; }

            set
            {
                _oper_info = value;
                RaisePropertyChanged(() => oper_info);
            }
        }

        private String _oper_way;
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way
        {
            get { return _oper_way; }

            set
            {
                _oper_way = value;
                RaisePropertyChanged(() => oper_way);
            }
        }

        private int _oper_menu_no;
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no
        {
            get { return _oper_menu_no; }

            set
            {
                _oper_menu_no = value;
                RaisePropertyChanged(() => oper_menu_no);
            }
        }

        private String _oper_func_code;
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code
        {
            get { return _oper_func_code; }

            set
            {
                _oper_func_code = value;
                RaisePropertyChanged(() => oper_func_code);
            }
        }

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

        private String _jour_occur_field;
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field
        {
            get { return _jour_occur_field; }

            set
            {
                _jour_occur_field = value;
                RaisePropertyChanged(() => jour_occur_field);
            }
        }

        private String _jour_after_occur_info;
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info
        {
            get { return _jour_after_occur_info; }

            set
            {
                _jour_after_occur_info = value;
                RaisePropertyChanged(() => jour_after_occur_info);
            }
        }

        private String _oper_remark_info;
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info
        {
            get { return _oper_remark_info; }

            set
            {
                _oper_remark_info = value;
                RaisePropertyChanged(() => oper_remark_info);
            }
        }
    }

    public class pubL_1_151_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private String _trade_code;
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code
        {
            get { return _trade_code; }

            set
            {
                _trade_code = value;
                RaisePropertyChanged(() => trade_code);
            }
        }

        private String _target_code;
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code
        {
            get { return _target_code; }

            set
            {
                _target_code = value;
                RaisePropertyChanged(() => target_code);
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

        private int _trade_code_no;
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no
        {
            get { return _trade_code_no; }

            set
            {
                _trade_code_no = value;
                RaisePropertyChanged(() => trade_code_no);
            }
        }

        private int _target_code_no;
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no
        {
            get { return _target_code_no; }

            set
            {
                _target_code_no = value;
                RaisePropertyChanged(() => target_code_no);
            }
        }

        private int _apply_date;
        /// <summary>
        /// 申购日期
        /// </summary>
        public int apply_date
        {
            get { return _apply_date; }

            set
            {
                _apply_date = value;
                RaisePropertyChanged(() => apply_date);
            }
        }

        private double _apply_limit;
        /// <summary>
        /// 申购上限
        /// </summary>
        public double apply_limit
        {
            get { return _apply_limit; }

            set
            {
                _apply_limit = value;
                RaisePropertyChanged(() => apply_limit);
            }
        }

        private int _begin_trade_date;
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date
        {
            get { return _begin_trade_date; }

            set
            {
                _begin_trade_date = value;
                RaisePropertyChanged(() => begin_trade_date);
            }
        }

        private double _issue_price;
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price
        {
            get { return _issue_price; }

            set
            {
                _issue_price = value;
                RaisePropertyChanged(() => issue_price);
            }
        }

        private double _warn_trade_amount;
        /// <summary>
        /// 触警成交量
        /// </summary>
        public double warn_trade_amount
        {
            get { return _warn_trade_amount; }

            set
            {
                _warn_trade_amount = value;
                RaisePropertyChanged(() => warn_trade_amount);
            }
        }

        private double _warn_buy_amount;
        /// <summary>
        /// 触警买一数量
        /// </summary>
        public double warn_buy_amount
        {
            get { return _warn_buy_amount; }

            set
            {
                _warn_buy_amount = value;
                RaisePropertyChanged(() => warn_buy_amount);
            }
        }

        private int _warn_auto_sell;
        /// <summary>
        /// 触警是否自动卖出
        /// </summary>
        public int warn_auto_sell
        {
            get { return _warn_auto_sell; }

            set
            {
                _warn_auto_sell = value;
                RaisePropertyChanged(() => warn_auto_sell);
            }
        }

        private int _is_warn;
        /// <summary>
        /// 是否触警
        /// </summary>
        public int is_warn
        {
            get { return _is_warn; }

            set
            {
                _is_warn = value;
                RaisePropertyChanged(() => is_warn);
            }
        }

        private int _stock_open_date;
        /// <summary>
        /// 开板日期
        /// </summary>
        public int stock_open_date
        {
            get { return _stock_open_date; }

            set
            {
                _stock_open_date = value;
                RaisePropertyChanged(() => stock_open_date);
            }
        }

        private double _stock_open_price;
        /// <summary>
        /// 开板价格
        /// </summary>
        public double stock_open_price
        {
            get { return _stock_open_price; }

            set
            {
                _stock_open_price = value;
                RaisePropertyChanged(() => stock_open_price);
            }
        }

        private double _strike_qty;
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty
        {
            get { return _strike_qty; }

            set
            {
                _strike_qty = value;
                RaisePropertyChanged(() => strike_qty);
            }
        }

        private double _buy_qty_1;
        /// <summary>
        /// 买一量
        /// </summary>
        public double buy_qty_1
        {
            get { return _buy_qty_1; }

            set
            {
                _buy_qty_1 = value;
                RaisePropertyChanged(() => buy_qty_1);
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
    }

    public class pubL_1_152_Info : ObservableObject
    {
    }

    public class pubL_1_153_Info : ObservableObject
    {
    }

    public class pubL_1_154_Info : ObservableObject
    {
    }

    public class pubL_1_155_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private double _warn_trade_amount;
        /// <summary>
        /// 触警成交量
        /// </summary>
        public double warn_trade_amount
        {
            get { return _warn_trade_amount; }

            set
            {
                _warn_trade_amount = value;
                RaisePropertyChanged(() => warn_trade_amount);
            }
        }

        private double _strike_qty;
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty
        {
            get { return _strike_qty; }

            set
            {
                _strike_qty = value;
                RaisePropertyChanged(() => strike_qty);
            }
        }

        private double _warn_buy_amount;
        /// <summary>
        /// 触警买一数量
        /// </summary>
        public double warn_buy_amount
        {
            get { return _warn_buy_amount; }

            set
            {
                _warn_buy_amount = value;
                RaisePropertyChanged(() => warn_buy_amount);
            }
        }

        private double _buy_qty_1;
        /// <summary>
        /// 买一量
        /// </summary>
        public double buy_qty_1
        {
            get { return _buy_qty_1; }

            set
            {
                _buy_qty_1 = value;
                RaisePropertyChanged(() => buy_qty_1);
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
    }

    public class pubL_1_156_Info : ObservableObject
    {
    }

    public class pubL_1_157_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
            }
        }

        private String _trade_code;
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code
        {
            get { return _trade_code; }

            set
            {
                _trade_code = value;
                RaisePropertyChanged(() => trade_code);
            }
        }

        private String _target_code;
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code
        {
            get { return _target_code; }

            set
            {
                _target_code = value;
                RaisePropertyChanged(() => target_code);
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

        private int _trade_code_no;
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no
        {
            get { return _trade_code_no; }

            set
            {
                _trade_code_no = value;
                RaisePropertyChanged(() => trade_code_no);
            }
        }

        private int _target_code_no;
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no
        {
            get { return _target_code_no; }

            set
            {
                _target_code_no = value;
                RaisePropertyChanged(() => target_code_no);
            }
        }

        private int _apply_date;
        /// <summary>
        /// 申购日期
        /// </summary>
        public int apply_date
        {
            get { return _apply_date; }

            set
            {
                _apply_date = value;
                RaisePropertyChanged(() => apply_date);
            }
        }

        private double _apply_limit;
        /// <summary>
        /// 申购上限
        /// </summary>
        public double apply_limit
        {
            get { return _apply_limit; }

            set
            {
                _apply_limit = value;
                RaisePropertyChanged(() => apply_limit);
            }
        }

        private int _begin_trade_date;
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date
        {
            get { return _begin_trade_date; }

            set
            {
                _begin_trade_date = value;
                RaisePropertyChanged(() => begin_trade_date);
            }
        }

        private double _issue_price;
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price
        {
            get { return _issue_price; }

            set
            {
                _issue_price = value;
                RaisePropertyChanged(() => issue_price);
            }
        }
    }

    public class pubL_1_158_Info : ObservableObject
    {
    }

    public class pubL_1_159_Info : ObservableObject
    {
    }

    public class pubL_1_160_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
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
    }

    public class pubL_1_161_Info : ObservableObject
    {
    }

    public class pubL_1_162_Info : ObservableObject
    {
    }

    public class pubL_1_163_Info : ObservableObject
    {
    }

    public class pubL_1_164_Info : ObservableObject
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

        private double _quot_calc_unit;
        /// <summary>
        /// 行情计算单位
        /// </summary>
        public double quot_calc_unit
        {
            get { return _quot_calc_unit; }

            set
            {
                _quot_calc_unit = value;
                RaisePropertyChanged(() => quot_calc_unit);
            }
        }
    }

    public class pubL_1_165_Info : ObservableObject
    {
    }

    public class pubL_1_166_Info : ObservableObject
    {
    }

    public class pubL_1_177_Info : ObservableObject
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

        private String _stock_name;
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name
        {
            get { return _stock_name; }

            set
            {
                _stock_name = value;
                RaisePropertyChanged(() => stock_name);
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

        private double _pre_close_price;
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price
        {
            get { return _pre_close_price; }

            set
            {
                _pre_close_price = value;
                RaisePropertyChanged(() => pre_close_price);
            }
        }

        private double _today_open_price;
        /// <summary>
        /// 今开盘价
        /// </summary>
        public double today_open_price
        {
            get { return _today_open_price; }

            set
            {
                _today_open_price = value;
                RaisePropertyChanged(() => today_open_price);
            }
        }

        private double _today_close_price;
        /// <summary>
        /// 今收盘价
        /// </summary>
        public double today_close_price
        {
            get { return _today_close_price; }

            set
            {
                _today_close_price = value;
                RaisePropertyChanged(() => today_close_price);
            }
        }

        private double _today_max_price;
        /// <summary>
        /// 今最高价
        /// </summary>
        public double today_max_price
        {
            get { return _today_max_price; }

            set
            {
                _today_max_price = value;
                RaisePropertyChanged(() => today_max_price);
            }
        }

        private double _today_min_price;
        /// <summary>
        /// 今最低价
        /// </summary>
        public double today_min_price
        {
            get { return _today_min_price; }

            set
            {
                _today_min_price = value;
                RaisePropertyChanged(() => today_min_price);
            }
        }
    }

}
