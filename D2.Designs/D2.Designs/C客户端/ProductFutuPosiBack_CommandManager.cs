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
    public partial class ProductFutuPosiBackCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_产品期货_持仓运维_核对内部期货持仓记录
        /// </summary>
        public IWorkCommand<pdfutuL_9_1_Request, ObservableCollection<pdfutuL_9_1_Info>> pdfutuL_9_1_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_9_1_Request, ObservableCollection<pdfutuL_9_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_9_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓运维_查询资产账户内外持仓差异记录
        /// </summary>
        public IWorkCommand<pdfutuL_9_2_Request, ObservableCollection<pdfutuL_9_2_Info>> pdfutuL_9_2_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_9_2_Request, ObservableCollection<pdfutuL_9_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_9_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓运维_处理资产账户内外持仓差异记录
        /// </summary>
        public IWorkCommand<pdfutuL_9_3_Request, ObservableCollection<pdfutuL_9_3_Info>> pdfutuL_9_3_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_9_3_Request, ObservableCollection<pdfutuL_9_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_9_3_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓运维_查询资产账户持仓
        /// </summary>
        public IWorkCommand<pdfutuL_9_71_Request, ObservableCollection<pdfutuL_9_71_Info>> pdfutuL_9_71_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_9_71_Request, ObservableCollection<pdfutuL_9_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_9_71_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓运维_查询历史资产账户持仓
        /// </summary>
        public IWorkCommand<pdfutuL_9_72_Request, ObservableCollection<pdfutuL_9_72_Info>> pdfutuL_9_72_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_9_72_Request, ObservableCollection<pdfutuL_9_72_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_9_72_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓运维_同步内外差异
        /// </summary>
        public IWorkCommand<pdfutuL_9_8_Request, ObservableCollection<pdfutuL_9_8_Info>> pdfutuL_9_8_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_9_8_Request, ObservableCollection<pdfutuL_9_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_9_8_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓运维_清除外部持仓记录差异记录
        /// </summary>
        public IWorkCommand<pdfutuL_9_9_Request, ObservableCollection<pdfutuL_9_9_Info>> pdfutuL_9_9_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_9_9_Request, ObservableCollection<pdfutuL_9_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_9_9_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓运维_查询交易组持仓
        /// </summary>
        public IWorkCommand<pdfutuL_9_73_Request, ObservableCollection<pdfutuL_9_73_Info>> pdfutuL_9_73_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_9_73_Request, ObservableCollection<pdfutuL_9_73_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_9_73_InfoList;
                });
            }
        }

    }
}
