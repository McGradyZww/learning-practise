using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class evaL_1_1_Info : ObservableObject
    {
    }

    public class evaL_1_2_Info : ObservableObject
    {
    }

    public class evaL_1_3_Info : ObservableObject
    {
    }

    public class evaL_1_4_Info : ObservableObject
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

        private String _fina_acco_code;
        /// <summary>
        /// 科目代码
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
        /// 科目名称
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

        private int _fina_acco_level;
        /// <summary>
        /// 科目级别
        /// </summary>
        public int fina_acco_level
        {
            get { return _fina_acco_level; }

            set
            {
                _fina_acco_level = value;
                RaisePropertyChanged(() => fina_acco_level);
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

        private String _pd_asset_type_str;
        /// <summary>
        /// 产品资产类型串
        /// </summary>
        public String pd_asset_type_str
        {
            get { return _pd_asset_type_str; }

            set
            {
                _pd_asset_type_str = value;
                RaisePropertyChanged(() => pd_asset_type_str);
            }
        }

        private String _pd_fee_type_str;
        /// <summary>
        /// 产品费用类型串
        /// </summary>
        public String pd_fee_type_str
        {
            get { return _pd_fee_type_str; }

            set
            {
                _pd_fee_type_str = value;
                RaisePropertyChanged(() => pd_fee_type_str);
            }
        }
    }

    public class evaL_1_11_Info : ObservableObject
    {
    }

    public class evaL_1_12_Info : ObservableObject
    {
    }

    public class evaL_1_13_Info : ObservableObject
    {
    }

    public class evaL_1_14_Info : ObservableObject
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

        private double _pd_begin_share;
        /// <summary>
        /// 产品期初份额
        /// </summary>
        public double pd_begin_share
        {
            get { return _pd_begin_share; }

            set
            {
                _pd_begin_share = value;
                RaisePropertyChanged(() => pd_begin_share);
            }
        }

        private double _pd_curr_share;
        /// <summary>
        /// 产品当前份额
        /// </summary>
        public double pd_curr_share
        {
            get { return _pd_curr_share; }

            set
            {
                _pd_curr_share = value;
                RaisePropertyChanged(() => pd_curr_share);
            }
        }

        private String _target_pd_code;
        /// <summary>
        /// 目标产品编码
        /// </summary>
        public String target_pd_code
        {
            get { return _target_pd_code; }

            set
            {
                _target_pd_code = value;
                RaisePropertyChanged(() => target_pd_code);
            }
        }

        private String _task_status;
        /// <summary>
        /// 任务状态
        /// </summary>
        public String task_status
        {
            get { return _task_status; }

            set
            {
                _task_status = value;
                RaisePropertyChanged(() => task_status);
            }
        }

        private String _is_auto_push;
        /// <summary>
        /// 是否支持主推
        /// </summary>
        public String is_auto_push
        {
            get { return _is_auto_push; }

            set
            {
                _is_auto_push = value;
                RaisePropertyChanged(() => is_auto_push);
            }
        }

        private int _is_sync_netvalue;
        /// <summary>
        /// 是否同步净值
        /// </summary>
        public int is_sync_netvalue
        {
            get { return _is_sync_netvalue; }

            set
            {
                _is_sync_netvalue = value;
                RaisePropertyChanged(() => is_sync_netvalue);
            }
        }

        private int _unit_evalu;
        /// <summary>
        /// 单元估值
        /// </summary>
        public int unit_evalu
        {
            get { return _unit_evalu; }

            set
            {
                _unit_evalu = value;
                RaisePropertyChanged(() => unit_evalu);
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

    public class evaL_1_15_Info : ObservableObject
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

        private String _mail_server;
        /// <summary>
        /// 邮件服务器
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
        /// 服务器类型
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
        /// 邮件服务器协议
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
        /// 邮件服务器端口
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
        /// 邮件服务器用户名
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
        /// 邮件服务器密码
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
        /// SSL标志
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

        private String _send_from;
        /// <summary>
        /// 发件人
        /// </summary>
        public String send_from
        {
            get { return _send_from; }

            set
            {
                _send_from = value;
                RaisePropertyChanged(() => send_from);
            }
        }

        private String _mail_subject;
        /// <summary>
        /// 邮件标题
        /// </summary>
        public String mail_subject
        {
            get { return _mail_subject; }

            set
            {
                _mail_subject = value;
                RaisePropertyChanged(() => mail_subject);
            }
        }

        private String _netvalue_posi;
        /// <summary>
        /// 净值位置
        /// </summary>
        public String netvalue_posi
        {
            get { return _netvalue_posi; }

            set
            {
                _netvalue_posi = value;
                RaisePropertyChanged(() => netvalue_posi);
            }
        }

        private String _netvalue_date_posi;
        /// <summary>
        /// 净值日期位置
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

        private int _dateformat_type;
        /// <summary>
        /// 日期格式类型
        /// </summary>
        public int dateformat_type
        {
            get { return _dateformat_type; }

            set
            {
                _dateformat_type = value;
                RaisePropertyChanged(() => dateformat_type);
            }
        }
    }

    public class evaL_1_21_Info : ObservableObject
    {
    }

    public class evaL_1_22_Info : ObservableObject
    {
    }

    public class evaL_1_23_Info : ObservableObject
    {
    }

    public class evaL_1_24_Info : ObservableObject
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

        private int _pd_fee_type;
        /// <summary>
        /// 产品费用类型
        /// </summary>
        public int pd_fee_type
        {
            get { return _pd_fee_type; }

            set
            {
                _pd_fee_type = value;
                RaisePropertyChanged(() => pd_fee_type);
            }
        }

        private double _pd_fee_rate;
        /// <summary>
        /// 产品费用费率
        /// </summary>
        public double pd_fee_rate
        {
            get { return _pd_fee_rate; }

            set
            {
                _pd_fee_rate = value;
                RaisePropertyChanged(() => pd_fee_rate);
            }
        }

        private int _pd_fee_circle;
        /// <summary>
        /// 产品计费周期
        /// </summary>
        public int pd_fee_circle
        {
            get { return _pd_fee_circle; }

            set
            {
                _pd_fee_circle = value;
                RaisePropertyChanged(() => pd_fee_circle);
            }
        }

        private double _min_fee;
        /// <summary>
        /// 最低费用
        /// </summary>
        public double min_fee
        {
            get { return _min_fee; }

            set
            {
                _min_fee = value;
                RaisePropertyChanged(() => min_fee);
            }
        }

        private String _calc_fee_date_str;
        /// <summary>
        /// 扣费日期串
        /// </summary>
        public String calc_fee_date_str
        {
            get { return _calc_fee_date_str; }

            set
            {
                _calc_fee_date_str = value;
                RaisePropertyChanged(() => calc_fee_date_str);
            }
        }

        private int _eva_calc_type;
        /// <summary>
        /// 净值计算方式
        /// </summary>
        public int eva_calc_type
        {
            get { return _eva_calc_type; }

            set
            {
                _eva_calc_type = value;
                RaisePropertyChanged(() => eva_calc_type);
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

    public class evaL_1_31_Info : ObservableObject
    {
    }

    public class evaL_1_32_Info : ObservableObject
    {
    }

    public class evaL_1_33_Info : ObservableObject
    {
    }

    public class evaL_1_34_Info : ObservableObject
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

        private int _pd_rate_type;
        /// <summary>
        /// 产品利率类型
        /// </summary>
        public int pd_rate_type
        {
            get { return _pd_rate_type; }

            set
            {
                _pd_rate_type = value;
                RaisePropertyChanged(() => pd_rate_type);
            }
        }

        private String _asset_acco;
        /// <summary>
        /// 资产账户
        /// </summary>
        public String asset_acco
        {
            get { return _asset_acco; }

            set
            {
                _asset_acco = value;
                RaisePropertyChanged(() => asset_acco);
            }
        }

        private double _intrst_rate;
        /// <summary>
        /// 利率
        /// </summary>
        public double intrst_rate
        {
            get { return _intrst_rate; }

            set
            {
                _intrst_rate = value;
                RaisePropertyChanged(() => intrst_rate);
            }
        }

        private int _pd_fee_circle;
        /// <summary>
        /// 产品计费周期
        /// </summary>
        public int pd_fee_circle
        {
            get { return _pd_fee_circle; }

            set
            {
                _pd_fee_circle = value;
                RaisePropertyChanged(() => pd_fee_circle);
            }
        }

        private double _min_interest;
        /// <summary>
        /// 最低利息
        /// </summary>
        public double min_interest
        {
            get { return _min_interest; }

            set
            {
                _min_interest = value;
                RaisePropertyChanged(() => min_interest);
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

    public class evaL_1_41_Info : ObservableObject
    {
    }

    public class evaL_1_42_Info : ObservableObject
    {
    }

    public class evaL_1_43_Info : ObservableObject
    {
    }

    public class evaL_1_44_Info : ObservableObject
    {
    }

    public class evaL_1_45_Info : ObservableObject
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

        private int _occur_dir;
        /// <summary>
        /// 变动方向
        /// </summary>
        public int occur_dir
        {
            get { return _occur_dir; }

            set
            {
                _occur_dir = value;
                RaisePropertyChanged(() => occur_dir);
            }
        }

        private int _share_oper;
        /// <summary>
        /// 份额操作
        /// </summary>
        public int share_oper
        {
            get { return _share_oper; }

            set
            {
                _share_oper = value;
                RaisePropertyChanged(() => share_oper);
            }
        }

        private double _occur_share;
        /// <summary>
        /// 变动份额
        /// </summary>
        public double occur_share
        {
            get { return _occur_share; }

            set
            {
                _occur_share = value;
                RaisePropertyChanged(() => occur_share);
            }
        }

        private double _occur_amt;
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt
        {
            get { return _occur_amt; }

            set
            {
                _occur_amt = value;
                RaisePropertyChanged(() => occur_amt);
            }
        }

        private int _arrive_date;
        /// <summary>
        /// 到账日期
        /// </summary>
        public int arrive_date
        {
            get { return _arrive_date; }

            set
            {
                _arrive_date = value;
                RaisePropertyChanged(() => arrive_date);
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

    public class evaL_1_51_Info : ObservableObject
    {
    }

    public class evaL_1_52_Info : ObservableObject
    {
    }

    public class evaL_1_53_Info : ObservableObject
    {
    }

    public class evaL_1_54_Info : ObservableObject
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

        private int _divide_type;
        /// <summary>
        /// 分红方式
        /// </summary>
        public int divide_type
        {
            get { return _divide_type; }

            set
            {
                _divide_type = value;
                RaisePropertyChanged(() => divide_type);
            }
        }

        private double _pd_curr_share;
        /// <summary>
        /// 产品当前份额
        /// </summary>
        public double pd_curr_share
        {
            get { return _pd_curr_share; }

            set
            {
                _pd_curr_share = value;
                RaisePropertyChanged(() => pd_curr_share);
            }
        }

        private double _divi_amt;
        /// <summary>
        /// 分红金额
        /// </summary>
        public double divi_amt
        {
            get { return _divi_amt; }

            set
            {
                _divi_amt = value;
                RaisePropertyChanged(() => divi_amt);
            }
        }

        private double _unit_divi_amt;
        /// <summary>
        /// 单位分红
        /// </summary>
        public double unit_divi_amt
        {
            get { return _unit_divi_amt; }

            set
            {
                _unit_divi_amt = value;
                RaisePropertyChanged(() => unit_divi_amt);
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

    public class evaL_1_55_Info : ObservableObject
    {
    }

    public class evaL_1_56_Info : ObservableObject
    {
    }

    public class evaL_1_57_Info : ObservableObject
    {
    }

    public class evaL_1_58_Info : ObservableObject
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

        private double _vat_rate;
        /// <summary>
        /// 增值税率
        /// </summary>
        public double vat_rate
        {
            get { return _vat_rate; }

            set
            {
                _vat_rate = value;
                RaisePropertyChanged(() => vat_rate);
            }
        }

        private double _vat_add_rate;
        /// <summary>
        /// 增值税附加税率
        /// </summary>
        public double vat_add_rate
        {
            get { return _vat_add_rate; }

            set
            {
                _vat_add_rate = value;
                RaisePropertyChanged(() => vat_add_rate);
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

}
