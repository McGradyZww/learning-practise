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
    public partial class UserClientCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_����_�û��ͻ���_��������Ա��Ϣ
        /// </summary>
        public IWorkCommand<pubL_19_1_Request, ObservableCollection<pubL_19_1_Info>> pubL_19_1_Command
        {
            get
            {
                return new WorkCommand<pubL_19_1_Request, ObservableCollection<pubL_19_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_1_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_�޸Ĳ���Ա��Ϣ
        /// </summary>
        public IWorkCommand<pubL_19_2_Request, ObservableCollection<pubL_19_2_Info>> pubL_19_2_Command
        {
            get
            {
                return new WorkCommand<pubL_19_2_Request, ObservableCollection<pubL_19_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_2_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ����Ա��Ϣ
        /// </summary>
        public IWorkCommand<pubL_19_4_Request, ObservableCollection<pubL_19_4_Info>> pubL_19_4_Command
        {
            get
            {
                return new WorkCommand<pubL_19_4_Request, ObservableCollection<pubL_19_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_4_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_�������Ա
        /// </summary>
        public IWorkCommand<pubL_19_5_Request, ObservableCollection<pubL_19_5_Info>> pubL_19_5_Command
        {
            get
            {
                return new WorkCommand<pubL_19_5_Request, ObservableCollection<pubL_19_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_5_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_�ⶳ����Ա
        /// </summary>
        public IWorkCommand<pubL_19_6_Request, ObservableCollection<pubL_19_6_Info>> pubL_19_6_Command
        {
            get
            {
                return new WorkCommand<pubL_19_6_Request, ObservableCollection<pubL_19_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_6_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_ע������Ա
        /// </summary>
        public IWorkCommand<pubL_19_7_Request, ObservableCollection<pubL_19_7_Info>> pubL_19_7_Command
        {
            get
            {
                return new WorkCommand<pubL_19_7_Request, ObservableCollection<pubL_19_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_7_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_�޸Ĳ���Ա����
        /// </summary>
        public IWorkCommand<pubL_19_9_Request, ObservableCollection<pubL_19_9_Info>> pubL_19_9_Command
        {
            get
            {
                return new WorkCommand<pubL_19_9_Request, ObservableCollection<pubL_19_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_9_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_���ò���Ա����
        /// </summary>
        public IWorkCommand<pubL_19_10_Request, ObservableCollection<pubL_19_10_Info>> pubL_19_10_Command
        {
            get
            {
                return new WorkCommand<pubL_19_10_Request, ObservableCollection<pubL_19_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_10_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ����Ա��Ϣ��ˮ
        /// </summary>
        public IWorkCommand<pubL_19_11_Request, ObservableCollection<pubL_19_11_Info>> pubL_19_11_Command
        {
            get
            {
                return new WorkCommand<pubL_19_11_Request, ObservableCollection<pubL_19_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_11_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ��ʷ����Ա��Ϣ��ˮ
        /// </summary>
        public IWorkCommand<pubL_19_12_Request, ObservableCollection<pubL_19_12_Info>> pubL_19_12_Command
        {
            get
            {
                return new WorkCommand<pubL_19_12_Request, ObservableCollection<pubL_19_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_12_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ȡ����Ա���
        /// </summary>
        public IWorkCommand<pubL_19_14_Request, ObservableCollection<pubL_19_14_Info>> pubL_19_14_Command
        {
            get
            {
                return new WorkCommand<pubL_19_14_Request, ObservableCollection<pubL_19_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_14_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ����Ա�б�
        /// </summary>
        public IWorkCommand<pubL_19_15_Request, ObservableCollection<pubL_19_15_Info>> pubL_19_15_Command
        {
            get
            {
                return new WorkCommand<pubL_19_15_Request, ObservableCollection<pubL_19_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_15_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��������ԱȨ����Ϣ
        /// </summary>
        public IWorkCommand<pubL_19_16_Request, ObservableCollection<pubL_19_16_Info>> pubL_19_16_Command
        {
            get
            {
                return new WorkCommand<pubL_19_16_Request, ObservableCollection<pubL_19_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_16_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_�޸Ĳ���ԱȨ����Ϣ
        /// </summary>
        public IWorkCommand<pubL_19_17_Request, ObservableCollection<pubL_19_17_Info>> pubL_19_17_Command
        {
            get
            {
                return new WorkCommand<pubL_19_17_Request, ObservableCollection<pubL_19_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_17_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ����ԱȨ����Ϣ
        /// </summary>
        public IWorkCommand<pubL_19_18_Request, ObservableCollection<pubL_19_18_Info>> pubL_19_18_Command
        {
            get
            {
                return new WorkCommand<pubL_19_18_Request, ObservableCollection<pubL_19_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_18_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ����Ա��¼��ַ��Ϣ
        /// </summary>
        public IWorkCommand<pubL_19_19_Request, ObservableCollection<pubL_19_19_Info>> pubL_19_19_Command
        {
            get
            {
                return new WorkCommand<pubL_19_19_Request, ObservableCollection<pubL_19_19_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_19_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_����Ա��¼
        /// </summary>
        public IWorkCommand<pubL_19_21_Request, ObservableCollection<pubL_19_21_Info>> pubL_19_21_Command
        {
            get
            {
                return new WorkCommand<pubL_19_21_Request, ObservableCollection<pubL_19_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_21_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_����Ա�˳�
        /// </summary>
        public IWorkCommand<pubL_19_22_Request, ObservableCollection<pubL_19_22_Info>> pubL_19_22_Command
        {
            get
            {
                return new WorkCommand<pubL_19_22_Request, ObservableCollection<pubL_19_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_22_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_���ò���Ա����
        /// </summary>
        public IWorkCommand<pubL_19_31_Request, ObservableCollection<pubL_19_31_Info>> pubL_19_31_Command
        {
            get
            {
                return new WorkCommand<pubL_19_31_Request, ObservableCollection<pubL_19_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_31_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ����Ա����
        /// </summary>
        public IWorkCommand<pubL_19_32_Request, ObservableCollection<pubL_19_32_Info>> pubL_19_32_Command
        {
            get
            {
                return new WorkCommand<pubL_19_32_Request, ObservableCollection<pubL_19_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_32_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_�������Ա�����ʾ
        /// </summary>
        public IWorkCommand<pubL_19_33_Request, ObservableCollection<pubL_19_33_Info>> pubL_19_33_Command
        {
            get
            {
                return new WorkCommand<pubL_19_33_Request, ObservableCollection<pubL_19_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_33_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ����Ա�����ʾ
        /// </summary>
        public IWorkCommand<pubL_19_34_Request, ObservableCollection<pubL_19_34_Info>> pubL_19_34_Command
        {
            get
            {
                return new WorkCommand<pubL_19_34_Request, ObservableCollection<pubL_19_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_34_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��������Ա�ɲ�����Ʒ
        /// </summary>
        public IWorkCommand<pubL_19_45_Request, ObservableCollection<pubL_19_45_Info>> pubL_19_45_Command
        {
            get
            {
                return new WorkCommand<pubL_19_45_Request, ObservableCollection<pubL_19_45_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_45_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_ɾ������Ա�ɲ�����Ʒ
        /// </summary>
        public IWorkCommand<pubL_19_46_Request, ObservableCollection<pubL_19_46_Info>> pubL_19_46_Command
        {
            get
            {
                return new WorkCommand<pubL_19_46_Request, ObservableCollection<pubL_19_46_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_46_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ����Ա�ɲ�����Ʒ
        /// </summary>
        public IWorkCommand<pubL_19_48_Request, ObservableCollection<pubL_19_48_Info>> pubL_19_48_Command
        {
            get
            {
                return new WorkCommand<pubL_19_48_Request, ObservableCollection<pubL_19_48_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_48_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_������������Ϣ
        /// </summary>
        public IWorkCommand<pubL_19_51_Request, ObservableCollection<pubL_19_51_Info>> pubL_19_51_Command
        {
            get
            {
                return new WorkCommand<pubL_19_51_Request, ObservableCollection<pubL_19_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_51_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_�޸Ľ�������Ϣ
        /// </summary>
        public IWorkCommand<pubL_19_52_Request, ObservableCollection<pubL_19_52_Info>> pubL_19_52_Command
        {
            get
            {
                return new WorkCommand<pubL_19_52_Request, ObservableCollection<pubL_19_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_52_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ��������Ϣ
        /// </summary>
        public IWorkCommand<pubL_19_54_Request, ObservableCollection<pubL_19_54_Info>> pubL_19_54_Command
        {
            get
            {
                return new WorkCommand<pubL_19_54_Request, ObservableCollection<pubL_19_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_54_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_���ύ����
        /// </summary>
        public IWorkCommand<pubL_19_55_Request, ObservableCollection<pubL_19_55_Info>> pubL_19_55_Command
        {
            get
            {
                return new WorkCommand<pubL_19_55_Request, ObservableCollection<pubL_19_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_55_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_�ⶳ������
        /// </summary>
        public IWorkCommand<pubL_19_56_Request, ObservableCollection<pubL_19_56_Info>> pubL_19_56_Command
        {
            get
            {
                return new WorkCommand<pubL_19_56_Request, ObservableCollection<pubL_19_56_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_56_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_ע��������
        /// </summary>
        public IWorkCommand<pubL_19_57_Request, ObservableCollection<pubL_19_57_Info>> pubL_19_57_Command
        {
            get
            {
                return new WorkCommand<pubL_19_57_Request, ObservableCollection<pubL_19_57_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_57_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ��������Ϣ��ˮ
        /// </summary>
        public IWorkCommand<pubL_19_58_Request, ObservableCollection<pubL_19_58_Info>> pubL_19_58_Command
        {
            get
            {
                return new WorkCommand<pubL_19_58_Request, ObservableCollection<pubL_19_58_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_58_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ��ʷ��������Ϣ��ˮ
        /// </summary>
        public IWorkCommand<pubL_19_59_Request, ObservableCollection<pubL_19_59_Info>> pubL_19_59_Command
        {
            get
            {
                return new WorkCommand<pubL_19_59_Request, ObservableCollection<pubL_19_59_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_59_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_����Ĭ�Ͻ�����
        /// </summary>
        public IWorkCommand<pubL_19_60_Request, ObservableCollection<pubL_19_60_Info>> pubL_19_60_Command
        {
            get
            {
                return new WorkCommand<pubL_19_60_Request, ObservableCollection<pubL_19_60_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_60_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ�ɼ�������
        /// </summary>
        public IWorkCommand<pubL_19_73_Request, ObservableCollection<pubL_19_73_Info>> pubL_19_73_Command
        {
            get
            {
                return new WorkCommand<pubL_19_73_Request, ObservableCollection<pubL_19_73_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_73_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��������Ա����������
        /// </summary>
        public IWorkCommand<pubL_19_61_Request, ObservableCollection<pubL_19_61_Info>> pubL_19_61_Command
        {
            get
            {
                return new WorkCommand<pubL_19_61_Request, ObservableCollection<pubL_19_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_61_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_ɾ������Ա����������
        /// </summary>
        public IWorkCommand<pubL_19_62_Request, ObservableCollection<pubL_19_62_Info>> pubL_19_62_Command
        {
            get
            {
                return new WorkCommand<pubL_19_62_Request, ObservableCollection<pubL_19_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_62_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ����Ա����������
        /// </summary>
        public IWorkCommand<pubL_19_64_Request, ObservableCollection<pubL_19_64_Info>> pubL_19_64_Command
        {
            get
            {
                return new WorkCommand<pubL_19_64_Request, ObservableCollection<pubL_19_64_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_64_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_������Ʒ�˻����������
        /// </summary>
        public IWorkCommand<pubL_19_65_Request, ObservableCollection<pubL_19_65_Info>> pubL_19_65_Command
        {
            get
            {
                return new WorkCommand<pubL_19_65_Request, ObservableCollection<pubL_19_65_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_65_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_�޸Ĳ�Ʒ�˻����������
        /// </summary>
        public IWorkCommand<pubL_19_66_Request, ObservableCollection<pubL_19_66_Info>> pubL_19_66_Command
        {
            get
            {
                return new WorkCommand<pubL_19_66_Request, ObservableCollection<pubL_19_66_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_66_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_ɾ����Ʒ�˻����������
        /// </summary>
        public IWorkCommand<pubL_19_67_Request, ObservableCollection<pubL_19_67_Info>> pubL_19_67_Command
        {
            get
            {
                return new WorkCommand<pubL_19_67_Request, ObservableCollection<pubL_19_67_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_67_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ��Ʒ�˻����������
        /// </summary>
        public IWorkCommand<pubL_19_68_Request, ObservableCollection<pubL_19_68_Info>> pubL_19_68_Command
        {
            get
            {
                return new WorkCommand<pubL_19_68_Request, ObservableCollection<pubL_19_68_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_68_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_������Ʒ�˻������������ϸ
        /// </summary>
        public IWorkCommand<pubL_19_69_Request, ObservableCollection<pubL_19_69_Info>> pubL_19_69_Command
        {
            get
            {
                return new WorkCommand<pubL_19_69_Request, ObservableCollection<pubL_19_69_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_69_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_�޸Ĳ�Ʒ�˻������������ϸ
        /// </summary>
        public IWorkCommand<pubL_19_70_Request, ObservableCollection<pubL_19_70_Info>> pubL_19_70_Command
        {
            get
            {
                return new WorkCommand<pubL_19_70_Request, ObservableCollection<pubL_19_70_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_70_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_ɾ����Ʒ�˻������������ϸ
        /// </summary>
        public IWorkCommand<pubL_19_71_Request, ObservableCollection<pubL_19_71_Info>> pubL_19_71_Command
        {
            get
            {
                return new WorkCommand<pubL_19_71_Request, ObservableCollection<pubL_19_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_71_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ��Ʒ�˻������������ϸ
        /// </summary>
        public IWorkCommand<pubL_19_72_Request, ObservableCollection<pubL_19_72_Info>> pubL_19_72_Command
        {
            get
            {
                return new WorkCommand<pubL_19_72_Request, ObservableCollection<pubL_19_72_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_72_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_������������Ա�ɲ�������Ա
        /// </summary>
        public IWorkCommand<pubL_19_77_Request, ObservableCollection<pubL_19_77_Info>> pubL_19_77_Command
        {
            get
            {
                return new WorkCommand<pubL_19_77_Request, ObservableCollection<pubL_19_77_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_77_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��������Ա�ɲ�������Ա
        /// </summary>
        public IWorkCommand<pubL_19_74_Request, ObservableCollection<pubL_19_74_Info>> pubL_19_74_Command
        {
            get
            {
                return new WorkCommand<pubL_19_74_Request, ObservableCollection<pubL_19_74_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_74_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_ɾ������Ա�ɲ�������Ա
        /// </summary>
        public IWorkCommand<pubL_19_75_Request, ObservableCollection<pubL_19_75_Info>> pubL_19_75_Command
        {
            get
            {
                return new WorkCommand<pubL_19_75_Request, ObservableCollection<pubL_19_75_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_75_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_����ɾ������Ա�ɲ�������Ա
        /// </summary>
        public IWorkCommand<pubL_19_78_Request, ObservableCollection<pubL_19_78_Info>> pubL_19_78_Command
        {
            get
            {
                return new WorkCommand<pubL_19_78_Request, ObservableCollection<pubL_19_78_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_78_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ����Ա�ɲ�������Ա
        /// </summary>
        public IWorkCommand<pubL_19_76_Request, ObservableCollection<pubL_19_76_Info>> pubL_19_76_Command
        {
            get
            {
                return new WorkCommand<pubL_19_76_Request, ObservableCollection<pubL_19_76_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_76_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ��������ʷ�ʲ�
        /// </summary>
        public IWorkCommand<pubL_19_89_Request, ObservableCollection<pubL_19_89_Info>> pubL_19_89_Command
        {
            get
            {
                return new WorkCommand<pubL_19_89_Request, ObservableCollection<pubL_19_89_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_89_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ�������ʲ�
        /// </summary>
        public IWorkCommand<pubL_19_91_Request, ObservableCollection<pubL_19_91_Info>> pubL_19_91_Command
        {
            get
            {
                return new WorkCommand<pubL_19_91_Request, ObservableCollection<pubL_19_91_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_91_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ�������ʲ���ʷ
        /// </summary>
        public IWorkCommand<pubL_19_90_Request, ObservableCollection<pubL_19_90_Info>> pubL_19_90_Command
        {
            get
            {
                return new WorkCommand<pubL_19_90_Request, ObservableCollection<pubL_19_90_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_90_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ȡ���������ֵ
        /// </summary>
        public IWorkCommand<pubL_19_92_Request, ObservableCollection<pubL_19_92_Info>> pubL_19_92_Command
        {
            get
            {
                return new WorkCommand<pubL_19_92_Request, ObservableCollection<pubL_19_92_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_92_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ȡ���������λ��ֵ
        /// </summary>
        public IWorkCommand<pubL_19_93_Request, ObservableCollection<pubL_19_93_Info>> pubL_19_93_Command
        {
            get
            {
                return new WorkCommand<pubL_19_93_Request, ObservableCollection<pubL_19_93_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_93_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ������ݶ�䶯��ˮ
        /// </summary>
        public IWorkCommand<pubL_19_94_Request, ObservableCollection<pubL_19_94_Info>> pubL_19_94_Command
        {
            get
            {
                return new WorkCommand<pubL_19_94_Request, ObservableCollection<pubL_19_94_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_94_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ������ݶ�䶯��ˮ��ʷ
        /// </summary>
        public IWorkCommand<pubL_19_95_Request, ObservableCollection<pubL_19_95_Info>> pubL_19_95_Command
        {
            get
            {
                return new WorkCommand<pubL_19_95_Request, ObservableCollection<pubL_19_95_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_95_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ�ɼ�����Ա�б�
        /// </summary>
        public IWorkCommand<pubL_19_202_Request, ObservableCollection<pubL_19_202_Info>> pubL_19_202_Command
        {
            get
            {
                return new WorkCommand<pubL_19_202_Request, ObservableCollection<pubL_19_202_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_202_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ�Զ����½������б�
        /// </summary>
        public IWorkCommand<pubL_19_203_Request, ObservableCollection<pubL_19_203_Info>> pubL_19_203_Command
        {
            get
            {
                return new WorkCommand<pubL_19_203_Request, ObservableCollection<pubL_19_203_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_203_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_���½�����֤ȯ�ʲ�
        /// </summary>
        public IWorkCommand<pubL_19_900_Request, ObservableCollection<pubL_19_900_Info>> pubL_19_900_Command
        {
            get
            {
                return new WorkCommand<pubL_19_900_Request, ObservableCollection<pubL_19_900_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_900_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_���½������ڻ��ʲ�
        /// </summary>
        public IWorkCommand<pubL_19_901_Request, ObservableCollection<pubL_19_901_Info>> pubL_19_901_Command
        {
            get
            {
                return new WorkCommand<pubL_19_901_Request, ObservableCollection<pubL_19_901_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_901_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ȡ�ɲ����ò�Ʒ����Ա��Ŵ�
        /// </summary>
        public IWorkCommand<pubL_19_902_Request, ObservableCollection<pubL_19_902_Info>> pubL_19_902_Command
        {
            get
            {
                return new WorkCommand<pubL_19_902_Request, ObservableCollection<pubL_19_902_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_902_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_�������ֶԳ����
        /// </summary>
        public IWorkCommand<pubL_19_301_Request, ObservableCollection<pubL_19_301_Info>> pubL_19_301_Command
        {
            get
            {
                return new WorkCommand<pubL_19_301_Request, ObservableCollection<pubL_19_301_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_301_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_ɾ�����ֶԳ����
        /// </summary>
        public IWorkCommand<pubL_19_303_Request, ObservableCollection<pubL_19_303_Info>> pubL_19_303_Command
        {
            get
            {
                return new WorkCommand<pubL_19_303_Request, ObservableCollection<pubL_19_303_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_303_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ���ֶԳ����
        /// </summary>
        public IWorkCommand<pubL_19_304_Request, ObservableCollection<pubL_19_304_Info>> pubL_19_304_Command
        {
            get
            {
                return new WorkCommand<pubL_19_304_Request, ObservableCollection<pubL_19_304_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_304_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_�������ֶԳ巽����Ϣ
        /// </summary>
        public IWorkCommand<pubL_19_401_Request, ObservableCollection<pubL_19_401_Info>> pubL_19_401_Command
        {
            get
            {
                return new WorkCommand<pubL_19_401_Request, ObservableCollection<pubL_19_401_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_401_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_�޸����ֶԳ巽����Ϣ
        /// </summary>
        public IWorkCommand<pubL_19_402_Request, ObservableCollection<pubL_19_402_Info>> pubL_19_402_Command
        {
            get
            {
                return new WorkCommand<pubL_19_402_Request, ObservableCollection<pubL_19_402_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_402_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_ɾ�����ֶԳ巽����Ϣ
        /// </summary>
        public IWorkCommand<pubL_19_403_Request, ObservableCollection<pubL_19_403_Info>> pubL_19_403_Command
        {
            get
            {
                return new WorkCommand<pubL_19_403_Request, ObservableCollection<pubL_19_403_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_403_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ���ֶԳ巽����Ϣ
        /// </summary>
        public IWorkCommand<pubL_19_404_Request, ObservableCollection<pubL_19_404_Info>> pubL_19_404_Command
        {
            get
            {
                return new WorkCommand<pubL_19_404_Request, ObservableCollection<pubL_19_404_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_404_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��������Ա�����ò���Ա
        /// </summary>
        public IWorkCommand<pubL_19_501_Request, ObservableCollection<pubL_19_501_Info>> pubL_19_501_Command
        {
            get
            {
                return new WorkCommand<pubL_19_501_Request, ObservableCollection<pubL_19_501_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_501_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_ɾ������Ա�����ò���Ա
        /// </summary>
        public IWorkCommand<pubL_19_502_Request, ObservableCollection<pubL_19_502_Info>> pubL_19_502_Command
        {
            get
            {
                return new WorkCommand<pubL_19_502_Request, ObservableCollection<pubL_19_502_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_502_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ����Ա�����ò���Ա
        /// </summary>
        public IWorkCommand<pubL_19_503_Request, ObservableCollection<pubL_19_503_Info>> pubL_19_503_Command
        {
            get
            {
                return new WorkCommand<pubL_19_503_Request, ObservableCollection<pubL_19_503_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_503_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ȡע�������鴮
        /// </summary>
        public IWorkCommand<pubL_19_504_Request, ObservableCollection<pubL_19_504_Info>> pubL_19_504_Command
        {
            get
            {
                return new WorkCommand<pubL_19_504_Request, ObservableCollection<pubL_19_504_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_504_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_���»����Ʒ����
        /// </summary>
        public IWorkCommand<pubL_19_505_Request, ObservableCollection<pubL_19_505_Info>> pubL_19_505_Command
        {
            get
            {
                return new WorkCommand<pubL_19_505_Request, ObservableCollection<pubL_19_505_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_505_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ѯ�����Ʒ����
        /// </summary>
        public IWorkCommand<pubL_19_506_Request, ObservableCollection<pubL_19_506_Info>> pubL_19_506_Command
        {
            get
            {
                return new WorkCommand<pubL_19_506_Request, ObservableCollection<pubL_19_506_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_506_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_�޸Ĳ���Ա����ֵ
        /// </summary>
        public IWorkCommand<pubL_19_507_Request, ObservableCollection<pubL_19_507_Info>> pubL_19_507_Command
        {
            get
            {
                return new WorkCommand<pubL_19_507_Request, ObservableCollection<pubL_19_507_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_507_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_���ò���Ա��¼�������
        /// </summary>
        public IWorkCommand<pubL_19_508_Request, ObservableCollection<pubL_19_508_Info>> pubL_19_508_Command
        {
            get
            {
                return new WorkCommand<pubL_19_508_Request, ObservableCollection<pubL_19_508_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_508_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�û��ͻ���_��ά�˲�ѯ��������Ϣ
        /// </summary>
        public IWorkCommand<pubL_19_96_Request, ObservableCollection<pubL_19_96_Info>> pubL_19_96_Command
        {
            get
            {
                return new WorkCommand<pubL_19_96_Request, ObservableCollection<pubL_19_96_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_19_96_InfoList;
                });
            }
        }

    }
}
