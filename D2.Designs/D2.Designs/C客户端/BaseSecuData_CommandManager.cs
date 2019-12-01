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
    public partial class BaseSecuDataCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ֤ȯģ��
        /// </summary>
        public IWorkCommand<pubL_1_6_Request, ObservableCollection<pubL_1_6_Info>> pubL_1_6_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_6_Request, ObservableCollection<pubL_1_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_6_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_�޸�֤ȯ����
        /// </summary>
        public IWorkCommand<pubL_1_12_Request, ObservableCollection<pubL_1_12_Info>> pubL_1_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_12_Request, ObservableCollection<pubL_1_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ֤ȯ����
        /// </summary>
        public IWorkCommand<pubL_1_14_Request, ObservableCollection<pubL_1_14_Info>> pubL_1_14_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_14_Request, ObservableCollection<pubL_1_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_14_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ֤ȯ������ˮ
        /// </summary>
        public IWorkCommand<pubL_1_15_Request, ObservableCollection<pubL_1_15_Info>> pubL_1_15_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_15_Request, ObservableCollection<pubL_1_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_15_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ��ʷ֤ȯ������ˮ
        /// </summary>
        public IWorkCommand<pubL_1_16_Request, ObservableCollection<pubL_1_16_Info>> pubL_1_16_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_16_Request, ObservableCollection<pubL_1_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_16_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ֤ȯ���Ͷ�������
        /// </summary>
        public IWorkCommand<pubL_1_24_Request, ObservableCollection<pubL_1_24_Info>> pubL_1_24_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_24_Request, ObservableCollection<pubL_1_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_24_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_����֤ȯ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_41_Request, ObservableCollection<pubL_1_41_Info>> pubL_1_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_41_Request, ObservableCollection<pubL_1_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_�޸�֤ȯ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_42_Request, ObservableCollection<pubL_1_42_Info>> pubL_1_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_42_Request, ObservableCollection<pubL_1_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ֤ȯ��Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_43_Request, ObservableCollection<pubL_1_43_Info>> pubL_1_43_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_43_Request, ObservableCollection<pubL_1_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_43_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ֤ȯ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_44_Request, ObservableCollection<pubL_1_44_Info>> pubL_1_44_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_44_Request, ObservableCollection<pubL_1_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_44_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ֤ȯ������Ϣ��ˮ
        /// </summary>
        public IWorkCommand<pubL_1_45_Request, ObservableCollection<pubL_1_45_Info>> pubL_1_45_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_45_Request, ObservableCollection<pubL_1_45_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_45_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ��ʷ֤ȯ������Ϣ��ˮ
        /// </summary>
        public IWorkCommand<pubL_1_46_Request, ObservableCollection<pubL_1_46_Info>> pubL_1_46_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_46_Request, ObservableCollection<pubL_1_46_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_46_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ֤ȯ�����б�
        /// </summary>
        public IWorkCommand<pubL_1_47_Request, ObservableCollection<pubL_1_47_Info>> pubL_1_47_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_47_Request, ObservableCollection<pubL_1_47_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_47_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ�ͻ���֤ȯ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_49_Request, ObservableCollection<pubL_1_49_Info>> pubL_1_49_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_49_Request, ObservableCollection<pubL_1_49_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_49_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_����֤ȯ���붩������
        /// </summary>
        public IWorkCommand<pubL_1_51_Request, ObservableCollection<pubL_1_51_Info>> pubL_1_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_51_Request, ObservableCollection<pubL_1_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_�޸�֤ȯ���붩������
        /// </summary>
        public IWorkCommand<pubL_1_52_Request, ObservableCollection<pubL_1_52_Info>> pubL_1_52_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_52_Request, ObservableCollection<pubL_1_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_52_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_ɾ��֤ȯ���붩������
        /// </summary>
        public IWorkCommand<pubL_1_53_Request, ObservableCollection<pubL_1_53_Info>> pubL_1_53_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_53_Request, ObservableCollection<pubL_1_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_53_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ֤ȯ���붩������
        /// </summary>
        public IWorkCommand<pubL_1_54_Request, ObservableCollection<pubL_1_54_Info>> pubL_1_54_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_54_Request, ObservableCollection<pubL_1_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_54_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ֤ȯ���붩��������ˮ
        /// </summary>
        public IWorkCommand<pubL_1_55_Request, ObservableCollection<pubL_1_55_Info>> pubL_1_55_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_55_Request, ObservableCollection<pubL_1_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_55_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ��ʷ֤ȯ���붩��������ˮ
        /// </summary>
        public IWorkCommand<pubL_1_56_Request, ObservableCollection<pubL_1_56_Info>> pubL_1_56_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_56_Request, ObservableCollection<pubL_1_56_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_56_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_����֤ȯ����ӳ��
        /// </summary>
        public IWorkCommand<pubL_1_61_Request, ObservableCollection<pubL_1_61_Info>> pubL_1_61_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_61_Request, ObservableCollection<pubL_1_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_61_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_�޸�֤ȯ����ӳ��
        /// </summary>
        public IWorkCommand<pubL_1_62_Request, ObservableCollection<pubL_1_62_Info>> pubL_1_62_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_62_Request, ObservableCollection<pubL_1_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_62_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_ɾ��֤ȯ����ӳ��
        /// </summary>
        public IWorkCommand<pubL_1_63_Request, ObservableCollection<pubL_1_63_Info>> pubL_1_63_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_63_Request, ObservableCollection<pubL_1_63_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_63_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ֤ȯ����ӳ��
        /// </summary>
        public IWorkCommand<pubL_1_64_Request, ObservableCollection<pubL_1_64_Info>> pubL_1_64_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_64_Request, ObservableCollection<pubL_1_64_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_64_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ֤ȯ����ӳ����ˮ
        /// </summary>
        public IWorkCommand<pubL_1_65_Request, ObservableCollection<pubL_1_65_Info>> pubL_1_65_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_65_Request, ObservableCollection<pubL_1_65_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_65_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ��ʷ֤ȯ����ӳ����ˮ
        /// </summary>
        public IWorkCommand<pubL_1_66_Request, ObservableCollection<pubL_1_66_Info>> pubL_1_66_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_66_Request, ObservableCollection<pubL_1_66_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_66_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ�¹���Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_34_Request, ObservableCollection<pubL_1_34_Info>> pubL_1_34_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_34_Request, ObservableCollection<pubL_1_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_34_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ�����¹���Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_35_Request, ObservableCollection<pubL_1_35_Info>> pubL_1_35_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_35_Request, ObservableCollection<pubL_1_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_35_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ��תծ��Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_36_Request, ObservableCollection<pubL_1_36_Info>> pubL_1_36_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_36_Request, ObservableCollection<pubL_1_36_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_36_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ���տ�תծ��Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_37_Request, ObservableCollection<pubL_1_37_Info>> pubL_1_37_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_37_Request, ObservableCollection<pubL_1_37_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_37_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_����֤ȯ����
        /// </summary>
        public IWorkCommand<pubL_1_71_Request, ObservableCollection<pubL_1_71_Info>> pubL_1_71_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_71_Request, ObservableCollection<pubL_1_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_71_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_�޸�֤ȯ����
        /// </summary>
        public IWorkCommand<pubL_1_72_Request, ObservableCollection<pubL_1_72_Info>> pubL_1_72_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_72_Request, ObservableCollection<pubL_1_72_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_72_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_ɾ��֤ȯ����
        /// </summary>
        public IWorkCommand<pubL_1_73_Request, ObservableCollection<pubL_1_73_Info>> pubL_1_73_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_73_Request, ObservableCollection<pubL_1_73_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_73_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ֤ȯ����
        /// </summary>
        public IWorkCommand<pubL_1_74_Request, ObservableCollection<pubL_1_74_Info>> pubL_1_74_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_74_Request, ObservableCollection<pubL_1_74_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_74_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_������ȡ֤ȯ����
        /// </summary>
        public IWorkCommand<pubL_1_77_Request, ObservableCollection<pubL_1_77_Info>> pubL_1_77_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_77_Request, ObservableCollection<pubL_1_77_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_77_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ȡ֤ȯ����
        /// </summary>
        public IWorkCommand<pubL_1_78_Request, ObservableCollection<pubL_1_78_Info>> pubL_1_78_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_78_Request, ObservableCollection<pubL_1_78_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_78_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ֤ȯ������ˮ
        /// </summary>
        public IWorkCommand<pubL_1_75_Request, ObservableCollection<pubL_1_75_Info>> pubL_1_75_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_75_Request, ObservableCollection<pubL_1_75_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_75_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ��ʷ֤ȯ������ˮ
        /// </summary>
        public IWorkCommand<pubL_1_76_Request, ObservableCollection<pubL_1_76_Info>> pubL_1_76_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_76_Request, ObservableCollection<pubL_1_76_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_76_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_֤ȯ����鵵��ʱ����
        /// </summary>
        public IWorkCommand<pubL_1_79_Request, ObservableCollection<pubL_1_79_Info>> pubL_1_79_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_79_Request, ObservableCollection<pubL_1_79_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_79_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_����ծȯ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_81_Request, ObservableCollection<pubL_1_81_Info>> pubL_1_81_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_81_Request, ObservableCollection<pubL_1_81_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_81_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_�޸�ծȯ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_82_Request, ObservableCollection<pubL_1_82_Info>> pubL_1_82_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_82_Request, ObservableCollection<pubL_1_82_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_82_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_ɾ��ծȯ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_83_Request, ObservableCollection<pubL_1_83_Info>> pubL_1_83_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_83_Request, ObservableCollection<pubL_1_83_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_83_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯծȯ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_84_Request, ObservableCollection<pubL_1_84_Info>> pubL_1_84_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_84_Request, ObservableCollection<pubL_1_84_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_84_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ȡծȯ����
        /// </summary>
        public IWorkCommand<pubL_1_88_Request, ObservableCollection<pubL_1_88_Info>> pubL_1_88_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_88_Request, ObservableCollection<pubL_1_88_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_88_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯծȯ������ˮ
        /// </summary>
        public IWorkCommand<pubL_1_85_Request, ObservableCollection<pubL_1_85_Info>> pubL_1_85_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_85_Request, ObservableCollection<pubL_1_85_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_85_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ��ʷծȯ������ˮ
        /// </summary>
        public IWorkCommand<pubL_1_86_Request, ObservableCollection<pubL_1_86_Info>> pubL_1_86_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_86_Request, ObservableCollection<pubL_1_86_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_86_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯծȯ��Ѻ��Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_87_Request, ObservableCollection<pubL_1_87_Info>> pubL_1_87_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_87_Request, ObservableCollection<pubL_1_87_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_87_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_����ծȯ����
        /// </summary>
        public IWorkCommand<pubL_1_91_Request, ObservableCollection<pubL_1_91_Info>> pubL_1_91_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_91_Request, ObservableCollection<pubL_1_91_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_91_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_�޸�ծȯ����
        /// </summary>
        public IWorkCommand<pubL_1_92_Request, ObservableCollection<pubL_1_92_Info>> pubL_1_92_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_92_Request, ObservableCollection<pubL_1_92_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_92_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_ɾ��ծȯ����
        /// </summary>
        public IWorkCommand<pubL_1_93_Request, ObservableCollection<pubL_1_93_Info>> pubL_1_93_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_93_Request, ObservableCollection<pubL_1_93_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_93_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯծȯ����
        /// </summary>
        public IWorkCommand<pubL_1_94_Request, ObservableCollection<pubL_1_94_Info>> pubL_1_94_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_94_Request, ObservableCollection<pubL_1_94_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_94_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯծȯ������ˮ
        /// </summary>
        public IWorkCommand<pubL_1_95_Request, ObservableCollection<pubL_1_95_Info>> pubL_1_95_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_95_Request, ObservableCollection<pubL_1_95_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_95_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ��ʷծȯ������ˮ
        /// </summary>
        public IWorkCommand<pubL_1_96_Request, ObservableCollection<pubL_1_96_Info>> pubL_1_96_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_96_Request, ObservableCollection<pubL_1_96_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_96_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_����ծȯ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_101_Request, ObservableCollection<pubL_1_101_Info>> pubL_1_101_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_101_Request, ObservableCollection<pubL_1_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_101_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_�޸�ծȯ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_102_Request, ObservableCollection<pubL_1_102_Info>> pubL_1_102_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_102_Request, ObservableCollection<pubL_1_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_102_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_ɾ��ծȯ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_103_Request, ObservableCollection<pubL_1_103_Info>> pubL_1_103_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_103_Request, ObservableCollection<pubL_1_103_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_103_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯծȯ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_104_Request, ObservableCollection<pubL_1_104_Info>> pubL_1_104_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_104_Request, ObservableCollection<pubL_1_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_104_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯծȯ������ˮ
        /// </summary>
        public IWorkCommand<pubL_1_105_Request, ObservableCollection<pubL_1_105_Info>> pubL_1_105_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_105_Request, ObservableCollection<pubL_1_105_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_105_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ��ʷծȯ������ˮ
        /// </summary>
        public IWorkCommand<pubL_1_106_Request, ObservableCollection<pubL_1_106_Info>> pubL_1_106_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_106_Request, ObservableCollection<pubL_1_106_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_106_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ�ع�������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_130_Request, ObservableCollection<pubL_1_130_Info>> pubL_1_130_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_130_Request, ObservableCollection<pubL_1_130_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_130_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ع���ȡ���������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_131_Request, ObservableCollection<pubL_1_131_Info>> pubL_1_131_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_131_Request, ObservableCollection<pubL_1_131_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_131_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ�۹ɼ�λ
        /// </summary>
        public IWorkCommand<pubL_1_140_Request, ObservableCollection<pubL_1_140_Info>> pubL_1_140_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_140_Request, ObservableCollection<pubL_1_140_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_140_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��Ż�ȡ֤ȯ��Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_141_Request, ObservableCollection<pubL_1_141_Info>> pubL_1_141_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_141_Request, ObservableCollection<pubL_1_141_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_141_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��������������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_142_Request, ObservableCollection<pubL_1_142_Info>> pubL_1_142_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_142_Request, ObservableCollection<pubL_1_142_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_142_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_�޸Ļ���������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_143_Request, ObservableCollection<pubL_1_143_Info>> pubL_1_143_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_143_Request, ObservableCollection<pubL_1_143_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_143_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_ɾ������������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_144_Request, ObservableCollection<pubL_1_144_Info>> pubL_1_144_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_144_Request, ObservableCollection<pubL_1_144_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_144_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ����������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_145_Request, ObservableCollection<pubL_1_145_Info>> pubL_1_145_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_145_Request, ObservableCollection<pubL_1_145_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_145_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ȡ��������
        /// </summary>
        public IWorkCommand<pubL_1_146_Request, ObservableCollection<pubL_1_146_Info>> pubL_1_146_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_146_Request, ObservableCollection<pubL_1_146_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_146_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ����������ˮ
        /// </summary>
        public IWorkCommand<pubL_1_147_Request, ObservableCollection<pubL_1_147_Info>> pubL_1_147_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_147_Request, ObservableCollection<pubL_1_147_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_147_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ��ʷ����������ˮ
        /// </summary>
        public IWorkCommand<pubL_1_148_Request, ObservableCollection<pubL_1_148_Info>> pubL_1_148_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_148_Request, ObservableCollection<pubL_1_148_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_148_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ�¹ɿ�������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_151_Request, ObservableCollection<pubL_1_151_Info>> pubL_1_151_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_151_Request, ObservableCollection<pubL_1_151_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_151_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_�����¹ɿ�������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_152_Request, ObservableCollection<pubL_1_152_Info>> pubL_1_152_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_152_Request, ObservableCollection<pubL_1_152_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_152_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_�޸��¹ɿ�������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_153_Request, ObservableCollection<pubL_1_153_Info>> pubL_1_153_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_153_Request, ObservableCollection<pubL_1_153_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_153_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_ɾ���¹ɿ�������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_154_Request, ObservableCollection<pubL_1_154_Info>> pubL_1_154_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_154_Request, ObservableCollection<pubL_1_154_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_154_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ�����¹���Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_155_Request, ObservableCollection<pubL_1_155_Info>> pubL_1_155_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_155_Request, ObservableCollection<pubL_1_155_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_155_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_�����¹ɴ�����Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_156_Request, ObservableCollection<pubL_1_156_Info>> pubL_1_156_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_156_Request, ObservableCollection<pubL_1_156_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_156_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ�����¹���Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_157_Request, ObservableCollection<pubL_1_157_Info>> pubL_1_157_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_157_Request, ObservableCollection<pubL_1_157_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_157_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_���������Ʒ���չ�ϵ
        /// </summary>
        public IWorkCommand<pubL_1_158_Request, ObservableCollection<pubL_1_158_Info>> pubL_1_158_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_158_Request, ObservableCollection<pubL_1_158_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_158_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_�޸Ļ����Ʒ���չ�ϵ
        /// </summary>
        public IWorkCommand<pubL_1_159_Request, ObservableCollection<pubL_1_159_Info>> pubL_1_159_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_159_Request, ObservableCollection<pubL_1_159_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_159_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ�����Ʒ���չ�ϵ
        /// </summary>
        public IWorkCommand<pubL_1_160_Request, ObservableCollection<pubL_1_160_Info>> pubL_1_160_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_160_Request, ObservableCollection<pubL_1_160_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_160_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_���»����Ʒ����
        /// </summary>
        public IWorkCommand<pubL_1_161_Request, ObservableCollection<pubL_1_161_Info>> pubL_1_161_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_161_Request, ObservableCollection<pubL_1_161_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_161_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_ɾ�������Ʒ���չ�ϵ
        /// </summary>
        public IWorkCommand<pubL_1_162_Request, ObservableCollection<pubL_1_162_Info>> pubL_1_162_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_162_Request, ObservableCollection<pubL_1_162_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_162_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_ͬ���������������Ϣ
        /// </summary>
        public IWorkCommand<pubL_1_163_Request, ObservableCollection<pubL_1_163_Info>> pubL_1_163_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_163_Request, ObservableCollection<pubL_1_163_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_163_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ����֤ȯ������㵥λ
        /// </summary>
        public IWorkCommand<pubL_1_164_Request, ObservableCollection<pubL_1_164_Info>> pubL_1_164_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_164_Request, ObservableCollection<pubL_1_164_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_164_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��������֤ȯ������㵥λ
        /// </summary>
        public IWorkCommand<pubL_1_165_Request, ObservableCollection<pubL_1_165_Info>> pubL_1_165_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_165_Request, ObservableCollection<pubL_1_165_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_165_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_ɾ������֤ȯ������㵥λ
        /// </summary>
        public IWorkCommand<pubL_1_166_Request, ObservableCollection<pubL_1_166_Info>> pubL_1_166_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_1_166_Request, ObservableCollection<pubL_1_166_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_1_166_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_֤ȯ��������_��ѯ֤ȯ���̼�
        /// </summary>
        public IWorkCommand<pubL_1_177_Request, ObservableCollection<pubL_1_177_Info>> pubL_1_177_Command
        {
            get
            {
                return new WorkCommand<pubL_1_177_Request, ObservableCollection<pubL_1_177_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_1_177_InfoList;
                });
            }
        }

    }
}
