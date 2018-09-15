[variables]

;==================================================================
;User Settings
;==================================================================
Padding=3
Padding1=0
SidePadding=5
HDDPadding=2

;==================================================================
;Network Settings
;==================================================================
;------------------------------------------------------------------
;Set your network interface number.  Tyipcally 1-5 or 0 for all
;------------------------------------------------------------------

Interface=0

;------------------------------------------------------------------
;Set ISP or local LAN speed in bytes (1MB = 9000000)
;------------------------------------------------------------------
SpeedD=45000000
SpeedU=9000000
;------------------------------------------------------------------
;Enable / Disable Number of Connections [ Disable 1 / Enable 0 ]
;------------------------------------------------------------------

;Connections
Connections=0

;==================================================================
;SPEED FAN - CPU / GPU / HDD Temperature
;==================================================================
;SpeedFan CPU Number Temp
SFCPU=3

;SpeedFan GPU 1 Number Temp
SFGPU1=0

;SpeedFan GPU 2 Number Temp
SFGPU2=1

;SpeedFan HDD 1 Number
SFHDD1=

;SpeedFan HDD 2 Number
SFHDD2=

;SpeedFan HDD 3 Number
SFHDD3=

;SpeedFan HDD 4 Number
SFHDD4=

;SpeedFan HDD 5 Number
SFHDD5=

;==================================================================
;SPEED FAN - CPU & AUX Fan
;==================================================================
;SpeedFan CPU Number Fan
SFfCPU=1

;SpeedFan Aux 1 Number Fan
SFfAUX1=2

;SpeedFan Aux 2 Number Fan
SFfAUX2=3

;==================================================================
;SPEED FAN - Temp Ranges
;==================================================================
F=300
C=100

;==================================================================
;HDD Drive Letter & Naming Assignment 
;==================================================================
Drive1=C:
Drive2=D:
Drive3=G:
Drive4=E:
Drive5=F:
Drive6=H:
Drive7=I:
Drive8=J:
Drive9=K:
Drive10=L:

;==================================================================
;Font and Color Settings
;==================================================================

;----------------------------------------------------
;Font 1 Settings
;----------------------------------------------------

Font1Name=Tahoma

;---------------------------- Antialias Enable / Diable

;AntiAlias [ Disable 0 / Enable 1 ]
AA=0

;----------------------------------------------------
;Color Settings
;----------------------------------------------------

;------  Global Colors ------------------------------
;Font 1
font1=255, 255, 255, 200

Bar_Red = 200,0,0,200
Bar_Green = 0, 200, 0, 200
Bar_Blue = 0, 100, 200, 255
Bar_Orange = 250,125,0,200

Bar_BG_Color = 50, 50, 50, 100
Graph_GB_Color = 50, 50, 50, 100

;------  CPU Color -----------------------------------
CPU_SideBar_Color = 100, 10, 10, 150
CPU_BG_Color = 20, 20, 20, 180

;------  RAM Color -----------------------------------
RAM_SideBar_Color = 100, 10, 10, 150
RAM_BG_Color = 20, 20, 20, 180

;------  Swap Color ----------------------------------
Swp_SideBar_Color = 100, 10, 10, 150
Swp_BG_Color = 20, 20, 20, 180

;------  Network Color -------------------------------
Net_SideBar_Color = 100, 10, 10, 150
Net_BG_Color = 20, 20, 20, 180

NetUp_Pri_Color = 0, 200, 0, 200
NetUp_Sec_Color = 0, 200, 0, 100
NetDown_Pri_Color = 0, 100, 200, 200
NetDown_Sec_Color = 0, 50, 100, 100


;------  HDD Color -----------------------------------
HDD_SideBar_Color = 100, 10, 10, 150
HDD1_BG_Color = 20, 20, 20, 180
HDD2_BG_Color = 20, 20, 20, 180
HDD3_BG_Color = 20, 20, 20, 180
HDD4_BG_Color = 20, 20, 20, 180
HDD5_BG_Color = 20, 20, 20, 180
HDD6_BG_Color = 20, 20, 20, 180
HDD7_BG_Color = 20, 20, 20, 180

;------  Sound & Time Color ---------------------------
S_SideBar_Color = 100, 10, 10, 150
T_SideBar_Color = 100, 10, 10, 150
Sound_BG_Color = 20, 20, 20, 200
Time_BG_Color = 20, 20, 20, 200



;------Legacy Color Name Support-------------------------

;Box Outline
color0=20, 20, 20, 255

;White
color1=255, 255, 255, 255

;Dark Grey
color2=20, 20, 20, 255

;Black
color3=0, 0, 0, 255

;Blue
color4=0, 100, 200, 255

;Blue Dark
Color5=0, 50, 100, 100

;Green
color6=0, 200, 0, 200

;Green Dark
color7=0, 200, 0, 100

;Title Bar Fill
color8=0, 5, 12, 255

;Title Bar Outline
color9=40, 40, 40, 255

;Message Body
color10= 0, 0, 0, 200

;Bar_Red
color11=200,0,0,200

;Bar_GPU_Temp_Red
color12=200,0,0,200

;Bar_Orange
color13=250,125,0,200

;Bar_CPU_Temp_Orange
color14=250,125,0,200