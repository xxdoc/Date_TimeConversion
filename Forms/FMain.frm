VERSION 5.00
Begin VB.Form FMain 
   Caption         =   "Datetime-Conversions"
   ClientHeight    =   5055
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   8415
   LinkTopic       =   "Form1"
   ScaleHeight     =   5055
   ScaleWidth      =   8415
   StartUpPosition =   3  'Windows-Standard
   Begin VB.CommandButton Command7 
      Caption         =   "IsSummerTime"
      Height          =   375
      Left            =   120
      TabIndex        =   17
      Top             =   3120
      Width           =   1815
   End
   Begin VB.CommandButton Command5 
      Caption         =   "DosTime_Now"
      Height          =   375
      Left            =   120
      TabIndex        =   14
      Top             =   2040
      Width           =   1815
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "Consolas"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2415
      Left            =   2040
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Beides
      TabIndex        =   9
      Top             =   2640
      Width           =   6375
   End
   Begin VB.CommandButton Command6 
      Caption         =   "Some UnixTime tests"
      Height          =   375
      Left            =   120
      TabIndex        =   8
      Top             =   2640
      Width           =   1815
   End
   Begin VB.CommandButton Command4 
      Caption         =   "UnixTime_Now"
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   1560
      Width           =   1815
   End
   Begin VB.CommandButton Command3 
      Caption         =   "FileTime_Now"
      Height          =   375
      Left            =   120
      TabIndex        =   6
      Top             =   1080
      Width           =   1815
   End
   Begin VB.CommandButton Command2 
      Caption         =   "SystemTime_Now"
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   600
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Date_Now"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1815
   End
   Begin VB.Label Label5 
      Caption         =   "Label5"
      Height          =   375
      Left            =   3120
      TabIndex        =   16
      Top             =   2040
      Width           =   5175
   End
   Begin VB.Label Labe15 
      Caption         =   "DosTime:"
      Height          =   375
      Left            =   2040
      TabIndex        =   15
      Top             =   2040
      Width           =   975
   End
   Begin VB.Label Label14 
      Caption         =   "UnixTime:"
      Height          =   375
      Left            =   2040
      TabIndex        =   13
      Top             =   1560
      Width           =   1095
   End
   Begin VB.Label Label13 
      Caption         =   "FileTime:"
      Height          =   375
      Left            =   2040
      TabIndex        =   12
      Top             =   1080
      Width           =   1095
   End
   Begin VB.Label Labe12 
      Caption         =   "SystemTime:"
      Height          =   375
      Left            =   2040
      TabIndex        =   11
      Top             =   600
      Width           =   1095
   End
   Begin VB.Label Label11 
      Caption         =   "Date:"
      Height          =   375
      Left            =   2040
      TabIndex        =   10
      Top             =   120
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   375
      Left            =   3120
      TabIndex        =   4
      Top             =   120
      Width           =   5175
   End
   Begin VB.Label Label4 
      Caption         =   "Label4"
      Height          =   375
      Left            =   3120
      TabIndex        =   3
      Top             =   1560
      Width           =   5175
   End
   Begin VB.Label Label3 
      Caption         =   "Label3"
      Height          =   375
      Left            =   3120
      TabIndex        =   2
      Top             =   1080
      Width           =   5175
   End
   Begin VB.Label Label2 
      Caption         =   "Label2"
      Height          =   375
      Left            =   3120
      TabIndex        =   1
      Top             =   600
      Width           =   5175
   End
End
Attribute VB_Name = "FMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    MTime.Init
    Me.Caption = Me.Caption & " v" & App.Major & "." & App.Minor & "." & App.Revision
    Command1_Click
    Command5_Click
End Sub

Private Sub Command1_Click()

    Dim dat As Date: dat = MTime.Date_Now
    Label1.Caption = MTime.Date_ToStr(dat)
    Label2.Caption = MTime.SystemTime_ToStr(MTime.Date_ToSystemTime(dat))
    Label3.Caption = MTime.FileTime_ToStr(MTime.Date_ToFileTime(dat))
    Label4.Caption = MTime.UnixTime_ToStr(MTime.Date_ToUnixTime(dat))
    Label5.Caption = MTime.DosTime_ToStr(MTime.Date_ToDosTime(dat))
    
End Sub

Private Sub Command2_Click()
    
    Dim syt As SYSTEMTIME: syt = MTime.SystemTime_Now
    Label1.Caption = MTime.Date_ToStr(MTime.SystemTime_ToDate(syt))
    Label2.Caption = MTime.SystemTime_ToStr(syt)
    Label3.Caption = MTime.FileTime_ToStr(MTime.SystemTime_ToFileTime(syt))
    Label4.Caption = MTime.UnixTime_ToStr(MTime.SystemTime_ToUnixTime(syt))
    Label5.Caption = MTime.DosTime_ToStr(MTime.SystemTime_ToDosTime(syt))
    
