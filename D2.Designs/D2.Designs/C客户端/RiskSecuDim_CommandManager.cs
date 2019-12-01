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
    public partial class RiskSecuDimCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_���֤ȯ_ά��_��ѯָ������
        /// </summary>
        public IWorkCommand<rksecuL_3_1_Request, ObservableCollection<rksecuL_3_1_Info>> rksecuL_3_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_1_Request, ObservableCollection<rksecuL_3_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_��ѯָ��֤ȯ����
        /// </summary>
        public IWorkCommand<rksecuL_3_2_Request, ObservableCollection<rksecuL_3_2_Info>> rksecuL_3_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_2_Request, ObservableCollection<rksecuL_3_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_��ѯ��ҵ����
        /// </summary>
        public IWorkCommand<rksecuL_3_3_Request, ObservableCollection<rksecuL_3_3_Info>> rksecuL_3_3_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_3_Request, ObservableCollection<rksecuL_3_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_3_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_��ѯ��ҵ�㼶
        /// </summary>
        public IWorkCommand<rksecuL_3_4_Request, ObservableCollection<rksecuL_3_4_Info>> rksecuL_3_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_4_Request, ObservableCollection<rksecuL_3_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_��ѯ��ҵ֤ȯ����
        /// </summary>
        public IWorkCommand<rksecuL_3_5_Request, ObservableCollection<rksecuL_3_5_Info>> rksecuL_3_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_5_Request, ObservableCollection<rksecuL_3_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_��ѯ�Զ���ά������
        /// </summary>
        public IWorkCommand<rksecuL_3_6_Request, ObservableCollection<rksecuL_3_6_Info>> rksecuL_3_6_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_6_Request, ObservableCollection<rksecuL_3_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_6_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_��ѯ�Զ���ά��֤ȯ����
        /// </summary>
        public IWorkCommand<rksecuL_3_7_Request, ObservableCollection<rksecuL_3_7_Info>> rksecuL_3_7_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_7_Request, ObservableCollection<rksecuL_3_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_7_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_��������ά������
        /// </summary>
        public IWorkCommand<rksecuL_3_8_Request, ObservableCollection<rksecuL_3_8_Info>> rksecuL_3_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_8_Request, ObservableCollection<rksecuL_3_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_�޸Ļ���ά������
        /// </summary>
        public IWorkCommand<rksecuL_3_9_Request, ObservableCollection<rksecuL_3_9_Info>> rksecuL_3_9_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_9_Request, ObservableCollection<rksecuL_3_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_9_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_ɾ������ά������
        /// </summary>
        public IWorkCommand<rksecuL_3_10_Request, ObservableCollection<rksecuL_3_10_Info>> rksecuL_3_10_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_10_Request, ObservableCollection<rksecuL_3_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_10_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_��ѯ����ά������
        /// </summary>
        public IWorkCommand<rksecuL_3_11_Request, ObservableCollection<rksecuL_3_11_Info>> rksecuL_3_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_11_Request, ObservableCollection<rksecuL_3_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_��������ά��֤ȯ����
        /// </summary>
        public IWorkCommand<rksecuL_3_12_Request, ObservableCollection<rksecuL_3_12_Info>> rksecuL_3_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_12_Request, ObservableCollection<rksecuL_3_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_ɾ������ά��֤ȯ����
        /// </summary>
        public IWorkCommand<rksecuL_3_13_Request, ObservableCollection<rksecuL_3_13_Info>> rksecuL_3_13_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_13_Request, ObservableCollection<rksecuL_3_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_13_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_��ѯ����ά��֤ȯ����
        /// </summary>
        public IWorkCommand<rksecuL_3_14_Request, ObservableCollection<rksecuL_3_14_Info>> rksecuL_3_14_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_14_Request, ObservableCollection<rksecuL_3_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_14_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_ά����Ż�ȡά�ȱ���
        /// </summary>
        public IWorkCommand<rksecuL_3_15_Request, ObservableCollection<rksecuL_3_15_Info>> rksecuL_3_15_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_15_Request, ObservableCollection<rksecuL_3_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_15_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_ά�ȱ����ȡά�����
        /// </summary>
        public IWorkCommand<rksecuL_3_16_Request, ObservableCollection<rksecuL_3_16_Info>> rksecuL_3_16_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_16_Request, ObservableCollection<rksecuL_3_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_16_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_�����Զ���ά�ȴ���
        /// </summary>
        public IWorkCommand<rksecuL_3_17_Request, ObservableCollection<rksecuL_3_17_Info>> rksecuL_3_17_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_3_17_Request, ObservableCollection<rksecuL_3_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_3_17_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_��ѯ֤ȯ�����Ʊ��
        /// </summary>
        public IWorkCommand<rksecuL_3_24_Request, ObservableCollection<rksecuL_3_24_Info>> rksecuL_3_24_Command
        {
            get
            {
                return new WorkCommand<rksecuL_3_24_Request, ObservableCollection<rksecuL_3_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rksecuL_3_24_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_ά��_��ղ�����ָ��֤ȯ����
        /// </summary>
        public IWorkCommand<rksecuL_3_25_Request, ObservableCollection<rksecuL_3_25_Info>> rksecuL_3_25_Command
        {
            get
            {
                return new WorkCommand<rksecuL_3_25_Request, ObservableCollection<rksecuL_3_25_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rksecuL_3_25_InfoList;
                });
            }
        }

    }
}
