// 读者与写者Dlg.cpp : implementation file
//

#include "stdafx.h"
#include "读者与写者.h"
#include "读者与写者Dlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMyDlg dialog

CMyDlg::CMyDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CMyDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CMyDlg)
	m_e1 = _T("当前没有任何请求");
	m_e2 = 0;
	m_e3 = 0;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);

	mutex=flag1=flag2=false;
	ReadCount=0;
}

void CMyDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CMyDlg)
	DDX_Text(pDX, IDC_EDIT1, m_e1);
	DDX_Text(pDX, IDC_EDIT2, m_e2);
	DDX_Text(pDX, IDC_EDIT3, m_e3);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CMyDlg, CDialog)
	//{{AFX_MSG_MAP(CMyDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON1, OnSZ)
	ON_WM_TIMER()
	ON_BN_CLICKED(IDC_BUTTON3, OnDZ)
	ON_BN_CLICKED(IDC_BUTTON2, OnTC)
	ON_BN_CLICKED(IDC_BUTTON4, OnGY)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMyDlg message handlers

BOOL CMyDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CMyDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CMyDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CMyDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CMyDlg::OnSZ() 
{
	// TODO: Add your control notification handler code here
   	this->UpdateData();
	if(flag1==true&&m_e2==1)
			{
	        	this->MessageBox("写--写互斥","提醒",MB_OK);
			
			}
	else 
		if(flag2=true&&m_e3>0)
		{
			this->MessageBox("写--读互斥","提醒",MB_OK);
		}

	else
  
       if(mutex==false&&m_e2==0)
	   {
		   mutex=true;
		   m_e2=1;
	       flag1=true;
		   m_e1=_T("写者正在访问");

    	CProgressCtrl *p;
    	p=(CProgressCtrl *)GetDlgItem(IDC_PROGRESS1);
    	p->ShowWindow(SW_SHOW);
    	p->SetRange(0,10);
    	p->SetPos(0);
    	SetTimer(0,300,NULL);
    
	   }
 


	this->UpdateData(false);
	
}

void CMyDlg::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	int n;
	CProgressCtrl *p;
	if(flag1==true)
	{
    	p=(CProgressCtrl *)GetDlgItem(IDC_PROGRESS1);
	}
	else
		if(flag2=true)
		{
		if(m_e3%10==1)
			{
	           p=(CProgressCtrl *)GetDlgItem(IDC_PROGRESS2);
			}
			else if(m_e3%10==2)
			{
				p=(CProgressCtrl *)GetDlgItem(IDC_PROGRESS3);
			}
			else if(m_e3%10==3)
			{
				p=(CProgressCtrl *)GetDlgItem(IDC_PROGRESS4);
			}
			else if(m_e3%10==4)
			{
				p=(CProgressCtrl *)GetDlgItem(IDC_PROGRESS5);
			}
		}

	n=p->GetPos();
	n++;
	
	if(n>10)

	{
		
		n=10;
		if(mutex==true&&m_e2==1)
		{

		m_e2=0;
        mutex=false;
        flag1=false;
		m_e1 = _T("写者已完成，当前没有任何请求");
		this->KillTimer(0);

		this->UpdateData(false);
		}

		else 
			if(flag2==true)
			{
				m_e3--;
				
				CWnd  *b;
				b=GetDlgItem(IDC_BUTTON3);
				b->EnableWindow(true);
				if(m_e3==0)
				{
					mutex=false;
                    flag2=false;
				
                    m_e1 = _T("读者已完成，当前没有任何请求");
		            this->KillTimer(1);
					this->KillTimer(2);
					this->KillTimer(3);
					this->KillTimer(4);
				}
				this->UpdateData(false);

			}
			
				
		p->ShowWindow(SW_HIDE);
		
	}

	p->SetPos(n);  


	
	CDialog::OnTimer(nIDEvent);
}

void CMyDlg::OnDZ() 
{
	// TODO: Add your control notification handler code here

    flag2=true;
	mutex=true;
	this->UpdateData();
	m_e3++;
	m_e1=_T("读者正在使用");

	if(flag1==true)
		{
	       	this->MessageBox("读--写互斥","提醒",MB_OK);
			m_e3=0;
			this->KillTimer(4);
				    
		}
    else
		if(flag2==true)
		{
        	CProgressCtrl *p;
			
			if(m_e3==4)
			{
				CWnd  *b;
				b=GetDlgItem(IDC_BUTTON3);
				b->EnableWindow(false);
			}	
				
			if(m_e3%10==1)
			{
	           p=(CProgressCtrl *)GetDlgItem(IDC_PROGRESS2);
			   p->ShowWindow(SW_SHOW);
        	p->SetRange(0,10);
        	p->SetPos(0);
        	SetTimer(1,300,NULL);
        
			}
			else if(m_e3%10==2)
			{
				p=(CProgressCtrl *)GetDlgItem(IDC_PROGRESS3);
				p->ShowWindow(SW_SHOW);
        	p->SetRange(0,10);
        	p->SetPos(0);
        	SetTimer(2,300,NULL);
        
			}
			else if(m_e3%10==3)
			{
				p=(CProgressCtrl *)GetDlgItem(IDC_PROGRESS4);
				p->ShowWindow(SW_SHOW);
        	p->SetRange(0,10);
        	p->SetPos(0);
        	SetTimer(3,300,NULL);
        	
			}
			else if(m_e3%10==4)
			{
				p=(CProgressCtrl *)GetDlgItem(IDC_PROGRESS5);
				p->ShowWindow(SW_SHOW);
        	    p->SetRange(0,10);
        	    p->SetPos(0);
        	    SetTimer(4,300,NULL);
        	    
			}

        
		}

	this->UpdateData(false);

	
}

void CMyDlg::OnTC() 
{
	// TODO: Add your control notification handler code here
	this->OnCancel();
	
}

void CMyDlg::OnGY() 
{
	// TODO: Add your control notification handler code here
	CAboutDlg  dlg;
	dlg.DoModal();
}
