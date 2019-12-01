using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class rksecuL_3_1_Info : ObservableObject
    {

        private int _index_no;
        /// <summary>
        /// 指数编号
        /// </summary>
        public int index_no
        {
            get { return _index_no; }

            set
            {
                _index_no = value;
                RaisePropertyChanged(() => index_no);
            }
        }

        private String _index_code;
        /// <summary>
        /// 指数编码
        /// </summary>
        public String index_code
        {
            get { return _index_code; }

            set
            {
                _index_code = value;
                RaisePropertyChanged(() => index_code);
            }
        }

        private String _index_name;
        /// <summary>
        /// 指数名称
        /// </summary>
        public String index_name
        {
            get { return _index_name; }

            set
            {
                _index_name = value;
                RaisePropertyChanged(() => index_name);
            }
        }

        private String _index_build_orgn;
        /// <summary>
        /// 指数编制机构
        /// </summary>
        public String index_build_orgn
        {
            get { return _index_build_orgn; }

            set
            {
                _index_build_orgn = value;
                RaisePropertyChanged(() => index_build_orgn);
            }
        }

        private int _weight_type;
        /// <summary>
        /// 权重类型
        /// </summary>
        public int weight_type
        {
            get { return _weight_type; }

            set
            {
                _weight_type = value;
                RaisePropertyChanged(() => weight_type);
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

    public class rksecuL_3_2_Info : ObservableObject
    {

        private int _index_no;
        /// <summary>
        /// 指数编号
        /// </summary>
        public int index_no
        {
            get { return _index_no; }

            set
            {
                _index_no = value;
                RaisePropertyChanged(() => index_no);
            }
        }

        private String _index_code;
        /// <summary>
        /// 指数编码
        /// </summary>
        public String index_code
        {
            get { return _index_code; }

            set
            {
                _index_code = value;
                RaisePropertyChanged(() => index_code);
            }
        }

        private String _index_name;
        /// <summary>
        /// 指数名称
        /// </summary>
        public String index_name
        {
            get { return _index_name; }

            set
            {
                _index_name = value;
                RaisePropertyChanged(() => index_name);
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

        private double _weight_value;
        /// <summary>
        /// 权重值
        /// </summary>
        public double weight_value
        {
            get { return _weight_value; }

            set
            {
                _weight_value = value;
                RaisePropertyChanged(() => weight_value);
            }
        }

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
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

    public class rksecuL_3_3_Info : ObservableObject
    {

        private int _indu_type_no;
        /// <summary>
        /// 行业类型编号
        /// </summary>
        public int indu_type_no
        {
            get { return _indu_type_no; }

            set
            {
                _indu_type_no = value;
                RaisePropertyChanged(() => indu_type_no);
            }
        }

        private String _indu_type_name;
        /// <summary>
        /// 行业类型名称
        /// </summary>
        public String indu_type_name
        {
            get { return _indu_type_name; }

            set
            {
                _indu_type_name = value;
                RaisePropertyChanged(() => indu_type_name);
            }
        }

        private String _indu_bulid_orgn;
        /// <summary>
        /// 行业编制机构
        /// </summary>
        public String indu_bulid_orgn
        {
            get { return _indu_bulid_orgn; }

            set
            {
                _indu_bulid_orgn = value;
                RaisePropertyChanged(() => indu_bulid_orgn);
            }
        }

        private int _indu_level_total;
        /// <summary>
        /// 行业累计层级
        /// </summary>
        public int indu_level_total
        {
            get { return _indu_level_total; }

            set
            {
                _indu_level_total = value;
                RaisePropertyChanged(() => indu_level_total);
            }
        }

        private int _weight_type;
        /// <summary>
        /// 权重类型
        /// </summary>
        public int weight_type
        {
            get { return _weight_type; }

            set
            {
                _weight_type = value;
                RaisePropertyChanged(() => weight_type);
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

    public class rksecuL_3_4_Info : ObservableObject
    {

        private int _indu_type_no;
        /// <summary>
        /// 行业类型编号
        /// </summary>
        public int indu_type_no
        {
            get { return _indu_type_no; }

            set
            {
                _indu_type_no = value;
                RaisePropertyChanged(() => indu_type_no);
            }
        }

        private String _indu_code;
        /// <summary>
        /// 行业编码
        /// </summary>
        public String indu_code
        {
            get { return _indu_code; }

            set
            {
                _indu_code = value;
                RaisePropertyChanged(() => indu_code);
            }
        }

        private String _indu_name;
        /// <summary>
        /// 行业名称
        /// </summary>
        public String indu_name
        {
            get { return _indu_name; }

            set
            {
                _indu_name = value;
                RaisePropertyChanged(() => indu_name);
            }
        }

        private int _indu_level_total;
        /// <summary>
        /// 行业累计层级
        /// </summary>
        public int indu_level_total
        {
            get { return _indu_level_total; }

            set
            {
                _indu_level_total = value;
                RaisePropertyChanged(() => indu_level_total);
            }
        }

        private int _indu_level;
        /// <summary>
        /// 行业当前层级
        /// </summary>
        public int indu_level
        {
            get { return _indu_level; }

            set
            {
                _indu_level = value;
                RaisePropertyChanged(() => indu_level);
            }
        }

        private String _highup_indu_code;
        /// <summary>
        /// 上级行业编码
        /// </summary>
        public String highup_indu_code
        {
            get { return _highup_indu_code; }

            set
            {
                _highup_indu_code = value;
                RaisePropertyChanged(() => highup_indu_code);
            }
        }

        private int _weight_type;
        /// <summary>
        /// 权重类型
        /// </summary>
        public int weight_type
        {
            get { return _weight_type; }

            set
            {
                _weight_type = value;
                RaisePropertyChanged(() => weight_type);
            }
        }

        private double _weight_value;
        /// <summary>
        /// 权重值
        /// </summary>
        public double weight_value
        {
            get { return _weight_value; }

            set
            {
                _weight_value = value;
                RaisePropertyChanged(() => weight_value);
            }
        }

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
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

    public class rksecuL_3_5_Info : ObservableObject
    {

        private int _indu_type_no;
        /// <summary>
        /// 行业类型编号
        /// </summary>
        public int indu_type_no
        {
            get { return _indu_type_no; }

            set
            {
                _indu_type_no = value;
                RaisePropertyChanged(() => indu_type_no);
            }
        }

        private String _indu_code;
        /// <summary>
        /// 行业编码
        /// </summary>
        public String indu_code
        {
            get { return _indu_code; }

            set
            {
                _indu_code = value;
                RaisePropertyChanged(() => indu_code);
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

        private double _weight_value;
        /// <summary>
        /// 权重值
        /// </summary>
        public double weight_value
        {
            get { return _weight_value; }

            set
            {
                _weight_value = value;
                RaisePropertyChanged(() => weight_value);
            }
        }

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
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

    public class rksecuL_3_6_Info : ObservableObject
    {

        private String _dime_type_code;
        /// <summary>
        /// 维度类型编码
        /// </summary>
        public String dime_type_code
        {
            get { return _dime_type_code; }

            set
            {
                _dime_type_code = value;
                RaisePropertyChanged(() => dime_type_code);
            }
        }

        private String _dime_type_name;
        /// <summary>
        /// 维度类型名称
        /// </summary>
        public String dime_type_name
        {
            get { return _dime_type_name; }

            set
            {
                _dime_type_name = value;
                RaisePropertyChanged(() => dime_type_name);
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

    public class rksecuL_3_7_Info : ObservableObject
    {

        private String _dime_type_code;
        /// <summary>
        /// 维度类型编码
        /// </summary>
        public String dime_type_code
        {
            get { return _dime_type_code; }

            set
            {
                _dime_type_code = value;
                RaisePropertyChanged(() => dime_type_code);
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

        private double _weight_value;
        /// <summary>
        /// 权重值
        /// </summary>
        public double weight_value
        {
            get { return _weight_value; }

            set
            {
                _weight_value = value;
                RaisePropertyChanged(() => weight_value);
            }
        }

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
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

    public class rksecuL_3_8_Info : ObservableObject
    {
    }

    public class rksecuL_3_9_Info : ObservableObject
    {
    }

    public class rksecuL_3_10_Info : ObservableObject
    {
    }

    public class rksecuL_3_11_Info : ObservableObject
    {

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

        private int _user_dim_type;
        /// <summary>
        /// 机构维度类型
        /// </summary>
        public int user_dim_type
        {
            get { return _user_dim_type; }

            set
            {
                _user_dim_type = value;
                RaisePropertyChanged(() => user_dim_type);
            }
        }

        private String _dime_type_code;
        /// <summary>
        /// 维度类型编码
        /// </summary>
        public String dime_type_code
        {
            get { return _dime_type_code; }

            set
            {
                _dime_type_code = value;
                RaisePropertyChanged(() => dime_type_code);
            }
        }

        private String _dime_type_name;
        /// <summary>
        /// 维度类型名称
        /// </summary>
        public String dime_type_name
        {
            get { return _dime_type_name; }

            set
            {
                _dime_type_name = value;
                RaisePropertyChanged(() => dime_type_name);
            }
        }

        private int _weight_type;
        /// <summary>
        /// 权重类型
        /// </summary>
        public int weight_type
        {
            get { return _weight_type; }

            set
            {
                _weight_type = value;
                RaisePropertyChanged(() => weight_type);
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

    public class rksecuL_3_12_Info : ObservableObject
    {
    }

    public class rksecuL_3_13_Info : ObservableObject
    {
    }

    public class rksecuL_3_14_Info : ObservableObject
    {

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

        private String _dime_type_code;
        /// <summary>
        /// 维度类型编码
        /// </summary>
        public String dime_type_code
        {
            get { return _dime_type_code; }

            set
            {
                _dime_type_code = value;
                RaisePropertyChanged(() => dime_type_code);
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

        private double _weight_value;
        /// <summary>
        /// 权重值
        /// </summary>
        public double weight_value
        {
            get { return _weight_value; }

            set
            {
                _weight_value = value;
                RaisePropertyChanged(() => weight_value);
            }
        }

        private double _weight_ratio;
        /// <summary>
        /// 权重比例
        /// </summary>
        public double weight_ratio
        {
            get { return _weight_ratio; }

            set
            {
                _weight_ratio = value;
                RaisePropertyChanged(() => weight_ratio);
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
    }

    public class rksecuL_3_15_Info : ObservableObject
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
    }

    public class rksecuL_3_16_Info : ObservableObject
    {

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
    }

    public class rksecuL_3_17_Info : ObservableObject
    {
    }

    public class rksecuL_3_24_Info : ObservableObject
    {

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

    public class rksecuL_3_25_Info : ObservableObject
    {
    }

}
