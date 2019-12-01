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
    public partial class ValCheckCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_独立估值_查询核对_新增估值表邮箱配置
        /// </summary>
        public IWorkCommand<valL_4_1_Request, ObservableCollection<valL_4_1_Info>> valL_4_1_Command
        {
            get
            {
                return new WorkCommand<valL_4_1_Request, ObservableCollection<valL_4_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).valL_4_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_独立估值_查询核对_修改估值表邮箱配置
        /// </summary>
        public IWorkCommand<valL_4_2_Request, ObservableCollection<valL_4_2_Info>> valL_4_2_Command
        {
            get
            {
                return new WorkCommand<valL_4_2_Request, ObservableCollection<valL_4_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).valL_4_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_独立估值_查询核对_查询估值表邮箱配置
        /// </summary>
        public IWorkCommand<valL_4_3_Request, ObservableCollection<valL_4_3_Info>> valL_4_3_Command
        {
            get
            {
                return new WorkCommand<valL_4_3_Request, ObservableCollection<valL_4_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).valL_4_3_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_独立估值_查询核对_新增托管估值表配置
        /// </summary>
        public IWorkCommand<valL_4_11_Request, ObservableCollection<valL_4_11_Info>> valL_4_11_Command
        {
            get
            {
                return new WorkCommand<valL_4_11_Request, ObservableCollection<valL_4_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).valL_4_11_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_独立估值_查询核对_修改托管估值表配置
        /// </summary>
        public IWorkCommand<valL_4_12_Request, ObservableCollection<valL_4_12_Info>> valL_4_12_Command
        {
            get
            {
                return new WorkCommand<valL_4_12_Request, ObservableCollection<valL_4_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).valL_4_12_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_独立估值_查询核对_查询托管估值表配置
        /// </summary>
        public IWorkCommand<valL_4_13_Request, ObservableCollection<valL_4_13_Info>> valL_4_13_Command
        {
            get
            {
                return new WorkCommand<valL_4_13_Request, ObservableCollection<valL_4_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).valL_4_13_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_独立估值_查询核对_新增托管估值表
        /// </summary>
        public IWorkCommand<valL_4_21_Request, ObservableCollection<valL_4_21_Info>> valL_4_21_Command
        {
            get
            {
                return new WorkCommand<valL_4_21_Request, ObservableCollection<valL_4_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).valL_4_21_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_独立估值_查询核对_查询托管估值表
        /// </summary>
        public IWorkCommand<valL_4_22_Request, ObservableCollection<valL_4_22_Info>> valL_4_22_Command
        {
            get
            {
                return new WorkCommand<valL_4_22_Request, ObservableCollection<valL_4_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).valL_4_22_InfoList;
                });
            }
        }

    }
}
