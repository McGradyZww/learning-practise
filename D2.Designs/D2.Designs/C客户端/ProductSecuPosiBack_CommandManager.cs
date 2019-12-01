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
    public partial class ProductSecuPosiBackCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_�˶��ڲ�֤ȯ�ֲּ�¼
        /// </summary>
        public IWorkCommand<pdsecuL_9_1_Request, ObservableCollection<pdsecuL_9_1_Info>> pdsecuL_9_1_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_1_Request, ObservableCollection<pdsecuL_9_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_1_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_��ѯ�ʲ��˻�����ֲֲ����¼
        /// </summary>
        public IWorkCommand<pdsecuL_9_2_Request, ObservableCollection<pdsecuL_9_2_Info>> pdsecuL_9_2_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_2_Request, ObservableCollection<pdsecuL_9_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_2_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_�����ʲ��˻�����ֲֲ����¼
        /// </summary>
        public IWorkCommand<pdsecuL_9_3_Request, ObservableCollection<pdsecuL_9_3_Info>> pdsecuL_9_3_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_3_Request, ObservableCollection<pdsecuL_9_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_3_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_ת���ֵ�ⲿ֤ȯ�ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_9_5_Request, ObservableCollection<pdsecuL_9_5_Info>> pdsecuL_9_5_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_5_Request, ObservableCollection<pdsecuL_9_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_5_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_��ѯ��ֵ�ⲿ֤ȯ�ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_9_6_Request, ObservableCollection<pdsecuL_9_6_Info>> pdsecuL_9_6_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_6_Request, ObservableCollection<pdsecuL_9_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_6_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_��ѯ�ⲿ֤ȯ�ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_9_7_Request, ObservableCollection<pdsecuL_9_7_Info>> pdsecuL_9_7_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_7_Request, ObservableCollection<pdsecuL_9_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_7_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_ͬ���������
        /// </summary>
        public IWorkCommand<pdsecuL_9_8_Request, ObservableCollection<pdsecuL_9_8_Info>> pdsecuL_9_8_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_8_Request, ObservableCollection<pdsecuL_9_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_8_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_ͬ��ծȯ��Ѻ��������
        /// </summary>
        public IWorkCommand<pdsecuL_9_9_Request, ObservableCollection<pdsecuL_9_9_Info>> pdsecuL_9_9_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_9_Request, ObservableCollection<pdsecuL_9_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_9_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_����ⲿ�ֲּ�¼�����¼
        /// </summary>
        public IWorkCommand<pdsecuL_9_10_Request, ObservableCollection<pdsecuL_9_10_Info>> pdsecuL_9_10_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_10_Request, ObservableCollection<pdsecuL_9_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_10_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_�˶��ڲ�ծȯ��Ѻ��¼
        /// </summary>
        public IWorkCommand<pdsecuL_9_11_Request, ObservableCollection<pdsecuL_9_11_Info>> pdsecuL_9_11_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_11_Request, ObservableCollection<pdsecuL_9_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_11_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_��ѯ�ʲ��˻�����ծȯ��Ѻ�����¼
        /// </summary>
        public IWorkCommand<pdsecuL_9_12_Request, ObservableCollection<pdsecuL_9_12_Info>> pdsecuL_9_12_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_12_Request, ObservableCollection<pdsecuL_9_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_12_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_�����ʲ��˻�����ծȯ��Ѻ�����¼
        /// </summary>
        public IWorkCommand<pdsecuL_9_13_Request, ObservableCollection<pdsecuL_9_13_Info>> pdsecuL_9_13_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_13_Request, ObservableCollection<pdsecuL_9_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_13_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_����ծȯ��Ѻ��׼ȯ����
        /// </summary>
        public IWorkCommand<pdsecuL_9_31_Request, ObservableCollection<pdsecuL_9_31_Info>> pdsecuL_9_31_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_31_Request, ObservableCollection<pdsecuL_9_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_31_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_��ѯ�ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_9_71_Request, ObservableCollection<pdsecuL_9_71_Info>> pdsecuL_9_71_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_71_Request, ObservableCollection<pdsecuL_9_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_71_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_��ѯ��ʷ�ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_9_72_Request, ObservableCollection<pdsecuL_9_72_Info>> pdsecuL_9_72_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_72_Request, ObservableCollection<pdsecuL_9_72_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_72_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_��ѯ�ʲ��˻��ֲ���ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_9_81_Request, ObservableCollection<pdsecuL_9_81_Info>> pdsecuL_9_81_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_81_Request, ObservableCollection<pdsecuL_9_81_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_81_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_��ѯ��ʷ�ʲ��˻��ֲ���ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_9_82_Request, ObservableCollection<pdsecuL_9_82_Info>> pdsecuL_9_82_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_82_Request, ObservableCollection<pdsecuL_9_82_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_82_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_�Զ���������ֲֲ����¼
        /// </summary>
        public IWorkCommand<pdsecuL_9_90_Request, ObservableCollection<pdsecuL_9_90_Info>> pdsecuL_9_90_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_90_Request, ObservableCollection<pdsecuL_9_90_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_90_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_��ѯͨ������ֲֲ����¼
        /// </summary>
        public IWorkCommand<pdsecuL_9_91_Request, ObservableCollection<pdsecuL_9_91_Info>> pdsecuL_9_91_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_91_Request, ObservableCollection<pdsecuL_9_91_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_91_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_��ѯ���н�����ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_9_92_Request, ObservableCollection<pdsecuL_9_92_Info>> pdsecuL_9_92_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_92_Request, ObservableCollection<pdsecuL_9_92_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_92_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_�����ʲ��˻��ֲֳɱ�
        /// </summary>
        public IWorkCommand<pdsecuL_9_93_Request, ObservableCollection<pdsecuL_9_93_Info>> pdsecuL_9_93_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_93_Request, ObservableCollection<pdsecuL_9_93_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_93_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_�����ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_9_94_Request, ObservableCollection<pdsecuL_9_94_Info>> pdsecuL_9_94_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_94_Request, ObservableCollection<pdsecuL_9_94_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_94_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_�ⶳ�ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_9_95_Request, ObservableCollection<pdsecuL_9_95_Info>> pdsecuL_9_95_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_95_Request, ObservableCollection<pdsecuL_9_95_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_95_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_��ѯ�ʲ��˻��ֲֶ���ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_9_96_Request, ObservableCollection<pdsecuL_9_96_Info>> pdsecuL_9_96_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_96_Request, ObservableCollection<pdsecuL_9_96_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_96_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_ȡ�������ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_9_97_Request, ObservableCollection<pdsecuL_9_97_Info>> pdsecuL_9_97_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_97_Request, ObservableCollection<pdsecuL_9_97_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_97_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ���ά_ȡ���ⶳ�ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_9_98_Request, ObservableCollection<pdsecuL_9_98_Info>> pdsecuL_9_98_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_9_98_Request, ObservableCollection<pdsecuL_9_98_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_9_98_InfoList;
                });
            }
        }

    }
}
