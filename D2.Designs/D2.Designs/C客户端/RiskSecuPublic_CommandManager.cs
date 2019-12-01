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
    public partial class RiskSecuPublicCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_���֤ȯ_����_��ѯ���չ����¼
        /// </summary>
        public IWorkCommand<rksecuL_1_1_Request, ObservableCollection<rksecuL_1_1_Info>> rksecuL_1_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_1_1_Request, ObservableCollection<rksecuL_1_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_1_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_����_���ӷ�����Ŀ��¼
        /// </summary>
        public IWorkCommand<rksecuL_1_2_Request, ObservableCollection<rksecuL_1_2_Info>> rksecuL_1_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_1_2_Request, ObservableCollection<rksecuL_1_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_1_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_����_�޸ķ�����Ŀ��¼
        /// </summary>
        public IWorkCommand<rksecuL_1_3_Request, ObservableCollection<rksecuL_1_3_Info>> rksecuL_1_3_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_1_3_Request, ObservableCollection<rksecuL_1_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_1_3_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_����_ɾ��������Ŀ��¼
        /// </summary>
        public IWorkCommand<rksecuL_1_4_Request, ObservableCollection<rksecuL_1_4_Info>> rksecuL_1_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_1_4_Request, ObservableCollection<rksecuL_1_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_1_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_����_��ѯ������Ŀ��¼
        /// </summary>
        public IWorkCommand<rksecuL_1_5_Request, ObservableCollection<rksecuL_1_5_Info>> rksecuL_1_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_1_5_Request, ObservableCollection<rksecuL_1_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_1_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_����_���ӷ���ģ���¼
        /// </summary>
        public IWorkCommand<rksecuL_1_6_Request, ObservableCollection<rksecuL_1_6_Info>> rksecuL_1_6_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_1_6_Request, ObservableCollection<rksecuL_1_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_1_6_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_����_ɾ������ģ���¼
        /// </summary>
        public IWorkCommand<rksecuL_1_7_Request, ObservableCollection<rksecuL_1_7_Info>> rksecuL_1_7_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_1_7_Request, ObservableCollection<rksecuL_1_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_1_7_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_����_�޸ķ���ģ���¼
        /// </summary>
        public IWorkCommand<rksecuL_1_8_Request, ObservableCollection<rksecuL_1_8_Info>> rksecuL_1_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_1_8_Request, ObservableCollection<rksecuL_1_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_1_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_����_��ѯ����ģ���¼
        /// </summary>
        public IWorkCommand<rksecuL_1_9_Request, ObservableCollection<rksecuL_1_9_Info>> rksecuL_1_9_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_1_9_Request, ObservableCollection<rksecuL_1_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_1_9_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_����_���ӷ���ģ����Ŀ��¼
        /// </summary>
        public IWorkCommand<rksecuL_1_10_Request, ObservableCollection<rksecuL_1_10_Info>> rksecuL_1_10_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_1_10_Request, ObservableCollection<rksecuL_1_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_1_10_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_����_ɾ������ģ����Ŀ��¼
        /// </summary>
        public IWorkCommand<rksecuL_1_11_Request, ObservableCollection<rksecuL_1_11_Info>> rksecuL_1_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_1_11_Request, ObservableCollection<rksecuL_1_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_1_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_����_��ѯ����ģ����Ŀ��¼
        /// </summary>
        public IWorkCommand<rksecuL_1_12_Request, ObservableCollection<rksecuL_1_12_Info>> rksecuL_1_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_1_12_Request, ObservableCollection<rksecuL_1_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_1_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_����_���·�����Ŀ��¼���ñ�־
        /// </summary>
        public IWorkCommand<rksecuL_1_13_Request, ObservableCollection<rksecuL_1_13_Info>> rksecuL_1_13_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_1_13_Request, ObservableCollection<rksecuL_1_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_1_13_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_����_֤ȯ���ݹ���ʷ
        /// </summary>
        public IWorkCommand<rksecuL_1_14_Request, ObservableCollection<rksecuL_1_14_Info>> rksecuL_1_14_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_1_14_Request, ObservableCollection<rksecuL_1_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_1_14_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_���֤ȯ_����_��ѯ������Ŀģ���¼
        /// </summary>
        public IWorkCommand<rksecuL_1_15_Request, ObservableCollection<rksecuL_1_15_Info>> rksecuL_1_15_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_1_15_Request, ObservableCollection<rksecuL_1_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_1_15_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
