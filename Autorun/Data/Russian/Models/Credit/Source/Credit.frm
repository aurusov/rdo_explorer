$Frame �������
$Back_picture = <255 255 255> 640 380
Show
  bitmap [350, 5,   net]
  text   [60, 265, 230, 20, <255 255 255>, <0 0 0>, < '- ������� ��� ��������� ��������']
  text   [60, 305, 130, 20, <255 255 255>, <0 0 0>, < '- �������� �������']
Show_if ����_wan.��������� = 2
  bitmap [358, 30, wans]
Show_if ����_wan.��������� < 2
  bitmap [358, 30, wanw]
Show_if ����_lan.��������� = 3
  bitmap [175, 138, lans1]
  bitmap [342, 202, lans2]
  bitmap [338, 80, lans3]
Show_if ����_lan.��������� < 3
  bitmap [175, 138, lanw1]
  bitmap [342, 202, lanw2]
  bitmap [338, 80, lanw3]
Show_if ��������__�������_r1.��������� = ��������
  bitmap [199, 110, kas]
  bitmap [20,  299, kas]
Show_if ��������__�������_r1.��������� = �����
  bitmap [199, 110, kaw]
  bitmap [20,  299, kaw]
Show_if ��������__�������_r2.��������� = ��������
  bitmap [393, 174, kas]
Show_if ��������__�������_r2.��������� = �����
  bitmap [393, 174, kaw]
Show_if �������_���_��������_r1.��������� = ��������
  bitmap [151, 126, ak1s]
  bitmap [23,  265, ak1s]
Show_if �������_���_��������_r1.��������� = �����
  bitmap [151, 126, ak1w]
  bitmap [23,  265, ak1w]
Show_if �������_���_��������_r2.��������� = ��������
  bitmap [455, 190, ak2s]
Show_if �������_���_��������_r2.��������� = �����
  bitmap [455, 190, ak2w]
Show_if PC_r.��������� = ��������
  bitmap [319, 56, comps]
Show_if PC_r.��������� = �����
  bitmap [319, 56, compw]
Show
  text   [280, 38,  70,  20, <255 255 255>, <0 0 0>,     = PC_r.���������]
  text   [125, 110, 70,  20, <255 255 255>, <0 0 0>,     = �������_���_��������_r1.���������]
  text   [183, 95,  70,  20, <255 255 255>, <0 0 0>,     = ��������__�������_r1.���������]
  text   [430, 172, 70,  20, <255 255 255>, <0 0 0>,     = �������_���_��������_r2.���������]
  text   [372, 158, 70,  20, <255 255 255>, <0 0 0>,     = ��������__�������_r2.���������]
  bitmap [80,  65, enter]
  text   [5,   40,  170, 20, <255 255 255>, <0 0 0>,     < '����������� �����:']
  text   [150, 40,  40,  20, <255 255 255>, <0 0 255>,   < �����_r.�����]
  bitmap [500, 230, exit]
  text   [430, 260, 170, 20, <255 255 255>, <0 0 0>,     < '����������� �����:']
  text   [577, 260, 40,  20, <255 255 255>, <0 0 255>,   < �����_r.�����]
  text   [120, 195, 170, 20, <255 255 255>, <0 0 0>,     < '����������� � ��������:']
  text   [296, 195, 40,  20, <255 255 255>, <0 0 255>,   < �����_r.�_�������]
  text   [140, 160, 70,  20, <255 255 255>, <0 0 0>,     < '�������: ']
  text   [210, 160, 40,  20, <255 255 255>, <255 0 255>, < �����_r.�����_�������_1]
  text   [390, 220, 70,  20, <255 255 255>, <0 0 0>,     < '�������: ']
  text   [460, 220, 40,  20, <255 255 255>, <255 0 255>, < �����_r.�����_�������_2]
  text   [430, 80,  160, 20, <255 255 255>, <0 0 0>,     < '����� ���������� ����:']
  text   [595, 80,  40,  20, <255 255 255>, <0 170 0>,   < ����_wan.���������]
  text   [430, 100, 160, 20, <255 255 255>, <0 0 0>,     < '����� ��������� ����:']
  text   [595, 100, 40,  20, <255 255 255>, <0 200 200>, < ����_lan.���������]
$End
