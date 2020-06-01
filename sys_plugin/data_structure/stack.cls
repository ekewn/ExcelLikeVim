VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "stack"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute appEvent.VB_VarHelpID = -1

Option Explicit
Private ary() As Variant   '�z����X�^�b�N�Ƃ��ė��p
Private size As Long       '�X�^�b�N�̌��݂̃T�C�Y


Private Sub Class_Initialize()
  '�R���X�g���N�^

  ReDim ary(0)
  size = 0

End Sub


Public Sub push(v As Variant)
  '�X�^�b�N�̈�ԏ�Ƀf�[�^��ǉ�����
  size = UBound(ary) + 1
  ReDim Preserve ary(size)
  Dim vType As Long
  vType = VarType(v)

  Select Case vType
    '�I�u�W�F�N�g�A�f�[�^�A�N�Z�X�I�u�W�F�N�g�A���[�U�[��`�^��
    'Set�\���𗘗p����
    Case vbObject
      Set ary(size) = v
    Case vbDataObject
      Set ary(size) = v
    Case vbUserDefinedType
      Set ary(size) = v
    Case Else
      ary(size) = v
  End Select
End Sub


Public Function pop() As Variant
  '�X�^�b�N�̈�ԏ�̃f�[�^�����o��
  If size = 0 Then
    '�X�^�b�N�Ƀf�[�^�����݂��Ȃ��Ƃ��́A�G���[�ԍ�1001��Raise����
    Err.Raise 1001, "Stack", "�X�^�b�N�Ƀf�[�^�����݂��܂���"
  End If

  Dim vType As Long
  vType = VarType(ary(size))

  Select Case vType
    '�I�u�W�F�N�g�A�f�[�^�A�N�Z�X�I�u�W�F�N�g�A���[�U�[��`�^��
    'Set�\���𗘗p����
    Case vbObject
      Set pop = ary(size)
    Case vbDataObject
      Set pop = ary(size)
    Case vbUserDefinedType
      Set pop = ary(size)
    Case Else
      pop = ary(size)
  End Select

  size = size - 1
  ReDim Preserve ary(size)

End Function


Public Function count() As Long
  '�X�^�b�N�̃f�[�^����Ԃ�
  count = size

End Function

Public Function getContents() As Variant
  '�X�^�b�N�̓��e��z��Ƃ��ĕԂ�
  '�C���f�b�N�X1����ԉ��̃f�[�^
  getContents = ary

End Function


Option Explicit
Sub test_Stack()
  Dim s As Stack
  Set s = New Stack

  s.push 1
  Dim c As Collection
  Set c = New Collection
  c.Add "value�e�X�g", "key�e�X�g"
  s.push c
  s.push "a"

  MsgBox "�X�^�b�N�̃f�[�^����" & s.count & "�ł��B"

  Dim ary() As Variant
  ary = s.getContents

  MsgBox "�X�^�b�N������o�����f�[�^��" & s.pop & "�ł��B"
  Dim returnC As Collection
  Set returnC = s.pop
  MsgBox "�X�^�b�N������o�����f�[�^��" & returnC("key�e�X�g") & "�ł��B"
  MsgBox "�X�^�b�N������o�����f�[�^��" & s.pop & "�ł��B"
  MsgBox "�X�^�b�N������o�����f�[�^��" & s.pop & "�ł��B"

  Set s = Nothing

End Sub