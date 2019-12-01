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
    public partial class ClearFoFutuClearCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_���������ڻ�_����_ת�붩����¼
        /// </summary>
        public IWorkCommand<clfofuL_2_1_Request, ObservableCollection<clfofuL_2_1_Info>> clfofuL_2_1_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_1_Request, ObservableCollection<clfofuL_2_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_1_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_��ѯ������¼
        /// </summary>
        public IWorkCommand<clfofuL_2_4_Request, ObservableCollection<clfofuL_2_4_Info>> clfofuL_2_4_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_4_Request, ObservableCollection<clfofuL_2_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_4_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_ת��ɽ���¼
        /// </summary>
        public IWorkCommand<clfofuL_2_6_Request, ObservableCollection<clfofuL_2_6_Info>> clfofuL_2_6_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_6_Request, ObservableCollection<clfofuL_2_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_6_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_��ѯ�ɽ���¼
        /// </summary>
        public IWorkCommand<clfofuL_2_9_Request, ObservableCollection<clfofuL_2_9_Info>> clfofuL_2_9_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_9_Request, ObservableCollection<clfofuL_2_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_9_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_���㴦��
        /// </summary>
        public IWorkCommand<clfofuL_2_31_Request, ObservableCollection<clfofuL_2_31_Info>> clfofuL_2_31_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_31_Request, ObservableCollection<clfofuL_2_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_31_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_�������ô���
        /// </summary>
        public IWorkCommand<clfofuL_2_32_Request, ObservableCollection<clfofuL_2_32_Info>> clfofuL_2_32_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_32_Request, ObservableCollection<clfofuL_2_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_32_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_�ϲ����㴦��
        /// </summary>
        public IWorkCommand<clfofuL_2_33_Request, ObservableCollection<clfofuL_2_33_Info>> clfofuL_2_33_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_33_Request, ObservableCollection<clfofuL_2_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_33_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_��ѯ�ϲ������¼
        /// </summary>
        public IWorkCommand<clfofuL_2_34_Request, ObservableCollection<clfofuL_2_34_Info>> clfofuL_2_34_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_34_Request, ObservableCollection<clfofuL_2_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_34_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_��ѯ�����˼�¼
        /// </summary>
        public IWorkCommand<clfofuL_2_35_Request, ObservableCollection<clfofuL_2_35_Info>> clfofuL_2_35_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_35_Request, ObservableCollection<clfofuL_2_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_35_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_���˴���
        /// </summary>
        public IWorkCommand<clfofuL_2_51_Request, ObservableCollection<clfofuL_2_51_Info>> clfofuL_2_51_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_51_Request, ObservableCollection<clfofuL_2_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_51_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_���˻ع�����
        /// </summary>
        public IWorkCommand<clfofuL_2_52_Request, ObservableCollection<clfofuL_2_52_Info>> clfofuL_2_52_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_52_Request, ObservableCollection<clfofuL_2_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_52_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_���ݹ���ʷ
        /// </summary>
        public IWorkCommand<clfofuL_2_71_Request, ObservableCollection<clfofuL_2_71_Info>> clfofuL_2_71_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_71_Request, ObservableCollection<clfofuL_2_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_71_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_����׼����ʱ����
        /// </summary>
        public IWorkCommand<clfofuL_2_101_Request, ObservableCollection<clfofuL_2_101_Info>> clfofuL_2_101_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_101_Request, ObservableCollection<clfofuL_2_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_101_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_�ɽ���Զ�ʱ����
        /// </summary>
        public IWorkCommand<clfutuL_2_102_Request, ObservableCollection<clfutuL_2_102_Info>> clfutuL_2_102_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_102_Request, ObservableCollection<clfutuL_2_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_102_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_���㴦��ʱ����
        /// </summary>
        public IWorkCommand<clfofuL_2_103_Request, ObservableCollection<clfofuL_2_103_Info>> clfofuL_2_103_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_103_Request, ObservableCollection<clfofuL_2_103_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_103_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_���˶�ʱ����
        /// </summary>
        public IWorkCommand<clfofuL_2_104_Request, ObservableCollection<clfofuL_2_104_Info>> clfofuL_2_104_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_104_Request, ObservableCollection<clfofuL_2_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_104_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_���������ڻ�_����_���ݹ���ʷ��ʱ����
        /// </summary>
        public IWorkCommand<clfofuL_2_106_Request, ObservableCollection<clfofuL_2_106_Info>> clfofuL_2_106_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_106_Request, ObservableCollection<clfofuL_2_106_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_106_InfoList;
                });
            }
        }

    }
}
