// ¶ÁÕßÓëÐ´ÕßDlg.h : header file
//

#if !defined(AFX_DLG_H__F560D003_05D2_449A_89F6_F4E8042ABDD9__INCLUDED_)
#define AFX_DLG_H__F560D003_05D2_449A_89F6_F4E8042ABDD9__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CMyDlg dialog

class CMyDlg : public CDialog
{
// Construction
public:
	CMyDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CMyDlg)
	enum { IDD = IDD_MY_DIALOG };
	CString	m_e1;
	int		m_e2;
	int		m_e3;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMyDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;
private:

	bool mutex;
	bool flag1;
	bool flag2;

	int ReadCount;


	// Generated message map functions
	//{{AFX_MSG(CMyDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnSZ();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnDZ();
	afx_msg void OnTC();
	afx_msg void OnGY();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLG_H__F560D003_05D2_449A_89F6_F4E8042ABDD9__INCLUDED_)
