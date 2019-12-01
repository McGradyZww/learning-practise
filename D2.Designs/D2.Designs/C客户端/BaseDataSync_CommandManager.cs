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
    public partial class BaseDataSyncCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_����_��������ͬ��_��ѯ�¹���Ϣ��
        /// </summary>
        public IWorkCommand<pubL_28_101_Request, ObservableCollection<pubL_28_101_Info>> pubL_28_101_Command
        {
            get
            {
                return new WorkCommand<pubL_28_101_Request, ObservableCollection<pubL_28_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_101_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_�����¹���Ϣ��
        /// </summary>
        public IWorkCommand<pubL_28_102_Request, ObservableCollection<pubL_28_102_Info>> pubL_28_102_Command
        {
            get
            {
                return new WorkCommand<pubL_28_102_Request, ObservableCollection<pubL_28_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_102_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_��ѯ֤ȯ������Ϣ��
        /// </summary>
        public IWorkCommand<pubL_28_111_Request, ObservableCollection<pubL_28_111_Info>> pubL_28_111_Command
        {
            get
            {
                return new WorkCommand<pubL_28_111_Request, ObservableCollection<pubL_28_111_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_111_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_����֤ȯ������Ϣ��
        /// </summary>
        public IWorkCommand<pubL_28_112_Request, ObservableCollection<pubL_28_112_Info>> pubL_28_112_Command
        {
            get
            {
                return new WorkCommand<pubL_28_112_Request, ObservableCollection<pubL_28_112_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_112_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_��ѯծȯ������Ϣ��
        /// </summary>
        public IWorkCommand<pubL_28_121_Request, ObservableCollection<pubL_28_121_Info>> pubL_28_121_Command
        {
            get
            {
                return new WorkCommand<pubL_28_121_Request, ObservableCollection<pubL_28_121_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_121_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_����ծȯ������Ϣ��
        /// </summary>
        public IWorkCommand<pubL_28_122_Request, ObservableCollection<pubL_28_122_Info>> pubL_28_122_Command
        {
            get
            {
                return new WorkCommand<pubL_28_122_Request, ObservableCollection<pubL_28_122_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_122_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_��ѯ֤ȯ�����
        /// </summary>
        public IWorkCommand<pubL_28_131_Request, ObservableCollection<pubL_28_131_Info>> pubL_28_131_Command
        {
            get
            {
                return new WorkCommand<pubL_28_131_Request, ObservableCollection<pubL_28_131_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_131_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_����֤ȯ�����
        /// </summary>
        public IWorkCommand<pubL_28_132_Request, ObservableCollection<pubL_28_132_Info>> pubL_28_132_Command
        {
            get
            {
                return new WorkCommand<pubL_28_132_Request, ObservableCollection<pubL_28_132_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_132_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_��ѯ����ӳ���
        /// </summary>
        public IWorkCommand<pubL_28_141_Request, ObservableCollection<pubL_28_141_Info>> pubL_28_141_Command
        {
            get
            {
                return new WorkCommand<pubL_28_141_Request, ObservableCollection<pubL_28_141_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_141_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_���´���ӳ���
        /// </summary>
        public IWorkCommand<pubL_28_142_Request, ObservableCollection<pubL_28_142_Info>> pubL_28_142_Command
        {
            get
            {
                return new WorkCommand<pubL_28_142_Request, ObservableCollection<pubL_28_142_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_142_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_��ѯ֤ȯ���붩�������
        /// </summary>
        public IWorkCommand<pubL_28_151_Request, ObservableCollection<pubL_28_151_Info>> pubL_28_151_Command
        {
            get
            {
                return new WorkCommand<pubL_28_151_Request, ObservableCollection<pubL_28_151_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_151_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_����֤ȯ���붩�������
        /// </summary>
        public IWorkCommand<pubL_28_152_Request, ObservableCollection<pubL_28_152_Info>> pubL_28_152_Command
        {
            get
            {
                return new WorkCommand<pubL_28_152_Request, ObservableCollection<pubL_28_152_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_152_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_��ѯ�۹�ͨ���ʱ�
        /// </summary>
        public IWorkCommand<pubL_28_161_Request, ObservableCollection<pubL_28_161_Info>> pubL_28_161_Command
        {
            get
            {
                return new WorkCommand<pubL_28_161_Request, ObservableCollection<pubL_28_161_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_161_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_���¸۹�ͨ���ʱ�
        /// </summary>
        public IWorkCommand<pubL_28_162_Request, ObservableCollection<pubL_28_162_Info>> pubL_28_162_Command
        {
            get
            {
                return new WorkCommand<pubL_28_162_Request, ObservableCollection<pubL_28_162_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_162_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_����A�ɹɱ���Ϣ
        /// </summary>
        public IWorkCommand<pubL_28_171_Request, ObservableCollection<pubL_28_171_Info>> pubL_28_171_Command
        {
            get
            {
                return new WorkCommand<pubL_28_171_Request, ObservableCollection<pubL_28_171_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_171_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_�����¹���Ϣ
        /// </summary>
        public IWorkCommand<pubL_28_172_Request, ObservableCollection<pubL_28_172_Info>> pubL_28_172_Command
        {
            get
            {
                return new WorkCommand<pubL_28_172_Request, ObservableCollection<pubL_28_172_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_172_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_���¿�תծ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_28_173_Request, ObservableCollection<pubL_28_173_Info>> pubL_28_173_Command
        {
            get
            {
                return new WorkCommand<pubL_28_173_Request, ObservableCollection<pubL_28_173_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_173_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_���»�����Ϣ
        /// </summary>
        public IWorkCommand<pubL_28_174_Request, ObservableCollection<pubL_28_174_Info>> pubL_28_174_Command
        {
            get
            {
                return new WorkCommand<pubL_28_174_Request, ObservableCollection<pubL_28_174_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_174_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_����ծȯ��Ϣ
        /// </summary>
        public IWorkCommand<pubL_28_175_Request, ObservableCollection<pubL_28_175_Info>> pubL_28_175_Command
        {
            get
            {
                return new WorkCommand<pubL_28_175_Request, ObservableCollection<pubL_28_175_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_175_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_��ѯ�Զ�ͬ�����ñ�
        /// </summary>
        public IWorkCommand<pubL_28_201_Request, ObservableCollection<pubL_28_201_Info>> pubL_28_201_Command
        {
            get
            {
                return new WorkCommand<pubL_28_201_Request, ObservableCollection<pubL_28_201_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_201_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_�����Զ�ͬ������
        /// </summary>
        public IWorkCommand<pubL_28_202_Request, ObservableCollection<pubL_28_202_Info>> pubL_28_202_Command
        {
            get
            {
                return new WorkCommand<pubL_28_202_Request, ObservableCollection<pubL_28_202_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_202_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_�޸��Զ�ͬ������
        /// </summary>
        public IWorkCommand<pubL_28_203_Request, ObservableCollection<pubL_28_203_Info>> pubL_28_203_Command
        {
            get
            {
                return new WorkCommand<pubL_28_203_Request, ObservableCollection<pubL_28_203_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_203_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_ɾ���Զ�ͬ������
        /// </summary>
        public IWorkCommand<pubL_28_204_Request, ObservableCollection<pubL_28_204_Info>> pubL_28_204_Command
        {
            get
            {
                return new WorkCommand<pubL_28_204_Request, ObservableCollection<pubL_28_204_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_204_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_�����Զ�ͬ�������־
        /// </summary>
        public IWorkCommand<pubL_28_205_Request, ObservableCollection<pubL_28_205_Info>> pubL_28_205_Command
        {
            get
            {
                return new WorkCommand<pubL_28_205_Request, ObservableCollection<pubL_28_205_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_205_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_��ѯ�Զ�ͬ����־��
        /// </summary>
        public IWorkCommand<pubL_28_106_Request, ObservableCollection<pubL_28_106_Info>> pubL_28_106_Command
        {
            get
            {
                return new WorkCommand<pubL_28_106_Request, ObservableCollection<pubL_28_106_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_106_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_�����Զ�ͬ����־
        /// </summary>
        public IWorkCommand<pubL_28_107_Request, ObservableCollection<pubL_28_107_Info>> pubL_28_107_Command
        {
            get
            {
                return new WorkCommand<pubL_28_107_Request, ObservableCollection<pubL_28_107_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_107_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����_��������ͬ��_����Զ�ͬ����־
        /// </summary>
        public IWorkCommand<pubL_28_108_Request, ObservableCollection<pubL_28_108_Info>> pubL_28_108_Command
        {
            get
            {
                return new WorkCommand<pubL_28_108_Request, ObservableCollection<pubL_28_108_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_28_108_InfoList;
                });
            }
        }

    }
}
