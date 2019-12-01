using CLRTestDLL;
using GGInterCodeHandler.BaseClass;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GGInterCodeHandler
{
    public partial class MainForm : MainFormBase
    {
        private int mainThreadId = 0;
        private DataTable srcData = new DataTable();
        private Task tsk_read = null;
        private Task tsk_write = null;
        private AutoResetEvent syncEvent1 = new AutoResetEvent(false);
        private List<string> ColumnNames = new List<string>() { "交易市场", "证券代码", "证券内码", "证券名称" };
        public MainForm()
        {
            InitializeComponent();
            this.StartPosition = FormStartPosition.CenterScreen;
            mainThreadId = Thread.CurrentThread.ManagedThreadId;
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.textBox_src1.Text = "";
            this.openFileDialog1.FileName = "请选择导入文件";
            this.openFileDialog1.DefaultExt = "xls*";
            this.openFileDialog1.Filter = "excel files(*.xls*)|*.xls*";
            this.openFileDialog1.FilterIndex = 1;
            DialogResult ret = this.openFileDialog1.ShowDialog();
            if (ret == DialogResult.OK)
            {
                this.textBox_src1.Text = this.openFileDialog1.FileName;
            }
            
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.textBox_dest1.Text = "";
            this.saveFileDialog1.Filter = "txt文件(*.txt)|*.txt";
            this.saveFileDialog1.FileName = "outFile.txt";
            this.saveFileDialog1.DefaultExt = ".txt";
            this.saveFileDialog1.InitialDirectory = System.Environment.CurrentDirectory;
            this.saveFileDialog1.RestoreDirectory = true;
            DialogResult ret = this.saveFileDialog1.ShowDialog();
            if (ret == DialogResult.OK)
            {
                this.textBox_dest1.Text = this.saveFileDialog1.FileName;                
            }
        }

        
        private void DoImportFile(string fileName)
        {          
            tsk_read = new Task(new Action(
                () => {
                    this.label_status1.Invoke(new Action(() => { this.label_status1.Text = "文件数据处理中..."; }));
                    srcData = ReadData(fileName);
                    if (srcData == null)
                    {
                        this.label_status1.Invoke(new Action(() => { this.label_status1.Text = "文件数据处理出错！"; }));
                    }
                    else
                    {
                        this.label_status1.Invoke(new Action(() => { this.label_status1.Text = "文件数据处理完成！"; }));
                    }
                    syncEvent1.Set();
                }));
            tsk_read.Start();
        }
        private void DoWriteFile(string fileName)
        {
            
            tsk_write = new Task(new Action(
                () =>
                {
                    syncEvent1.WaitOne();
                    this.label_status2.Invoke(new Action(() => { this.label_status2.Text = "目标文件生成中..."; }));
                    bool ret = WriteData(fileName);
                    if (!ret)
                    {
                        this.label_status2.Invoke(new Action(() => { this.label_status2.Text = "目标文件生成出错！"; }));
                    }
                    else
                    {
                        this.label_status2.Invoke(new Action(() => { this.label_status2.Text = "目标文件生成完成！"; }));
                    }
                    this.button1.Invoke(new Action(() => { this.button1.Text = "生成"; this.button1.Enabled = true; }));
                }));
            tsk_write.Start();
        }
        

        /// <summary>
        /// 子线程函数
        /// </summary>
        /// <param name="excelFile"></param>
        /// <returns></returns>
        private DataTable ReadData(string excelFile)
        {
            if (Thread.CurrentThread.ManagedThreadId == mainThreadId)
            {
                this.Invoke(new Action(() => { MessageBox.Show("非法线程不允许读取文件数据！"); }));
                return null;
            }
            bool hasTitle = true;
            Microsoft.Office.Interop.Excel.Application app = new Microsoft.Office.Interop.Excel.Application();
            Microsoft.Office.Interop.Excel.Sheets sheets = null;
            object oMissiong = System.Reflection.Missing.Value;
            Microsoft.Office.Interop.Excel.Workbook workbook = null;
            DataTable dt = new DataTable();

            try
            {
                if (app == null)
                {
                    return null;
                }
                workbook = app.Workbooks.Open(excelFile, oMissiong, oMissiong, oMissiong, oMissiong, oMissiong,
                    oMissiong, oMissiong, oMissiong, oMissiong, oMissiong, oMissiong, oMissiong, oMissiong, oMissiong);
                sheets = workbook.Worksheets;

                //将数据读入到DataTable中
                Microsoft.Office.Interop.Excel.Worksheet worksheet = (Microsoft.Office.Interop.Excel.Worksheet)sheets.get_Item(1);//读取第一张表  
                if (worksheet == null) return null;

                int iRowCount = worksheet.UsedRange.Rows.Count;
                int iColCount = worksheet.UsedRange.Columns.Count;

                // 增加列格式检查
                if (ColumnNames != null && ColumnNames.Count > 0)
                {
                    if (iColCount != ColumnNames.Count)
                    {
                        MessageBox.Show("excel格式存在错误，请检查！");
                        return null;
                    }
                    for (int i = 0; i < iColCount; i++)
                    {
                        var name = "column" + i;
                        if (hasTitle)
                        {
                            var txt = ((Microsoft.Office.Interop.Excel.Range)worksheet.Cells[1, i + 1]).Text.ToString();
                            if (!string.IsNullOrWhiteSpace(txt))
                            {
                                name = txt;
                            }
                        }

                        if (!ColumnNames.Contains(name))
                        {
                            MessageBox.Show("excel格式存在错误，请检查！");
                            return null;
                        }
                    }
                }

                //生成列头
                for (int i = 0; i < iColCount; i++)
                {
                    var name = "column" + i;
                    if (hasTitle)
                    {
                        var txt = ((Microsoft.Office.Interop.Excel.Range)worksheet.Cells[1, i + 1]).Text.ToString();
                        if (!string.IsNullOrWhiteSpace(txt))
                        {
                            name = txt;
                        }
                    }
                    while (dt.Columns.Contains(name))
                    {
                        name = name + "_1";//重复行名称会报错。
                    }
                    dt.Columns.Add(new DataColumn(name, typeof(string)));
                }
                //生成行数据
                Microsoft.Office.Interop.Excel.Range range;
                int rowIdx = hasTitle ? 2 : 1;
                for (int iRow = rowIdx; iRow <= iRowCount; iRow++)
                {
                    DataRow dr = dt.NewRow();
                    bool IsAllNull = true;
                    for (int iCol = 1; iCol <= iColCount; iCol++)
                    {
                        range = (Microsoft.Office.Interop.Excel.Range)worksheet.Cells[iRow, iCol];
                        dr[iCol - 1] = (range.Value2 == null) ? "" : range.Text.ToString();
                        if (string.Empty != dr[iCol - 1].ToString())
                        {
                            IsAllNull = false;
                        }
                    }
                    if (false == IsAllNull)
                    {
                        dt.Rows.Add(dr);
                    }
                }

                return dt;
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
                return null;
            }
            finally
            {
                if (workbook != null)
                {
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(sheets);
                    workbook.Close(false, oMissiong, oMissiong);
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(workbook);
                    workbook = null;
                }
                if (app != null)
                {
                    app.Workbooks.Close();
                    app.Quit();
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(app);
                    app = null;
                }


            }
        }

        /// <summary>
        /// 子线程函数
        /// </summary>
        /// <param name="txtFile"></param>
        /// <returns></returns>
        private bool WriteData(string txtFile, FileMode mode = FileMode.Append)
        {
            if (Thread.CurrentThread.ManagedThreadId == mainThreadId)
            {
                this.Invoke(new Action(() => { MessageBox.Show("非法线程不允许读取文件数据！"); }));
                return false;
            }
            StreamWriter wr = null;
            try
            {
                FileStream fs = new FileStream(txtFile, mode);                
                wr = new StreamWriter(fs);
                StringBuilder sb = new StringBuilder();
                foreach (DataRow dt in srcData.Rows)
                {
                    string exch_no = dt["交易市场"].ToString().Trim().Contains("沪")?"3":"4";
                    string stock_code = dt["证券代码"].ToString().Trim();
                    string stock_inter_code = dt["证券内码"].ToString().Trim();
                    string stock_name = dt["证券名称"].ToString().Trim();

                    if (stock_code.Length > 5)
                    {
                        continue;
                    }

                    string appendStr = string.Format("#{0},{1}-{2};", stock_inter_code, stock_code, exch_no);
                    sb.Append(appendStr);
                }
                if (sb.Length > 0)
                {
                    wr.Write(sb.ToString());
                }
                return true;
                
            }
            catch (Exception ex)
            {
                MessageBox.Show(string.Format("保存文件出错！出错信息:{0}", ex.Message));
                return false;
            }
            finally
            {
                if (wr != null)
                {
                    wr.Close();
                }
                
            }
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.textBox_src1.Text) || string.IsNullOrEmpty(this.textBox_dest1.Text))
            {
                MessageBox.Show("请选择源文件和目标文件路径！");
                return;
            }
            this.button1.Enabled = false;
            this.button1.Text = "生成中...";
            DoImportFile(this.textBox_src1.Text);
            DoWriteFile(this.textBox_dest1.Text);
        }

        private void tabControl1_DrawItem(object sender, DrawItemEventArgs e)
        {
            Rectangle rec = tabControl1.ClientRectangle;
            
            //标签背景填充颜色
            SolidBrush BackBrush = new SolidBrush(Color.FromArgb(33,50,70));
            e.Graphics.FillRectangle(BackBrush, rec);
            //标签文字填充颜色
            SolidBrush FrontBrush = new SolidBrush(Color.White);
            StringFormat StringF = new StringFormat();
            //设置文字对齐方式
            StringF.Alignment = StringAlignment.Center;
            StringF.LineAlignment = StringAlignment.Center;

            for (int i = 0; i < tabControl1.TabPages.Count; i++)
           {
                 //获取标签头工作区域
                Rectangle Rec = tabControl1.GetTabRect(i);
                //绘制标签头背景颜色
                e.Graphics.FillRectangle(BackBrush, Rec);
               //绘制标签头文字
                e.Graphics.DrawString(tabControl1.TabPages[i].Text, new Font("微软雅黑", 9), FrontBrush, Rec, StringF);
           }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            //this.textBox3.Text
            CLRMFCComFunc.AlertMFCMessageBox(this.textBox3.Text, System.Environment.CurrentDirectory + "\\MFCDLL.dll");
        }

        private AutoResetEvent ev = new AutoResetEvent(false);
        private void threadPoolTest()
        {
            ThreadPool.RegisterWaitForSingleObject(ev, new WaitOrTimerCallback(WaitThreadFunc), 4, 2000, false);
            ThreadPool.QueueUserWorkItem(new WaitCallback(ThreadFunc), 8);
            Thread.Sleep(10000);

        }
        private void ThreadFunc(object b)
        {
            this.richTextBox1.Invoke(new Action(() => { this.richTextBox1.AppendText(string.Format("the object is {0}\n", b)); }));
            for (int i = 0; i < 2; i++)
            {
                Thread.Sleep(1000);
                ev.Set();
            }
        }
        private void WaitThreadFunc(object b, bool t)
        {
            this.richTextBox1.Invoke(new Action(() => { this.richTextBox1.AppendText(string.Format(string.Format("the object is {0},t is {1}\n", b, t))); }));            
            
        }
        private void button5_Click(object sender, EventArgs e)
        {
            Task.Run(() =>
            {
                threadPoolTest();
            });
        }

        private void button6_x_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.textBox1.Text))
                return;
            string fileName = this.textBox1.Text;
            Stream s1 = new FileStream(fileName, FileMode.Open);
            StreamReader sr = new StreamReader(s1, Encoding.UTF8);
            string sss = sr.ReadToEnd().ToString();
            sr.Close();
            s1.Close();
            char[] chars = sss.ToCharArray();
            
            int len = 0;
            if (string.IsNullOrEmpty(textBox2.Text))
            {
                len = chars.Length;
            }
            else
            {
                len = int.Parse(textBox2.Text);
            }
            for (int i = 0; i < len; i++)
            {
                chars[i] = (char)(chars[i] + 3 - chars[i] % 4 * 2);
            }

            StreamWriter wr = null;
            try
            {
                FileStream fs = new FileStream(fileName, FileMode.Truncate);
                wr = new StreamWriter(fs);

                StringBuilder sb = new StringBuilder();
                sb.Append(chars);
                wr.Write(sb.ToString());

            }
            catch (Exception ex)
            {
                MessageBox.Show(string.Format("保存文件出错！出错信息:{0}", ex.Message));
            }
            finally
            {
                if (wr != null)
                {
                    wr.Close();
                }

            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            this.textBox1.Text = "";
            this.openFileDialog1.FileName = "请选择文件";
            this.openFileDialog1.DefaultExt = "txt*";
            this.openFileDialog1.Filter = "txt files(*.txt*)|*.txt*";
            this.openFileDialog1.FilterIndex = 1;
            DialogResult ret = this.openFileDialog1.ShowDialog();
            if (ret == DialogResult.OK)
            {
                this.textBox1.Text = this.openFileDialog1.FileName;
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            string text = richTextBox2.Text;
            char[] chs = text.ToCharArray();
            StringBuilder sb = new StringBuilder();
            if (!string.IsNullOrEmpty(text))
            {
                for (int i = 0; i < chs.Length; i += 2)
                {
                    byte bb = byte.Parse(chs[i].ToString() + chs[i + 1].ToString(), System.Globalization.NumberStyles.HexNumber);
                    sb.Append(bb.ToString()+" ");
                }
            }
            if (sb.Length > 0)
            {
                sb.Replace(' ','\0',sb.Length-1,1);
            }
            this.richTextBox3.Text = sb.ToString();
        }

        
    }
}
