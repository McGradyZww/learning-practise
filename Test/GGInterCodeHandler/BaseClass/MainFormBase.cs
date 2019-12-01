using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GGInterCodeHandler.BaseClass
{
    /// <summary>
    /// 所有主窗体的基类
    /// </summary>
    public partial class MainFormBase : Form
    {
        #region 变量

        private bool enableDrag = true;
        public bool EnableDrag
        {
            set
            {
                enableDrag = value;
            }
            get
            {
                return enableDrag;
            }
        }
        /// <summary>
        /// 标题栏背景图像
        /// </summary>
        Image titleBackgroundImage;

        /// <summary>
        /// 菜单栏背景图像
        /// </summary>
        Image menuBackgroundImage;

        /// <summary>
        /// 系统图标
        /// </summary>
        Image logoImage;

        /// <summary>
        /// 系统标题 
        /// </summary>
        Image titleImage;

        /// <summary>
        /// 标题栏背景图像的高度
        /// </summary>
        public int titleBackgroundImageHeight = 71;

        /// <summary>
        /// 菜单栏背景图像的高度
        /// </summary>
        public int menuBackgroundImageHeight = 100;

        /// <summary>
        /// 关闭按钮以及最小化按钮原大小
        /// </summary>
        int closeAndMinButtonSize = 20;



        /// <summary>
        /// 关闭按钮，正常状态
        /// </summary>
        Image closeImageNormal;
        /// <summary>
        /// 关闭按钮，鼠标经过激活状态    
        /// </summary>
        Image closeImageHover;
        /// <summary>
        /// 关闭按钮，鼠标按下的状态  
        /// </summary>
        Image closeImageDown;


        /// <summary>
        /// 最小化按钮，正常状态
        /// </summary>
        Image minImageNormal;
        /// <summary>
        /// 最小化按钮，鼠标经过激活状态
        /// </summary>
        Image minImageHover;
        /// <summary>
        /// 最小化按钮，鼠标按下的状态  
        /// </summary>
        Image minImageDown;



        /// <summary>
        /// 背景颜色
        /// </summary>
        Color baseColorBackground = Color.FromArgb(153, 180, 209);//背景颜色
        /// <summary>
        /// 边框颜色
        /// </summary>
        Color baseColorBorder = Color.FromArgb(45, 54, 54);//边框颜色
        /// <summary>
        /// 默认边距   
        /// </summary>
        int paddingSize = 3;//默认边距    

        //鼠标是否按下
        bool isMouseDown = false;
        //鼠标按下时的位置
        Point mouseDownPosi = new Point(0, 0);


        CloseMinButtonStatus closeButtonStatus;

        CloseMinButtonStatus minButtonStatus;

        #endregion

        #region 属性

        /// <summary>
        /// 标题栏背景图像
        /// </summary>
        public Image TitleBackgroundImage
        {
            get { return titleBackgroundImage; }
            set
            {
                if (value == null)
                {
                    int maxWidth = System.Windows.Forms.Screen.PrimaryScreen.Bounds.Width * 2;
                    value = new Bitmap(MainForm_ImageList.Images["标题栏背景"], new Size(maxWidth, titleBackgroundImageHeight));
                }
                titleBackgroundImage = value;

                this.Invalidate();
            }
        }
        /// <summary>
        /// 菜单栏背景图像
        /// </summary>
        public Image MenuBackgroundImage
        {
            get { return menuBackgroundImage; }
            set
            {
                if (value == null)
                {
                    int maxWidth = System.Windows.Forms.Screen.PrimaryScreen.Bounds.Width * 2;
                    value = new Bitmap(MainForm_ImageList.Images["菜单栏背景"], new Size(maxWidth, menuBackgroundImageHeight));
                }
                menuBackgroundImage = value;

                this.Invalidate();
            }
        }
        /// <summary>
        ///系统图标图像
        /// </summary>
        public Image LogoImage
        {
            get { return logoImage; }
            set
            {
                if (value == null)
                {
                    value = new Bitmap(MainForm_ImageList.Images["系统图标"], new Size(menuBackgroundImageHeight - 15, menuBackgroundImageHeight - 15));
                }
                logoImage = value;

                this.Invalidate();
            }
        }

        /// <summary>
        ///系统图标图像
        /// </summary>
        public Image TitleImage
        {
            get { return titleImage; }
            set
            {
                if (value == null)
                {
                    value = new Bitmap(MainForm_ImageList.Images["标题文字"], new Size(menuBackgroundImageHeight - 5, menuBackgroundImageHeight - 5));
                }
                logoImage = value;

                this.Invalidate();
            }
        }

        /// <summary>
        /// 关闭按钮，正常状态
        /// </summary>
        public Image CloseImageNormal
        {
            get { return closeImageNormal; }
            set
            {
                if (value == null)
                    value = new Bitmap(CloseMin_ImageList.Images["关闭"], new Size(closeAndMinButtonSize, closeAndMinButtonSize));
                closeImageNormal = value;
                this.Invalidate();
            }
        }
        /// <summary>
        /// 关闭按钮，鼠标经过激活状态
        /// </summary>
        public Image CloseImageHover
        {
            get { return closeImageHover; }
            set
            {
                if (value == null)
                    value = new Bitmap(CloseMin_ImageList.Images["关闭-划过"], new Size(closeAndMinButtonSize, closeAndMinButtonSize));
                closeImageHover = value;
                this.Invalidate();
            }
        }
        /// <summary>
        /// 关闭按钮，鼠标经过激活状态
        /// </summary>
        public Image CloseImageDown
        {
            get { return closeImageDown; }
            set
            {
                if (value == null)
                    value = new Bitmap(CloseMin_ImageList.Images["关闭-按下"], new Size(closeAndMinButtonSize, closeAndMinButtonSize));
                closeImageDown = value;
                this.Invalidate();
            }
        }


        /// <summary>
        /// 最小化按钮，正常状态
        /// </summary>
        public Image MinImageNormal
        {
            get { return minImageNormal; }
            set
            {
                if (value == null)
                    value = new Bitmap(CloseMin_ImageList.Images["最小化"], new Size(closeAndMinButtonSize, closeAndMinButtonSize));
                minImageNormal = value;
                this.Invalidate();
            }
        }
        /// <summary>
        /// 最小化按钮，鼠标经过激活状态
        /// </summary>
        public Image MinImageHover
        {
            get { return minImageHover; }
            set
            {
                if (value == null)
                    value = new Bitmap(CloseMin_ImageList.Images["最小化-划过"], new Size(closeAndMinButtonSize, closeAndMinButtonSize));
                minImageHover = value;
                this.Invalidate();
            }
        }
        /// <summary>
        /// 关闭按钮，鼠标经过激活状态
        /// </summary>
        public Image MinImageDown
        {
            get { return minImageDown; }
            set
            {
                if (value == null)
                    value = new Bitmap(CloseMin_ImageList.Images["最小化-按下"], new Size(closeAndMinButtonSize, closeAndMinButtonSize));
                minImageDown = value;
                this.Invalidate();
            }
        }


        /// <summary>
        /// 边框颜色
        /// </summary>
        public Color BaseColorBorder
        {
            get { return baseColorBorder; }
            set
            {
                if (value.IsEmpty)
                    value = baseColorBorder;
                baseColorBorder = value;
                this.Invalidate();
            }
        }

        #endregion

        #region 初始化
        public MainFormBase()
        {
            InitializeComponent();
            InitForm();
        }

        /// <summary>
        /// 初始化窗体
        /// </summary>
        private void InitForm()
        {
            //双缓冲
            SetStyle(
                ControlStyles.UserPaint |
                ControlStyles.AllPaintingInWmPaint |
                ControlStyles.OptimizedDoubleBuffer |
                ControlStyles.ResizeRedraw |
                ControlStyles.SupportsTransparentBackColor, true);
            this.DoubleBuffered = true;
            //背景色
            //this.BackColor = baseColorBackground;
            //设置边距
            this.Padding = new Padding(paddingSize, titleBackgroundImageHeight
                + menuBackgroundImageHeight, paddingSize, paddingSize);

            this.FormBorderStyle = FormBorderStyle.None;
            this.StartPosition = FormStartPosition.CenterScreen;
            //int maxWidth = System.Windows.Forms.Screen.PrimaryScreen.WorkingArea.Width;
            //int maxHeight = System.Windows.Forms.Screen.PrimaryScreen.WorkingArea.Height;
            int maxWidth = System.Windows.Forms.Screen.PrimaryScreen.Bounds.Width;
            int maxHeight = System.Windows.Forms.Screen.PrimaryScreen.Bounds.Height;

            //this.Width = maxWidth;
            //this.Height = maxHeight;

            this.MaximumSize = new Size(maxWidth, maxHeight);
            //this.WindowState = FormWindowState.Maximized;



            //不许最小化
            this.MinimizeBox = true;
            this.MaximizeBox = true;
            InitImage();
            //MessageBox.Show(string.Format("窗体大小宽:{0},高:{1}", this.Width, this.Height));
            //InitFormEffect();
        }

        /// <summary>
        /// 初始化资源图片
        /// </summary>
        private void InitImage()
        {
            int maxWidth = System.Windows.Forms.Screen.PrimaryScreen.WorkingArea.Width;
            titleBackgroundImage = new Bitmap(MainForm_ImageList.Images["标题栏背景"], new Size(maxWidth, titleBackgroundImageHeight));
            menuBackgroundImage = new Bitmap(MainForm_ImageList.Images["菜单栏背景"], new Size(maxWidth, titleBackgroundImageHeight));

            logoImage = Logo_ImageList.Images["系统图标"];
            string titleImageFile = Application.StartupPath + @"\界面图片\海陆矢量数据融合.png";
            if (File.Exists(titleImageFile))
                titleImage = Image.FromFile(titleImageFile);
            //titleImage= Title_ImageList.Images["标题文字"];

            closeImageNormal = CloseMin_ImageList.Images["关闭.png"];
            closeImageHover = CloseMin_ImageList.Images["关闭-划过.png"];
            closeImageDown = CloseMin_ImageList.Images["关闭-按下.png"];

            minImageNormal = CloseMin_ImageList.Images["最小化.png"];
            minImageHover = CloseMin_ImageList.Images["最小化-划过.png"];
            minImageDown = CloseMin_ImageList.Images["最小化-按下.png"];
        }


        #endregion

        #region 窗体绘制重载

        /// <summary>
        /// 背景色改变
        /// </summary>
        /// <param name="e"></param>
        protected override void OnBackColorChanged(EventArgs e)
        {
            //颜色绑架。。。吼吼
            //if (this.BackColor == System.Drawing.SystemColors.Control)
            //    this.BackColor = baseColorBackground;
            //base.OnBackColorChanged(e);
        }

        private int initCount = 0;
        /// <summary>
        /// 获取缩略图的长与宽
        /// </summary>
        /// <param name="minwidth">原宽</param>
        /// <param name="minheight">原长</param>
        /// <param name="width">宽</param>
        /// <param name="height">长</param>
        /// <returns>长宽整数对</returns>
        //private static Size NewSize(int minwidth, int minheight, int width, int height)
        //{
        //    double w = 0.0;
        //    double h = 0.0;
        //    double sw = Convert.ToDouble(width);
        //    double sh = Convert.ToDouble(height);
        //    double mw = Convert.ToDouble(minwidth);
        //    double mh = Convert.ToDouble(minheight);

        //    if (sw < mw && sh < mh)
        //    {
        //        w = sw;
        //        h = sh;
        //    }
        //    else if ((sw / sh) > (mw / mh))
        //    {
        //        w = minwidth;
        //        h = (w * sh) / sw;
        //    }
        //    else
        //    {
        //        h = minheight;
        //        w = (h * sw) / sh;
        //    }

        //    return new Size(Convert.ToInt32(w), Convert.ToInt32(h));
        //}

        /// <summary>
        /// 生成缩略图
        /// </summary>
        /// <param name="filename">上传图片数据源</param>
        /// <param name="minwidth">缩略图宽</param>
        /// <param name="minheight">缩略图高</param>
        /// <param name="FileName">上传到DISK文件夹下目录</param>
        /// <param name="type">图片类型,BOOL型变量,true为jpg,反之为gif</param>
        /// <returns>返回当前图片名</returns>
        //public static string SendToSmallImage(Stream _stream, int minwidth, int minheight, string FileName, bool type)
        //{
        //    System.Drawing.Image img = System.Drawing.Image.FromStream(_stream);
        //    //System.Drawing.Image img = System.Drawing.Image.FromFile(HttpContext.Current.Server.MapPath(filename));
        //    ImageFormat imgformat = img.RawFormat;

        //    Size newSize = NewSize(minwidth, minheight, img.Width, img.Height);

        //    Bitmap bm = new Bitmap(newSize.Width, newSize.Height);
        //    Graphics g = Graphics.FromImage(bm);

        //    // 设置画布的描绘质量
        //    g.CompositingQuality = CompositingQuality.HighQuality;
        //    g.SmoothingMode = SmoothingMode.HighQuality;
        //    g.InterpolationMode = InterpolationMode.HighQualityBicubic;

        //    g.DrawImage(img, new Rectangle(0, 0, newSize.Width, newSize.Height), 0, 0, img.Width, img.Height, GraphicsUnit.Pixel);
        //    g.Dispose();

        //    // 以下代码为保存图片时，设置压缩质量
        //    EncoderParameters encoderParams = new EncoderParameters();
        //    long[] quality = new long[1];
        //    quality[0] = 100;

        //    EncoderParameter encoderParam = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, quality);
        //    encoderParams.Param[0] = encoderParam;

        //    //获得包含有关内置图像编码解码器的信息的ImageCodecInfo 对象。
        //    ImageCodecInfo[] arrayICI = ImageCodecInfo.GetImageEncoders();
        //    ImageCodecInfo jpegICI = null;
        //    ImageCodecInfo GIFICI = null;
        //    ImageCodecInfo allICI = null;
        //    for (int x = 0; x < arrayICI.Length; x++)
        //    {
        //        if (arrayICI[x].FormatDescription.Equals("JPEG"))
        //        {
        //            jpegICI = arrayICI[x];//设置JPEG编码
        //        }

        //        if (arrayICI[x].FormatDescription.Equals("GIF"))
        //        {
        //            GIFICI = arrayICI[x];//设置GIF编码
        //        }
        //    }

        //    string stringpath = null;
        //    string imagename = DateTime.Now.ToString("yyMMddmmss");
        //    if (type)
        //    {
        //        stringpath = "/Disk/" + FileName + "/" + imagename + ".jpg";
        //        allICI = jpegICI;
        //        imagename = imagename + ".jpg";
        //    }
        //    else
        //    {
        //        stringpath = "/Disk/" + FileName + "/" + imagename + ".gif";
        //        allICI = GIFICI;
        //        imagename = imagename + ".gif";
        //    }

        //    try
        //    {
        //        bm.Save(HttpContext.Current.Server.MapPath(stringpath), allICI, encoderParams);
        //    }
        //    catch (Exception e)
        //    {
        //        throw e;
        //    }
        //    finally
        //    {
        //        img.Dispose();
        //        bm.Dispose();
        //    }

        //    return imagename;
        //}
        /// <summary>
        /// 重绘
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPaint(PaintEventArgs e)
        {
            //initCount++;
            //Console.WriteLine(string.Format("OnPaint调用次数:{0}", initCount));
            base.OnPaint(e);

            Graphics g = e.Graphics;
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;
            g.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAlias;


            //渲染标题栏
            Rectangle rtgTitleHeader = new Rectangle(paddingSize, 0, this.Width, this.titleBackgroundImageHeight);
            g.DrawImage(titleBackgroundImage, rtgTitleHeader);

            //渲染菜单栏
            Rectangle rtgMenuHeader = new Rectangle(paddingSize, titleBackgroundImageHeight - 1, this.Width - (int)(paddingSize / 2f), this.menuBackgroundImageHeight);
            //g.DrawImage(menuBackgroundImage, rtgMenuHeader);
            //GenThumbnail(e.Graphics, menuBackgroundImage, rtgMenuHeader);

            //边框蓝
            Brush brush = new SolidBrush(baseColorBorder);
            List<PointF> points = new List<PointF>();
            points.Add(new PointF(paddingSize / 2f - 0.5f, 0));//0.5f是一个微调距离
            points.Add(new PointF(paddingSize / 2f - 0.5f, this.Height - paddingSize / 2f));
            points.Add(new PointF(this.Width - paddingSize / 2f, this.Height - paddingSize / 2f));
            points.Add(new PointF(this.Width - paddingSize / 2f, 0));

            Pen penBorder = new Pen(brush);
            penBorder.Width = paddingSize;
            g.DrawLines(penBorder, points.ToArray());

            //渲染Logo
            Rectangle rtgLogo = new Rectangle(10, 15, 25, 25);
            g.DrawImage(logoImage, rtgLogo);

            //渲染标题 zww 注释掉代码 不使用标题图片 2016-10-18 14:25:14
            //if (titleImage != null)
            //{
            //    Rectangle rtgTitle = new Rectangle(55, 15, titleImage.Width, titleImage.Height);
            //    g.DrawImage(titleImage, rtgTitle);
            //}



            //关闭按钮,默认状态
            Rectangle rtgClose = GetRtgClose();
            switch (closeButtonStatus)
            {
                case CloseMinButtonStatus.Normal:
                    g.DrawImage(closeImageNormal, rtgClose);

                    break;
                case CloseMinButtonStatus.Move:
                    g.DrawImage(closeImageHover, rtgClose);

                    break;

                case CloseMinButtonStatus.Down:
                    g.DrawImage(closeImageDown, rtgClose);

                    break;
            }



            //最小化按钮，默认状态
            Rectangle rtgMin = GetRtgMin();
            switch (minButtonStatus)
            {
                case CloseMinButtonStatus.Normal:
                    g.DrawImage(minImageNormal, rtgMin);

                    break;
                case CloseMinButtonStatus.Move:
                    g.DrawImage(minImageHover, rtgMin);

                    break;

                case CloseMinButtonStatus.Down:
                    g.DrawImage(minImageDown, rtgMin);

                    break;
            }
            
        }
        private Image GenThumbnail(Graphics g, Image imageFrom, Rectangle rtg)
        {
            // 源图宽度及高度 
            int imageFromWidth = imageFrom.Width;
            int imageFromHeight = imageFrom.Height;

            int width = rtg.Width;
            int height = rtg.Height;

            // 生成的缩略图实际宽度及高度 
            if (width >= imageFromWidth && height >= imageFromHeight)
            {
                return imageFrom;
            }
            else
            {
                // 生成的缩略图在上述"画布"上的位置 
                int X = 0;
                int Y = 0;

                decimal wpercent = (decimal)width / imageFromWidth;
                decimal hpercent = (decimal)height / imageFromHeight;
                if (wpercent > hpercent)
                {
                    width = (int)(imageFromWidth * hpercent);
                }
                else if (wpercent < hpercent)
                {
                    height = (int)(imageFromHeight * wpercent);
                }

                // 创建画布 
                //Bitmap bmp = new Bitmap(width, height, PixelFormat.Format24bppRgb);
                //bmp.SetResolution(imageFrom.HorizontalResolution, imageFrom.VerticalResolution);
                //using (Graphics g = Graphics.FromImage(bmp))
                {
                    // 用白色清空 
                    //g.Clear(Color.White);

                    // 指定高质量的双三次插值法。执行预筛选以确保高质量的收缩。此模式可产生质量最高的转换图像。 
                    g.InterpolationMode = InterpolationMode.HighQualityBicubic;

                    // 指定高质量、低速度呈现。 
                    g.SmoothingMode = SmoothingMode.HighQuality;

                    // 在指定位置并且按指定大小绘制指定的 Image 的指定部分。 
                    g.DrawImage(imageFrom, new Rectangle(rtg.X, rtg.Y, rtg.Width, height), new Rectangle(rtg.X, rtg.Y, imageFromWidth, imageFromHeight), GraphicsUnit.Pixel);

                    return null;
                }
            }
        }
        ///// <summary>
        ///// 鼠标移动
        ///// </summary>
        ///// <param name="e"></param>
        //protected override void OnMouseMove(MouseEventArgs e)
        //{
        //    base.OnMouseMove(e);

        //    //限定一个稍大的区域，监测鼠标是否移动到了关闭按钮上
        //    Rectangle rtgHeader = new Rectangle(this.Width - 150, 0, this.Width + 50, this._baseTopHeight + 50);
        //    if (rtgHeader.Contains(e.Location))
        //    {
        //        Rectangle rtgClose = GetRtgClose();
        //        //鼠标移动到关闭按钮时，改变高亮状态
        //        if (exitButtonVisible)
        //        {
        //            if (rtgClose.Contains(e.Location))
        //            {
        //                Graphics g = this.CreateGraphics();
        //                g.DrawImage(_baseImageCloseHover, rtgClose);
        //                //this.Cursor = System.Windows.Forms.Cursors.Hand;
        //            }
        //            else
        //            {
        //                Graphics g = this.CreateGraphics();
        //                g.DrawImage(_baseImageCloseNormal, rtgClose);
        //                //this.Cursor = System.Windows.Forms.Cursors.Default;
        //            }
        //        }

        //        if (MinimizeBox)
        //        {
        //            Rectangle rtgMin = GetRtgMin();
        //            //鼠标移动到最小化按钮时，改变高亮状态
        //            if (rtgMin.Contains(e.Location))
        //            {
        //                Graphics g = this.CreateGraphics();
        //                g.DrawImage(_baseImageMinHover, rtgMin);
        //                //this.Cursor = System.Windows.Forms.Cursors.Hand;
        //            }
        //            else
        //            {
        //                Graphics g = this.CreateGraphics();
        //                g.DrawImage(_baseImageMinNormal, rtgMin);
        //                //this.Cursor = System.Windows.Forms.Cursors.Default;
        //            }
        //        }
        //    }
        //}
        ///// <summary>
        ///// 鼠标抬起
        ///// </summary>
        ///// <param name="e"></param>
        //protected override void OnMouseUp(MouseEventArgs e)
        //{
        //    base.OnMouseUp(e);
        //    Rectangle rtgClose = GetRtgClose();
        //    if (rtgClose.Contains(e.Location) && exitButtonVisible)
        //    {
        //        this.Close();
        //    }
        //    if (MinimizeBox)
        //    {
        //        Rectangle rtgMin = GetRtgMin();
        //        if (rtgMin.Contains(e.Location))
        //        {
        //            this.WindowState = FormWindowState.Minimized;
        //        }
        //    }
        //}


        /// <summary>
        /// 鼠标移动
        /// </summary>
        /// <param name="e"></param>
        protected override void OnMouseMove(MouseEventArgs e)
        {
            base.OnMouseMove(e);

            //限定一个稍大的区域，监测鼠标是否移动到了关闭按钮上
            Rectangle rtgHeader = new Rectangle(this.Width / 2, 0, this.Width / 2, this.titleBackgroundImage.Height);

            if (rtgHeader.Contains(e.Location))
            {
                Rectangle rtgClose = GetRtgClose();

                //鼠标移动到关闭按钮时，改变高亮状态
                if (rtgClose.Contains(e.Location))
                {
                    closeButtonStatus = CloseMinButtonStatus.Move;
                }
                else
                {
                    closeButtonStatus = CloseMinButtonStatus.Normal;
                }
                Invalidate(rtgClose);

                Rectangle rtgMin = GetRtgMin();
                //鼠标移动到最小化按钮时，改变高亮状态
                if (rtgMin.Contains(e.Location))
                {
                    minButtonStatus = CloseMinButtonStatus.Move;
                }
                else
                {
                    minButtonStatus = CloseMinButtonStatus.Normal;
                }

                Invalidate(rtgMin);
            }

            if (enableDrag)
            {
                // 鼠标拖动界面设置 zww 修改 2016-11-11 15:28:17
                if (isMouseDown)
                {
                    int offX = e.X - mouseDownPosi.X;
                    int offY = e.Y - mouseDownPosi.Y;

                    this.Location = new Point(this.Location.X + offX, this.Location.Y + offY);
                }
            }

        }
        /// <summary>
        /// 鼠标抬起
        /// </summary>
        /// <param name="e"></param>
        protected override void OnMouseUp(MouseEventArgs e)
        {
            base.OnMouseUp(e);
            Rectangle rtgClose = GetRtgClose();
            if (rtgClose.Contains(e.Location))
            {
                this.Close();
            }

            Rectangle rtgMin = GetRtgMin();
            if (rtgMin.Contains(e.Location))
            {
                this.WindowState = FormWindowState.Minimized;
            }


            isMouseDown = false;

        }

        protected override void OnMouseDown(MouseEventArgs e)
        {
            Rectangle rtgClose = GetRtgClose();

            //鼠标移动到关闭按钮时，改变高亮状态
            if (rtgClose.Contains(e.Location))
            {
                closeButtonStatus = CloseMinButtonStatus.Down;
            }

            Invalidate(rtgClose);

            Rectangle rtgMin = GetRtgMin();
            //鼠标移动到最小化按钮时，改变高亮状态
            if (rtgMin.Contains(e.Location))
            {
                minButtonStatus = CloseMinButtonStatus.Down;
            }

            Invalidate(rtgMin);


            //mousedown
            isMouseDown = true;
            mouseDownPosi.X = e.X;
            mouseDownPosi.Y = e.Y;



            base.OnMouseDown(e);
        }

        protected override void OnMouseDoubleClick(MouseEventArgs e)
        {

            //if (this.WindowState == FormWindowState.Maximized)
            //{
            //    this.WindowState = FormWindowState.Normal;
            //    this.Width = 900;
            //    this.Height = 500;

            //    int maxWidth = System.Windows.Forms.Screen.PrimaryScreen.WorkingArea.Width;
            //    int maxHeight = System.Windows.Forms.Screen.PrimaryScreen.WorkingArea.Height;
            //    int posiX = (maxWidth - this.Width) / 2;
            //    int posiY = (maxHeight - this.Height) / 2;

            //    this.Location = new Point(posiX, posiY);

            //}
            //else
            //    this.WindowState = FormWindowState.Maximized;

            //base.OnMouseDoubleClick(e);

            base.OnMouseDoubleClick(e);
        }

        #endregion

        #region 方法
        /// <summary>
        /// 获得关闭按钮的位置
        /// </summary>
        /// <returns></returns>
        Rectangle GetRtgClose()
        {
            Rectangle rtgClose = new Rectangle(this.Width - this.closeImageNormal.Width+5,
                this.titleBackgroundImage.Height / 2 - this.closeImageNormal.Height / 2,
                (int)(0.6*this.closeImageNormal.Width), (int)(0.6 * closeImageNormal.Height));
            return rtgClose;
        }
        /// <summary>
        /// 获得最小化按钮的位置
        /// </summary>
        /// <returns></returns>
        Rectangle GetRtgMin()
        {
            Rectangle rtgClose = new Rectangle(this.Width - this.closeImageNormal.Width * 2 + 17,
                this.titleBackgroundImage.Height / 2 - this.closeImageNormal.Height / 2,
                (int)(0.6 * this.minImageNormal.Width), (int)(0.6 * minImageNormal.Height));

            return rtgClose;
        }

        protected override CreateParams CreateParams
        {
            get
            {
                const int WS_MINIMIZEBOX = 0x00020000;  // Winuser.h中定义
                CreateParams cp = base.CreateParams;
                cp.Style = cp.Style | WS_MINIMIZEBOX;   // 允许最小化操作
                return cp;
            }
        }
        #endregion

    }

    public enum CloseMinButtonStatus
    {
        Normal,
        Move,
        Down
    }
}
