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
    public partial class ProductFoFutuCapitalCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_�����Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_8_Request, ObservableCollection<pdfofuL_2_8_Info>> pdfofuL_2_8_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_8_Request, ObservableCollection<pdfofuL_2_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_8_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_���ղ�Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_9_Request, ObservableCollection<pdfofuL_2_9_Info>> pdfofuL_2_9_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_9_Request, ObservableCollection<pdfofuL_2_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_9_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��Ȩ��Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_10_Request, ObservableCollection<pdfofuL_2_10_Info>> pdfofuL_2_10_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_10_Request, ObservableCollection<pdfofuL_2_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_10_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_������Ȩ��Ʒ�ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_11_Request, ObservableCollection<pdfofuL_2_11_Info>> pdfofuL_2_11_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_11_Request, ObservableCollection<pdfofuL_2_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_11_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_���ύ�����ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_32_Request, ObservableCollection<pdfofuL_2_32_Info>> pdfofuL_2_32_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_32_Request, ObservableCollection<pdfofuL_2_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_32_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_ȡ�����ύ�����ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_33_Request, ObservableCollection<pdfofuL_2_33_Info>> pdfofuL_2_33_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_33_Request, ObservableCollection<pdfofuL_2_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_33_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_�ⶳ�������ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_34_Request, ObservableCollection<pdfofuL_2_34_Info>> pdfofuL_2_34_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_34_Request, ObservableCollection<pdfofuL_2_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_34_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_ȡ���ⶳ�������ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_35_Request, ObservableCollection<pdfofuL_2_35_Info>> pdfofuL_2_35_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_35_Request, ObservableCollection<pdfofuL_2_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_35_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_�޸Ľ������ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_36_Request, ObservableCollection<pdfofuL_2_36_Info>> pdfofuL_2_36_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_36_Request, ObservableCollection<pdfofuL_2_36_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_36_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��ѯ�������ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_37_Request, ObservableCollection<pdfofuL_2_37_Info>> pdfofuL_2_37_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_37_Request, ObservableCollection<pdfofuL_2_37_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_37_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��ѯ��ʷ�������ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_38_Request, ObservableCollection<pdfofuL_2_38_Info>> pdfofuL_2_38_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_38_Request, ObservableCollection<pdfofuL_2_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_38_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��ѯ�������ʽ���ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_2_39_Request, ObservableCollection<pdfofuL_2_39_Info>> pdfofuL_2_39_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_39_Request, ObservableCollection<pdfofuL_2_39_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_39_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��ѯ��ʷ�������ʽ���ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_2_40_Request, ObservableCollection<pdfofuL_2_40_Info>> pdfofuL_2_40_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_40_Request, ObservableCollection<pdfofuL_2_40_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_40_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��ѯ�������ʽ𶳽�ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_2_41_Request, ObservableCollection<pdfofuL_2_41_Info>> pdfofuL_2_41_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_41_Request, ObservableCollection<pdfofuL_2_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_41_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��ѯ��ʷ�������ʽ𶳽�ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_2_42_Request, ObservableCollection<pdfofuL_2_42_Info>> pdfofuL_2_42_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_42_Request, ObservableCollection<pdfofuL_2_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_42_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��������ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_51_Request, ObservableCollection<pdfofuL_2_51_Info>> pdfofuL_2_51_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_51_Request, ObservableCollection<pdfofuL_2_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_51_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_�����ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_52_Request, ObservableCollection<pdfofuL_2_52_Info>> pdfofuL_2_52_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_52_Request, ObservableCollection<pdfofuL_2_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_52_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_ȡ�������ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_53_Request, ObservableCollection<pdfofuL_2_53_Info>> pdfofuL_2_53_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_53_Request, ObservableCollection<pdfofuL_2_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_53_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_�ⶳ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_54_Request, ObservableCollection<pdfofuL_2_54_Info>> pdfofuL_2_54_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_54_Request, ObservableCollection<pdfofuL_2_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_54_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_ȡ���ⶳ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_55_Request, ObservableCollection<pdfofuL_2_55_Info>> pdfofuL_2_55_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_55_Request, ObservableCollection<pdfofuL_2_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_55_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_�޸��ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_56_Request, ObservableCollection<pdfofuL_2_56_Info>> pdfofuL_2_56_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_56_Request, ObservableCollection<pdfofuL_2_56_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_56_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��ѯ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_57_Request, ObservableCollection<pdfofuL_2_57_Info>> pdfofuL_2_57_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_57_Request, ObservableCollection<pdfofuL_2_57_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_57_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��ѯ��ʷ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfofuL_2_58_Request, ObservableCollection<pdfofuL_2_58_Info>> pdfofuL_2_58_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_58_Request, ObservableCollection<pdfofuL_2_58_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_58_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��ѯ�ʲ��˻��ʽ���ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_2_59_Request, ObservableCollection<pdfofuL_2_59_Info>> pdfofuL_2_59_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_59_Request, ObservableCollection<pdfofuL_2_59_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_59_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��ѯ��ʷ�ʲ��˻��ʽ���ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_2_60_Request, ObservableCollection<pdfofuL_2_60_Info>> pdfofuL_2_60_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_60_Request, ObservableCollection<pdfofuL_2_60_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_60_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��ѯ�ʲ��˻��ʽ𶳽�ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_2_61_Request, ObservableCollection<pdfofuL_2_61_Info>> pdfofuL_2_61_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_61_Request, ObservableCollection<pdfofuL_2_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_61_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��ѯ��ʷ�ʲ��˻��ʽ𶳽�ⶳ��ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_2_62_Request, ObservableCollection<pdfofuL_2_62_Info>> pdfofuL_2_62_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_62_Request, ObservableCollection<pdfofuL_2_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_62_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_�ⲿ�����ڻ��ʽ���ˮ��¼����
        /// </summary>
        public IWorkCommand<pdfofuL_2_106_Request, ObservableCollection<pdfofuL_2_106_Info>> pdfofuL_2_106_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_106_Request, ObservableCollection<pdfofuL_2_106_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_106_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��ѯ�ⲿ�����ڻ��ʽ���ˮ��¼
        /// </summary>
        public IWorkCommand<pdfofuL_2_108_Request, ObservableCollection<pdfofuL_2_108_Info>> pdfofuL_2_108_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_108_Request, ObservableCollection<pdfofuL_2_108_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_108_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_�����ʽ�����ͳ��
        /// </summary>
        public IWorkCommand<pdfofuL_2_201_Request, ObservableCollection<pdfofuL_2_201_Info>> pdfofuL_2_201_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_201_Request, ObservableCollection<pdfofuL_2_201_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_201_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�ʽ�_��ѯ�����ʽ�ͳ������
        /// </summary>
        public IWorkCommand<pdfofuL_2_202_Request, ObservableCollection<pdfofuL_2_202_Info>> pdfofuL_2_202_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_2_202_Request, ObservableCollection<pdfofuL_2_202_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_2_202_InfoList;
                });
            }
        }

    }
}
