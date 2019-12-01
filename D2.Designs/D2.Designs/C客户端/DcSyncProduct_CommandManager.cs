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
    public partial class DcSyncProductCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_����ͬ��_��Ʒͬ��_ͬ����Ʒ��Ϣ��
        /// </summary>
        public IWorkCommand<dcsyncL_2_12_Request, ObservableCollection<dcsyncL_2_12_Info>> dcsyncL_2_12_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_2_12_Request, ObservableCollection<dcsyncL_2_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_2_12_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����ͬ��_��Ʒͬ��_ͬ����Ʒ������Ϣ��
        /// </summary>
        public IWorkCommand<dcsyncL_2_13_Request, ObservableCollection<dcsyncL_2_13_Info>> dcsyncL_2_13_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_2_13_Request, ObservableCollection<dcsyncL_2_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_2_13_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����ͬ��_��Ʒͬ��_ͬ���ʲ��˻���Ϣ��
        /// </summary>
        public IWorkCommand<dcsyncL_2_14_Request, ObservableCollection<dcsyncL_2_14_Info>> dcsyncL_2_14_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_2_14_Request, ObservableCollection<dcsyncL_2_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_2_14_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����ͬ��_��Ʒͬ��_ͬ���ʲ��˻�ͨ����Ϣ��
        /// </summary>
        public IWorkCommand<dcsyncL_2_15_Request, ObservableCollection<dcsyncL_2_15_Info>> dcsyncL_2_15_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_2_15_Request, ObservableCollection<dcsyncL_2_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_2_15_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����ͬ��_��Ʒͬ��_ͬ����Ʒ�ʽ��
        /// </summary>
        public IWorkCommand<dcsyncL_2_16_Request, ObservableCollection<dcsyncL_2_16_Info>> dcsyncL_2_16_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_2_16_Request, ObservableCollection<dcsyncL_2_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_2_16_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����ͬ��_��Ʒͬ��_ͬ����Ʒ�ʲ���
        /// </summary>
        public IWorkCommand<dcsyncL_2_17_Request, ObservableCollection<dcsyncL_2_17_Info>> dcsyncL_2_17_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_2_17_Request, ObservableCollection<dcsyncL_2_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_2_17_InfoList;
                });
            }
        }

    }
}
