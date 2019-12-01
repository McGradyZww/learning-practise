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
    public partial class RptAssetCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_����_�ʹܱ���_T+0�ֲ�ӯ����ѯ
        /// </summary>
        public IWorkCommand<rptL_4_1_Request, ObservableCollection<rptL_4_1_Info>> rptL_4_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_1_Request, ObservableCollection<rptL_4_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_T+0ȯԴ�ֱֲ����ѯ
        /// </summary>
        public IWorkCommand<rptL_4_2_Request, ObservableCollection<rptL_4_2_Info>> rptL_4_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_2_Request, ObservableCollection<rptL_4_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_T+0�˻����׻��ܲ�ѯ
        /// </summary>
        public IWorkCommand<rptL_4_3_Request, ObservableCollection<rptL_4_3_Info>> rptL_4_3_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_3_Request, ObservableCollection<rptL_4_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_3_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_T+0�ֲ�ӯ����ʷ��ѯ
        /// </summary>
        public IWorkCommand<rptL_4_4_Request, ObservableCollection<rptL_4_4_Info>> rptL_4_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_4_Request, ObservableCollection<rptL_4_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_T+0ȯԴ�ֱֲ�����ʷ��ѯ
        /// </summary>
        public IWorkCommand<rptL_4_5_Request, ObservableCollection<rptL_4_5_Info>> rptL_4_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_5_Request, ObservableCollection<rptL_4_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_T+0�˻����׻�����ʷ��ѯ
        /// </summary>
        public IWorkCommand<rptL_4_6_Request, ObservableCollection<rptL_4_6_Info>> rptL_4_6_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_6_Request, ObservableCollection<rptL_4_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_6_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_�����Ʒ�ֲֻ��ܲ�ѯ
        /// </summary>
        public IWorkCommand<rptL_4_7_Request, ObservableCollection<rptL_4_7_Info>> rptL_4_7_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_7_Request, ObservableCollection<rptL_4_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_7_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��������ֲֻ��ܲ�ѯ
        /// </summary>
        public IWorkCommand<rptL_4_8_Request, ObservableCollection<rptL_4_8_Info>> rptL_4_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_8_Request, ObservableCollection<rptL_4_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_�����Ʒ�ֲֽ��׻��ܲ�ѯ
        /// </summary>
        public IWorkCommand<rptL_4_9_Request, ObservableCollection<rptL_4_9_Info>> rptL_4_9_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_9_Request, ObservableCollection<rptL_4_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_9_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��Ʒ�˻�֤ȯ�زֹɳֲֲ�ѯ
        /// </summary>
        public IWorkCommand<rptL_4_10_Request, ObservableCollection<rptL_4_10_Info>> rptL_4_10_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_10_Request, ObservableCollection<rptL_4_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_10_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_���׵�Ԫ֤ȯ�زֹɳֲֲ�ѯ
        /// </summary>
        public IWorkCommand<rptL_4_11_Request, ObservableCollection<rptL_4_11_Info>> rptL_4_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_11_Request, ObservableCollection<rptL_4_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_֤ȯ�ֲֻ��ܲ�ѯ
        /// </summary>
        public IWorkCommand<rptL_4_12_Request, ObservableCollection<rptL_4_12_Info>> rptL_4_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_12_Request, ObservableCollection<rptL_4_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ʷ֤ȯ�ֲֻ��ܲ�ѯ
        /// </summary>
        public IWorkCommand<rptL_4_13_Request, ObservableCollection<rptL_4_13_Info>> rptL_4_13_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_13_Request, ObservableCollection<rptL_4_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_13_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_T+0�˻�ӯ�������ѯ
        /// </summary>
        public IWorkCommand<rptL_4_14_Request, ObservableCollection<rptL_4_14_Info>> rptL_4_14_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_14_Request, ObservableCollection<rptL_4_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_14_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_T+0�˻�ӯ��������ʷ��ѯ
        /// </summary>
        public IWorkCommand<rptL_4_15_Request, ObservableCollection<rptL_4_15_Info>> rptL_4_15_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_15_Request, ObservableCollection<rptL_4_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_15_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_T+0�˻����ڱ����ѯ
        /// </summary>
        public IWorkCommand<rptL_4_16_Request, ObservableCollection<rptL_4_16_Info>> rptL_4_16_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_16_Request, ObservableCollection<rptL_4_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_16_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_T+0�˻����ڱ�����ʷ��ѯ
        /// </summary>
        public IWorkCommand<rptL_4_17_Request, ObservableCollection<rptL_4_17_Info>> rptL_4_17_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_17_Request, ObservableCollection<rptL_4_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_17_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_֤ȯ�ɽ���ˮ��ϸ��ѯ
        /// </summary>
        public IWorkCommand<rptL_4_18_Request, ObservableCollection<rptL_4_18_Info>> rptL_4_18_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_18_Request, ObservableCollection<rptL_4_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_18_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_֤ȯ�ɽ���ˮ��ʷ��ѯ
        /// </summary>
        public IWorkCommand<rptL_4_19_Request, ObservableCollection<rptL_4_19_Info>> rptL_4_19_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_19_Request, ObservableCollection<rptL_4_19_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_19_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_T+0�˻���ӯ�������ѯ
        /// </summary>
        public IWorkCommand<rptL_4_20_Request, ObservableCollection<rptL_4_20_Info>> rptL_4_20_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_20_Request, ObservableCollection<rptL_4_20_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_20_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_T+0�˻���ӯ��������ʷ��ѯ
        /// </summary>
        public IWorkCommand<rptL_4_21_Request, ObservableCollection<rptL_4_21_Info>> rptL_4_21_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_21_Request, ObservableCollection<rptL_4_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_21_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_T+0�˻�ӯ��ר�ñ����ѯ
        /// </summary>
        public IWorkCommand<rptL_4_27_Request, ObservableCollection<rptL_4_27_Info>> rptL_4_27_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_27_Request, ObservableCollection<rptL_4_27_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_27_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_T+0�˻�ӯ��ר�ñ�����ʷ��ѯ
        /// </summary>
        public IWorkCommand<rptL_4_28_Request, ObservableCollection<rptL_4_28_Info>> rptL_4_28_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_28_Request, ObservableCollection<rptL_4_28_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_28_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ��Ʒ�ʲ�
        /// </summary>
        public IWorkCommand<rptL_4_31_Request, ObservableCollection<rptL_4_31_Info>> rptL_4_31_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_31_Request, ObservableCollection<rptL_4_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_31_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ�������ʲ�
        /// </summary>
        public IWorkCommand<rptL_4_32_Request, ObservableCollection<rptL_4_32_Info>> rptL_4_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_32_Request, ObservableCollection<rptL_4_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ��Ʒ�ʲ�_��ʷ
        /// </summary>
        public IWorkCommand<rptL_4_33_Request, ObservableCollection<rptL_4_33_Info>> rptL_4_33_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_33_Request, ObservableCollection<rptL_4_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_33_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ�������ʲ�_��ʷ
        /// </summary>
        public IWorkCommand<rptL_4_34_Request, ObservableCollection<rptL_4_34_Info>> rptL_4_34_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_34_Request, ObservableCollection<rptL_4_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_34_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ_��Ʒ_֤ȯ�ֲ�
        /// </summary>
        public IWorkCommand<rptL_4_35_Request, ObservableCollection<rptL_4_35_Info>> rptL_4_35_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_35_Request, ObservableCollection<rptL_4_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_35_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ_������_֤ȯ�ֲ�
        /// </summary>
        public IWorkCommand<rptL_4_36_Request, ObservableCollection<rptL_4_36_Info>> rptL_4_36_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_36_Request, ObservableCollection<rptL_4_36_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_36_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ_��Ʒ_֤ȯ�ֲ�_��ʷ
        /// </summary>
        public IWorkCommand<rptL_4_37_Request, ObservableCollection<rptL_4_37_Info>> rptL_4_37_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_37_Request, ObservableCollection<rptL_4_37_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_37_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ_������_֤ȯ�ֲ�_��ʷ
        /// </summary>
        public IWorkCommand<rptL_4_38_Request, ObservableCollection<rptL_4_38_Info>> rptL_4_38_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_38_Request, ObservableCollection<rptL_4_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_38_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ_��Ʒ_�ڻ��ֲ�
        /// </summary>
        public IWorkCommand<rptL_4_41_Request, ObservableCollection<rptL_4_41_Info>> rptL_4_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_41_Request, ObservableCollection<rptL_4_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ_��Ʒ_�ڻ��ֲ�_��ʷ
        /// </summary>
        public IWorkCommand<rptL_4_42_Request, ObservableCollection<rptL_4_42_Info>> rptL_4_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_42_Request, ObservableCollection<rptL_4_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ_������_�ڻ��ֲ�
        /// </summary>
        public IWorkCommand<rptL_4_43_Request, ObservableCollection<rptL_4_43_Info>> rptL_4_43_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_43_Request, ObservableCollection<rptL_4_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_43_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ_������_�ڻ��ֲ�_��ʷ
        /// </summary>
        public IWorkCommand<rptL_4_44_Request, ObservableCollection<rptL_4_44_Info>> rptL_4_44_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_44_Request, ObservableCollection<rptL_4_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_44_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ_������_�ڻ��ֲ���ϸ
        /// </summary>
        public IWorkCommand<rptL_4_45_Request, ObservableCollection<rptL_4_45_Info>> rptL_4_45_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_45_Request, ObservableCollection<rptL_4_45_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_45_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯT0����Ա��ƽ����ϸ��ʷ
        /// </summary>
        public IWorkCommand<rptL_4_46_Request, ObservableCollection<rptL_4_46_Info>> rptL_4_46_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_46_Request, ObservableCollection<rptL_4_46_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_46_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ�ɽ���ϸ
        /// </summary>
        public IWorkCommand<rptL_4_47_Request, ObservableCollection<rptL_4_47_Info>> rptL_4_47_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_47_Request, ObservableCollection<rptL_4_47_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_47_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯȫ��������
        /// </summary>
        public IWorkCommand<rptL_4_101_Request, ObservableCollection<rptL_4_101_Info>> rptL_4_101_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_101_Request, ObservableCollection<rptL_4_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_101_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯȫ������Ա��Ϣ
        /// </summary>
        public IWorkCommand<rptL_4_102_Request, ObservableCollection<rptL_4_102_Info>> rptL_4_102_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_102_Request, ObservableCollection<rptL_4_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_102_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ��Ʒ�����ʲ�
        /// </summary>
        public IWorkCommand<rptL_4_103_Request, ObservableCollection<rptL_4_103_Info>> rptL_4_103_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_103_Request, ObservableCollection<rptL_4_103_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_103_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ��Ʒ���ܳɽ�֤ȯ����
        /// </summary>
        public IWorkCommand<rptL_4_104_Request, ObservableCollection<rptL_4_104_Info>> rptL_4_104_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_104_Request, ObservableCollection<rptL_4_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_104_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ֤ȯ����
        /// </summary>
        public IWorkCommand<rptL_4_106_Request, ObservableCollection<rptL_4_106_Info>> rptL_4_106_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_106_Request, ObservableCollection<rptL_4_106_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_106_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ��Ʒָ��ͳ��
        /// </summary>
        public IWorkCommand<rptL_4_107_Request, ObservableCollection<rptL_4_107_Info>> rptL_4_107_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_107_Request, ObservableCollection<rptL_4_107_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_107_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ��Ʒ���ײ���Ч��
        /// </summary>
        public IWorkCommand<rptL_4_108_Request, ObservableCollection<rptL_4_108_Info>> rptL_4_108_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_108_Request, ObservableCollection<rptL_4_108_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_108_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ��Ʒ���ֲܳ�
        /// </summary>
        public IWorkCommand<rptL_4_111_Request, ObservableCollection<rptL_4_111_Info>> rptL_4_111_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_111_Request, ObservableCollection<rptL_4_111_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_111_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ��ƷӶ��ͳ�Ʊ���
        /// </summary>
        public IWorkCommand<rptL_4_112_Request, ObservableCollection<rptL_4_112_Info>> rptL_4_112_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_112_Request, ObservableCollection<rptL_4_112_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_112_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��Ʒ���ճɽ�ͳ�Ʋ�ѯ
        /// </summary>
        public IWorkCommand<rptL_4_113_Request, ObservableCollection<rptL_4_113_Info>> rptL_4_113_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_113_Request, ObservableCollection<rptL_4_113_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_113_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��Ʒ�ֲֻ���ͳ�Ʋ�ѯ
        /// </summary>
        public IWorkCommand<rptL_4_114_Request, ObservableCollection<rptL_4_114_Info>> rptL_4_114_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_114_Request, ObservableCollection<rptL_4_114_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_114_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_��ѯ_������_��֤ȯ�ֲ�
        /// </summary>
        public IWorkCommand<rptL_4_115_Request, ObservableCollection<rptL_4_115_Info>> rptL_4_115_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rptL_4_115_Request, ObservableCollection<rptL_4_115_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rptL_4_115_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�ʹܱ���_�����鵱�ճɽ�ͳ�Ʋ�ѯ
        /// </summary>
        public IWorkCommand<rptL_4_116_Request, ObservableCollection<rptL_4_116_Info>> rptL_4_116_Command
        {
            get
            {
                return new WorkCommand<rptL_4_116_Request, ObservableCollection<rptL_4_116_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_4_116_InfoList;
                });
            }
        }

    }
}
