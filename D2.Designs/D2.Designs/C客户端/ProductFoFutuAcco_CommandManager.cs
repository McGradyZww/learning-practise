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
    public partial class ProductFoFutuAccoCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�˻�_��������ڻ��˻�����
        /// </summary>
        public IWorkCommand<pdfofuL_1_40_Request, ObservableCollection<pdfofuL_1_40_Info>> pdfofuL_1_40_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_1_40_Request, ObservableCollection<pdfofuL_1_40_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_1_40_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�˻�_���������ڻ��˻���Ϣ
        /// </summary>
        public IWorkCommand<pdfofuL_1_41_Request, ObservableCollection<pdfofuL_1_41_Info>> pdfofuL_1_41_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_1_41_Request, ObservableCollection<pdfofuL_1_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_1_41_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�˻�_�޸������ڻ��˻���Ϣ
        /// </summary>
        public IWorkCommand<pdfofuL_1_42_Request, ObservableCollection<pdfofuL_1_42_Info>> pdfofuL_1_42_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_1_42_Request, ObservableCollection<pdfofuL_1_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_1_42_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�˻�_ɾ�������ڻ��˻���Ϣ
        /// </summary>
        public IWorkCommand<pdfofuL_1_43_Request, ObservableCollection<pdfofuL_1_43_Info>> pdfofuL_1_43_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_1_43_Request, ObservableCollection<pdfofuL_1_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_1_43_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�˻�_��ѯ�����ڻ��˻���Ϣ
        /// </summary>
        public IWorkCommand<pdfofuL_1_44_Request, ObservableCollection<pdfofuL_1_44_Info>> pdfofuL_1_44_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_1_44_Request, ObservableCollection<pdfofuL_1_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_1_44_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�˻�_��ѯ�����ڻ��˻���Ϣ��ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_1_45_Request, ObservableCollection<pdfofuL_1_45_Info>> pdfofuL_1_45_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_1_45_Request, ObservableCollection<pdfofuL_1_45_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_1_45_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�˻�_��ѯ��ʷ�����ڻ��˻���Ϣ��ˮ
        /// </summary>
        public IWorkCommand<pdfofuL_1_46_Request, ObservableCollection<pdfofuL_1_46_Info>> pdfofuL_1_46_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_1_46_Request, ObservableCollection<pdfofuL_1_46_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_1_46_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�˻�_���������ڻ��˻�
        /// </summary>
        public IWorkCommand<pdfofuL_1_47_Request, ObservableCollection<pdfofuL_1_47_Info>> pdfofuL_1_47_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_1_47_Request, ObservableCollection<pdfofuL_1_47_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_1_47_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�˻�_�ָ������ڻ��˻�
        /// </summary>
        public IWorkCommand<pdfofuL_1_48_Request, ObservableCollection<pdfofuL_1_48_Info>> pdfofuL_1_48_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_1_48_Request, ObservableCollection<pdfofuL_1_48_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_1_48_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�˻�_ע�������ڻ��˻�
        /// </summary>
        public IWorkCommand<pdfofuL_1_49_Request, ObservableCollection<pdfofuL_1_49_Info>> pdfofuL_1_49_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_1_49_Request, ObservableCollection<pdfofuL_1_49_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_1_49_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�˻�_��ѯ�����ڻ��˻��б�
        /// </summary>
        public IWorkCommand<pdfofuL_1_51_Request, ObservableCollection<pdfofuL_1_51_Info>> pdfofuL_1_51_Command
        {
            get
            {
                return new WorkCommand<pdfofuL_1_51_Request, ObservableCollection<pdfofuL_1_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfofuL_1_51_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�˻�_�����Ʒ�����ڻ��ճ�
        /// </summary>
        public IWorkCommand<pdfufuL_1_61_Request, ObservableCollection<pdfufuL_1_61_Info>> pdfufuL_1_61_Command
        {
            get
            {
                return new WorkCommand<pdfufuL_1_61_Request, ObservableCollection<pdfufuL_1_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfufuL_1_61_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�˻�_�����Ʒ�����ڻ�����
        /// </summary>
        public IWorkCommand<pdfufuL_1_62_Request, ObservableCollection<pdfufuL_1_62_Info>> pdfufuL_1_62_Command
        {
            get
            {
                return new WorkCommand<pdfufuL_1_62_Request, ObservableCollection<pdfufuL_1_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfufuL_1_62_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�˻�_�����Ʒ�����ڻ��ճ���ʱ����
        /// </summary>
        public IWorkCommand<pdfufuL_1_101_Request, ObservableCollection<pdfufuL_1_101_Info>> pdfufuL_1_101_Command
        {
            get
            {
                return new WorkCommand<pdfufuL_1_101_Request, ObservableCollection<pdfufuL_1_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfufuL_1_101_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�����ڻ�_�˻�_�����Ʒ�����ڻ����ն�ʱ����
        /// </summary>
        public IWorkCommand<pdfufuL_1_102_Request, ObservableCollection<pdfufuL_1_102_Info>> pdfufuL_1_102_Command
        {
            get
            {
                return new WorkCommand<pdfufuL_1_102_Request, ObservableCollection<pdfufuL_1_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfufuL_1_102_InfoList;
                });
            }
        }

    }
}
