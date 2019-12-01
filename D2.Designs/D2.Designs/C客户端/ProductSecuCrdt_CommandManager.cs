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
    public partial class ProductSecuCrdtCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_��Ʒ֤ȯ_������ȯ_��ѯ�ʲ��˻��ֲָ�ծ
        /// </summary>
        public IWorkCommand<pdsecuL_21_1_Request, ObservableCollection<pdsecuL_21_1_Info>> pdsecuL_21_1_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_21_1_Request, ObservableCollection<pdsecuL_21_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_21_1_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_������ȯ_��ѯ������ֲָ�ծ
        /// </summary>
        public IWorkCommand<pdsecuL_21_2_Request, ObservableCollection<pdsecuL_21_2_Info>> pdsecuL_21_2_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_21_2_Request, ObservableCollection<pdsecuL_21_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_21_2_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_������ȯ_��ѯ�������ʽ�ծ
        /// </summary>
        public IWorkCommand<pdsecuL_21_3_Request, ObservableCollection<pdsecuL_21_3_Info>> pdsecuL_21_3_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_21_3_Request, ObservableCollection<pdsecuL_21_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_21_3_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_������ȯ_��ѯ�ʲ��˻��ʽ�ծ
        /// </summary>
        public IWorkCommand<pdsecuL_21_4_Request, ObservableCollection<pdsecuL_21_4_Info>> pdsecuL_21_4_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_21_4_Request, ObservableCollection<pdsecuL_21_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_21_4_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_������ȯ_��ѯ�ʲ��˻���ծ��ϸ
        /// </summary>
        public IWorkCommand<pdsecuL_21_5_Request, ObservableCollection<pdsecuL_21_5_Info>> pdsecuL_21_5_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_21_5_Request, ObservableCollection<pdsecuL_21_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_21_5_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_������ȯ_��ѯ�����鸺ծ��ϸ
        /// </summary>
        public IWorkCommand<pdsecuL_21_6_Request, ObservableCollection<pdsecuL_21_6_Info>> pdsecuL_21_6_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_21_6_Request, ObservableCollection<pdsecuL_21_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_21_6_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_������ȯ_�鵵��Ʒ֤ȯ������ȯ����
        /// </summary>
        public IWorkCommand<pdsecuL_21_21_Request, ObservableCollection<pdsecuL_21_21_Info>> pdsecuL_21_21_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_21_21_Request, ObservableCollection<pdsecuL_21_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_21_21_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_������ȯ_��ʼ��������ȯ����
        /// </summary>
        public IWorkCommand<pdsecuL_21_22_Request, ObservableCollection<pdsecuL_21_22_Info>> pdsecuL_21_22_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_21_22_Request, ObservableCollection<pdsecuL_21_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_21_22_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_������ȯ_�������������ֲָ�ծ
        /// </summary>
        public IWorkCommand<pdsecuL_21_7_Request, ObservableCollection<pdsecuL_21_7_Info>> pdsecuL_21_7_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_21_7_Request, ObservableCollection<pdsecuL_21_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_21_7_InfoList;
                });
            }
        }

    }
}
