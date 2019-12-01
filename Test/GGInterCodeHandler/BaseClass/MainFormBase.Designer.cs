namespace GGInterCodeHandler.BaseClass
{
    partial class MainFormBase
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainFormBase));
            this.MainForm_ImageList = new System.Windows.Forms.ImageList(this.components);
            this.CloseMin_ImageList = new System.Windows.Forms.ImageList(this.components);
            this.Logo_ImageList = new System.Windows.Forms.ImageList(this.components);
            this.Title_ImageList = new System.Windows.Forms.ImageList(this.components);
            this.SuspendLayout();
            // 
            // MainForm_ImageList
            // 
            this.MainForm_ImageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("MainForm_ImageList.ImageStream")));
            this.MainForm_ImageList.TransparentColor = System.Drawing.Color.Transparent;
            this.MainForm_ImageList.Images.SetKeyName(0, "标题栏背景");
            this.MainForm_ImageList.Images.SetKeyName(1, "菜单栏背景");
            // 
            // CloseMin_ImageList
            // 
            this.CloseMin_ImageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("CloseMin_ImageList.ImageStream")));
            this.CloseMin_ImageList.TransparentColor = System.Drawing.Color.Transparent;
            this.CloseMin_ImageList.Images.SetKeyName(0, "关闭.png");
            this.CloseMin_ImageList.Images.SetKeyName(1, "关闭-按下.png");
            this.CloseMin_ImageList.Images.SetKeyName(2, "关闭-划过.png");
            this.CloseMin_ImageList.Images.SetKeyName(3, "最小化.png");
            this.CloseMin_ImageList.Images.SetKeyName(4, "最小化-按下.png");
            this.CloseMin_ImageList.Images.SetKeyName(5, "最小化-划过.png");
            // 
            // Logo_ImageList
            // 
            this.Logo_ImageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("Logo_ImageList.ImageStream")));
            this.Logo_ImageList.TransparentColor = System.Drawing.Color.Transparent;
            this.Logo_ImageList.Images.SetKeyName(0, "系统图标");
            // 
            // Title_ImageList
            // 
            this.Title_ImageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("Title_ImageList.ImageStream")));
            this.Title_ImageList.TransparentColor = System.Drawing.Color.Transparent;
            this.Title_ImageList.Images.SetKeyName(0, "标题文字");
            // 
            // MainFormBase
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(153)))), ((int)(((byte)(180)))), ((int)(((byte)(209)))));
            this.ClientSize = new System.Drawing.Size(602, 431);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "MainFormBase";
            this.StartPosition = System.Windows.Forms.FormStartPosition.Manual;
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ImageList MainForm_ImageList;
        private System.Windows.Forms.ImageList CloseMin_ImageList;
        private System.Windows.Forms.ImageList Logo_ImageList;
        private System.Windows.Forms.ImageList Title_ImageList;
    }
}