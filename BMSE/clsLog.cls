VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsLog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_strArray()    As String '���O
Dim m_lngPos        As Long '���݈ʒu
Dim m_lngMax        As Long '�ő�l

'�R���X�g���N�^
Private Sub Class_Initialize()

    Call Me.Clear

End Sub

'������
Public Sub Clear()

    ReDim m_strArray(0)
    m_lngPos = 0
    m_lngMax = 0

End Sub

'�f�[�^�̒ǉ�
Public Sub AddData(ByRef str As String)

    m_strArray(GetPos) = str
    
    m_lngPos = m_lngPos + 1
    m_lngMax = m_lngPos
    
    If UBound(m_strArray) < Max Then
    
        ReDim Preserve m_strArray((UBound(m_strArray) + 1) * 2 - 1)
    
    End If
    
    Call frmMain.SaveChanges

End Sub

'�f�[�^�̎擾
Public Function GetData() As String

    GetData = m_strArray(m_lngPos - 1)

End Function

'���݈ʒu�̎擾
Public Function GetPos() As Long

    GetPos = m_lngPos

End Function

'�i��
Public Sub Forward()

    m_lngPos = m_lngPos + 1
    
    If m_lngPos > Max Then m_lngPos = Max

End Sub

'�߂�
Public Sub Back()

    m_lngPos = m_lngPos - 1
    
    If m_lngPos < 0 Then m_lngPos = 0

End Sub

'�ő�T�C�Y�̎擾
Public Function Max() As Long

    Max = m_lngMax

End Function

'�g�p���Ă��郁�����ʂ̎擾
Public Function GetBufferSize() As Long

    Dim i   As Long
    Dim ret As Long
    
    For i = 0 To UBound(m_strArray)
    
        ret = ret + LenB(m_strArray(i))
    
    Next i
    
    GetBufferSize = ret

End Function