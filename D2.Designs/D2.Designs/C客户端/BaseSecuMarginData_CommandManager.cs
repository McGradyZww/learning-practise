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
    public partial class BaseSecuMarginDataCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_����_������ȯ��������_�����ɳ�ֱ�֤��֤ȯ��
        /// </summary>
        public IWorkCommand<pubL_29_1_Request, ObservableCollection<pubL_29_1_Info>> pubL_29_1_Command
        {
            get
            {
                return new WorkCommand<pubL_29_1_Request, ObservableCollection<pubL_29_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_1_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_�޸Ŀɳ�ֱ�֤��֤ȯ��
        /// </summary>
        public IWorkCommand<pubL_29_2_Request, ObservableCollection<pubL_29_2_Info>> pubL_29_2_Command
        {
            get
            {
                return new WorkCommand<pubL_29_2_Request, ObservableCollection<pubL_29_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_2_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_ɾ���ɳ�ֱ�֤��֤ȯ��
        /// </summary>
        public IWorkCommand<pubL_29_3_Request, ObservableCollection<pubL_29_3_Info>> pubL_29_3_Command
        {
            get
            {
                return new WorkCommand<pubL_29_3_Request, ObservableCollection<pubL_29_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_3_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_��ѯ�ɳ�ֱ�֤��֤ȯ��
        /// </summary>
        public IWorkCommand<pubL_29_4_Request, ObservableCollection<pubL_29_4_Info>> pubL_29_4_Command
        {
            get
            {
                return new WorkCommand<pubL_29_4_Request, ObservableCollection<pubL_29_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_4_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_����������ȯ���ñ�
        /// </summary>
        public IWorkCommand<pubL_29_5_Request, ObservableCollection<pubL_29_5_Info>> pubL_29_5_Command
        {
            get
            {
                return new WorkCommand<pubL_29_5_Request, ObservableCollection<pubL_29_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_5_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_�޸�������ȯ���ñ�
        /// </summary>
        public IWorkCommand<pubL_29_6_Request, ObservableCollection<pubL_29_6_Info>> pubL_29_6_Command
        {
            get
            {
                return new WorkCommand<pubL_29_6_Request, ObservableCollection<pubL_29_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_6_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_ɾ��������ȯ���ñ�
        /// </summary>
        public IWorkCommand<pubL_29_7_Request, ObservableCollection<pubL_29_7_Info>> pubL_29_7_Command
        {
            get
            {
                return new WorkCommand<pubL_29_7_Request, ObservableCollection<pubL_29_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_7_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_��ѯ������ȯ���ñ�
        /// </summary>
        public IWorkCommand<pubL_29_8_Request, ObservableCollection<pubL_29_8_Info>> pubL_29_8_Command
        {
            get
            {
                return new WorkCommand<pubL_29_8_Request, ObservableCollection<pubL_29_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_8_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_����������ȯ���֤ȯ��
        /// </summary>
        public IWorkCommand<pubL_29_9_Request, ObservableCollection<pubL_29_9_Info>> pubL_29_9_Command
        {
            get
            {
                return new WorkCommand<pubL_29_9_Request, ObservableCollection<pubL_29_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_9_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_�޸�������ȯ���֤ȯ��
        /// </summary>
        public IWorkCommand<pubL_29_10_Request, ObservableCollection<pubL_29_10_Info>> pubL_29_10_Command
        {
            get
            {
                return new WorkCommand<pubL_29_10_Request, ObservableCollection<pubL_29_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_10_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_ɾ��������ȯ���֤ȯ��
        /// </summary>
        public IWorkCommand<pubL_29_11_Request, ObservableCollection<pubL_29_11_Info>> pubL_29_11_Command
        {
            get
            {
                return new WorkCommand<pubL_29_11_Request, ObservableCollection<pubL_29_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_11_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_��ѯ������ȯ���֤ȯ��
        /// </summary>
        public IWorkCommand<pubL_29_12_Request, ObservableCollection<pubL_29_12_Info>> pubL_29_12_Command
        {
            get
            {
                return new WorkCommand<pubL_29_12_Request, ObservableCollection<pubL_29_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_12_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_����������ȯȯ�̽�ֹ���֤ȯ��
        /// </summary>
        public IWorkCommand<pubL_29_13_Request, ObservableCollection<pubL_29_13_Info>> pubL_29_13_Command
        {
            get
            {
                return new WorkCommand<pubL_29_13_Request, ObservableCollection<pubL_29_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_13_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_�޸�������ȯȯ�̽�ֹ���֤ȯ��
        /// </summary>
        public IWorkCommand<pubL_29_14_Request, ObservableCollection<pubL_29_14_Info>> pubL_29_14_Command
        {
            get
            {
                return new WorkCommand<pubL_29_14_Request, ObservableCollection<pubL_29_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_14_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_ɾ��������ȯȯ�̽�ֹ���֤ȯ��
        /// </summary>
        public IWorkCommand<pubL_29_15_Request, ObservableCollection<pubL_29_15_Info>> pubL_29_15_Command
        {
            get
            {
                return new WorkCommand<pubL_29_15_Request, ObservableCollection<pubL_29_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_15_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_��ѯ������ȯȯ�̽�ֹ���֤ȯ��
        /// </summary>
        public IWorkCommand<pubL_29_16_Request, ObservableCollection<pubL_29_16_Info>> pubL_29_16_Command
        {
            get
            {
                return new WorkCommand<pubL_29_16_Request, ObservableCollection<pubL_29_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_16_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_����������ȯ��֤��������ñ�
        /// </summary>
        public IWorkCommand<pubL_29_17_Request, ObservableCollection<pubL_29_17_Info>> pubL_29_17_Command
        {
            get
            {
                return new WorkCommand<pubL_29_17_Request, ObservableCollection<pubL_29_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_17_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_�޸�������ȯ��֤��������ñ�
        /// </summary>
        public IWorkCommand<pubL_29_18_Request, ObservableCollection<pubL_29_18_Info>> pubL_29_18_Command
        {
            get
            {
                return new WorkCommand<pubL_29_18_Request, ObservableCollection<pubL_29_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_18_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_ɾ��������ȯ��֤��������ñ�
        /// </summary>
        public IWorkCommand<pubL_29_19_Request, ObservableCollection<pubL_29_19_Info>> pubL_29_19_Command
        {
            get
            {
                return new WorkCommand<pubL_29_19_Request, ObservableCollection<pubL_29_19_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_19_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_��ѯ������ȯ��֤��������ñ�
        /// </summary>
        public IWorkCommand<pubL_29_20_Request, ObservableCollection<pubL_29_20_Info>> pubL_29_20_Command
        {
            get
            {
                return new WorkCommand<pubL_29_20_Request, ObservableCollection<pubL_29_20_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_20_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_��ȡ������ȯ��֤���������
        /// </summary>
        public IWorkCommand<pubL_29_21_Request, ObservableCollection<pubL_29_21_Info>> pubL_29_21_Command
        {
            get
            {
                return new WorkCommand<pubL_29_21_Request, ObservableCollection<pubL_29_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_21_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_��ȡ�ɳ�ֱ�֤��֤ȯ��
        /// </summary>
        public IWorkCommand<pubL_29_22_Request, ObservableCollection<pubL_29_22_Info>> pubL_29_22_Command
        {
            get
            {
                return new WorkCommand<pubL_29_22_Request, ObservableCollection<pubL_29_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_22_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_��ѯ����������ȯ��֤�����
        /// </summary>
        public IWorkCommand<pubL_29_23_Request, ObservableCollection<pubL_29_23_Info>> pubL_29_23_Command
        {
            get
            {
                return new WorkCommand<pubL_29_23_Request, ObservableCollection<pubL_29_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_23_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_�ɳ�ֱ�֤��֤ȯ����
        /// </summary>
        public IWorkCommand<pubL_29_24_Request, ObservableCollection<pubL_29_24_Info>> pubL_29_24_Command
        {
            get
            {
                return new WorkCommand<pubL_29_24_Request, ObservableCollection<pubL_29_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_24_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_������ȯ��������_������ȯ���֤ȯ����
        /// </summary>
        public IWorkCommand<pubL_29_25_Request, ObservableCollection<pubL_29_25_Info>> pubL_29_25_Command
        {
            get
            {
                return new WorkCommand<pubL_29_25_Request, ObservableCollection<pubL_29_25_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_25_InfoList;
                });
            }
        }

    }
}
