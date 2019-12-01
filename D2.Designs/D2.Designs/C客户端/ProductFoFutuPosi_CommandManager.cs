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
    public partial class ProductFoFutuPosiCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_�������������ֲ�
        /// </summary>
        public IWorkCommand<pdfofuL_3_1_Request, ObservableCollection<pdfofuL_3_1_Info>> pdfofuL_3_1_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_1_Request, ObservableCollection<pdfofuL_3_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_1_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_���ύ����ֲ�
        /// </summary>
        public IWorkCommand<pdfofuL_3_2_Request, ObservableCollection<pdfofuL_3_2_Info>> pdfofuL_3_2_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_2_Request, ObservableCollection<pdfofuL_3_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_2_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_ȡ�����ύ����ֲ�
        /// </summary>
        public IWorkCommand<pdfofuL_3_3_Request, ObservableCollection<pdfofuL_3_3_Info>> pdfofuL_3_3_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_3_Request, ObservableCollection<pdfofuL_3_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_3_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_�ⶳ������ֲ�
        /// </summary>
        public IWorkCommand<pdfofuL_3_4_Request, ObservableCollection<pdfofuL_3_4_Info>> pdfofuL_3_4_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_4_Request, ObservableCollection<pdfofuL_3_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_4_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_ȡ���ⶳ������ֲ�
        /// </summary>
        public IWorkCommand<pdfofuL_3_5_Request, ObservableCollection<pdfofuL_3_5_Info>> pdfofuL_3_5_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_5_Request, ObservableCollection<pdfofuL_3_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_5_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ������ֲ�
        /// </summary>
        public IWorkCommand<pdfofuL_3_21_Request, ObservableCollection<pdfofuL_3_21_Info>> pdfofuL_3_21_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_21_Request, ObservableCollection<pdfofuL_3_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_21_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ��ʷ������ֲ�
        /// </summary>
        public IWorkCommand<pdfofuL_3_22_Request, ObservableCollection<pdfofuL_3_22_Info>> pdfofuL_3_22_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_22_Request, ObservableCollection<pdfofuL_3_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_22_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ������ֲ���ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_3_31_Request, ObservableCollection<pdfofuL_3_31_Info>> pdfofuL_3_31_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_31_Request, ObservableCollection<pdfofuL_3_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_31_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ��ʷ������ֲ���ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_3_32_Request, ObservableCollection<pdfofuL_3_32_Info>> pdfofuL_3_32_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_32_Request, ObservableCollection<pdfofuL_3_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_32_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ������ֲֶ���ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_3_34_Request, ObservableCollection<pdfofuL_3_34_Info>> pdfofuL_3_34_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_34_Request, ObservableCollection<pdfofuL_3_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_34_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ��ʷ������ֲֶ���ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_3_35_Request, ObservableCollection<pdfofuL_3_35_Info>> pdfofuL_3_35_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_35_Request, ObservableCollection<pdfofuL_3_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_35_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��������ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdfofuL_3_51_Request, ObservableCollection<pdfofuL_3_51_Info>> pdfofuL_3_51_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_51_Request, ObservableCollection<pdfofuL_3_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_51_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_�����ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdfofuL_3_52_Request, ObservableCollection<pdfofuL_3_52_Info>> pdfofuL_3_52_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_52_Request, ObservableCollection<pdfofuL_3_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_52_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_ȡ�������ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdfofuL_3_53_Request, ObservableCollection<pdfofuL_3_53_Info>> pdfofuL_3_53_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_53_Request, ObservableCollection<pdfofuL_3_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_53_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_�ⶳ�ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdfofuL_3_54_Request, ObservableCollection<pdfofuL_3_54_Info>> pdfofuL_3_54_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_54_Request, ObservableCollection<pdfofuL_3_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_54_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_ȡ���ⶳ�ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdfofuL_3_55_Request, ObservableCollection<pdfofuL_3_55_Info>> pdfofuL_3_55_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_55_Request, ObservableCollection<pdfofuL_3_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_55_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ�ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdfofuL_3_71_Request, ObservableCollection<pdfofuL_3_71_Info>> pdfofuL_3_71_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_71_Request, ObservableCollection<pdfofuL_3_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_71_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ��ʷ�ʲ��˻��ֲ�
        /// </summary>
        public IWorkCommand<pdfofuL_3_72_Request, ObservableCollection<pdfofuL_3_72_Info>> pdfofuL_3_72_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_72_Request, ObservableCollection<pdfofuL_3_72_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_72_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ�ʲ��˻��ֲ���ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_3_81_Request, ObservableCollection<pdfofuL_3_81_Info>> pdfofuL_3_81_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_81_Request, ObservableCollection<pdfofuL_3_81_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_81_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ��ʷ�ʲ��˻��ֲ���ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_3_82_Request, ObservableCollection<pdfofuL_3_82_Info>> pdfofuL_3_82_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_82_Request, ObservableCollection<pdfofuL_3_82_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_82_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ�ʲ��˻��ֲֶ���ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_3_84_Request, ObservableCollection<pdfofuL_3_84_Info>> pdfofuL_3_84_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_84_Request, ObservableCollection<pdfofuL_3_84_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_84_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ��ʷ�ʲ��˻��ֲֶ���ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_3_85_Request, ObservableCollection<pdfofuL_3_85_Info>> pdfofuL_3_85_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_85_Request, ObservableCollection<pdfofuL_3_85_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_85_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_ת���ⲿ�ֲ���ˮ��¼
        /// </summary>
        public IWorkCommand<pdfofuL_3_101_Request, ObservableCollection<pdfofuL_3_101_Info>> pdfofuL_3_101_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_101_Request, ObservableCollection<pdfofuL_3_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_101_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ�ⲿ�ֲ���ˮ��¼
        /// </summary>
        public IWorkCommand<pdfofuL_3_105_Request, ObservableCollection<pdfofuL_3_105_Info>> pdfofuL_3_105_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_105_Request, ObservableCollection<pdfofuL_3_105_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_105_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_ת���ⲿ������¼
        /// </summary>
        public IWorkCommand<pdfofuL_3_111_Request, ObservableCollection<pdfofuL_3_111_Info>> pdfofuL_3_111_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_111_Request, ObservableCollection<pdfofuL_3_111_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_111_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ�ⲿ������¼
        /// </summary>
        public IWorkCommand<pdfofuL_3_115_Request, ObservableCollection<pdfofuL_3_115_Info>> pdfofuL_3_115_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_115_Request, ObservableCollection<pdfofuL_3_115_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_115_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_ת���ⲿ�ɽ���¼
        /// </summary>
        public IWorkCommand<pdfofuL_3_121_Request, ObservableCollection<pdfofuL_3_121_Info>> pdfofuL_3_121_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_121_Request, ObservableCollection<pdfofuL_3_121_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_121_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ�ⲿ�ɽ���¼
        /// </summary>
        public IWorkCommand<pdfofuL_3_125_Request, ObservableCollection<pdfofuL_3_125_Info>> pdfofuL_3_125_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_125_Request, ObservableCollection<pdfofuL_3_125_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_125_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_ת���ⲿ������ˮ��¼
        /// </summary>
        public IWorkCommand<pdfofuL_3_131_Request, ObservableCollection<pdfofuL_3_131_Info>> pdfofuL_3_131_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_131_Request, ObservableCollection<pdfofuL_3_131_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_131_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ�ⲿ������ˮ��¼
        /// </summary>
        public IWorkCommand<pdfofuL_3_135_Request, ObservableCollection<pdfofuL_3_135_Info>> pdfofuL_3_135_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_135_Request, ObservableCollection<pdfofuL_3_135_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_135_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ���˼�¼
        /// </summary>
        public IWorkCommand<pdfofuL_3_145_Request, ObservableCollection<pdfofuL_3_145_Info>> pdfofuL_3_145_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_145_Request, ObservableCollection<pdfofuL_3_145_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_145_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ֲ�_��ѯ��ʷ���˼�¼
        /// </summary>
        public IWorkCommand<pdfofuL_3_146_Request, ObservableCollection<pdfofuL_3_146_Info>> pdfofuL_3_146_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_3_146_Request, ObservableCollection<pdfofuL_3_146_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_3_146_InfoList;
                });
            }
        }

    }
}
