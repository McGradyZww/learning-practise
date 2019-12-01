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
    public partial class BaseClientCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_����_�����ͻ���_��ȡ��������ʱ��
        /// </summary>
        public IWorkCommand<pubL_17_8_Request, ObservableCollection<pubL_17_8_Info>> pubL_17_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_8_Request, ObservableCollection<pubL_17_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_�޸Ļ�����Ϣ
        /// </summary>
        public IWorkCommand<pubL_17_12_Request, ObservableCollection<pubL_17_12_Info>> pubL_17_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_12_Request, ObservableCollection<pubL_17_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_�޸Ļ���ҵ��������ô�
        /// </summary>
        public IWorkCommand<pubL_17_13_Request, ObservableCollection<pubL_17_13_Info>> pubL_17_13_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_13_Request, ObservableCollection<pubL_17_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_13_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_��ѯ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_17_18_Request, ObservableCollection<pubL_17_18_Info>> pubL_17_18_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_18_Request, ObservableCollection<pubL_17_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_18_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_��ѯϵͳ����
        /// </summary>
        public IWorkCommand<pubL_17_32_Request, ObservableCollection<pubL_17_32_Info>> pubL_17_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_32_Request, ObservableCollection<pubL_17_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_��ѯ��������
        /// </summary>
        public IWorkCommand<pubL_17_38_Request, ObservableCollection<pubL_17_38_Info>> pubL_17_38_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_38_Request, ObservableCollection<pubL_17_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_38_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_����ͨ��
        /// </summary>
        public IWorkCommand<pubL_17_154_Request, ObservableCollection<pubL_17_154_Info>> pubL_17_154_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_154_Request, ObservableCollection<pubL_17_154_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_154_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_����ͨ��
        /// </summary>
        public IWorkCommand<pubL_17_155_Request, ObservableCollection<pubL_17_155_Info>> pubL_17_155_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_155_Request, ObservableCollection<pubL_17_155_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_155_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_��ȡ�۹�ͨ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_17_117_Request, ObservableCollection<pubL_17_117_Info>> pubL_17_117_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_117_Request, ObservableCollection<pubL_17_117_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_117_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_���¸۹�ͨ�����Ϣ
        /// </summary>
        public IWorkCommand<pubL_17_118_Request, ObservableCollection<pubL_17_118_Info>> pubL_17_118_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_118_Request, ObservableCollection<pubL_17_118_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_118_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_��ѯ�۹�ͨ�����Ϣ
        /// </summary>
        public IWorkCommand<pubL_17_119_Request, ObservableCollection<pubL_17_119_Info>> pubL_17_119_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_119_Request, ObservableCollection<pubL_17_119_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_119_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_��ѯ�����ֵ�
        /// </summary>
        public IWorkCommand<pubL_17_180_Request, ObservableCollection<pubL_17_180_Info>> pubL_17_180_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_180_Request, ObservableCollection<pubL_17_180_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_180_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_��ѯҵ���־
        /// </summary>
        public IWorkCommand<pubL_17_181_Request, ObservableCollection<pubL_17_181_Info>> pubL_17_181_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_181_Request, ObservableCollection<pubL_17_181_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_181_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_��ȡ����֤ȯ����
        /// </summary>
        public IWorkCommand<pubL_17_182_Request, ObservableCollection<pubL_17_182_Info>> pubL_17_182_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_182_Request, ObservableCollection<pubL_17_182_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_182_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_��ȡ����۹�ͨ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_17_120_Request, ObservableCollection<pubL_17_120_Info>> pubL_17_120_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_120_Request, ObservableCollection<pubL_17_120_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_120_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_��������۹�ͨ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_17_121_Request, ObservableCollection<pubL_17_121_Info>> pubL_17_121_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_121_Request, ObservableCollection<pubL_17_121_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_121_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_�޸�����۹�ͨ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_17_122_Request, ObservableCollection<pubL_17_122_Info>> pubL_17_122_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_122_Request, ObservableCollection<pubL_17_122_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_122_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_�޸��¹ɴ�����Ϣ
        /// </summary>
        public IWorkCommand<pubL_17_123_Request, ObservableCollection<pubL_17_123_Info>> pubL_17_123_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_123_Request, ObservableCollection<pubL_17_123_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_123_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_�޸Ŀ�תծ������Ϣ
        /// </summary>
        public IWorkCommand<pubL_17_124_Request, ObservableCollection<pubL_17_124_Info>> pubL_17_124_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_124_Request, ObservableCollection<pubL_17_124_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_124_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_�����Գ�������Ϣ
        /// </summary>
        public IWorkCommand<pubL_17_125_Request, ObservableCollection<pubL_17_125_Info>> pubL_17_125_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_125_Request, ObservableCollection<pubL_17_125_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_125_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_��ѯ�Գ�������Ϣ�����
        /// </summary>
        public IWorkCommand<pubL_17_126_Request, ObservableCollection<pubL_17_126_Info>> pubL_17_126_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_126_Request, ObservableCollection<pubL_17_126_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_126_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_��ѯ��ʷ�Գ�������Ϣ�����
        /// </summary>
        public IWorkCommand<pubL_17_127_Request, ObservableCollection<pubL_17_127_Info>> pubL_17_127_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_127_Request, ObservableCollection<pubL_17_127_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_127_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ͻ���_�޸ĶԳ�������Ϣ
        /// </summary>
        public IWorkCommand<pubL_17_128_Request, ObservableCollection<pubL_17_128_Info>> pubL_17_128_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_128_Request, ObservableCollection<pubL_17_128_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_128_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
