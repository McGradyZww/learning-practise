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
    public partial class RptQueryCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ������Ʒ������
        /// </summary>
        public IWorkCommand<rptL_3_1_Request, ObservableCollection<rptL_3_1_Info>> rptL_3_1_Command
        {
            get
            {
                return new WorkCommand<rptL_3_1_Request, ObservableCollection<rptL_3_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_1_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ���������ʷ���
        /// </summary>
        public IWorkCommand<rptL_3_2_Request, ObservableCollection<rptL_3_2_Info>> rptL_3_2_Command
        {
            get
            {
                return new WorkCommand<rptL_3_2_Request, ObservableCollection<rptL_3_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_2_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ�����Ʒ�ʲ���¼
        /// </summary>
        public IWorkCommand<rptL_3_3_Request, ObservableCollection<rptL_3_3_Info>> rptL_3_3_Command
        {
            get
            {
                return new WorkCommand<rptL_3_3_Request, ObservableCollection<rptL_3_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_3_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ�����Ʒ��ֵ�ر���
        /// </summary>
        public IWorkCommand<rptL_3_4_Request, ObservableCollection<rptL_3_4_Info>> rptL_3_4_Command
        {
            get
            {
                return new WorkCommand<rptL_3_4_Request, ObservableCollection<rptL_3_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_4_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ�����Ʒ�ʲ���ϸ����ͳ����ʷ��¼
        /// </summary>
        public IWorkCommand<rptL_3_6_Request, ObservableCollection<rptL_3_6_Info>> rptL_3_6_Command
        {
            get
            {
                return new WorkCommand<rptL_3_6_Request, ObservableCollection<rptL_3_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_6_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ�ܾ�ֵ�۱䱨��
        /// </summary>
        public IWorkCommand<rptL_3_7_Request, ObservableCollection<rptL_3_7_Info>> rptL_3_7_Command
        {
            get
            {
                return new WorkCommand<rptL_3_7_Request, ObservableCollection<rptL_3_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_7_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒ������Ϣ
        /// </summary>
        public IWorkCommand<rptL_3_8_Request, ObservableCollection<rptL_3_8_Info>> rptL_3_8_Command
        {
            get
            {
                return new WorkCommand<rptL_3_8_Request, ObservableCollection<rptL_3_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_8_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_�����Ͷ����
        /// </summary>
        public IWorkCommand<rptL_3_9_Request, ObservableCollection<rptL_3_9_Info>> rptL_3_9_Command
        {
            get
            {
                return new WorkCommand<rptL_3_9_Request, ObservableCollection<rptL_3_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_9_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ͷ����
        /// </summary>
        public IWorkCommand<rptL_3_10_Request, ObservableCollection<rptL_3_10_Info>> rptL_3_10_Command
        {
            get
            {
                return new WorkCommand<rptL_3_10_Request, ObservableCollection<rptL_3_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_10_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯӯ������
        /// </summary>
        public IWorkCommand<rptL_3_11_Request, ObservableCollection<rptL_3_11_Info>> rptL_3_11_Command
        {
            get
            {
                return new WorkCommand<rptL_3_11_Request, ObservableCollection<rptL_3_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_11_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ�ر�ͳ��
        /// </summary>
        public IWorkCommand<rptL_3_12_Request, ObservableCollection<rptL_3_12_Info>> rptL_3_12_Command
        {
            get
            {
                return new WorkCommand<rptL_3_12_Request, ObservableCollection<rptL_3_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_12_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ�������
        /// </summary>
        public IWorkCommand<rptL_3_13_Request, ObservableCollection<rptL_3_13_Info>> rptL_3_13_Command
        {
            get
            {
                return new WorkCommand<rptL_3_13_Request, ObservableCollection<rptL_3_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_13_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ�ʲ�����
        /// </summary>
        public IWorkCommand<rptL_3_14_Request, ObservableCollection<rptL_3_14_Info>> rptL_3_14_Command
        {
            get
            {
                return new WorkCommand<rptL_3_14_Request, ObservableCollection<rptL_3_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_14_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ�ֲַ���
        /// </summary>
        public IWorkCommand<rptL_3_15_Request, ObservableCollection<rptL_3_15_Info>> rptL_3_15_Command
        {
            get
            {
                return new WorkCommand<rptL_3_15_Request, ObservableCollection<rptL_3_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_15_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��ҵ����
        /// </summary>
        public IWorkCommand<rptL_3_16_Request, ObservableCollection<rptL_3_16_Info>> rptL_3_16_Command
        {
            get
            {
                return new WorkCommand<rptL_3_16_Request, ObservableCollection<rptL_3_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_16_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��ҵ�ֲַ���
        /// </summary>
        public IWorkCommand<rptL_3_17_Request, ObservableCollection<rptL_3_17_Info>> rptL_3_17_Command
        {
            get
            {
                return new WorkCommand<rptL_3_17_Request, ObservableCollection<rptL_3_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_17_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒ�ֲ�
        /// </summary>
        public IWorkCommand<rptL_3_18_Request, ObservableCollection<rptL_3_18_Info>> rptL_3_18_Command
        {
            get
            {
                return new WorkCommand<rptL_3_18_Request, ObservableCollection<rptL_3_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_18_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒ�ֲֶԱ�
        /// </summary>
        public IWorkCommand<rptL_3_19_Request, ObservableCollection<rptL_3_19_Info>> rptL_3_19_Command
        {
            get
            {
                return new WorkCommand<rptL_3_19_Request, ObservableCollection<rptL_3_19_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_19_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ�ֲ�֤ȯ��Ʒ
        /// </summary>
        public IWorkCommand<rptL_3_20_Request, ObservableCollection<rptL_3_20_Info>> rptL_3_20_Command
        {
            get
            {
                return new WorkCommand<rptL_3_20_Request, ObservableCollection<rptL_3_20_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_20_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_�ֲַ�����ѯ����֤ȯ����
        /// </summary>
        public IWorkCommand<rptL_3_21_Request, ObservableCollection<rptL_3_21_Info>> rptL_3_21_Command
        {
            get
            {
                return new WorkCommand<rptL_3_21_Request, ObservableCollection<rptL_3_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_21_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_�ֲַ�����ѯ�����г�
        /// </summary>
        public IWorkCommand<rptL_3_22_Request, ObservableCollection<rptL_3_22_Info>> rptL_3_22_Command
        {
            get
            {
                return new WorkCommand<rptL_3_22_Request, ObservableCollection<rptL_3_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_22_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_�ֲַ�����ѯ����֤ȯ���
        /// </summary>
        public IWorkCommand<rptL_3_23_Request, ObservableCollection<rptL_3_23_Info>> rptL_3_23_Command
        {
            get
            {
                return new WorkCommand<rptL_3_23_Request, ObservableCollection<rptL_3_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_23_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_�ֲַ�����ѯ���ܲ�Ʒ����
        /// </summary>
        public IWorkCommand<rptL_3_24_Request, ObservableCollection<rptL_3_24_Info>> rptL_3_24_Command
        {
            get
            {
                return new WorkCommand<rptL_3_24_Request, ObservableCollection<rptL_3_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_24_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_�ֲַ�����ѯ��ϸ�ֲ�
        /// </summary>
        public IWorkCommand<rptL_3_25_Request, ObservableCollection<rptL_3_25_Info>> rptL_3_25_Command
        {
            get
            {
                return new WorkCommand<rptL_3_25_Request, ObservableCollection<rptL_3_25_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_25_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_ծȯ������ѯ��ϸ
        /// </summary>
        public IWorkCommand<rptL_3_26_Request, ObservableCollection<rptL_3_26_Info>> rptL_3_26_Command
        {
            get
            {
                return new WorkCommand<rptL_3_26_Request, ObservableCollection<rptL_3_26_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_26_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_ծȯ������ѯ��ҵȨ��
        /// </summary>
        public IWorkCommand<rptL_3_27_Request, ObservableCollection<rptL_3_27_Info>> rptL_3_27_Command
        {
            get
            {
                return new WorkCommand<rptL_3_27_Request, ObservableCollection<rptL_3_27_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_27_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_�ڻ��ֲֲ�ѯ��ϸ
        /// </summary>
        public IWorkCommand<rptL_3_29_Request, ObservableCollection<rptL_3_29_Info>> rptL_3_29_Command
        {
            get
            {
                return new WorkCommand<rptL_3_29_Request, ObservableCollection<rptL_3_29_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_29_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_�ڻ���֤�����
        /// </summary>
        public IWorkCommand<rptL_3_30_Request, ObservableCollection<rptL_3_30_Info>> rptL_3_30_Command
        {
            get
            {
                return new WorkCommand<rptL_3_30_Request, ObservableCollection<rptL_3_30_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_30_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_�ڻ��ֲֲ�Ʒ�ֲ�
        /// </summary>
        public IWorkCommand<rptL_3_31_Request, ObservableCollection<rptL_3_31_Info>> rptL_3_31_Command
        {
            get
            {
                return new WorkCommand<rptL_3_31_Request, ObservableCollection<rptL_3_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_31_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_�ڻ��ֲֲ�Ʒ�ֲ���ϸ
        /// </summary>
        public IWorkCommand<rptL_3_32_Request, ObservableCollection<rptL_3_32_Info>> rptL_3_32_Command
        {
            get
            {
                return new WorkCommand<rptL_3_32_Request, ObservableCollection<rptL_3_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_32_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒ����ָ��
        /// </summary>
        public IWorkCommand<rptL_3_34_Request, ObservableCollection<rptL_3_34_Info>> rptL_3_34_Command
        {
            get
            {
                return new WorkCommand<rptL_3_34_Request, ObservableCollection<rptL_3_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_34_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒ����ЧӦ
        /// </summary>
        public IWorkCommand<rptL_3_35_Request, ObservableCollection<rptL_3_35_Info>> rptL_3_35_Command
        {
            get
            {
                return new WorkCommand<rptL_3_35_Request, ObservableCollection<rptL_3_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_35_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒ���佻��ͳ��
        /// </summary>
        public IWorkCommand<rptL_3_36_Request, ObservableCollection<rptL_3_36_Info>> rptL_3_36_Command
        {
            get
            {
                return new WorkCommand<rptL_3_36_Request, ObservableCollection<rptL_3_36_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_36_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒծȯ�¶ȳֲ�ͳ��
        /// </summary>
        public IWorkCommand<rptL_3_37_Request, ObservableCollection<rptL_3_37_Info>> rptL_3_37_Command
        {
            get
            {
                return new WorkCommand<rptL_3_37_Request, ObservableCollection<rptL_3_37_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_37_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒծȯ�¶Ƚ�����ϸ
        /// </summary>
        public IWorkCommand<rptL_3_38_Request, ObservableCollection<rptL_3_38_Info>> rptL_3_38_Command
        {
            get
            {
                return new WorkCommand<rptL_3_38_Request, ObservableCollection<rptL_3_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_38_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒծȯ�¶Ƚ��׻���
        /// </summary>
        public IWorkCommand<rptL_3_39_Request, ObservableCollection<rptL_3_39_Info>> rptL_3_39_Command
        {
            get
            {
                return new WorkCommand<rptL_3_39_Request, ObservableCollection<rptL_3_39_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_39_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒծȯ�¶��ʲ�ͳ��
        /// </summary>
        public IWorkCommand<rptL_3_40_Request, ObservableCollection<rptL_3_40_Info>> rptL_3_40_Command
        {
            get
            {
                return new WorkCommand<rptL_3_40_Request, ObservableCollection<rptL_3_40_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_40_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒ�ֲ���ϸ
        /// </summary>
        public IWorkCommand<rptL_3_61_Request, ObservableCollection<rptL_3_61_Info>> rptL_3_61_Command
        {
            get
            {
                return new WorkCommand<rptL_3_61_Request, ObservableCollection<rptL_3_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_61_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒ������ϸ
        /// </summary>
        public IWorkCommand<rptL_3_62_Request, ObservableCollection<rptL_3_62_Info>> rptL_3_62_Command
        {
            get
            {
                return new WorkCommand<rptL_3_62_Request, ObservableCollection<rptL_3_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_62_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒ���׻��ܷ���
        /// </summary>
        public IWorkCommand<rptL_3_63_Request, ObservableCollection<rptL_3_63_Info>> rptL_3_63_Command
        {
            get
            {
                return new WorkCommand<rptL_3_63_Request, ObservableCollection<rptL_3_63_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_63_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒ���׻���֤ȯ����
        /// </summary>
        public IWorkCommand<rptL_3_64_Request, ObservableCollection<rptL_3_64_Info>> rptL_3_64_Command
        {
            get
            {
                return new WorkCommand<rptL_3_64_Request, ObservableCollection<rptL_3_64_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_64_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒ�ֲֻ���
        /// </summary>
        public IWorkCommand<rptL_3_66_Request, ObservableCollection<rptL_3_66_Info>> rptL_3_66_Command
        {
            get
            {
                return new WorkCommand<rptL_3_66_Request, ObservableCollection<rptL_3_66_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_66_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ�����ֲֻ���
        /// </summary>
        public IWorkCommand<rptL_3_67_Request, ObservableCollection<rptL_3_67_Info>> rptL_3_67_Command
        {
            get
            {
                return new WorkCommand<rptL_3_67_Request, ObservableCollection<rptL_3_67_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_67_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒ�ֲֽ��׻���
        /// </summary>
        public IWorkCommand<rptL_3_68_Request, ObservableCollection<rptL_3_68_Info>> rptL_3_68_Command
        {
            get
            {
                return new WorkCommand<rptL_3_68_Request, ObservableCollection<rptL_3_68_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_68_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ�������ʲ��ֲָ�������
        /// </summary>
        public IWorkCommand<rptL_3_81_Request, ObservableCollection<rptL_3_81_Info>> rptL_3_81_Command
        {
            get
            {
                return new WorkCommand<rptL_3_81_Request, ObservableCollection<rptL_3_81_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_81_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ����֤ȯ�ֲֳɽ�
        /// </summary>
        public IWorkCommand<rptL_3_82_Request, ObservableCollection<rptL_3_82_Info>> rptL_3_82_Command
        {
            get
            {
                return new WorkCommand<rptL_3_82_Request, ObservableCollection<rptL_3_82_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_82_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ������֤ȯ�ֲ���ϸ
        /// </summary>
        public IWorkCommand<rptL_3_83_Request, ObservableCollection<rptL_3_83_Info>> rptL_3_83_Command
        {
            get
            {
                return new WorkCommand<rptL_3_83_Request, ObservableCollection<rptL_3_83_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_83_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ������ֲ�����ӯ��
        /// </summary>
        public IWorkCommand<rptL_3_101_Request, ObservableCollection<rptL_3_101_Info>> rptL_3_101_Command
        {
            get
            {
                return new WorkCommand<rptL_3_101_Request, ObservableCollection<rptL_3_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_101_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ������ֲ�����ӯ����ҵ
        /// </summary>
        public IWorkCommand<rptL_3_102_Request, ObservableCollection<rptL_3_102_Info>> rptL_3_102_Command
        {
            get
            {
                return new WorkCommand<rptL_3_102_Request, ObservableCollection<rptL_3_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_102_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯ��Ʒ�ֲ�����ӯ��
        /// </summary>
        public IWorkCommand<rptL_3_103_Request, ObservableCollection<rptL_3_103_Info>> rptL_3_103_Command
        {
            get
            {
                return new WorkCommand<rptL_3_103_Request, ObservableCollection<rptL_3_103_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_103_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯƽ̨��Ʒ���ձ���
        /// </summary>
        public IWorkCommand<rptL_3_201_Request, ObservableCollection<rptL_3_201_Info>> rptL_3_201_Command
        {
            get
            {
                return new WorkCommand<rptL_3_201_Request, ObservableCollection<rptL_3_201_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_201_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_�����ѯ_��ѯƽ̨��Ʒ��������
        /// </summary>
        public IWorkCommand<rptL_3_202_Request, ObservableCollection<rptL_3_202_Info>> rptL_3_202_Command
        {
            get
            {
                return new WorkCommand<rptL_3_202_Request, ObservableCollection<rptL_3_202_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_3_202_InfoList;
                });
            }
        }

    }
}