End Sub

Private Sub Command3_Click()
    
    Dim fit As FILETIME: fit = MTime.FileTime_Now
    Label1.Caption = MTime.Date_ToStr(MTime.FileTime_ToDate(fit))
    Label2.Caption = MTime.SystemTime_ToStr(MTime.FileTime_ToSystemTime(fit))
    Label3.Caption = MTime.FileTime_ToStr(fit)
    Label4.Caption = MTime.UnixTime_ToStr(MTime.FileTime_ToUnixTime(fit))
    Label5.Caption = MTime.DosTime_ToStr(MTime.FileTime_ToDosTime(fit))
    
End Sub

Private Sub Command4_Click()
    
    Dim uxt As Currency: uxt = MTime.UnixTime_Now
    Label1.Caption = MTime.Date_ToStr(MTime.UnixTime_ToDate(uxt))
    Label2.Caption = MTime.SystemTime_ToStr(MTime.UnixTime_ToSystemTime(uxt))
    Label3.Caption = MTime.FileTime_ToStr(MTime.UnixTime_ToFileTime(uxt))
    Label4.Caption = MTime.UnixTime_ToStr(uxt)
    Label5.Caption = MTime.DosTime_ToStr(MTime.UnixTime_ToDosTime(uxt))
    
End Sub

Private Sub Command5_Click()
    
    Dim Dst As DOSTIME: Dst = MTime.DosTime_Now
    Label1.Caption = MTime.Date_ToStr(MTime.DosTime_ToDate(Dst))
    Label2.Caption = MTime.SystemTime_ToStr(MTime.DosTime_ToSystemTime(Dst))
    Label3.Caption = MTime.FileTime_ToStr(MTime.DosTime_ToFileTime(Dst))
    Label4.Caption = MTime.UnixTime_ToStr(MTime.DosTime_ToUnixTime(Dst))
    Label5.Caption = MTime.DosTime_ToStr(Dst)
    
End Sub

Private Sub Command6_Click()
    
    Dim dat As Date
    Dim uxs As Double
    Dim s   As String
    
    'https://alexander-fischer-online.net/fuer-webmaster/unix-timestamp-in-datumsformat-wandeln.html
    'https://checkmk.com/de/linux-wissen/datum-umrechnen
    
    'user@linux> date -d @1234567890
    'Sa 14. Feb 00:31:30 CET 2009
    dat = DateSerial(2009, 2, 14) + TimeSerial(0, 31, 30)
    uxs = Date_ToUnixTime(dat)
    s = s & "1234567890 = " & uxs & " : " & CBool(1234567890 = uxs) & vbCrLf
    
    'user@ linux > Date - d '2008-12-18 12:34:00' +%s
    '1229600040
    dat = DateSerial(2008, 12, 18) + TimeSerial(12, 34, 0)
    uxs = Date_ToUnixTime(dat)
    s = s & "1229600040 = " & uxs & " : " & CBool(1229600040 = uxs) & vbCrLf
    
    'user@ linux > Date - d '1970-01-01 00:00:00' +%s
    '-3600
    dat = DateSerial(1970, 1, 1) '+ TimeSerial(0, 0, 0)
    uxs = Date_ToUnixTime(dat)
    s = s & "-3600 = " & uxs & " : " & CBool(-3600 = uxs) & vbCrLf
    
    'convert from unixtime to date
    uxs = 1234567890
    dat = UnixTime_ToDate(uxs)
    s = s & "The unixtimestamp: " & uxs & " stands for the date: " & Date_ToStr(dat) & vbCrLf
    
    Text1.Text = s
    
End Sub

Private Sub Command7_Click()
'    Dim dat As Date: dat = Now
'    MsgBox Date_ToStr(dat)
'    Dim dtstmp As Long: dtstmp = Date_ToDateTimeStamp(dat)
'    'ist datetimestamp m�glicherweise das gleiche wie DosTime???
'    MsgBox DateTimeStamp_ToStr(dtstmp)
    Dim s As String
    s = "Is summer time? " & MTime.IsSummerTime & vbCrLf
    s = s & MTime.TimeZoneInfo_ToStr
    Text1.Text = s
    
End Sub

Private Sub Form_Resize()
    Dim L As Single: L = Text1.Left
    Dim T As Single: T = Text1.Top
    Dim W As Single: W = Me.ScaleWidth - L
    Dim H As Single: H = Me.ScaleHeight - T
    If W > 0 And H > 0 Then Text1.Move L, T, W, H
End Sub