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
    public partial class SecuQuotServerCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_����_֤ȯ�������_��ʼ��֤ȯ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_16_1_Request, ObservableCollection<pubL_16_1_Info>> pubL_16_1_Command
        {
            get
            {
                return new WorkCommand<pubL_16_1_Request, ObservableCollection<pubL_16_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_16_1_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ�������_����֤ȯ��������
        /// </summary>
        public IWorkCommand<pubL_16_2_Request, ObservableCollection<pubL_16_2_Info>> pubL_16_2_Command
        {
            get
            {
                return new WorkCommand<pubL_16_2_Request, ObservableCollection<pubL_16_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_16_2_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ�������_������Ч����
        /// </summary>
        public IWorkCommand<pubL_16_3_Request, ObservableCollection<pubL_16_3_Info>> pubL_16_3_Command
        {
            get
            {
                return new WorkCommand<pubL_16_3_Request, ObservableCollection<pubL_16_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_16_3_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ�������_�����������
        /// </summary>
        public IWorkCommand<pubL_16_4_Request, ObservableCollection<pubL_16_4_Info>> pubL_16_4_Command
        {
            get
            {
                return new WorkCommand<pubL_16_4_Request, ObservableCollection<pubL_16_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_16_4_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ�������_����ʵʱ����
        /// </summary>
        public IWorkCommand<pubL_16_5_Request, ObservableCollection<pubL_16_5_Info>> pubL_16_5_Command
        {
            get
            {
                return new WorkCommand<pubL_16_5_Request, ObservableCollection<pubL_16_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_16_5_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ�������_�����Ϻ���������
        /// </summary>
        public IWorkCommand<pubL_16_11_Request, ObservableCollection<pubL_16_11_Info>> pubL_16_11_Command
        {
            get
            {
                return new WorkCommand<pubL_16_11_Request, ObservableCollection<pubL_16_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_16_11_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ�������_�������ڸ�������
        /// </summary>
        public IWorkCommand<pubL_16_12_Request, ObservableCollection<pubL_16_12_Info>> pubL_16_12_Command
        {
            get
            {
                return new WorkCommand<pubL_16_12_Request, ObservableCollection<pubL_16_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_16_12_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ�������_���������������
        /// </summary>
        public IWorkCommand<pubL_16_15_Request, ObservableCollection<pubL_16_15_Info>> pubL_16_15_Command
        {
            get
            {
                return new WorkCommand<pubL_16_15_Request, ObservableCollection<pubL_16_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_16_15_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ�������_���������Ч����
        /// </summary>
        public IWorkCommand<pubL_16_16_Request, ObservableCollection<pubL_16_16_Info>> pubL_16_16_Command
        {
            get
            {
                return new WorkCommand<pubL_16_16_Request, ObservableCollection<pubL_16_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_16_16_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ�������_�̺����֤ȯ��������
        /// </summary>
        public IWorkCommand<pubL_16_17_Request, ObservableCollection<pubL_16_17_Info>> pubL_16_17_Command
        {
            get
            {
                return new WorkCommand<pubL_16_17_Request, ObservableCollection<pubL_16_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_16_17_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ�������_��������۹�����
        /// </summary>
        public IWorkCommand<pubL_16_18_Request, ObservableCollection<pubL_16_18_Info>> pubL_16_18_Command
        {
            get
            {
                return new WorkCommand<pubL_16_18_Request, ObservableCollection<pubL_16_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_16_18_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ�������_���Ժ�̨����
        /// </summary>
        public IWorkCommand<pubL_16_19_Request, ObservableCollection<pubL_16_19_Info>> pubL_16_19_Command
        {
            get
            {
                return new WorkCommand<pubL_16_19_Request, ObservableCollection<pubL_16_19_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_16_19_InfoList;
                });
            }
        }

    }
}
