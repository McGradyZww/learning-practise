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
    public partial class ProductFutuCapitalBackCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ���ά_��ѯ�ʲ��˻������ʽ�����¼
        /// </summary>
        public IWorkCommand<pdfutuL_10_1_Request, ObservableCollection<pdfutuL_10_1_Info>> pdfutuL_10_1_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_10_1_Request, ObservableCollection<pdfutuL_10_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_10_1_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ���ά_�����ʲ��˻������ʽ�����¼
        /// </summary>
        public IWorkCommand<pdfutuL_10_2_Request, ObservableCollection<pdfutuL_10_2_Info>> pdfutuL_10_2_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_10_2_Request, ObservableCollection<pdfutuL_10_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_10_2_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ���ά_���²�Ʒ�������ڻ��ʲ�
        /// </summary>
        public IWorkCommand<pdfutuL_10_11_Request, ObservableCollection<pdfutuL_10_11_Info>> pdfutuL_10_11_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_10_11_Request, ObservableCollection<pdfutuL_10_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_10_11_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ���ά_����ⲿ�ʽ��¼�����¼
        /// </summary>
        public IWorkCommand<pdfutuL_10_13_Request, ObservableCollection<pdfutuL_10_13_Info>> pdfutuL_10_13_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_10_13_Request, ObservableCollection<pdfutuL_10_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_10_13_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ���ά_ͬ���������
        /// </summary>
        public IWorkCommand<pdfutuL_10_12_Request, ObservableCollection<pdfutuL_10_12_Info>> pdfutuL_10_12_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_10_12_Request, ObservableCollection<pdfutuL_10_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_10_12_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ���ά_��ѯ�������ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_10_14_Request, ObservableCollection<pdfutuL_10_14_Info>> pdfutuL_10_14_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_10_14_Request, ObservableCollection<pdfutuL_10_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_10_14_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ���ά_��ѯ�ʲ��˻��ʽ�
        /// </summary>
        public IWorkCommand<pdfutuL_10_15_Request, ObservableCollection<pdfutuL_10_15_Info>> pdfutuL_10_15_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_10_15_Request, ObservableCollection<pdfutuL_10_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_10_15_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ���ά_��ѯ�ʲ��˻��ʽ���ˮ
        /// </summary>
        public IWorkCommand<pdfutuL_10_16_Request, ObservableCollection<pdfutuL_10_16_Info>> pdfutuL_10_16_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_10_16_Request, ObservableCollection<pdfutuL_10_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_10_16_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_��Ʒ�ڻ�_�ʽ���ά_��ѯ��ʷ�ʲ��˻��ʽ���ˮ
        /// </summary>
        public IWorkCommand<pdfutuL_10_17_Request, ObservableCollection<pdfutuL_10_17_Info>> pdfutuL_10_17_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_10_17_Request, ObservableCollection<pdfutuL_10_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_10_17_InfoList;
                });
            }
        }

    }
}
