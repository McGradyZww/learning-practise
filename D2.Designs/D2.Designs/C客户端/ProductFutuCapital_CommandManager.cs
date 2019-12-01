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
    public partial class ProductFutuCapitalCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_�����Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_8_Request, ObservableCollection<pdfutuL_2_8_Info>> pdfutuL_2_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_8_Request, ObservableCollection<pdfutuL_2_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_���ղ�Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_9_Request, ObservableCollection<pdfutuL_2_9_Info>> pdfutuL_2_9_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_9_Request, ObservableCollection<pdfutuL_2_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_9_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_��Ȩ��Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_10_Request, ObservableCollection<pdfutuL_2_10_Info>> pdfutuL_2_10_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_10_Request, ObservableCollection<pdfutuL_2_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_10_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_������Ȩ��Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_11_Request, ObservableCollection<pdfutuL_2_11_Info>> pdfutuL_2_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_11_Request, ObservableCollection<pdfutuL_2_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_���ύ�����ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_32_Request, ObservableCollection<pdfutuL_2_32_Info>> pdfutuL_2_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_32_Request, ObservableCollection<pdfutuL_2_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_ȡ�����ύ�����ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_33_Request, ObservableCollection<pdfutuL_2_33_Info>> pdfutuL_2_33_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_33_Request, ObservableCollection<pdfutuL_2_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_33_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_�ⶳ�������ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_34_Request, ObservableCollection<pdfutuL_2_34_Info>> pdfutuL_2_34_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_34_Request, ObservableCollection<pdfutuL_2_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_34_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_ȡ���ⶳ�������ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_35_Request, ObservableCollection<pdfutuL_2_35_Info>> pdfutuL_2_35_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_35_Request, ObservableCollection<pdfutuL_2_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_35_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_��ѯ�������ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_37_Request, ObservableCollection<pdfutuL_2_37_Info>> pdfutuL_2_37_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_37_Request, ObservableCollection<pdfutuL_2_37_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_37_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_��ѯ��ʷ�������ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_38_Request, ObservableCollection<pdfutuL_2_38_Info>> pdfutuL_2_38_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_38_Request, ObservableCollection<pdfutuL_2_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_38_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_��ѯ�������ʽ���ˮ
        /// </summary>
        public IWorkCommand<pdfutuL_2_39_Request, ObservableCollection<pdfutuL_2_39_Info>> pdfutuL_2_39_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_39_Request, ObservableCollection<pdfutuL_2_39_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_39_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_��ѯ��ʷ�������ʽ���ˮ
        /// </summary>
        public IWorkCommand<pdfutuL_2_40_Request, ObservableCollection<pdfutuL_2_40_Info>> pdfutuL_2_40_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_40_Request, ObservableCollection<pdfutuL_2_40_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_40_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_��ѯ�������ʽ𶳽�ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdfutuL_2_41_Request, ObservableCollection<pdfutuL_2_41_Info>> pdfutuL_2_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_41_Request, ObservableCollection<pdfutuL_2_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_��ѯ��ʷ�������ʽ𶳽�ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdfutuL_2_42_Request, ObservableCollection<pdfutuL_2_42_Info>> pdfutuL_2_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_42_Request, ObservableCollection<pdfutuL_2_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_��������ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_51_Request, ObservableCollection<pdfutuL_2_51_Info>> pdfutuL_2_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_51_Request, ObservableCollection<pdfutuL_2_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_�����ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_52_Request, ObservableCollection<pdfutuL_2_52_Info>> pdfutuL_2_52_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_52_Request, ObservableCollection<pdfutuL_2_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_52_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_ȡ�������ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_53_Request, ObservableCollection<pdfutuL_2_53_Info>> pdfutuL_2_53_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_53_Request, ObservableCollection<pdfutuL_2_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_53_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_�ⶳ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_54_Request, ObservableCollection<pdfutuL_2_54_Info>> pdfutuL_2_54_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_54_Request, ObservableCollection<pdfutuL_2_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_54_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_ȡ���ⶳ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_55_Request, ObservableCollection<pdfutuL_2_55_Info>> pdfutuL_2_55_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_55_Request, ObservableCollection<pdfutuL_2_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_55_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_��ѯ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_57_Request, ObservableCollection<pdfutuL_2_57_Info>> pdfutuL_2_57_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_57_Request, ObservableCollection<pdfutuL_2_57_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_57_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_��ѯ��ʷ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_58_Request, ObservableCollection<pdfutuL_2_58_Info>> pdfutuL_2_58_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_58_Request, ObservableCollection<pdfutuL_2_58_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_58_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_��ѯ�ʲ��˻��ʽ���ˮ
        /// </summary>
        public IWorkCommand<pdfutuL_2_59_Request, ObservableCollection<pdfutuL_2_59_Info>> pdfutuL_2_59_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_59_Request, ObservableCollection<pdfutuL_2_59_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_59_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_��ѯ��ʷ�ʲ��˻��ʽ���ˮ
        /// </summary>
        public IWorkCommand<pdfutuL_2_60_Request, ObservableCollection<pdfutuL_2_60_Info>> pdfutuL_2_60_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_60_Request, ObservableCollection<pdfutuL_2_60_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_60_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_��ѯ�ʲ��˻��ʽ𶳽�ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdfutuL_2_61_Request, ObservableCollection<pdfutuL_2_61_Info>> pdfutuL_2_61_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_61_Request, ObservableCollection<pdfutuL_2_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_61_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_��ѯ��ʷ�ʲ��˻��ʽ𶳽�ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdfutuL_2_62_Request, ObservableCollection<pdfutuL_2_62_Info>> pdfutuL_2_62_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_62_Request, ObservableCollection<pdfutuL_2_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_62_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ�_ת���ⲿ�ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_2_101_Request, ObservableCollection<pdfutuL_2_101_Info>> pdfutuL_2_101_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_101_Request, ObservableCollection<pdfutuL_2_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_101_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
