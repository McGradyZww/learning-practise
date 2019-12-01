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
    public partial class ProductSecuCapitalCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_�����Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_8_Request, ObservableCollection<pdsecuL_2_8_Info>> pdsecuL_2_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_8_Request, ObservableCollection<pdsecuL_2_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_���ղ�Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_9_Request, ObservableCollection<pdsecuL_2_9_Info>> pdsecuL_2_9_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_9_Request, ObservableCollection<pdsecuL_2_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_9_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��Ȩ��Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_10_Request, ObservableCollection<pdsecuL_2_10_Info>> pdsecuL_2_10_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_10_Request, ObservableCollection<pdsecuL_2_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_10_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_������Ȩ��Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_11_Request, ObservableCollection<pdsecuL_2_11_Info>> pdsecuL_2_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_11_Request, ObservableCollection<pdsecuL_2_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_���ύ�����ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_32_Request, ObservableCollection<pdsecuL_2_32_Info>> pdsecuL_2_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_32_Request, ObservableCollection<pdsecuL_2_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_ȡ�����ύ�����ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_33_Request, ObservableCollection<pdsecuL_2_33_Info>> pdsecuL_2_33_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_33_Request, ObservableCollection<pdsecuL_2_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_33_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_�ⶳ�������ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_34_Request, ObservableCollection<pdsecuL_2_34_Info>> pdsecuL_2_34_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_34_Request, ObservableCollection<pdsecuL_2_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_34_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_ȡ���ⶳ�������ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_35_Request, ObservableCollection<pdsecuL_2_35_Info>> pdsecuL_2_35_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_35_Request, ObservableCollection<pdsecuL_2_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_35_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ�������ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_37_Request, ObservableCollection<pdsecuL_2_37_Info>> pdsecuL_2_37_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_37_Request, ObservableCollection<pdsecuL_2_37_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_37_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ��ʷ�������ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_38_Request, ObservableCollection<pdsecuL_2_38_Info>> pdsecuL_2_38_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_38_Request, ObservableCollection<pdsecuL_2_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_38_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ�������ʽ���ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_2_39_Request, ObservableCollection<pdsecuL_2_39_Info>> pdsecuL_2_39_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_39_Request, ObservableCollection<pdsecuL_2_39_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_39_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ��ʷ�������ʽ���ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_2_40_Request, ObservableCollection<pdsecuL_2_40_Info>> pdsecuL_2_40_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_40_Request, ObservableCollection<pdsecuL_2_40_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_40_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ�������ʽ𶳽�ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_2_41_Request, ObservableCollection<pdsecuL_2_41_Info>> pdsecuL_2_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_41_Request, ObservableCollection<pdsecuL_2_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ��ʷ�������ʽ𶳽�ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_2_42_Request, ObservableCollection<pdsecuL_2_42_Info>> pdsecuL_2_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_42_Request, ObservableCollection<pdsecuL_2_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_���½������ʽ��ۼ�Ӧ��Ӧ��
        /// </summary>
        public IWorkCommand<pdsecuL_2_43_Request, ObservableCollection<pdsecuL_2_43_Info>> pdsecuL_2_43_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_43_Request, ObservableCollection<pdsecuL_2_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_43_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ�������ʲ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_44_Request, ObservableCollection<pdsecuL_2_44_Info>> pdsecuL_2_44_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_44_Request, ObservableCollection<pdsecuL_2_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_44_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��������ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_51_Request, ObservableCollection<pdsecuL_2_51_Info>> pdsecuL_2_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_51_Request, ObservableCollection<pdsecuL_2_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_�����ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_52_Request, ObservableCollection<pdsecuL_2_52_Info>> pdsecuL_2_52_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_52_Request, ObservableCollection<pdsecuL_2_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_52_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_ȡ�������ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_53_Request, ObservableCollection<pdsecuL_2_53_Info>> pdsecuL_2_53_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_53_Request, ObservableCollection<pdsecuL_2_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_53_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_�ⶳ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_54_Request, ObservableCollection<pdsecuL_2_54_Info>> pdsecuL_2_54_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_54_Request, ObservableCollection<pdsecuL_2_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_54_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_ȡ���ⶳ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_55_Request, ObservableCollection<pdsecuL_2_55_Info>> pdsecuL_2_55_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_55_Request, ObservableCollection<pdsecuL_2_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_55_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_57_Request, ObservableCollection<pdsecuL_2_57_Info>> pdsecuL_2_57_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_57_Request, ObservableCollection<pdsecuL_2_57_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_57_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ��ʷ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_58_Request, ObservableCollection<pdsecuL_2_58_Info>> pdsecuL_2_58_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_58_Request, ObservableCollection<pdsecuL_2_58_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_58_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ�ʲ��˻��ʽ���ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_2_59_Request, ObservableCollection<pdsecuL_2_59_Info>> pdsecuL_2_59_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_59_Request, ObservableCollection<pdsecuL_2_59_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_59_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ��ʷ�ʲ��˻��ʽ���ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_2_60_Request, ObservableCollection<pdsecuL_2_60_Info>> pdsecuL_2_60_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_60_Request, ObservableCollection<pdsecuL_2_60_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_60_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ�ʲ��˻��ʽ𶳽�ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_2_61_Request, ObservableCollection<pdsecuL_2_61_Info>> pdsecuL_2_61_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_61_Request, ObservableCollection<pdsecuL_2_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_61_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ��ʷ�ʲ��˻��ʽ𶳽�ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_2_62_Request, ObservableCollection<pdsecuL_2_62_Info>> pdsecuL_2_62_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_62_Request, ObservableCollection<pdsecuL_2_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_62_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_�����ʲ��˻��ʽ��ۼ�Ӧ��Ӧ��
        /// </summary>
        public IWorkCommand<pdsecuL_2_63_Request, ObservableCollection<pdsecuL_2_63_Info>> pdsecuL_2_63_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_63_Request, ObservableCollection<pdsecuL_2_63_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_63_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_�ⲿ֤ȯ�ʽ���ˮ��¼����
        /// </summary>
        public IWorkCommand<pdsecuL_2_101_Request, ObservableCollection<pdsecuL_2_101_Info>> pdsecuL_2_101_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_101_Request, ObservableCollection<pdsecuL_2_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_101_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ�ⲿ֤ȯ�ʽ���ˮ��¼
        /// </summary>
        public IWorkCommand<pdsecuL_2_103_Request, ObservableCollection<pdsecuL_2_103_Info>> pdsecuL_2_103_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_103_Request, ObservableCollection<pdsecuL_2_103_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_103_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_ת���ⲿ�ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_171_Request, ObservableCollection<pdsecuL_2_171_Info>> pdsecuL_2_171_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_171_Request, ObservableCollection<pdsecuL_2_171_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_171_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_�ʲ��˻��ʽ�Ӧ��Ӧ���䶯
        /// </summary>
        public IWorkCommand<pdsecuL_2_64_Request, ObservableCollection<pdsecuL_2_64_Info>> pdsecuL_2_64_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_64_Request, ObservableCollection<pdsecuL_2_64_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_64_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_������֤ת�˼�¼
        /// </summary>
        public IWorkCommand<pdsecuL_2_65_Request, ObservableCollection<pdsecuL_2_65_Info>> pdsecuL_2_65_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_65_Request, ObservableCollection<pdsecuL_2_65_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_65_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_�����ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_66_Request, ObservableCollection<pdsecuL_2_66_Info>> pdsecuL_2_66_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_66_Request, ObservableCollection<pdsecuL_2_66_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_66_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ȡ�������Ӧ�ʲ��˻�
        /// </summary>
        public IWorkCommand<pdsecuL_2_67_Request, ObservableCollection<pdsecuL_2_67_Info>> pdsecuL_2_67_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_67_Request, ObservableCollection<pdsecuL_2_67_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_67_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_�������ʽ�ת
        /// </summary>
        public IWorkCommand<pdsecuL_2_68_Request, ObservableCollection<pdsecuL_2_68_Info>> pdsecuL_2_68_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_68_Request, ObservableCollection<pdsecuL_2_68_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_68_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ�������������
        /// </summary>
        public IWorkCommand<pdsecuL_2_69_Request, ObservableCollection<pdsecuL_2_69_Info>> pdsecuL_2_69_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_69_Request, ObservableCollection<pdsecuL_2_69_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_69_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_ɾ���������ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_70_Request, ObservableCollection<pdsecuL_2_70_Info>> pdsecuL_2_70_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_70_Request, ObservableCollection<pdsecuL_2_70_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_70_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_ͬ����������ⲿ����
        /// </summary>
        public IWorkCommand<pdsecuL_2_71_Request, ObservableCollection<pdsecuL_2_71_Info>> pdsecuL_2_71_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_71_Request, ObservableCollection<pdsecuL_2_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_71_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_ת���ⲿ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_72_Request, ObservableCollection<pdsecuL_2_72_Info>> pdsecuL_2_72_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_72_Request, ObservableCollection<pdsecuL_2_72_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_72_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_ת���ⲿ�ʲ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_73_Request, ObservableCollection<pdsecuL_2_73_Info>> pdsecuL_2_73_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_73_Request, ObservableCollection<pdsecuL_2_73_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_73_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_���ݲ���Ա��ѯ�������ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_80_Request, ObservableCollection<pdsecuL_2_80_Info>> pdsecuL_2_80_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_80_Request, ObservableCollection<pdsecuL_2_80_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_80_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_�����Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_81_Request, ObservableCollection<pdsecuL_2_81_Info>> pdsecuL_2_81_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_81_Request, ObservableCollection<pdsecuL_2_81_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_81_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_ɾ����Ʒ������ˮ��¼
        /// </summary>
        public IWorkCommand<pdsecuL_2_82_Request, ObservableCollection<pdsecuL_2_82_Info>> pdsecuL_2_82_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_82_Request, ObservableCollection<pdsecuL_2_82_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_82_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ��Ʒ������ˮ��¼
        /// </summary>
        public IWorkCommand<pdsecuL_2_83_Request, ObservableCollection<pdsecuL_2_83_Info>> pdsecuL_2_83_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_83_Request, ObservableCollection<pdsecuL_2_83_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_83_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ��Ʒ������ˮ��ʷ��¼
        /// </summary>
        public IWorkCommand<pdsecuL_2_84_Request, ObservableCollection<pdsecuL_2_84_Info>> pdsecuL_2_84_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_84_Request, ObservableCollection<pdsecuL_2_84_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_84_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ�ⲿת���ʲ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_74_Request, ObservableCollection<pdsecuL_2_74_Info>> pdsecuL_2_74_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_2_74_Request, ObservableCollection<pdsecuL_2_74_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_2_74_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ѯ�ʲ��˻������ʽ�����¼
        /// </summary>
        public IWorkCommand<pdsecuL_2_75_Request, ObservableCollection<pdsecuL_2_75_Info>> pdsecuL_2_75_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_75_Request, ObservableCollection<pdsecuL_2_75_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_75_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά�˲�ѯ�������ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_76_Request, ObservableCollection<pdsecuL_2_76_Info>> pdsecuL_2_76_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_76_Request, ObservableCollection<pdsecuL_2_76_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_76_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά�˷����Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_77_Request, ObservableCollection<pdsecuL_2_77_Info>> pdsecuL_2_77_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_77_Request, ObservableCollection<pdsecuL_2_77_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_77_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά�˻��ղ�Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_78_Request, ObservableCollection<pdsecuL_2_78_Info>> pdsecuL_2_78_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_78_Request, ObservableCollection<pdsecuL_2_78_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_78_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά�˺�������ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_79_Request, ObservableCollection<pdsecuL_2_79_Info>> pdsecuL_2_79_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_79_Request, ObservableCollection<pdsecuL_2_79_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_79_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά�˶����ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_85_Request, ObservableCollection<pdsecuL_2_85_Info>> pdsecuL_2_85_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_85_Request, ObservableCollection<pdsecuL_2_85_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_85_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά�˽ⶳ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_86_Request, ObservableCollection<pdsecuL_2_86_Info>> pdsecuL_2_86_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_86_Request, ObservableCollection<pdsecuL_2_86_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_86_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά���ʲ��˻��ʽ�Ӧ��Ӧ���䶯
        /// </summary>
        public IWorkCommand<pdsecuL_2_87_Request, ObservableCollection<pdsecuL_2_87_Info>> pdsecuL_2_87_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_87_Request, ObservableCollection<pdsecuL_2_87_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_87_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά��ȡ�������ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_88_Request, ObservableCollection<pdsecuL_2_88_Info>> pdsecuL_2_88_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_88_Request, ObservableCollection<pdsecuL_2_88_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_88_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά��ȡ���ⶳ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_89_Request, ObservableCollection<pdsecuL_2_89_Info>> pdsecuL_2_89_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_89_Request, ObservableCollection<pdsecuL_2_89_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_89_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά�˲�ѯ�ʲ��˻��ʽ𶳽�ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_2_90_Request, ObservableCollection<pdsecuL_2_90_Info>> pdsecuL_2_90_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_90_Request, ObservableCollection<pdsecuL_2_90_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_90_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά����Ȩ��Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_91_Request, ObservableCollection<pdsecuL_2_91_Info>> pdsecuL_2_91_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_91_Request, ObservableCollection<pdsecuL_2_91_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_91_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά�˻�����Ȩ��Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_92_Request, ObservableCollection<pdsecuL_2_92_Info>> pdsecuL_2_92_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_92_Request, ObservableCollection<pdsecuL_2_92_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_92_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά�˶��ύ�����ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_93_Request, ObservableCollection<pdsecuL_2_93_Info>> pdsecuL_2_93_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_93_Request, ObservableCollection<pdsecuL_2_93_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_93_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά��ȡ�����ύ�����ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_94_Request, ObservableCollection<pdsecuL_2_94_Info>> pdsecuL_2_94_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_94_Request, ObservableCollection<pdsecuL_2_94_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_94_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά�˽ⶳ�������ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_95_Request, ObservableCollection<pdsecuL_2_95_Info>> pdsecuL_2_95_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_95_Request, ObservableCollection<pdsecuL_2_95_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_95_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά��ȡ���ⶳ�������ʽ�
        /// </summary>
        public IWorkCommand<pdsecuL_2_96_Request, ObservableCollection<pdsecuL_2_96_Info>> pdsecuL_2_96_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_96_Request, ObservableCollection<pdsecuL_2_96_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_96_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά�˲�ѯ�������ʽ𶳽�ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdsecuL_2_97_Request, ObservableCollection<pdsecuL_2_97_Info>> pdsecuL_2_97_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_97_Request, ObservableCollection<pdsecuL_2_97_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_97_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά�˸��½������ʽ��ۼ�Ӧ��Ӧ��
        /// </summary>
        public IWorkCommand<pdsecuL_2_98_Request, ObservableCollection<pdsecuL_2_98_Info>> pdsecuL_2_98_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_98_Request, ObservableCollection<pdsecuL_2_98_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_98_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�ʽ�_��ά�˽������ʽ�ת
        /// </summary>
        public IWorkCommand<pdsecuL_2_99_Request, ObservableCollection<pdsecuL_2_99_Info>> pdsecuL_2_99_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_2_99_Request, ObservableCollection<pdsecuL_2_99_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_2_99_InfoList;
                });
            }
        }

    }
}
