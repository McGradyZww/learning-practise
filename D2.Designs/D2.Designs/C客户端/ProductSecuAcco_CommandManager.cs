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
    public partial class ProductSecuAccoCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_��Ȩ����������̨�˻�
        /// </summary>
        public IWorkCommand<pdsecuL_1_1_Request, ObservableCollection<pdsecuL_1_1_Info>> pdsecuL_1_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_1_Request, ObservableCollection<pdsecuL_1_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_��鿪��������̨�ʲ���Ԫ
        /// </summary>
        public IWorkCommand<pdsecuL_1_2_Request, ObservableCollection<pdsecuL_1_2_Info>> pdsecuL_1_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_2_Request, ObservableCollection<pdsecuL_1_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_���֤ȯ�˻�����
        /// </summary>
        public IWorkCommand<pdsecuL_1_40_Request, ObservableCollection<pdsecuL_1_40_Info>> pdsecuL_1_40_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_40_Request, ObservableCollection<pdsecuL_1_40_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_40_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_����֤ȯ�˻���Ϣ
        /// </summary>
        public IWorkCommand<pdsecuL_1_41_Request, ObservableCollection<pdsecuL_1_41_Info>> pdsecuL_1_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_41_Request, ObservableCollection<pdsecuL_1_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_�޸�֤ȯ�˻���Ϣ
        /// </summary>
        public IWorkCommand<pdsecuL_1_42_Request, ObservableCollection<pdsecuL_1_42_Info>> pdsecuL_1_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_42_Request, ObservableCollection<pdsecuL_1_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_ɾ��֤ȯ�˻���Ϣ
        /// </summary>
        public IWorkCommand<pdsecuL_1_43_Request, ObservableCollection<pdsecuL_1_43_Info>> pdsecuL_1_43_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_43_Request, ObservableCollection<pdsecuL_1_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_43_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_��ѯ֤ȯ�˻���Ϣ
        /// </summary>
        public IWorkCommand<pdsecuL_1_44_Request, ObservableCollection<pdsecuL_1_44_Info>> pdsecuL_1_44_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_44_Request, ObservableCollection<pdsecuL_1_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_44_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_��ѯ֤ȯ�˻���Ϣ��ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_1_45_Request, ObservableCollection<pdsecuL_1_45_Info>> pdsecuL_1_45_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_45_Request, ObservableCollection<pdsecuL_1_45_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_45_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_��ѯ��ʷ֤ȯ�˻���Ϣ��ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_1_46_Request, ObservableCollection<pdsecuL_1_46_Info>> pdsecuL_1_46_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_46_Request, ObservableCollection<pdsecuL_1_46_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_46_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_����֤ȯ�˻�
        /// </summary>
        public IWorkCommand<pdsecuL_1_47_Request, ObservableCollection<pdsecuL_1_47_Info>> pdsecuL_1_47_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_47_Request, ObservableCollection<pdsecuL_1_47_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_47_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_�ָ�֤ȯ�˻�
        /// </summary>
        public IWorkCommand<pdsecuL_1_48_Request, ObservableCollection<pdsecuL_1_48_Info>> pdsecuL_1_48_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_48_Request, ObservableCollection<pdsecuL_1_48_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_48_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_ע��֤ȯ�˻�
        /// </summary>
        public IWorkCommand<pdsecuL_1_49_Request, ObservableCollection<pdsecuL_1_49_Info>> pdsecuL_1_49_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_49_Request, ObservableCollection<pdsecuL_1_49_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_49_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_��ѯ֤ȯ�˻��б�
        /// </summary>
        public IWorkCommand<pdsecuL_1_51_Request, ObservableCollection<pdsecuL_1_51_Info>> pdsecuL_1_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_51_Request, ObservableCollection<pdsecuL_1_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_����֤ȯ�˻��Զ���������
        /// </summary>
        public IWorkCommand<pdsecuL_1_61_Request, ObservableCollection<pdsecuL_1_61_Info>> pdsecuL_1_61_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_61_Request, ObservableCollection<pdsecuL_1_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_61_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_�޸�֤ȯ�˻��Զ���������
        /// </summary>
        public IWorkCommand<pdsecuL_1_62_Request, ObservableCollection<pdsecuL_1_62_Info>> pdsecuL_1_62_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_62_Request, ObservableCollection<pdsecuL_1_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_62_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_ɾ��֤ȯ�˻��Զ���������
        /// </summary>
        public IWorkCommand<pdsecuL_1_63_Request, ObservableCollection<pdsecuL_1_63_Info>> pdsecuL_1_63_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_63_Request, ObservableCollection<pdsecuL_1_63_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_63_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_��ѯ֤ȯ�˻��Զ���������
        /// </summary>
        public IWorkCommand<pdsecuL_1_64_Request, ObservableCollection<pdsecuL_1_64_Info>> pdsecuL_1_64_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_64_Request, ObservableCollection<pdsecuL_1_64_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_64_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_��ѯ���������ʲ��˻�֤ȯ�˻���Ϣ
        /// </summary>
        public IWorkCommand<pdsecuL_1_501_Request, ObservableCollection<pdsecuL_1_501_Info>> pdsecuL_1_501_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_501_Request, ObservableCollection<pdsecuL_1_501_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_501_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_�����ʲ��˻��ɶ���Ϣ
        /// </summary>
        public IWorkCommand<pdsecuL_1_71_Request, ObservableCollection<pdsecuL_1_71_Info>> pdsecuL_1_71_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_71_Request, ObservableCollection<pdsecuL_1_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_71_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_ע���ʲ��˻���֤ȯ�˻�
        /// </summary>
        public IWorkCommand<pdsecuL_1_72_Request, ObservableCollection<pdsecuL_1_72_Info>> pdsecuL_1_72_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_72_Request, ObservableCollection<pdsecuL_1_72_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_72_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_����֤ȯ�˻��Զ���ع�����
        /// </summary>
        public IWorkCommand<pdsecuL_1_73_Request, ObservableCollection<pdsecuL_1_73_Info>> pdsecuL_1_73_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_73_Request, ObservableCollection<pdsecuL_1_73_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_73_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_�޸�֤ȯ�˻��Զ���ع�����
        /// </summary>
        public IWorkCommand<pdsecuL_1_74_Request, ObservableCollection<pdsecuL_1_74_Info>> pdsecuL_1_74_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_74_Request, ObservableCollection<pdsecuL_1_74_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_74_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_ɾ��֤ȯ�˻��Զ���ع�����
        /// </summary>
        public IWorkCommand<pdsecuL_1_75_Request, ObservableCollection<pdsecuL_1_75_Info>> pdsecuL_1_75_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_75_Request, ObservableCollection<pdsecuL_1_75_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_75_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_��ѯ֤ȯ�˻��Զ���ع�����
        /// </summary>
        public IWorkCommand<pdsecuL_1_76_Request, ObservableCollection<pdsecuL_1_76_Info>> pdsecuL_1_76_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_76_Request, ObservableCollection<pdsecuL_1_76_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_76_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�˻�_�޸�Ĭ�Ͻ�����ת���ʽ�ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_1_77_Request, ObservableCollection<pdsecuL_1_77_Info>> pdsecuL_1_77_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_1_77_Request, ObservableCollection<pdsecuL_1_77_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_1_77_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
