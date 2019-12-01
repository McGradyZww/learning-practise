using LdNet.ClientCore.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Model
{
    public class pubL_21_1_Info : ObservableObject
    {
    }

    public class pubL_21_2_Info : ObservableObject
    {
    }

    public class pubL_21_3_Info : ObservableObject
    {
    }

    public class pubL_21_4_Info : ObservableObject
    {
    }

    public class pubL_21_5_Info : ObservableObject
    {

        private int _role_no;
        /// <summary>
        /// 角色编号
        /// </summary>
        public int role_no
        {
            get { return _role_no; }

            set
            {
                _role_no = value;
                RaisePropertyChanged(() => role_no);
            }
        }

        private String _role_code;
        /// <summary>
        /// 角色编码
        /// </summary>
        public String role_code
        {
            get { return _role_code; }

            set
            {
                _role_code = value;
                RaisePropertyChanged(() => role_code);
            }
        }

        private String _role_name;
        /// <summary>
        /// 角色名称
        /// </summary>
        public String role_name
        {
            get { return _role_name; }

            set
            {
                _role_name = value;
                RaisePropertyChanged(() => role_name);
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

        private int _role_type;
        /// <summary>
        /// 角色类型
        /// </summary>
        public int role_type
        {
            get { return _role_type; }

            set
            {
                _role_type = value;
                RaisePropertyChanged(() => role_type);
            }
        }
    }

    public class pubL_21_13_Info : ObservableObject
    {
    }

    public class pubL_21_14_Info : ObservableObject
    {
    }

    public class pubL_21_15_Info : ObservableObject
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

        private int _role_no;
        /// <summary>
        /// 角色编号
        /// </summary>
        public int role_no
        {
            get { return _role_no; }

            set
            {
                _role_no = value;
                RaisePropertyChanged(() => role_no);
            }
        }

        private int _busi_menu_no;
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no
        {
            get { return _busi_menu_no; }

            set
            {
                _busi_menu_no = value;
                RaisePropertyChanged(() => busi_menu_no);
            }
        }

        private String _busi_func_code;
        /// <summary>
        /// 业务功能编码
        /// </summary>
        public String busi_func_code
        {
            get { return _busi_func_code; }

            set
            {
                _busi_func_code = value;
                RaisePropertyChanged(() => busi_func_code);
            }
        }
    }

    public class pubL_21_21_Info : ObservableObject
    {

        private int _role_no;
        /// <summary>
        /// 角色编号
        /// </summary>
        public int role_no
        {
            get { return _role_no; }

            set
            {
                _role_no = value;
                RaisePropertyChanged(() => role_no);
            }
        }

        private String _role_name;
        /// <summary>
        /// 角色名称
        /// </summary>
        public String role_name
        {
            get { return _role_name; }

            set
            {
                _role_name = value;
                RaisePropertyChanged(() => role_name);
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

    public class pubL_21_22_Info : ObservableObject
    {
    }

    public class pubL_21_23_Info : ObservableObject
    {
    }

    public class pubL_21_24_Info : ObservableObject
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

        private int _role_no;
        /// <summary>
        /// 角色编号
        /// </summary>
        public int role_no
        {
            get { return _role_no; }

            set
            {
                _role_no = value;
                RaisePropertyChanged(() => role_no);
            }
        }
    }

    public class pubL_21_27_Info : ObservableObject
    {
    }

    public class pubL_21_28_Info : ObservableObject
    {
    }

    public class pubL_21_29_Info : ObservableObject
    {

        private int _busi_menu_no;
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no
        {
            get { return _busi_menu_no; }

            set
            {
                _busi_menu_no = value;
                RaisePropertyChanged(() => busi_menu_no);
            }
        }
    }

    public class pubL_21_30_Info : ObservableObject
    {

        private int _busi_menu_no;
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no
        {
            get { return _busi_menu_no; }

            set
            {
                _busi_menu_no = value;
                RaisePropertyChanged(() => busi_menu_no);
            }
        }
    }

    public class pubL_21_31_Info : ObservableObject
    {

        private int _busi_menu_no;
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no
        {
            get { return _busi_menu_no; }

            set
            {
                _busi_menu_no = value;
                RaisePropertyChanged(() => busi_menu_no);
            }
        }

        private String _busi_func_code;
        /// <summary>
        /// 业务功能编码
        /// </summary>
        public String busi_func_code
        {
            get { return _busi_func_code; }

            set
            {
                _busi_func_code = value;
                RaisePropertyChanged(() => busi_func_code);
            }
        }
    }

    public class pubL_21_32_Info : ObservableObject
    {

        private int _busi_menu_no;
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no
        {
            get { return _busi_menu_no; }

            set
            {
                _busi_menu_no = value;
                RaisePropertyChanged(() => busi_menu_no);
            }
        }

        private String _busi_func_code;
        /// <summary>
        /// 业务功能编码
        /// </summary>
        public String busi_func_code
        {
            get { return _busi_func_code; }

            set
            {
                _busi_func_code = value;
                RaisePropertyChanged(() => busi_func_code);
            }
        }
    }

    public class pubL_21_33_Info : ObservableObject
    {

        private int _busi_menu_no;
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no
        {
            get { return _busi_menu_no; }

            set
            {
                _busi_menu_no = value;
                RaisePropertyChanged(() => busi_menu_no);
            }
        }

        private String _menu_name;
        /// <summary>
        /// 菜单名称
        /// </summary>
        public String menu_name
        {
            get { return _menu_name; }

            set
            {
                _menu_name = value;
                RaisePropertyChanged(() => menu_name);
            }
        }

        private int _menu_parent;
        /// <summary>
        /// 菜单所属
        /// </summary>
        public int menu_parent
        {
            get { return _menu_parent; }

            set
            {
                _menu_parent = value;
                RaisePropertyChanged(() => menu_parent);
            }
        }

        private int _menu_child;
        /// <summary>
        /// 菜单枝叶
        /// </summary>
        public int menu_child
        {
            get { return _menu_child; }

            set
            {
                _menu_child = value;
                RaisePropertyChanged(() => menu_child);
            }
        }

        private String _menu_path;
        /// <summary>
        /// 菜单路径
        /// </summary>
        public String menu_path
        {
            get { return _menu_path; }

            set
            {
                _menu_path = value;
                RaisePropertyChanged(() => menu_path);
            }
        }

        private String _menu_image;
        /// <summary>
        /// 菜单图标
        /// </summary>
        public String menu_image
        {
            get { return _menu_image; }

            set
            {
                _menu_image = value;
                RaisePropertyChanged(() => menu_image);
            }
        }
    }

    public class pubL_21_51_Info : ObservableObject
    {
    }

}
