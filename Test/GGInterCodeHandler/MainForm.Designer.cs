namespace GGInterCodeHandler
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.label1 = new System.Windows.Forms.Label();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.panel1 = new System.Windows.Forms.Panel();
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label_status2 = new System.Windows.Forms.Label();
            this.button6_x = new System.Windows.Forms.Button();
            this.button6 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.textBox_dest1 = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label_status1 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.textBox_src1 = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.button4 = new System.Windows.Forms.Button();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.button5 = new System.Windows.Forms.Button();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
            this.richTextBox2 = new System.Windows.Forms.RichTextBox();
            this.richTextBox3 = new System.Windows.Forms.RichTextBox();
            this.button7 = new System.Windows.Forms.Button();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.panel1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabPage3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("微软雅黑", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label1.Location = new System.Drawing.Point(49, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(88, 25);
            this.label1.TabIndex = 0;
            this.label1.Text = "测试工具";
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl1.DrawMode = System.Windows.Forms.TabDrawMode.OwnerDrawFixed;
            this.tabControl1.Location = new System.Drawing.Point(3, 171);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(870, 374);
            this.tabControl1.TabIndex = 1;
            this.tabControl1.DrawItem += new System.Windows.Forms.DrawItemEventHandler(this.tabControl1_DrawItem);
            // 
            // tabPage1
            // 
            this.tabPage1.BackgroundImage = global::GGInterCodeHandler.Properties.Resources.menu_bg_normal;
            this.tabPage1.Controls.Add(this.panel1);
            this.tabPage1.Controls.Add(this.groupBox2);
            this.tabPage1.Controls.Add(this.groupBox1);
            this.tabPage1.Location = new System.Drawing.Point(4, 25);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(862, 345);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "港股内码处理";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel1.Controls.Add(this.button1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(3, 267);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(856, 75);
            this.panel1.TabIndex = 2;
            // 
            // button1
            // 
            this.button1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.button1.BackgroundImage = global::GGInterCodeHandler.Properties.Resources.menu_bg_normal;
            this.button1.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.button1.ForeColor = System.Drawing.Color.White;
            this.button1.Location = new System.Drawing.Point(701, 18);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(138, 39);
            this.button1.TabIndex = 0;
            this.button1.Text = "生成";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.textBox2);
            this.groupBox2.Controls.Add(this.textBox1);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Controls.Add(this.label_status2);
            this.groupBox2.Controls.Add(this.button6_x);
            this.groupBox2.Controls.Add(this.button6);
            this.groupBox2.Controls.Add(this.button3);
            this.groupBox2.Controls.Add(this.textBox_dest1);
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupBox2.Font = new System.Drawing.Font("微软雅黑", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.groupBox2.ForeColor = System.Drawing.Color.White;
            this.groupBox2.Location = new System.Drawing.Point(3, 128);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(856, 139);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "目标文件";
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(609, 94);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(100, 27);
            this.textBox2.TabIndex = 9;
            // 
            // textBox1
            // 
            this.textBox1.BackColor = System.Drawing.Color.DarkGoldenrod;
            this.textBox1.ForeColor = System.Drawing.Color.White;
            this.textBox1.Location = new System.Drawing.Point(112, 94);
            this.textBox1.Name = "textBox1";
            this.textBox1.ReadOnly = true;
            this.textBox1.Size = new System.Drawing.Size(257, 27);
            this.textBox1.TabIndex = 8;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(23, 94);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(69, 20);
            this.label4.TabIndex = 7;
            this.label4.Text = "文件路径";
            // 
            // label_status2
            // 
            this.label_status2.AutoSize = true;
            this.label_status2.Font = new System.Drawing.Font("微软雅黑", 16.2F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label_status2.ForeColor = System.Drawing.Color.Red;
            this.label_status2.Location = new System.Drawing.Point(535, 53);
            this.label_status2.Name = "label_status2";
            this.label_status2.Size = new System.Drawing.Size(0, 36);
            this.label_status2.TabIndex = 6;
            // 
            // button6_x
            // 
            this.button6_x.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.button6_x.BackgroundImage = global::GGInterCodeHandler.Properties.Resources.menu_bg_normal;
            this.button6_x.ForeColor = System.Drawing.Color.White;
            this.button6_x.Location = new System.Drawing.Point(490, 92);
            this.button6_x.Name = "button6_x";
            this.button6_x.Size = new System.Drawing.Size(93, 30);
            this.button6_x.TabIndex = 5;
            this.button6_x.Text = "Decode";
            this.button6_x.UseVisualStyleBackColor = true;
            this.button6_x.Click += new System.EventHandler(this.button6_x_Click);
            // 
            // button6
            // 
            this.button6.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.button6.BackgroundImage = global::GGInterCodeHandler.Properties.Resources.menu_bg_normal;
            this.button6.ForeColor = System.Drawing.Color.White;
            this.button6.Location = new System.Drawing.Point(391, 92);
            this.button6.Name = "button6";
            this.button6.Size = new System.Drawing.Size(93, 30);
            this.button6.TabIndex = 5;
            this.button6.Text = "浏览";
            this.button6.UseVisualStyleBackColor = true;
            this.button6.Click += new System.EventHandler(this.button6_Click);
            // 
            // button3
            // 
            this.button3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.button3.BackgroundImage = global::GGInterCodeHandler.Properties.Resources.menu_bg_normal;
            this.button3.ForeColor = System.Drawing.Color.White;
            this.button3.Location = new System.Drawing.Point(391, 53);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(93, 30);
            this.button3.TabIndex = 5;
            this.button3.Text = "浏览";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // textBox_dest1
            // 
            this.textBox_dest1.BackColor = System.Drawing.Color.DarkGoldenrod;
            this.textBox_dest1.ForeColor = System.Drawing.Color.White;
            this.textBox_dest1.Location = new System.Drawing.Point(112, 56);
            this.textBox_dest1.Name = "textBox_dest1";
            this.textBox_dest1.ReadOnly = true;
            this.textBox_dest1.Size = new System.Drawing.Size(257, 27);
            this.textBox_dest1.TabIndex = 4;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(23, 56);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(69, 20);
            this.label3.TabIndex = 3;
            this.label3.Text = "文件路径";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label_status1);
            this.groupBox1.Controls.Add(this.button2);
            this.groupBox1.Controls.Add(this.textBox_src1);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupBox1.Font = new System.Drawing.Font("微软雅黑", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.groupBox1.ForeColor = System.Drawing.Color.White;
            this.groupBox1.Location = new System.Drawing.Point(3, 3);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(856, 125);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "源文件";
            // 
            // label_status1
            // 
            this.label_status1.AutoSize = true;
            this.label_status1.Font = new System.Drawing.Font("微软雅黑", 16.2F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label_status1.ForeColor = System.Drawing.Color.Red;
            this.label_status1.Location = new System.Drawing.Point(535, 45);
            this.label_status1.Name = "label_status1";
            this.label_status1.Size = new System.Drawing.Size(0, 36);
            this.label_status1.TabIndex = 3;
            // 
            // button2
            // 
            this.button2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.button2.BackgroundImage = global::GGInterCodeHandler.Properties.Resources.menu_bg_normal;
            this.button2.ForeColor = System.Drawing.Color.White;
            this.button2.Location = new System.Drawing.Point(391, 45);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(93, 30);
            this.button2.TabIndex = 2;
            this.button2.Text = "浏览";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // textBox_src1
            // 
            this.textBox_src1.BackColor = System.Drawing.Color.DarkGoldenrod;
            this.textBox_src1.ForeColor = System.Drawing.Color.White;
            this.textBox_src1.Location = new System.Drawing.Point(112, 47);
            this.textBox_src1.Name = "textBox_src1";
            this.textBox_src1.ReadOnly = true;
            this.textBox_src1.Size = new System.Drawing.Size(257, 27);
            this.textBox_src1.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(23, 47);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(69, 20);
            this.label2.TabIndex = 0;
            this.label2.Text = "文件路径";
            // 
            // tabPage2
            // 
            this.tabPage2.BackgroundImage = global::GGInterCodeHandler.Properties.Resources.menu_bg_normal;
            this.tabPage2.Controls.Add(this.button4);
            this.tabPage2.Controls.Add(this.textBox3);
            this.tabPage2.Location = new System.Drawing.Point(4, 25);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(862, 345);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "CLR测试";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // button4
            // 
            this.button4.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.button4.BackgroundImage = global::GGInterCodeHandler.Properties.Resources.menu_bg_normal;
            this.button4.ForeColor = System.Drawing.Color.White;
            this.button4.Location = new System.Drawing.Point(298, 28);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(93, 35);
            this.button4.TabIndex = 4;
            this.button4.Text = "消息框";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // textBox3
            // 
            this.textBox3.BackColor = System.Drawing.Color.DarkGoldenrod;
            this.textBox3.ForeColor = System.Drawing.Color.White;
            this.textBox3.Location = new System.Drawing.Point(19, 30);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(257, 25);
            this.textBox3.TabIndex = 3;
            // 
            // tabPage3
            // 
            this.tabPage3.BackgroundImage = global::GGInterCodeHandler.Properties.Resources.menu_bg_normal;
            this.tabPage3.Controls.Add(this.button7);
            this.tabPage3.Controls.Add(this.richTextBox3);
            this.tabPage3.Controls.Add(this.richTextBox2);
            this.tabPage3.Controls.Add(this.splitContainer1);
            this.tabPage3.Location = new System.Drawing.Point(4, 25);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(862, 345);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "线程池测试";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Left;
            this.splitContainer1.Location = new System.Drawing.Point(3, 3);
            this.splitContainer1.Name = "splitContainer1";
            this.splitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.button5);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.richTextBox1);
            this.splitContainer1.Size = new System.Drawing.Size(150, 339);
            this.splitContainer1.SplitterDistance = 84;
            this.splitContainer1.TabIndex = 0;
            // 
            // button5
            // 
            this.button5.BackgroundImage = global::GGInterCodeHandler.Properties.Resources.menu_bg_normal;
            this.button5.Location = new System.Drawing.Point(28, 25);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(75, 33);
            this.button5.TabIndex = 0;
            this.button5.Text = "开始";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // richTextBox1
            // 
            this.richTextBox1.CausesValidation = false;
            this.richTextBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.richTextBox1.Location = new System.Drawing.Point(0, 0);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.ReadOnly = true;
            this.richTextBox1.Size = new System.Drawing.Size(150, 251);
            this.richTextBox1.TabIndex = 0;
            this.richTextBox1.Text = "";
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // richTextBox2
            // 
            this.richTextBox2.CausesValidation = false;
            this.richTextBox2.Location = new System.Drawing.Point(245, 34);
            this.richTextBox2.Name = "richTextBox2";
            this.richTextBox2.Size = new System.Drawing.Size(581, 58);
            this.richTextBox2.TabIndex = 1;
            this.richTextBox2.Text = "";
            // 
            // richTextBox3
            // 
            this.richTextBox3.CausesValidation = false;
            this.richTextBox3.Location = new System.Drawing.Point(245, 158);
            this.richTextBox3.Name = "richTextBox3";
            this.richTextBox3.ReadOnly = true;
            this.richTextBox3.Size = new System.Drawing.Size(581, 74);
            this.richTextBox3.TabIndex = 1;
            this.richTextBox3.Text = "";
            // 
            // button7
            // 
            this.button7.BackgroundImage = global::GGInterCodeHandler.Properties.Resources.menu_bg_normal;
            this.button7.Location = new System.Drawing.Point(718, 264);
            this.button7.Name = "button7";
            this.button7.Size = new System.Drawing.Size(75, 33);
            this.button7.TabIndex = 0;
            this.button7.Text = "转义";
            this.button7.UseVisualStyleBackColor = true;
            this.button7.Click += new System.EventHandler(this.button7_Click);
            // 
            // MainForm
            // 
            this.AllowDrop = true;
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.AutoValidate = System.Windows.Forms.AutoValidate.Disable;
            this.BackgroundImage = global::GGInterCodeHandler.Properties.Resources.timg;
            this.ClientSize = new System.Drawing.Size(876, 548);
            this.CloseImageDown = global::GGInterCodeHandler.Properties.Resources.E1;
            this.CloseImageHover = global::GGInterCodeHandler.Properties.Resources.E2;
            this.CloseImageNormal = global::GGInterCodeHandler.Properties.Resources.E3;
            this.Controls.Add(this.tabControl1);
            this.Controls.Add(this.label1);
            this.ForeColor = System.Drawing.Color.White;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.LogoImage = global::GGInterCodeHandler.Properties.Resources._1;
            this.MenuBackgroundImage = global::GGInterCodeHandler.Properties.Resources.menu_bg_normal;
            this.MinImageDown = global::GGInterCodeHandler.Properties.Resources.X1;
            this.MinImageHover = global::GGInterCodeHandler.Properties.Resources.X2;
            this.MinImageNormal = global::GGInterCodeHandler.Properties.Resources.X3;
            this.Name = "MainForm";
            this.Text = "MainForm";
            this.TitleBackgroundImage = global::GGInterCodeHandler.Properties.Resources.menu_bg_normal;
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.tabPage3.ResumeLayout(false);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.TextBox textBox_src1;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.TextBox textBox_dest1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.SaveFileDialog saveFileDialog1;
        private System.Windows.Forms.Label label_status1;
        private System.Windows.Forms.Label label_status2;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.Button button6_x;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button button6;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.RichTextBox richTextBox2;
        private System.Windows.Forms.RichTextBox richTextBox3;
        private System.Windows.Forms.Button button7;
    }
}