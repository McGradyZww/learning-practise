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
    public partial class ProductCapitalCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_������Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<prodL_3_1_Request, ObservableCollection<prodL_3_1_Info>> prodL_3_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_1_Request, ObservableCollection<prodL_3_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_�۳���Ʒ����
        /// </summary>
        public IWorkCommand<prodL_3_7_Request, ObservableCollection<prodL_3_7_Info>> prodL_3_7_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_7_Request, ObservableCollection<prodL_3_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_7_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_��ѯ��Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<prodL_3_4_Request, ObservableCollection<prodL_3_4_Info>> prodL_3_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_4_Request, ObservableCollection<prodL_3_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_��ѯ��Ʒ�ʽ���ˮ
        /// </summary>
        public IWorkCommand<prodL_3_5_Request, ObservableCollection<prodL_3_5_Info>> prodL_3_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_5_Request, ObservableCollection<prodL_3_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_��ѯ��ʷ��Ʒ�ʽ���ˮ
        /// </summary>
        public IWorkCommand<prodL_3_6_Request, ObservableCollection<prodL_3_6_Info>> prodL_3_6_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_6_Request, ObservableCollection<prodL_3_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_6_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_�����Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<prodL_3_8_Request, ObservableCollection<prodL_3_8_Info>> prodL_3_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_8_Request, ObservableCollection<prodL_3_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_���²�Ʒ�ʽ��ۼ�Ӧ��Ӧ��
        /// </summary>
        public IWorkCommand<prodL_3_9_Request, ObservableCollection<prodL_3_9_Info>> prodL_3_9_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_9_Request, ObservableCollection<prodL_3_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_9_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_��ѯ��Ʒ�ʲ�
        /// </summary>
        public IWorkCommand<prodL_3_21_Request, ObservableCollection<prodL_3_21_Info>> prodL_3_21_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_21_Request, ObservableCollection<prodL_3_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_21_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_��ѯ��ʷ��Ʒ�ʲ�
        /// </summary>
        public IWorkCommand<prodL_3_22_Request, ObservableCollection<prodL_3_22_Info>> prodL_3_22_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_22_Request, ObservableCollection<prodL_3_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_22_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_���������˻��ʽ�
        /// </summary>
        public IWorkCommand<prodL_3_71_Request, ObservableCollection<prodL_3_71_Info>> prodL_3_71_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_71_Request, ObservableCollection<prodL_3_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_71_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_�޸������˻��ʽ�
        /// </summary>
        public IWorkCommand<prodL_3_72_Request, ObservableCollection<prodL_3_72_Info>> prodL_3_72_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_72_Request, ObservableCollection<prodL_3_72_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_72_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_ɾ�������˻��ʽ�
        /// </summary>
        public IWorkCommand<prodL_3_73_Request, ObservableCollection<prodL_3_73_Info>> prodL_3_73_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_73_Request, ObservableCollection<prodL_3_73_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_73_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_��ѯ�����˻��ʽ�
        /// </summary>
        public IWorkCommand<prodL_3_74_Request, ObservableCollection<prodL_3_74_Info>> prodL_3_74_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_74_Request, ObservableCollection<prodL_3_74_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_74_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_��ѯ��ʷ�����˻��ʽ�
        /// </summary>
        public IWorkCommand<prodL_3_75_Request, ObservableCollection<prodL_3_75_Info>> prodL_3_75_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_75_Request, ObservableCollection<prodL_3_75_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_75_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_��ѯ�����˻��ʽ���ˮ
        /// </summary>
        public IWorkCommand<prodL_3_76_Request, ObservableCollection<prodL_3_76_Info>> prodL_3_76_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_76_Request, ObservableCollection<prodL_3_76_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_76_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_��ѯ��ʷ�����˻��ʽ���ˮ
        /// </summary>
        public IWorkCommand<prodL_3_77_Request, ObservableCollection<prodL_3_77_Info>> prodL_3_77_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_77_Request, ObservableCollection<prodL_3_77_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_77_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ_�ʽ�_���²�Ʒ�ʲ�
        /// </summary>
        public IWorkCommand<prodL_3_900_Request, ObservableCollection<prodL_3_900_Info>> prodL_3_900_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_3_900_Request, ObservableCollection<prodL_3_900_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_3_900_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
