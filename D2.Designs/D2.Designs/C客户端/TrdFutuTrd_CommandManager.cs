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
    public partial class TrdFutuTrdCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_交易期货_交易_新增订单
        /// </summary>
        public IWorkCommand<tdfutuL_4_11_Request, ObservableCollection<tdfutuL_4_11_Info>> tdfutuL_4_11_Command
        {
            get
            {
                return new WorkCommand<tdfutuL_4_11_Request, ObservableCollection<tdfutuL_4_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdfutuL_4_11_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易期货_交易_撤销订单
        /// </summary>
        public IWorkCommand<tdfutuL_4_12_Request, ObservableCollection<tdfutuL_4_12_Info>> tdfutuL_4_12_Command
        {
            get
            {
                return new WorkCommand<tdfutuL_4_12_Request, ObservableCollection<tdfutuL_4_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdfutuL_4_12_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易期货_交易_更新订单状态
        /// </summary>
        public IWorkCommand<tdfutuL_4_21_Request, ObservableCollection<tdfutuL_4_21_Info>> tdfutuL_4_21_Command
        {
            get
            {
                return new WorkCommand<tdfutuL_4_21_Request, ObservableCollection<tdfutuL_4_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdfutuL_4_21_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易期货_交易_查询报盘订单
        /// </summary>
        public IWorkCommand<tdfutuL_4_31_Request, ObservableCollection<tdfutuL_4_31_Info>> tdfutuL_4_31_Command
        {
            get
            {
                return new WorkCommand<tdfutuL_4_31_Request, ObservableCollection<tdfutuL_4_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdfutuL_4_31_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易期货_交易_查询报盘撤单
        /// </summary>
        public IWorkCommand<tdfutuL_4_32_Request, ObservableCollection<tdfutuL_4_32_Info>> tdfutuL_4_32_Command
        {
            get
            {
                return new WorkCommand<tdfutuL_4_32_Request, ObservableCollection<tdfutuL_4_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdfutuL_4_32_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易期货_交易_查询订单
        /// </summary>
        public IWorkCommand<tdfutuL_4_101_Request, ObservableCollection<tdfutuL_4_101_Info>> tdfutuL_4_101_Command
        {
            get
            {
                return new WorkCommand<tdfutuL_4_101_Request, ObservableCollection<tdfutuL_4_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdfutuL_4_101_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易期货_交易_查询订单历史
        /// </summary>
        public IWorkCommand<tdfutuL_4_102_Request, ObservableCollection<tdfutuL_4_102_Info>> tdfutuL_4_102_Command
        {
            get
            {
                return new WorkCommand<tdfutuL_4_102_Request, ObservableCollection<tdfutuL_4_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdfutuL_4_102_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易期货_交易_查询汇总订单结果集
        /// </summary>
        public IWorkCommand<tdfutuL_4_103_Request, ObservableCollection<tdfutuL_4_103_Info>> tdfutuL_4_103_Command
        {
            get
            {
                return new WorkCommand<tdfutuL_4_103_Request, ObservableCollection<tdfutuL_4_103_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdfutuL_4_103_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易期货_交易_查询历史汇总订单结果集
        /// </summary>
        public IWorkCommand<tdfutuL_4_104_Request, ObservableCollection<tdfutuL_4_104_Info>> tdfutuL_4_104_Command
        {
            get
            {
                return new WorkCommand<tdfutuL_4_104_Request, ObservableCollection<tdfutuL_4_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdfutuL_4_104_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易期货_交易_新增改单
        /// </summary>
        public IWorkCommand<tdfutuL_4_33_Request, ObservableCollection<tdfutuL_4_33_Info>> tdfutuL_4_33_Command
        {
            get
            {
                return new WorkCommand<tdfutuL_4_33_Request, ObservableCollection<tdfutuL_4_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdfutuL_4_33_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易期货_交易_查询报盘订单主推
        /// </summary>
        public IWorkCommand<tdfutuL_4_41_Request, ObservableCollection<tdfutuL_4_41_Info>> tdfutuL_4_41_Command
        {
            get
            {
                return new WorkCommand<tdfutuL_4_41_Request, ObservableCollection<tdfutuL_4_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdfutuL_4_41_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易期货_交易_查询报盘撤单主推
        /// </summary>
        public IWorkCommand<tdfutuL_4_42_Request, ObservableCollection<tdfutuL_4_42_Info>> tdfutuL_4_42_Command
        {
            get
            {
                return new WorkCommand<tdfutuL_4_42_Request, ObservableCollection<tdfutuL_4_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdfutuL_4_42_InfoList;
                });
            }
        }

    }
}
