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
    public partial class ClearSecuBaseDataSyncCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_����֤ȯ_��������ͬ��_��ѯ��˾��Ϊ��
        /// </summary>
        public IWorkCommand<clsecuL_4_101_Request, ObservableCollection<clsecuL_4_101_Info>> clsecuL_4_101_Command
        {
            get
            {
                return new WorkCommand<clsecuL_4_101_Request, ObservableCollection<clsecuL_4_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_4_101_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_��������ͬ��_���¹�˾��Ϊ��
        /// </summary>
        public IWorkCommand<clsecuL_4_102_Request, ObservableCollection<clsecuL_4_102_Info>> clsecuL_4_102_Command
        {
            get
            {
                return new WorkCommand<clsecuL_4_102_Request, ObservableCollection<clsecuL_4_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_4_102_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_��������ͬ��_���¹�˾��Ϊ��Ϣ
        /// </summary>
        public IWorkCommand<clsecuL_4_103_Request, ObservableCollection<clsecuL_4_103_Info>> clsecuL_4_103_Command
        {
            get
            {
                return new WorkCommand<clsecuL_4_103_Request, ObservableCollection<clsecuL_4_103_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_4_103_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_��������ͬ��_����ծȯ�Ҹ���Ϣ
        /// </summary>
        public IWorkCommand<clsecuL_4_104_Request, ObservableCollection<clsecuL_4_104_Info>> clsecuL_4_104_Command
        {
            get
            {
                return new WorkCommand<clsecuL_4_104_Request, ObservableCollection<clsecuL_4_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_4_104_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_��������ͬ��_����ծȯ��Ϣ��Ϣ
        /// </summary>
        public IWorkCommand<clsecuL_4_105_Request, ObservableCollection<clsecuL_4_105_Info>> clsecuL_4_105_Command
        {
            get
            {
                return new WorkCommand<clsecuL_4_105_Request, ObservableCollection<clsecuL_4_105_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_4_105_InfoList;
                });
            }
        }

    }
}
