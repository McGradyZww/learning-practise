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
    public partial class ProductSecuPosiCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_�������������ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_1_Request, ObservableCollection<pdsecuL_3_1_Info>> pdsecuL_3_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_1_Request, ObservableCollection<pdsecuL_3_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_���ύ����ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_2_Request, ObservableCollection<pdsecuL_3_2_Info>> pdsecuL_3_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_2_Request, ObservableCollection<pdsecuL_3_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_ȡ�����ύ����ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_3_Request, ObservableCollection<pdsecuL_3_3_Info>> pdsecuL_3_3_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_3_Request, ObservableCollection<pdsecuL_3_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_3_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_�ⶳ������ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_4_Request, ObservableCollection<pdsecuL_3_4_Info>> pdsecuL_3_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_4_Request, ObservableCollection<pdsecuL_3_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_ȡ���ⶳ������ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_5_Request, ObservableCollection<pdsecuL_3_5_Info>> pdsecuL_3_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_5_Request, ObservableCollection<pdsecuL_3_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_����������ֲֳɱ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_6_Request, ObservableCollection<pdsecuL_3_6_Info>> pdsecuL_3_6_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_6_Request, ObservableCollection<pdsecuL_3_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_6_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ������ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_21_Request, ObservableCollection<pdsecuL_3_21_Info>> pdsecuL_3_21_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_21_Request, ObservableCollection<pdsecuL_3_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_21_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ��ʷ������ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_22_Request, ObservableCollection<pdsecuL_3_22_Info>> pdsecuL_3_22_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_22_Request, ObservableCollection<pdsecuL_3_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_22_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ������ֲ���ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_3_31_Request, ObservableCollection<pdsecuL_3_31_Info>> pdsecuL_3_31_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_31_Request, ObservableCollection<pdsecuL_3_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_31_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ��ʷ������ֲ���ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_3_32_Request, ObservableCollection<pdsecuL_3_32_Info>> pdsecuL_3_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_32_Request, ObservableCollection<pdsecuL_3_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ������ֲֶ���ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_3_34_Request, ObservableCollection<pdsecuL_3_34_Info>> pdsecuL_3_34_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_34_Request, ObservableCollection<pdsecuL_3_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_34_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ��ʷ������ֲֶ���ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_3_35_Request, ObservableCollection<pdsecuL_3_35_Info>> pdsecuL_3_35_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_35_Request, ObservableCollection<pdsecuL_3_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_35_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯծȯ��Ѻ������ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_36_Request, ObservableCollection<pdsecuL_3_36_Info>> pdsecuL_3_36_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_36_Request, ObservableCollection<pdsecuL_3_36_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_36_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯծȯת����Ѻ��Ѻ��Ϣ
        /// </summary>
        public IWorkCommand<pdsecuL_3_37_Request, ObservableCollection<pdsecuL_3_37_Info>> pdsecuL_3_37_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_37_Request, ObservableCollection<pdsecuL_3_37_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_37_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�������׼ȯ����
        /// </summary>
        public IWorkCommand<pdsecuL_3_38_Request, ObservableCollection<pdsecuL_3_38_Info>> pdsecuL_3_38_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_38_Request, ObservableCollection<pdsecuL_3_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_38_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯծȯ�ع�
        /// </summary>
        public IWorkCommand<pdsecuL_3_39_Request, ObservableCollection<pdsecuL_3_39_Info>> pdsecuL_3_39_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_39_Request, ObservableCollection<pdsecuL_3_39_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_39_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ������ծȯ��Ѻ
        /// </summary>
        public IWorkCommand<pdsecuL_3_41_Request, ObservableCollection<pdsecuL_3_41_Info>> pdsecuL_3_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_41_Request, ObservableCollection<pdsecuL_3_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��������ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_51_Request, ObservableCollection<pdsecuL_3_51_Info>> pdsecuL_3_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_51_Request, ObservableCollection<pdsecuL_3_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_�����ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_52_Request, ObservableCollection<pdsecuL_3_52_Info>> pdsecuL_3_52_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_52_Request, ObservableCollection<pdsecuL_3_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_52_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_ȡ�������ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_53_Request, ObservableCollection<pdsecuL_3_53_Info>> pdsecuL_3_53_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_53_Request, ObservableCollection<pdsecuL_3_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_53_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_�ⶳ�ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_54_Request, ObservableCollection<pdsecuL_3_54_Info>> pdsecuL_3_54_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_54_Request, ObservableCollection<pdsecuL_3_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_54_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_ȡ���ⶳ�ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_55_Request, ObservableCollection<pdsecuL_3_55_Info>> pdsecuL_3_55_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_55_Request, ObservableCollection<pdsecuL_3_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_55_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_�����ʲ��˻��ֲֳɱ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_56_Request, ObservableCollection<pdsecuL_3_56_Info>> pdsecuL_3_56_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_56_Request, ObservableCollection<pdsecuL_3_56_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_56_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_71_Request, ObservableCollection<pdsecuL_3_71_Info>> pdsecuL_3_71_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_71_Request, ObservableCollection<pdsecuL_3_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_71_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ��ʷ�ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_72_Request, ObservableCollection<pdsecuL_3_72_Info>> pdsecuL_3_72_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_72_Request, ObservableCollection<pdsecuL_3_72_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_72_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�ʲ��˻��ֲ���ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_3_81_Request, ObservableCollection<pdsecuL_3_81_Info>> pdsecuL_3_81_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_81_Request, ObservableCollection<pdsecuL_3_81_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_81_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ��ʷ�ʲ��˻��ֲ���ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_3_82_Request, ObservableCollection<pdsecuL_3_82_Info>> pdsecuL_3_82_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_82_Request, ObservableCollection<pdsecuL_3_82_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_82_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�ʲ��˻��ֲֶ���ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_3_84_Request, ObservableCollection<pdsecuL_3_84_Info>> pdsecuL_3_84_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_84_Request, ObservableCollection<pdsecuL_3_84_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_84_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ��ʷ�ʲ��˻��ֲֶ���ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_3_85_Request, ObservableCollection<pdsecuL_3_85_Info>> pdsecuL_3_85_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_85_Request, ObservableCollection<pdsecuL_3_85_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_85_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�Զ�����֤ȯ�˻��б�
        /// </summary>
        public IWorkCommand<pdsecuL_3_91_Request, ObservableCollection<pdsecuL_3_91_Info>> pdsecuL_3_91_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_91_Request, ObservableCollection<pdsecuL_3_91_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_91_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_ת���ⲿ֤ȯ�ֲּ�¼
        /// </summary>
        public IWorkCommand<pdsecuL_3_171_Request, ObservableCollection<pdsecuL_3_171_Info>> pdsecuL_3_171_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_171_Request, ObservableCollection<pdsecuL_3_171_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_171_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_����ⲿת���¼
        /// </summary>
        public IWorkCommand<pdsecuL_3_172_Request, ObservableCollection<pdsecuL_3_172_Info>> pdsecuL_3_172_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_172_Request, ObservableCollection<pdsecuL_3_172_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_172_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_ת���ⲿ��Ѻ��ϸ
        /// </summary>
        public IWorkCommand<pdsecuL_3_181_Request, ObservableCollection<pdsecuL_3_181_Info>> pdsecuL_3_181_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_181_Request, ObservableCollection<pdsecuL_3_181_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_181_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_ת���ⲿ�¹��깺���
        /// </summary>
        public IWorkCommand<pdsecuL_3_191_Request, ObservableCollection<pdsecuL_3_191_Info>> pdsecuL_3_191_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_191_Request, ObservableCollection<pdsecuL_3_191_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_191_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�¹��깺���
        /// </summary>
        public IWorkCommand<pdsecuL_3_192_Request, ObservableCollection<pdsecuL_3_192_Info>> pdsecuL_3_192_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_192_Request, ObservableCollection<pdsecuL_3_192_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_192_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_����ֲֵ����¼
        /// </summary>
        public IWorkCommand<pdsecuL_3_501_Request, ObservableCollection<pdsecuL_3_501_Info>> pdsecuL_3_501_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_501_Request, ObservableCollection<pdsecuL_3_501_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_501_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_����ֲּ�¼
        /// </summary>
        public IWorkCommand<pdsecuL_3_502_Request, ObservableCollection<pdsecuL_3_502_Info>> pdsecuL_3_502_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_502_Request, ObservableCollection<pdsecuL_3_502_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_502_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_������ֲֻ�ת
        /// </summary>
        public IWorkCommand<pdsecuL_3_503_Request, ObservableCollection<pdsecuL_3_503_Info>> pdsecuL_3_503_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_503_Request, ObservableCollection<pdsecuL_3_503_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_503_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_�޸Ĵ��ڽ��׳ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_504_Request, ObservableCollection<pdsecuL_3_504_Info>> pdsecuL_3_504_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_504_Request, ObservableCollection<pdsecuL_3_504_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_504_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_�������ڽ��׳ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_505_Request, ObservableCollection<pdsecuL_3_505_Info>> pdsecuL_3_505_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_505_Request, ObservableCollection<pdsecuL_3_505_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_505_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_ɾ�����ڽ��׳ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_506_Request, ObservableCollection<pdsecuL_3_506_Info>> pdsecuL_3_506_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_506_Request, ObservableCollection<pdsecuL_3_506_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_506_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ���ڽ��׳ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_507_Request, ObservableCollection<pdsecuL_3_507_Info>> pdsecuL_3_507_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_507_Request, ObservableCollection<pdsecuL_3_507_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_507_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ��ʷ���ڽ��׳ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_508_Request, ObservableCollection<pdsecuL_3_508_Info>> pdsecuL_3_508_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_508_Request, ObservableCollection<pdsecuL_3_508_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_508_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_�޸��ʲ��˻��ֲ��ڳ�����
        /// </summary>
        public IWorkCommand<pdsecuL_3_601_Request, ObservableCollection<pdsecuL_3_601_Info>> pdsecuL_3_601_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_601_Request, ObservableCollection<pdsecuL_3_601_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_601_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_�޸Ľ�����ֲ��ڳ�����
        /// </summary>
        public IWorkCommand<pdsecuL_3_602_Request, ObservableCollection<pdsecuL_3_602_Info>> pdsecuL_3_602_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_602_Request, ObservableCollection<pdsecuL_3_602_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_602_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_ͬ����������ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_603_Request, ObservableCollection<pdsecuL_3_603_Info>> pdsecuL_3_603_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_603_Request, ObservableCollection<pdsecuL_3_603_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_603_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_ת���ⲿ�ʲ��˻��ֲּ�¼
        /// </summary>
        public IWorkCommand<pdsecuL_3_604_Request, ObservableCollection<pdsecuL_3_604_Info>> pdsecuL_3_604_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_604_Request, ObservableCollection<pdsecuL_3_604_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_604_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_���ݲ���Ա��ѯ������ֲ�
        /// </summary>
        public IWorkCommand<pdsecuL_3_700_Request, ObservableCollection<pdsecuL_3_700_Info>> pdsecuL_3_700_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_3_700_Request, ObservableCollection<pdsecuL_3_700_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_3_700_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�ʲ��˻�����ֲֲ����¼
        /// </summary>
        public IWorkCommand<pdsecuL_3_701_Request, ObservableCollection<pdsecuL_3_701_Info>> pdsecuL_3_701_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_3_701_Request, ObservableCollection<pdsecuL_3_701_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_3_701_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_ת��ƴ����ⲿ�¹��깺���
        /// </summary>
        public IWorkCommand<pdsecuL_3_193_Request, ObservableCollection<pdsecuL_3_193_Info>> pdsecuL_3_193_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_3_193_Request, ObservableCollection<pdsecuL_3_193_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_3_193_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ֲ�_��ѯ�ƴ����¹��깺���
        /// </summary>
        public IWorkCommand<pdsecuL_3_194_Request, ObservableCollection<pdsecuL_3_194_Info>> pdsecuL_3_194_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_3_194_Request, ObservableCollection<pdsecuL_3_194_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_3_194_InfoList;
                });
            }
        }

    }
}
