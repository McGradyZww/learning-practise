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
    public partial class ClearSecuClearCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_����֤ȯ_����_ת��ɽ���¼
        /// </summary>
        public IWorkCommand<clsecuL_2_1_Request, ObservableCollection<clsecuL_2_1_Info>> clsecuL_2_1_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_1_Request, ObservableCollection<clsecuL_2_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_1_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_ת������׼�¼
        /// </summary>
        public IWorkCommand<clsecuL_2_2_Request, ObservableCollection<clsecuL_2_2_Info>> clsecuL_2_2_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_2_Request, ObservableCollection<clsecuL_2_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_2_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_��ѯ�ɽ���¼
        /// </summary>
        public IWorkCommand<clsecuL_2_3_Request, ObservableCollection<clsecuL_2_3_Info>> clsecuL_2_3_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_3_Request, ObservableCollection<clsecuL_2_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_3_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_��ѯת��ɽ���¼
        /// </summary>
        public IWorkCommand<clsecuL_2_4_Request, ObservableCollection<clsecuL_2_4_Info>> clsecuL_2_4_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_4_Request, ObservableCollection<clsecuL_2_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_4_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_���㴦��
        /// </summary>
        public IWorkCommand<clsecuL_2_11_Request, ObservableCollection<clsecuL_2_11_Info>> clsecuL_2_11_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_11_Request, ObservableCollection<clsecuL_2_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_11_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_��ѯ�ϲ������¼
        /// </summary>
        public IWorkCommand<clsecuL_2_13_Request, ObservableCollection<clsecuL_2_13_Info>> clsecuL_2_13_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_13_Request, ObservableCollection<clsecuL_2_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_13_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_�ϲ����㴦��
        /// </summary>
        public IWorkCommand<clsecuL_2_15_Request, ObservableCollection<clsecuL_2_15_Info>> clsecuL_2_15_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_15_Request, ObservableCollection<clsecuL_2_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_15_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_��ѯ�����˼�¼
        /// </summary>
        public IWorkCommand<clsecuL_2_23_Request, ObservableCollection<clsecuL_2_23_Info>> clsecuL_2_23_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_23_Request, ObservableCollection<clsecuL_2_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_23_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_���˴���
        /// </summary>
        public IWorkCommand<clsecuL_2_24_Request, ObservableCollection<clsecuL_2_24_Info>> clsecuL_2_24_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_24_Request, ObservableCollection<clsecuL_2_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_24_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_���˻ع�����
        /// </summary>
        public IWorkCommand<clsecuL_2_25_Request, ObservableCollection<clsecuL_2_25_Info>> clsecuL_2_25_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_25_Request, ObservableCollection<clsecuL_2_25_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_25_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_�ɽ�ת�붨ʱ����
        /// </summary>
        public IWorkCommand<clsecuL_2_151_Request, ObservableCollection<clsecuL_2_151_Info>> clsecuL_2_151_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_151_Request, ObservableCollection<clsecuL_2_151_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_151_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_���㴦��ʱ����
        /// </summary>
        public IWorkCommand<clsecuL_2_153_Request, ObservableCollection<clsecuL_2_153_Info>> clsecuL_2_153_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_153_Request, ObservableCollection<clsecuL_2_153_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_153_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_���˴���ʱ����
        /// </summary>
        public IWorkCommand<clsecuL_2_154_Request, ObservableCollection<clsecuL_2_154_Info>> clsecuL_2_154_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_154_Request, ObservableCollection<clsecuL_2_154_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_154_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_����ͳ��
        /// </summary>
        public IWorkCommand<clsecuL_2_201_Request, ObservableCollection<clsecuL_2_201_Info>> clsecuL_2_201_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_201_Request, ObservableCollection<clsecuL_2_201_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_201_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_��ѯͳ������
        /// </summary>
        public IWorkCommand<clsecuL_2_202_Request, ObservableCollection<clsecuL_2_202_Info>> clsecuL_2_202_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_202_Request, ObservableCollection<clsecuL_2_202_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_202_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_��ȡ����ͳ��ֵ
        /// </summary>
        public IWorkCommand<clsecuL_2_203_Request, ObservableCollection<clsecuL_2_203_Info>> clsecuL_2_203_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_203_Request, ObservableCollection<clsecuL_2_203_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_203_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_��ѯ�ɽ���¼���
        /// </summary>
        public IWorkCommand<clsecuL_2_204_Request, ObservableCollection<clsecuL_2_204_Info>> clsecuL_2_204_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_204_Request, ObservableCollection<clsecuL_2_204_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_204_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_��ѯ����ɽ���¼���
        /// </summary>
        public IWorkCommand<clsecuL_2_205_Request, ObservableCollection<clsecuL_2_205_Info>> clsecuL_2_205_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_205_Request, ObservableCollection<clsecuL_2_205_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_205_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_��ѯ�ϲ������¼���
        /// </summary>
        public IWorkCommand<clsecuL_2_206_Request, ObservableCollection<clsecuL_2_206_Info>> clsecuL_2_206_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_206_Request, ObservableCollection<clsecuL_2_206_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_206_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_��ѯ�����˼�¼���
        /// </summary>
        public IWorkCommand<clsecuL_2_207_Request, ObservableCollection<clsecuL_2_207_Info>> clsecuL_2_207_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_207_Request, ObservableCollection<clsecuL_2_207_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_207_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_A������ǰ���
        /// </summary>
        public IWorkCommand<clsecuL_2_208_Request, ObservableCollection<clsecuL_2_208_Info>> clsecuL_2_208_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_208_Request, ObservableCollection<clsecuL_2_208_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_208_InfoList;
                });
            }
        }


        /// <summary>
        /// �߼�_����֤ȯ_����_����ת��ɽ���¼
        /// </summary>
        public IWorkCommand<clsecuL_2_209_Request, ObservableCollection<clsecuL_2_209_Info>> clsecuL_2_209_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_209_Request, ObservableCollection<clsecuL_2_209_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_209_InfoList;
                });
            }
        }

    }
}
