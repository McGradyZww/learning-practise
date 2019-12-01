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
    public partial class ProductSecuAccoBackCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_��ѯȫ��֤ȯ�˻�
        /// </summary>
        public IWorkCommand<pdsecuL_7_1_Request, ObservableCollection<pdsecuL_7_1_Info>> pdsecuL_7_1_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_1_Request, ObservableCollection<pdsecuL_7_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_1_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_�鵵��Ʒ֤ȯ����
        /// </summary>
        public IWorkCommand<pdsecuL_7_11_Request, ObservableCollection<pdsecuL_7_11_Info>> pdsecuL_7_11_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_11_Request, ObservableCollection<pdsecuL_7_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_11_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_��ʼ����Ʒ֤ȯ����
        /// </summary>
        public IWorkCommand<pdsecuL_7_12_Request, ObservableCollection<pdsecuL_7_12_Info>> pdsecuL_7_12_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_12_Request, ObservableCollection<pdsecuL_7_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_12_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_���¸۹�ͨ�����˼�¼
        /// </summary>
        public IWorkCommand<pdsecuL_7_13_Request, ObservableCollection<pdsecuL_7_13_Info>> pdsecuL_7_13_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_13_Request, ObservableCollection<pdsecuL_7_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_13_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_���¹�ֵ�ʲ�
        /// </summary>
        public IWorkCommand<pdsecuL_7_14_Request, ObservableCollection<pdsecuL_7_14_Info>> pdsecuL_7_14_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_14_Request, ObservableCollection<pdsecuL_7_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_14_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_���¸۹�ͨ�������
        /// </summary>
        public IWorkCommand<pdsecuL_7_15_Request, ObservableCollection<pdsecuL_7_15_Info>> pdsecuL_7_15_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_15_Request, ObservableCollection<pdsecuL_7_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_15_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_ͬ����Ʒ��Ϣ
        /// </summary>
        public IWorkCommand<pdsecuL_7_16_Request, ObservableCollection<pdsecuL_7_16_Info>> pdsecuL_7_16_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_16_Request, ObservableCollection<pdsecuL_7_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_16_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_ͬ���ʲ�����֤ȯ������Ϣ
        /// </summary>
        public IWorkCommand<pdsecuL_7_17_Request, ObservableCollection<pdsecuL_7_17_Info>> pdsecuL_7_17_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_17_Request, ObservableCollection<pdsecuL_7_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_17_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_����֤ȯ�˻���Ϣ
        /// </summary>
        public IWorkCommand<pdsecuL_7_18_Request, ObservableCollection<pdsecuL_7_18_Info>> pdsecuL_7_18_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_18_Request, ObservableCollection<pdsecuL_7_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_18_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_��ѯ֤ȯ�˻���Ϣ
        /// </summary>
        public IWorkCommand<pdsecuL_7_19_Request, ObservableCollection<pdsecuL_7_19_Info>> pdsecuL_7_19_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_19_Request, ObservableCollection<pdsecuL_7_19_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_19_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_ע���ʲ��˻���֤ȯ�˻�
        /// </summary>
        public IWorkCommand<pdsecuL_7_20_Request, ObservableCollection<pdsecuL_7_20_Info>> pdsecuL_7_20_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_20_Request, ObservableCollection<pdsecuL_7_20_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_20_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_����֤ȯ�˻�
        /// </summary>
        public IWorkCommand<pdsecuL_7_21_Request, ObservableCollection<pdsecuL_7_21_Info>> pdsecuL_7_21_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_21_Request, ObservableCollection<pdsecuL_7_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_21_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_�ָ�֤ȯ�˻�
        /// </summary>
        public IWorkCommand<pdsecuL_7_22_Request, ObservableCollection<pdsecuL_7_22_Info>> pdsecuL_7_22_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_22_Request, ObservableCollection<pdsecuL_7_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_22_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_ע��֤ȯ�˻�
        /// </summary>
        public IWorkCommand<pdsecuL_7_23_Request, ObservableCollection<pdsecuL_7_23_Info>> pdsecuL_7_23_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_23_Request, ObservableCollection<pdsecuL_7_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_23_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_�޸�֤ȯ�˻���Ϣ
        /// </summary>
        public IWorkCommand<pdsecuL_7_25_Request, ObservableCollection<pdsecuL_7_25_Info>> pdsecuL_7_25_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_25_Request, ObservableCollection<pdsecuL_7_25_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_25_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_ɾ��֤ȯ�˻���Ϣ
        /// </summary>
        public IWorkCommand<pdsecuL_7_26_Request, ObservableCollection<pdsecuL_7_26_Info>> pdsecuL_7_26_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_26_Request, ObservableCollection<pdsecuL_7_26_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_26_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻���ά_ע��������
        /// </summary>
        public IWorkCommand<pdsecuL_7_27_Request, ObservableCollection<pdsecuL_7_27_Info>> pdsecuL_7_27_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_27_Request, ObservableCollection<pdsecuL_7_27_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_27_InfoList;
                });
            }
        }

    }
}
