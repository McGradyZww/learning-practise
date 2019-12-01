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
    public partial class ClearSecuPublicCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_����֤ȯ_����_���ݹ���ʷ
        /// </summary>
        public IWorkCommand<clsecuL_1_21_Request, ObservableCollection<clsecuL_1_21_Info>> clsecuL_1_21_Command
        {
            get
            {
                return new WorkCommand<clsecuL_1_21_Request, ObservableCollection<clsecuL_1_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_1_21_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_����׼��
        /// </summary>
        public IWorkCommand<clsecuL_1_41_Request, ObservableCollection<clsecuL_1_41_Info>> clsecuL_1_41_Command
        {
            get
            {
                return new WorkCommand<clsecuL_1_41_Request, ObservableCollection<clsecuL_1_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_1_41_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_��������ͳ��
        /// </summary>
        public IWorkCommand<clsecuL_1_42_Request, ObservableCollection<clsecuL_1_42_Info>> clsecuL_1_42_Command
        {
            get
            {
                return new WorkCommand<clsecuL_1_42_Request, ObservableCollection<clsecuL_1_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_1_42_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_��ѯ��������ͳ������
        /// </summary>
        public IWorkCommand<clsecuL_1_43_Request, ObservableCollection<clsecuL_1_43_Info>> clsecuL_1_43_Command
        {
            get
            {
                return new WorkCommand<clsecuL_1_43_Request, ObservableCollection<clsecuL_1_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_1_43_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_��鴦��������ȷ��
        /// </summary>
        public IWorkCommand<clsecuL_1_44_Request, ObservableCollection<clsecuL_1_44_Info>> clsecuL_1_44_Command
        {
            get
            {
                return new WorkCommand<clsecuL_1_44_Request, ObservableCollection<clsecuL_1_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_1_44_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_���ݹ���ʷ��ʱ����
        /// </summary>
        public IWorkCommand<clsecuL_1_51_Request, ObservableCollection<clsecuL_1_51_Info>> clsecuL_1_51_Command
        {
            get
            {
                return new WorkCommand<clsecuL_1_51_Request, ObservableCollection<clsecuL_1_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_1_51_InfoList;
                });
            }
        }

    }
}
