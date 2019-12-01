using LdNet.ClientSdk.Model;
using LdNet.ClientSdk.Request;
using LdNet.ClientCore.Sdk;
using LdNet.ClientCore.Threading;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Command
{
    public partial class EvaBasicCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_平台估值_基础参数_增加估值科目
        /// </summary>
        public IWorkCommand<evaL_1_1_Request, ObservableCollection<evaL_1_1_Info>> evaL_1_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_1_Request, ObservableCollection<evaL_1_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_修改估值科目
        /// </summary>
        public IWorkCommand<evaL_1_2_Request, ObservableCollection<evaL_1_2_Info>> evaL_1_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_2_Request, ObservableCollection<evaL_1_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_删除估值科目
        /// </summary>
        public IWorkCommand<evaL_1_3_Request, ObservableCollection<evaL_1_3_Info>> evaL_1_3_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_3_Request, ObservableCollection<evaL_1_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_3_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_查询估值科目
        /// </summary>
        public IWorkCommand<evaL_1_4_Request, ObservableCollection<evaL_1_4_Info>> evaL_1_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_4_Request, ObservableCollection<evaL_1_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_增加估值产品信息
        /// </summary>
        public IWorkCommand<evaL_1_11_Request, ObservableCollection<evaL_1_11_Info>> evaL_1_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_11_Request, ObservableCollection<evaL_1_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_修改估值产品信息
        /// </summary>
        public IWorkCommand<evaL_1_12_Request, ObservableCollection<evaL_1_12_Info>> evaL_1_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_12_Request, ObservableCollection<evaL_1_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_删除估值产品信息
        /// </summary>
        public IWorkCommand<evaL_1_13_Request, ObservableCollection<evaL_1_13_Info>> evaL_1_13_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_13_Request, ObservableCollection<evaL_1_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_13_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_查询估值产品信息
        /// </summary>
        public IWorkCommand<evaL_1_14_Request, ObservableCollection<evaL_1_14_Info>> evaL_1_14_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_14_Request, ObservableCollection<evaL_1_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_14_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_查询估值产品邮箱配置
        /// </summary>
        public IWorkCommand<evaL_1_15_Request, ObservableCollection<evaL_1_15_Info>> evaL_1_15_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_15_Request, ObservableCollection<evaL_1_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_15_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_增加估值产品费率
        /// </summary>
        public IWorkCommand<evaL_1_21_Request, ObservableCollection<evaL_1_21_Info>> evaL_1_21_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_21_Request, ObservableCollection<evaL_1_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_21_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_修改估值产品费率
        /// </summary>
        public IWorkCommand<evaL_1_22_Request, ObservableCollection<evaL_1_22_Info>> evaL_1_22_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_22_Request, ObservableCollection<evaL_1_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_22_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_删除估值产品费率
        /// </summary>
        public IWorkCommand<evaL_1_23_Request, ObservableCollection<evaL_1_23_Info>> evaL_1_23_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_23_Request, ObservableCollection<evaL_1_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_23_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_查询估值产品费率
        /// </summary>
        public IWorkCommand<evaL_1_24_Request, ObservableCollection<evaL_1_24_Info>> evaL_1_24_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_24_Request, ObservableCollection<evaL_1_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_24_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_增加估值产品利率
        /// </summary>
        public IWorkCommand<evaL_1_31_Request, ObservableCollection<evaL_1_31_Info>> evaL_1_31_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_31_Request, ObservableCollection<evaL_1_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_31_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_修改估值产品利率
        /// </summary>
        public IWorkCommand<evaL_1_32_Request, ObservableCollection<evaL_1_32_Info>> evaL_1_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_32_Request, ObservableCollection<evaL_1_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_删除估值产品利率
        /// </summary>
        public IWorkCommand<evaL_1_33_Request, ObservableCollection<evaL_1_33_Info>> evaL_1_33_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_33_Request, ObservableCollection<evaL_1_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_33_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_查询估值产品利率
        /// </summary>
        public IWorkCommand<evaL_1_34_Request, ObservableCollection<evaL_1_34_Info>> evaL_1_34_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_34_Request, ObservableCollection<evaL_1_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_34_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_一站式新增估值产品
        /// </summary>
        public IWorkCommand<evaL_1_41_Request, ObservableCollection<evaL_1_41_Info>> evaL_1_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_41_Request, ObservableCollection<evaL_1_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_增加估值产品份额流水
        /// </summary>
        public IWorkCommand<evaL_1_42_Request, ObservableCollection<evaL_1_42_Info>> evaL_1_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_42_Request, ObservableCollection<evaL_1_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_修改估值产品份额流水
        /// </summary>
        public IWorkCommand<evaL_1_43_Request, ObservableCollection<evaL_1_43_Info>> evaL_1_43_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_43_Request, ObservableCollection<evaL_1_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_43_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_删除估值产品份额流水
        /// </summary>
        public IWorkCommand<evaL_1_44_Request, ObservableCollection<evaL_1_44_Info>> evaL_1_44_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_44_Request, ObservableCollection<evaL_1_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_44_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_查询估值产品份额流水
        /// </summary>
        public IWorkCommand<evaL_1_45_Request, ObservableCollection<evaL_1_45_Info>> evaL_1_45_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_45_Request, ObservableCollection<evaL_1_45_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_45_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_增加估值产品累计净值配置
        /// </summary>
        public IWorkCommand<evaL_1_51_Request, ObservableCollection<evaL_1_51_Info>> evaL_1_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_51_Request, ObservableCollection<evaL_1_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_修改估值产品累计净值配置
        /// </summary>
        public IWorkCommand<evaL_1_52_Request, ObservableCollection<evaL_1_52_Info>> evaL_1_52_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_52_Request, ObservableCollection<evaL_1_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_52_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_删除估值产品累计净值配置
        /// </summary>
        public IWorkCommand<evaL_1_53_Request, ObservableCollection<evaL_1_53_Info>> evaL_1_53_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_53_Request, ObservableCollection<evaL_1_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_53_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_查询估值产品累计净值配置
        /// </summary>
        public IWorkCommand<evaL_1_54_Request, ObservableCollection<evaL_1_54_Info>> evaL_1_54_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_54_Request, ObservableCollection<evaL_1_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_54_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_增加估值产品增值税率
        /// </summary>
        public IWorkCommand<evaL_1_55_Request, ObservableCollection<evaL_1_55_Info>> evaL_1_55_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_55_Request, ObservableCollection<evaL_1_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_55_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_修改估值产品增值税率
        /// </summary>
        public IWorkCommand<evaL_1_56_Request, ObservableCollection<evaL_1_56_Info>> evaL_1_56_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_56_Request, ObservableCollection<evaL_1_56_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_56_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_删除估值产品增值税率
        /// </summary>
        public IWorkCommand<evaL_1_57_Request, ObservableCollection<evaL_1_57_Info>> evaL_1_57_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_57_Request, ObservableCollection<evaL_1_57_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_57_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_基础参数_查询估值产品增值税率
        /// </summary>
        public IWorkCommand<evaL_1_58_Request, ObservableCollection<evaL_1_58_Info>> evaL_1_58_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_1_58_Request, ObservableCollection<evaL_1_58_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_1_58_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
