opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_lcd_init
	FNCALL	_main,_adc_init
	FNCALL	_main,_i2c_init
	FNCALL	_main,_pwm1_init
	FNCALL	_main,_lcd_goto
	FNCALL	_main,_read_adc
	FNCALL	_main,___lwtoft
	FNCALL	_main,___ftmul
	FNCALL	_main,___fttol
	FNCALL	_main,_rtc_read
	FNCALL	_main,___bmul
	FNCALL	_main,___awdiv
	FNCALL	_main,_lcd_putch
	FNCALL	_main,___awmod
	FNCALL	_main,_lcd_clear
	FNCALL	_lcd_goto,_send
	FNCALL	_lcd_putch,_send
	FNCALL	_lcd_clear,_send
	FNCALL	_lcd_init,_LCD_STROBE
	FNCALL	_lcd_init,_send
	FNCALL	_rtc_read,_i2c_start
	FNCALL	_rtc_read,_i2c_write
	FNCALL	_rtc_read,_i2c_restart
	FNCALL	_rtc_read,_i2c_read
	FNCALL	_rtc_read,_i2c_nack
	FNCALL	_rtc_read,_i2c_stop
	FNCALL	_send,_LCD_STROBE
	FNCALL	___lwtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	_i2c_read,_i2c_Wait
	FNCALL	_i2c_write,_i2c_Wait
	FNROOT	_main
	global	_chs0
	global	_chs1
	global	_chs2
	global	_mode
	global	_ADCON0
psect	text597,local,class=CODE,delta=2
global __ptext597
__ptext597:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_CCP1CON
_CCP1CON	set	23
	global	_CCPR1L
_CCPR1L	set	21
	global	_PORTD
_PORTD	set	8
	global	_SSPBUF
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_T2CON
_T2CON	set	18
	global	_ADIF
_ADIF	set	102
	global	_ADON
_ADON	set	248
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_GO
_GO	set	250
	global	_RB0
_RB0	set	48
	global	_RC0
_RC0	set	56
	global	_RC5
_RC5	set	61
	global	_RD2
_RD2	set	66
	global	_RD3
_RD3	set	67
	global	_SSPIF
_SSPIF	set	99
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_PR2
_PR2	set	146
	global	_SSPADD
_SSPADD	set	147
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_ACKDT
_ACKDT	set	1165
	global	_ACKEN
_ACKEN	set	1164
	global	_ACKSTAT
_ACKSTAT	set	1166
	global	_PEN
_PEN	set	1162
	global	_RCEN
_RCEN	set	1163
	global	_RSEN
_RSEN	set	1161
	global	_SEN
_SEN	set	1160
	global	_TRISA0
_TRISA0	set	1064
	global	_TRISA1
_TRISA1	set	1065
	global	_TRISC0
_TRISC0	set	1080
	global	_TRISC2
_TRISC2	set	1082
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC5
_TRISC5	set	1085
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"Garden Automation.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_chs0:
       ds      1

_chs2:
       ds      1

_mode:
       ds      1

psect	bitbssBANK0,class=BANK0,bit,space=1
global __pbitbssBANK0
__pbitbssBANK0:
_chs1:
       ds      1

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to BITBANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssBANK0/8)+0)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_i2c_Wait
?_i2c_Wait:	; 0 bytes @ 0x0
	global	??_i2c_Wait
??_i2c_Wait:	; 0 bytes @ 0x0
	global	?_LCD_STROBE
?_LCD_STROBE:	; 0 bytes @ 0x0
	global	??_LCD_STROBE
??_LCD_STROBE:	; 0 bytes @ 0x0
	global	?_send
?_send:	; 0 bytes @ 0x0
	global	?_pwm1_init
?_pwm1_init:	; 0 bytes @ 0x0
	global	??_pwm1_init
??_pwm1_init:	; 0 bytes @ 0x0
	global	?_adc_init
?_adc_init:	; 0 bytes @ 0x0
	global	??_adc_init
??_adc_init:	; 0 bytes @ 0x0
	global	?_i2c_init
?_i2c_init:	; 0 bytes @ 0x0
	global	??_i2c_init
??_i2c_init:	; 0 bytes @ 0x0
	global	?_i2c_start
?_i2c_start:	; 0 bytes @ 0x0
	global	??_i2c_start
??_i2c_start:	; 0 bytes @ 0x0
	global	?_i2c_stop
?_i2c_stop:	; 0 bytes @ 0x0
	global	??_i2c_stop
??_i2c_stop:	; 0 bytes @ 0x0
	global	?_i2c_restart
?_i2c_restart:	; 0 bytes @ 0x0
	global	??_i2c_restart
??_i2c_restart:	; 0 bytes @ 0x0
	global	?_i2c_write
?_i2c_write:	; 0 bytes @ 0x0
	global	??_i2c_write
??_i2c_write:	; 0 bytes @ 0x0
	global	??_i2c_read
??_i2c_read:	; 0 bytes @ 0x0
	global	?_i2c_nack
?_i2c_nack:	; 0 bytes @ 0x0
	global	??_i2c_nack
??_i2c_nack:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_lcd_clear
?_lcd_clear:	; 0 bytes @ 0x0
	global	?_lcd_putch
?_lcd_putch:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_rtc_read
?_rtc_read:	; 1 bytes @ 0x0
	global	?_i2c_read
?_i2c_read:	; 1 bytes @ 0x0
	global	?___bmul
?___bmul:	; 1 bytes @ 0x0
	global	?_read_adc
?_read_adc:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	i2c_write@data
i2c_write@data:	; 1 bytes @ 0x0
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	ds	1
	global	??___bmul
??___bmul:	; 0 bytes @ 0x1
	global	i2c_read@temp
i2c_read@temp:	; 1 bytes @ 0x1
	ds	1
	global	??_send
??_send:	; 0 bytes @ 0x2
	global	??_rtc_read
??_rtc_read:	; 0 bytes @ 0x2
	global	??_read_adc
??_read_adc:	; 0 bytes @ 0x2
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	rtc_read@reg_address
rtc_read@reg_address:	; 1 bytes @ 0x3
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x3
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	send@temp
send@temp:	; 1 bytes @ 0x4
	global	rtc_read@data
rtc_read@data:	; 1 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x5
	global	send@x
send@x:	; 1 bytes @ 0x5
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x6
	global	??_lcd_clear
??_lcd_clear:	; 0 bytes @ 0x6
	global	??_lcd_putch
??_lcd_putch:	; 0 bytes @ 0x6
	global	?_lcd_goto
?_lcd_goto:	; 0 bytes @ 0x6
	global	read_adc@chnl
read_adc@chnl:	; 1 bytes @ 0x6
	global	lcd_putch@c
lcd_putch@c:	; 1 bytes @ 0x6
	global	lcd_goto@pos
lcd_goto@pos:	; 1 bytes @ 0x6
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	??_lcd_goto
??_lcd_goto:	; 0 bytes @ 0x7
	global	lcd_goto@line
lcd_goto@line:	; 1 bytes @ 0x7
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	1
	global	?___fttol
?___fttol:	; 4 bytes @ 0x8
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x8
	ds	4
	global	??___lwtoft
??___lwtoft:	; 0 bytes @ 0xC
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??___fttol
??___fttol:	; 0 bytes @ 0x0
	ds	4
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x4
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x5
	ds	4
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x9
	ds	1
	global	?___lwtoft
?___lwtoft:	; 3 bytes @ 0xA
	global	___lwtoft@c
___lwtoft@c:	; 2 bytes @ 0xA
	ds	3
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0xD
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0xD
	ds	3
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0x10
	ds	3
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0x13
	ds	4
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x17
	ds	1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x18
	ds	3
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x1B
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x1C
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x1D
	ds	3
	global	main@count
main@count:	; 2 bytes @ 0x20
	ds	2
	global	main@flag2
main@flag2:	; 2 bytes @ 0x22
	ds	2
	global	main@i
main@i:	; 2 bytes @ 0x24
	ds	2
	global	main@j
main@j:	; 2 bytes @ 0x26
	ds	2
	global	main@a1
main@a1:	; 1 bytes @ 0x28
	ds	1
	global	main@a2
main@a2:	; 1 bytes @ 0x29
	ds	1
	global	main@b1
main@b1:	; 1 bytes @ 0x2A
	ds	1
	global	main@b2
main@b2:	; 1 bytes @ 0x2B
	ds	1
	global	main@c1
main@c1:	; 1 bytes @ 0x2C
	ds	1
	global	main@c2
main@c2:	; 1 bytes @ 0x2D
	ds	1
	global	main@moisture
main@moisture:	; 1 bytes @ 0x2E
	ds	1
	global	main@a
main@a:	; 1 bytes @ 0x2F
	ds	1
	global	main@a3
main@a3:	; 1 bytes @ 0x30
	ds	1
	global	main@b
main@b:	; 1 bytes @ 0x31
	ds	1
	global	main@b3
main@b3:	; 1 bytes @ 0x32
	ds	1
	global	main@c
main@c:	; 1 bytes @ 0x33
	ds	1
	global	main@f1
main@f1:	; 2 bytes @ 0x34
	ds	2
	global	main@light_int
main@light_int:	; 1 bytes @ 0x36
	ds	1
	global	main@c3
main@c3:	; 1 bytes @ 0x37
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     56      57
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___lwtoft	float  size(1) Largest target is 0
;;
;; ?_read_adc	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->___lwtoft
;;   _lcd_goto->_send
;;   _lcd_putch->_send
;;   _lcd_clear->_send
;;   _lcd_init->_send
;;   _rtc_read->_i2c_read
;;   _send->_LCD_STROBE
;;   ___lwtoft->___fttol
;;   ___ftmul->___lwtoft
;;   ___fttol->___ftpack
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->___ftmul
;;   ___lwtoft->___fttol
;;   ___ftmul->___lwtoft
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                27    27      0    3311
;;                                             29 BANK0     27    27      0
;;                           _lcd_init
;;                           _adc_init
;;                           _i2c_init
;;                          _pwm1_init
;;                           _lcd_goto
;;                           _read_adc
;;                           ___lwtoft
;;                            ___ftmul
;;                            ___fttol
;;                           _rtc_read
;;                             ___bmul
;;                            ___awdiv
;;                          _lcd_putch
;;                            ___awmod
;;                          _lcd_clear
;; ---------------------------------------------------------------------------------
;; (1) _lcd_goto                                             2     1      1     291
;;                                              6 COMMON     2     1      1
;;                               _send
;; ---------------------------------------------------------------------------------
;; (1) _lcd_putch                                            1     1      0     181
;;                                              6 COMMON     1     1      0
;;                               _send
;; ---------------------------------------------------------------------------------
;; (1) _lcd_clear                                            0     0      0     159
;;                               _send
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             3     3      0     159
;;                                              6 COMMON     3     3      0
;;                         _LCD_STROBE
;;                               _send
;; ---------------------------------------------------------------------------------
;; (1) _rtc_read                                             3     3      0      90
;;                                              2 COMMON     3     3      0
;;                          _i2c_start
;;                          _i2c_write
;;                        _i2c_restart
;;                           _i2c_read
;;                           _i2c_nack
;;                           _i2c_stop
;; ---------------------------------------------------------------------------------
;; (2) _send                                                 4     4      0     159
;;                                              2 COMMON     4     4      0
;;                         _LCD_STROBE
;; ---------------------------------------------------------------------------------
;; (1) ___lwtoft                                             4     1      3     231
;;                                             12 COMMON     1     1      0
;;                                             10 BANK0      3     0      3
;;                           ___ftpack
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___ftmul                                             16    10      6     535
;;                                             13 BANK0     16    10      6
;;                           ___ftpack
;;                           ___lwtoft (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (3) _LCD_STROBE                                           2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _i2c_read                                             2     2      0      23
;;                                              0 COMMON     2     2      0
;;                           _i2c_Wait
;; ---------------------------------------------------------------------------------
;; (2) _i2c_write                                            1     1      0      22
;;                                              0 COMMON     1     1      0
;;                           _i2c_Wait
;; ---------------------------------------------------------------------------------
;; (1) _read_adc                                             7     5      2      22
;;                                              0 COMMON     7     5      2
;; ---------------------------------------------------------------------------------
;; (1) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (1) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (1) ___fttol                                             14    10      4     252
;;                                              8 COMMON     4     0      4
;;                                              0 BANK0     10    10      0
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftpack                                             8     3      5     209
;;                                              0 COMMON     8     3      5
;; ---------------------------------------------------------------------------------
;; (1) ___bmul                                               4     3      1      92
;;                                              0 COMMON     4     3      1
;; ---------------------------------------------------------------------------------
;; (1) _pwm1_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _i2c_nack                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _i2c_Wait                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _i2c_restart                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _i2c_stop                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _i2c_start                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _i2c_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _adc_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _LCD_STROBE
;;     _send
;;       _LCD_STROBE
;;   _adc_init
;;   _i2c_init
;;   _pwm1_init
;;   _lcd_goto
;;     _send
;;       _LCD_STROBE
;;   _read_adc
;;   ___lwtoft
;;     ___ftpack
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;   ___ftmul
;;     ___ftpack
;;     ___lwtoft (ARG)
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;   ___fttol
;;     ___ftpack (ARG)
;;   _rtc_read
;;     _i2c_start
;;     _i2c_write
;;       _i2c_Wait
;;     _i2c_restart
;;     _i2c_read
;;       _i2c_Wait
;;     _i2c_nack
;;     _i2c_stop
;;   ___bmul
;;   ___awdiv
;;   _lcd_putch
;;     _send
;;       _LCD_STROBE
;;   ___awmod
;;   _lcd_clear
;;     _send
;;       _LCD_STROBE
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      D       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0      47       3        0.0%
;;BITBANK0            50      0       1       4        1.3%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     38      39       5       71.3%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      4A      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 24 in file "E:\PIC\test\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  f1              2   52[BANK0 ] int 
;;  j               2   38[BANK0 ] unsigned int 
;;  i               2   36[BANK0 ] unsigned int 
;;  flag2           2   34[BANK0 ] int 
;;  count           2   32[BANK0 ] int 
;;  c3              1   55[BANK0 ] unsigned char 
;;  light_int       1   54[BANK0 ] unsigned char 
;;  c               1   51[BANK0 ] unsigned char 
;;  b3              1   50[BANK0 ] unsigned char 
;;  b               1   49[BANK0 ] unsigned char 
;;  a3              1   48[BANK0 ] unsigned char 
;;  a               1   47[BANK0 ] unsigned char 
;;  moisture        1   46[BANK0 ] unsigned char 
;;  c2              1   45[BANK0 ] unsigned char 
;;  c1              1   44[BANK0 ] unsigned char 
;;  b2              1   43[BANK0 ] unsigned char 
;;  b1              1   42[BANK0 ] unsigned char 
;;  a2              1   41[BANK0 ] unsigned char 
;;  a1              1   40[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      24       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      27       0       0       0
;;Total ram usage:       27 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_init
;;		_adc_init
;;		_i2c_init
;;		_pwm1_init
;;		_lcd_goto
;;		_read_adc
;;		___lwtoft
;;		___ftmul
;;		___fttol
;;		_rtc_read
;;		___bmul
;;		___awdiv
;;		_lcd_putch
;;		___awmod
;;		_lcd_clear
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\PIC\test\main.c"
	line	24
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	25
	
l5952:	
;main.c: 25: int count = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@count)
	clrf	(main@count+1)
	line	31
;main.c: 26: unsigned int i;
;main.c: 27: unsigned int j;
;main.c: 28: unsigned char moisture;
;main.c: 29: unsigned char light_int;
;main.c: 30: unsigned char a, a1, a2, a3, b, b1, b2, b3, c, c1, c2, c3;
;main.c: 31: int f1=0,flag2=0;
	clrf	(main@f1)
	clrf	(main@f1+1)
	clrf	(main@flag2)
	clrf	(main@flag2+1)
	line	32
;main.c: 32: PORTD = 0X00;
	clrf	(8)	;volatile
	line	33
	
l5954:	
;main.c: 33: TRISA0 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1064/8)^080h,(1064)&7
	line	34
	
l5956:	
;main.c: 34: TRISA1 = 1;
	bsf	(1065/8)^080h,(1065)&7
	line	35
;main.c: 35: TRISB = 0X00;
	clrf	(134)^080h	;volatile
	line	36
	
l5958:	
;main.c: 36: TRISC0 = 0;
	bcf	(1080/8)^080h,(1080)&7
	line	37
	
l5960:	
;main.c: 37: TRISC5 = 0;
	bcf	(1085/8)^080h,(1085)&7
	line	38
	
l5962:	
;main.c: 38: lcd_init();
	fcall	_lcd_init
	line	39
	
l5964:	
;main.c: 39: adc_init();
	fcall	_adc_init
	line	40
	
l5966:	
;main.c: 40: i2c_init();
	fcall	_i2c_init
	line	41
	
l5968:	
;main.c: 41: pwm1_init();
	fcall	_pwm1_init
	line	42
	
l5970:	
;main.c: 42: RC0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	43
	
l5972:	
;main.c: 43: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
movwf	((??_main+0)+0+2),f
movlw	94
movwf	((??_main+0)+0+1),f
	movlw	134
movwf	((??_main+0)+0),f
u3747:
	decfsz	((??_main+0)+0),f
	goto	u3747
	decfsz	((??_main+0)+0+1),f
	goto	u3747
	decfsz	((??_main+0)+0+2),f
	goto	u3747
	clrwdt
opt asmopt_on

	line	44
	
l5974:	
;main.c: 44: RC0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	50
	
l5976:	
;main.c: 50: lcd_goto(1,0);
	clrf	(?_lcd_goto)
	movlw	(01h)
	fcall	_lcd_goto
	goto	l5978
	line	51
;main.c: 51: while (1)
	
l2893:	
	line	53
	
l5978:	
;main.c: 52: {
;main.c: 53: i = read_adc(0);
	movlw	(0)
	fcall	_read_adc
	movf	(1+(?_read_adc)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@i+1)
	addwf	(main@i+1)
	movf	(0+(?_read_adc)),w
	clrf	(main@i)
	addwf	(main@i)

	line	54
	
l5980:	
;main.c: 54: j = read_adc(1);
	movlw	(01h)
	fcall	_read_adc
	movf	(1+(?_read_adc)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@j+1)
	addwf	(main@j+1)
	movf	(0+(?_read_adc)),w
	clrf	(main@j)
	addwf	(main@j)

	line	55
	
l5982:	
;main.c: 55: moisture = (char) (i * 0.00488);
	movf	(main@i+1),w
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(main@i),w
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___lwtoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___lwtoft)),w
	movwf	2+(?___ftmul)+03h
	movlw	0xe8
	movwf	(?___ftmul)
	movlw	0x9f
	movwf	(?___ftmul+1)
	movlw	0x3b
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	0+(((0+(?___fttol)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@moisture)
	line	56
	
l5984:	
;main.c: 56: light_int = (char) (j * 0.00488);
	movf	(main@j+1),w
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(main@j),w
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___lwtoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___lwtoft)),w
	movwf	2+(?___ftmul)+03h
	movlw	0xe8
	movwf	(?___ftmul)
	movlw	0x9f
	movwf	(?___ftmul+1)
	movlw	0x3b
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	0+(((0+(?___fttol)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@light_int)
	line	59
	
l5986:	
;main.c: 59: a = rtc_read(0X02);
	movlw	(02h)
	fcall	_rtc_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@a)
	line	60
	
l5988:	
;main.c: 60: a1 = (a >> 4)&0X0f;
	movf	(main@a),w
	movwf	(??_main+0)+0
	movlw	04h
u3605:
	clrc
	rrf	(??_main+0)+0,f
	addlw	-1
	skipz
	goto	u3605
	movf	0+(??_main+0)+0,w
	andlw	0Fh
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(main@a1)
	line	61
	
l5990:	
;main.c: 61: a2 = a & 0X0f;
	movf	(main@a),w
	andlw	0Fh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@a2)
	line	62
	
l5992:	
;main.c: 62: a3 = (a1 * 10) + a2;
	movlw	(0Ah)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?___bmul)
	movf	(main@a1),w
	fcall	___bmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+1)+0
	movf	(main@a2),w
	addwf	0+(??_main+1)+0,w
	movwf	(??_main+2)+0
	movf	(??_main+2)+0,w
	movwf	(main@a3)
	line	63
	
l5994:	
;main.c: 63: lcd_putch(a3 / 10 + 0x30);
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(main@a3),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_lcd_putch
	line	64
	
l5996:	
;main.c: 64: lcd_putch(a3 % 10 + 0x30);
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@a3),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_lcd_putch
	line	65
	
l5998:	
;main.c: 65: lcd_putch(':');
	movlw	(03Ah)
	fcall	_lcd_putch
	line	68
	
l6000:	
;main.c: 68: b = rtc_read(0X01);
	movlw	(01h)
	fcall	_rtc_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@b)
	line	69
	
l6002:	
;main.c: 69: b1 = (b >> 4)&0X0f;
	movf	(main@b),w
	movwf	(??_main+0)+0
	movlw	04h
u3615:
	clrc
	rrf	(??_main+0)+0,f
	addlw	-1
	skipz
	goto	u3615
	movf	0+(??_main+0)+0,w
	andlw	0Fh
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(main@b1)
	line	70
	
l6004:	
;main.c: 70: b2 = b & 0X0f;
	movf	(main@b),w
	andlw	0Fh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@b2)
	line	71
	
l6006:	
;main.c: 71: b3 = (b1 * 10) + b2;
	movlw	(0Ah)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?___bmul)
	movf	(main@b1),w
	fcall	___bmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+1)+0
	movf	(main@b2),w
	addwf	0+(??_main+1)+0,w
	movwf	(??_main+2)+0
	movf	(??_main+2)+0,w
	movwf	(main@b3)
	line	72
	
l6008:	
;main.c: 72: lcd_putch(b3 / 10 + 0x30);
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(main@b3),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_lcd_putch
	line	73
	
l6010:	
;main.c: 73: lcd_putch(b3 % 10 + 0x30);
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@b3),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_lcd_putch
	line	74
	
l6012:	
;main.c: 74: lcd_putch(':');
	movlw	(03Ah)
	fcall	_lcd_putch
	line	77
	
l6014:	
;main.c: 77: c = rtc_read(0x00);
	movlw	(0)
	fcall	_rtc_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@c)
	line	78
	
l6016:	
;main.c: 78: c1 = (c >> 4)&0X0f;
	movf	(main@c),w
	movwf	(??_main+0)+0
	movlw	04h
u3625:
	clrc
	rrf	(??_main+0)+0,f
	addlw	-1
	skipz
	goto	u3625
	movf	0+(??_main+0)+0,w
	andlw	0Fh
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(main@c1)
	line	79
	
l6018:	
;main.c: 79: c2 = c & 0X0f;
	movf	(main@c),w
	andlw	0Fh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@c2)
	line	80
	
l6020:	
;main.c: 80: c3 = (c1 * 10) + c2;
	movlw	(0Ah)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?___bmul)
	movf	(main@c1),w
	fcall	___bmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+1)+0
	movf	(main@c2),w
	addwf	0+(??_main+1)+0,w
	movwf	(??_main+2)+0
	movf	(??_main+2)+0,w
	movwf	(main@c3)
	line	81
	
l6022:	
;main.c: 81: lcd_putch(c3 / 10 + 0x30);
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(main@c3),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_lcd_putch
	line	82
	
l6024:	
;main.c: 82: lcd_putch(c3 % 10 + 0x30);
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@c3),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_lcd_putch
	line	85
	
l6026:	
;main.c: 85: if(moisture>2&&f1==0)
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(main@moisture),w
	skipc
	goto	u3631
	goto	u3630
u3631:
	goto	l6034
u3630:
	
l6028:	
	movf	((main@f1+1)),w
	iorwf	((main@f1)),w
	skipz
	goto	u3641
	goto	u3640
u3641:
	goto	l6034
u3640:
	line	87
	
l6030:	
;main.c: 86: {
;main.c: 87: RB0=1;
	bsf	(48/8),(48)&7
	line	88
	
l6032:	
;main.c: 88: f1=1;
	movlw	low(01h)
	movwf	(main@f1)
	movlw	high(01h)
	movwf	((main@f1))+1
	line	89
;main.c: 89: }
	goto	l6042
	line	90
	
l2894:	
	
l6034:	
;main.c: 90: else if(moisture<2&&f1==1)
	movlw	(02h)
	subwf	(main@moisture),w
	skipnc
	goto	u3651
	goto	u3650
u3651:
	goto	l6042
u3650:
	
l6036:	
	movlw	01h
	xorwf	(main@f1),w
	iorwf	(main@f1+1),w
	skipz
	goto	u3661
	goto	u3660
u3661:
	goto	l6042
u3660:
	line	92
	
l6038:	
;main.c: 91: {
;main.c: 92: RB0=0;
	bcf	(48/8),(48)&7
	line	93
	
l6040:	
;main.c: 93: f1=0;
	clrf	(main@f1)
	clrf	(main@f1+1)
	goto	l6042
	line	94
	
l2896:	
	goto	l6042
	line	97
	
l2895:	
	
l6042:	
;main.c: 94: }
;main.c: 97: if((c3>10)&&(c3<=20))
	movlw	(0Bh)
	subwf	(main@c3),w
	skipc
	goto	u3671
	goto	u3670
u3671:
	goto	l2897
u3670:
	
l6044:	
	movlw	(015h)
	subwf	(main@c3),w
	skipnc
	goto	u3681
	goto	u3680
u3681:
	goto	l2897
u3680:
	line	99
	
l6046:	
;main.c: 98: {
;main.c: 99: RC0=1;
	bsf	(56/8),(56)&7
	line	100
;main.c: 100: }
	goto	l6048
	line	101
	
l2897:	
	line	103
;main.c: 101: else
;main.c: 102: {
;main.c: 103: RC0=0;
	bcf	(56/8),(56)&7
	goto	l6048
	line	104
	
l2898:	
	line	107
	
l6048:	
;main.c: 104: }
;main.c: 107: if (light_int < 2)
	movlw	(02h)
	subwf	(main@light_int),w
	skipnc
	goto	u3691
	goto	u3690
u3691:
	goto	l6054
u3690:
	line	109
	
l6050:	
;main.c: 108: {
;main.c: 109: RC5 = 1;
	bsf	(61/8),(61)&7
	line	110
	
l6052:	
;main.c: 110: CCPR1L = 150;
	movlw	(096h)
	movwf	(21)	;volatile
	line	111
;main.c: 111: }
	goto	l6058
	line	112
	
l2899:	
	
l6054:	
;main.c: 112: else if(light_int > 2)
	movlw	(03h)
	subwf	(main@light_int),w
	skipc
	goto	u3701
	goto	u3700
u3701:
	goto	l6058
u3700:
	line	114
	
l6056:	
;main.c: 113: {
;main.c: 114: CCPR1L=0;
	clrf	(21)	;volatile
	goto	l6058
	line	115
	
l2901:	
	goto	l6058
	line	116
	
l2900:	
	
l6058:	
;main.c: 115: }
;main.c: 116: if((c3>=30)&&(c3<=35)&&(light_int < 2))
	movlw	(01Eh)
	subwf	(main@c3),w
	skipc
	goto	u3711
	goto	u3710
u3711:
	goto	l6066
u3710:
	
l6060:	
	movlw	(024h)
	subwf	(main@c3),w
	skipnc
	goto	u3721
	goto	u3720
u3721:
	goto	l6066
u3720:
	
l6062:	
	movlw	(02h)
	subwf	(main@light_int),w
	skipnc
	goto	u3731
	goto	u3730
u3731:
	goto	l6066
u3730:
	line	118
	
l6064:	
;main.c: 117: {
;main.c: 118: RC5 = 0;
	bcf	(61/8),(61)&7
	goto	l6066
	line	119
	
l2902:	
	line	120
	
l6066:	
;main.c: 119: }
;main.c: 120: _delay((unsigned long)((850)*(20000000/4000.0)));
	opt asmopt_off
movlw  22
movwf	((??_main+0)+0+2),f
movlw	144
movwf	((??_main+0)+0+1),f
	movlw	126
movwf	((??_main+0)+0),f
u3757:
	decfsz	((??_main+0)+0),f
	goto	u3757
	decfsz	((??_main+0)+0+1),f
	goto	u3757
	decfsz	((??_main+0)+0+2),f
	goto	u3757
	clrwdt
opt asmopt_on

	line	121
	
l6068:	
;main.c: 121: lcd_clear();
	fcall	_lcd_clear
	goto	l5978
	line	122
	
l2903:	
	line	51
	goto	l5978
	
l2904:	
	line	123
	
l2905:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_goto
psect	text598,local,class=CODE,delta=2
global __ptext598
__ptext598:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 77 in file "E:\PIC\test\lcd.c"
;; Parameters:    Size  Location     Type
;;  line            1    wreg     unsigned char 
;;  pos             1    6[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  line            1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_send
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text598
	file	"E:\PIC\test\lcd.c"
	line	77
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 5
; Regs used in _lcd_goto: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_goto@line stored from wreg
	movwf	(lcd_goto@line)
	line	78
	
l5936:	
;lcd.c: 78: switch(line)
	goto	l5950
	line	80
;lcd.c: 79: {
;lcd.c: 80: case 1:
	
l2156:	
	line	81
;lcd.c: 81: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	82
	
l5938:	
;lcd.c: 82: send(0X80+pos);
	movf	(lcd_goto@pos),w
	addlw	080h
	fcall	_send
	line	83
;lcd.c: 83: break;
	goto	l2162
	line	85
;lcd.c: 85: case 2:
	
l2158:	
	line	86
;lcd.c: 86: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	87
	
l5940:	
;lcd.c: 87: send(0XC0+pos);
	movf	(lcd_goto@pos),w
	addlw	0C0h
	fcall	_send
	line	88
;lcd.c: 88: break;
	goto	l2162
	line	90
;lcd.c: 90: case 3:
	
l2159:	
	line	91
;lcd.c: 91: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	92
	
l5942:	
;lcd.c: 92: send(0X94+pos);
	movf	(lcd_goto@pos),w
	addlw	094h
	fcall	_send
	line	93
;lcd.c: 93: break;
	goto	l2162
	line	95
;lcd.c: 95: case 4:
	
l2160:	
	line	96
;lcd.c: 96: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	97
	
l5944:	
;lcd.c: 97: send(0XD4+pos);
	movf	(lcd_goto@pos),w
	addlw	0D4h
	fcall	_send
	line	98
;lcd.c: 98: break;
	goto	l2162
	line	100
;lcd.c: 100: default:
	
l2161:	
	line	101
;lcd.c: 101: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	102
	
l5946:	
;lcd.c: 102: send(0XD4+pos);
	movf	(lcd_goto@pos),w
	addlw	0D4h
	fcall	_send
	line	103
;lcd.c: 103: break;
	goto	l2162
	line	104
	
l5948:	
;lcd.c: 104: }
	goto	l2162
	line	78
	
l2155:	
	
l5950:	
	movf	(lcd_goto@line),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 1 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           23    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l2156
	xorlw	2^1	; case 2
	skipnz
	goto	l2158
	xorlw	3^2	; case 3
	skipnz
	goto	l2159
	xorlw	4^3	; case 4
	skipnz
	goto	l2160
	goto	l2161
	opt asmopt_on

	line	104
	
l2157:	
	line	105
	
l2162:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto
	__end_of_lcd_goto:
;; =============== function _lcd_goto ends ============

	signat	_lcd_goto,8312
	global	_lcd_putch
psect	text599,local,class=CODE,delta=2
global __ptext599
__ptext599:

;; *************** function _lcd_putch *****************
;; Defined at:
;;		line 72 in file "E:\PIC\test\lcd.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_send
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text599
	file	"E:\PIC\test\lcd.c"
	line	72
	global	__size_of_lcd_putch
	__size_of_lcd_putch	equ	__end_of_lcd_putch-_lcd_putch
	
_lcd_putch:	
	opt	stack 5
; Regs used in _lcd_putch: [wreg+status,2+status,0+pclath+cstack]
;lcd_putch@c stored from wreg
	movwf	(lcd_putch@c)
	line	73
	
l5932:	
;lcd.c: 73: mode = 1;
	bsf	(_mode/8),(_mode)&7
	line	74
	
l5934:	
;lcd.c: 74: send( c );
	movf	(lcd_putch@c),w
	fcall	_send
	line	75
	
l2152:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_putch
	__end_of_lcd_putch:
;; =============== function _lcd_putch ends ============

	signat	_lcd_putch,4216
	global	_lcd_clear
psect	text600,local,class=CODE,delta=2
global __ptext600
__ptext600:

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 67 in file "E:\PIC\test\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_send
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text600
	file	"E:\PIC\test\lcd.c"
	line	67
	global	__size_of_lcd_clear
	__size_of_lcd_clear	equ	__end_of_lcd_clear-_lcd_clear
	
_lcd_clear:	
	opt	stack 5
; Regs used in _lcd_clear: [wreg+status,2+status,0+pclath+cstack]
	line	68
	
l5928:	
;lcd.c: 68: mode = 0;
	bcf	(_mode/8),(_mode)&7
	line	69
	
l5930:	
;lcd.c: 69: send(0x01);
	movlw	(01h)
	fcall	_send
	line	70
	
l2149:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
;; =============== function _lcd_clear ends ============

	signat	_lcd_clear,88
	global	_lcd_init
psect	text601,local,class=CODE,delta=2
global __ptext601
__ptext601:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 13 in file "E:\PIC\test\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_LCD_STROBE
;;		_send
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text601
	file	"E:\PIC\test\lcd.c"
	line	13
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 5
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	14
	
l5914:	
;lcd.c: 14: TRISD=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	15
	
l5916:	
;lcd.c: 15: _delay((unsigned long)((500)*(20000000/4000.0)));
	opt asmopt_off
movlw  13
movwf	((??_lcd_init+0)+0+2),f
movlw	175
movwf	((??_lcd_init+0)+0+1),f
	movlw	193
movwf	((??_lcd_init+0)+0),f
u3767:
	decfsz	((??_lcd_init+0)+0),f
	goto	u3767
	decfsz	((??_lcd_init+0)+0+1),f
	goto	u3767
	decfsz	((??_lcd_init+0)+0+2),f
	goto	u3767
	clrwdt
opt asmopt_on

	line	16
	
l5918:	
;lcd.c: 16: RD2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	17
	
l5920:	
;lcd.c: 17: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	18
	
l5922:	
;lcd.c: 18: RD3=0;
	bcf	(67/8),(67)&7
	line	20
;lcd.c: 20: PORTD=(PORTD&0X0F)|0x30;
	movf	(8),w
	andlw	0Fh
	iorlw	030h
	movwf	(8)	;volatile
	line	21
	
l5924:	
;lcd.c: 21: LCD_STROBE();
	fcall	_LCD_STROBE
	line	22
	
l5926:	
;lcd.c: 22: PORTD=(PORTD&0X0F)|0x20;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w
	andlw	0Fh
	iorlw	020h
	movwf	(8)	;volatile
	line	23
;lcd.c: 23: LCD_STROBE();
	fcall	_LCD_STROBE
	line	24
;lcd.c: 24: send(0x28);
	movlw	(028h)
	fcall	_send
	line	25
;lcd.c: 25: send(0x08);
	movlw	(08h)
	fcall	_send
	line	26
;lcd.c: 26: send(0x01);
	movlw	(01h)
	fcall	_send
	line	27
;lcd.c: 27: send(0x06);
	movlw	(06h)
	fcall	_send
	line	28
;lcd.c: 28: send(0x80);
	movlw	(080h)
	fcall	_send
	line	29
;lcd.c: 29: send(0x0c);
	movlw	(0Ch)
	fcall	_send
	line	30
	
l2130:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_rtc_read
psect	text602,local,class=CODE,delta=2
global __ptext602
__ptext602:

;; *************** function _rtc_read *****************
;; Defined at:
;;		line 128 in file "E:\PIC\test\main.c"
;; Parameters:    Size  Location     Type
;;  reg_address     1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg_address     1    3[COMMON] unsigned char 
;;  data            1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_i2c_start
;;		_i2c_write
;;		_i2c_restart
;;		_i2c_read
;;		_i2c_nack
;;		_i2c_stop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text602
	file	"E:\PIC\test\main.c"
	line	128
	global	__size_of_rtc_read
	__size_of_rtc_read	equ	__end_of_rtc_read-_rtc_read
	
_rtc_read:	
	opt	stack 5
; Regs used in _rtc_read: [wreg+status,2+status,0+pclath+cstack]
;rtc_read@reg_address stored from wreg
	line	130
	movwf	(rtc_read@reg_address)
	
l5900:	
;main.c: 129: unsigned char data;
;main.c: 130: i2c_start();
	fcall	_i2c_start
	line	131
	
l5902:	
;main.c: 131: i2c_write(0XD0);
	movlw	(0D0h)
	fcall	_i2c_write
	line	132
	
l5904:	
;main.c: 132: i2c_write(reg_address);
	movf	(rtc_read@reg_address),w
	fcall	_i2c_write
	line	133
;main.c: 133: i2c_restart();
	fcall	_i2c_restart
	line	134
	
l5906:	
;main.c: 134: i2c_write(0XD0 + 1);
	movlw	(0D1h)
	fcall	_i2c_write
	line	135
	
l5908:	
;main.c: 135: data = i2c_read();
	fcall	_i2c_read
	movwf	(??_rtc_read+0)+0
	movf	(??_rtc_read+0)+0,w
	movwf	(rtc_read@data)
	line	136
;main.c: 136: i2c_nack();
	fcall	_i2c_nack
	line	137
;main.c: 137: i2c_stop();
	fcall	_i2c_stop
	line	138
	
l5910:	
;main.c: 138: return data;
	movf	(rtc_read@data),w
	goto	l2908
	
l5912:	
	line	139
	
l2908:	
	return
	opt stack 0
GLOBAL	__end_of_rtc_read
	__end_of_rtc_read:
;; =============== function _rtc_read ends ============

	signat	_rtc_read,4217
	global	_send
psect	text603,local,class=CODE,delta=2
global __ptext603
__ptext603:

;; *************** function _send *****************
;; Defined at:
;;		line 38 in file "E:\PIC\test\lcd.c"
;; Parameters:    Size  Location     Type
;;  x               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  x               1    5[COMMON] unsigned char 
;;  temp            1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_LCD_STROBE
;; This function is called by:
;;		_lcd_init
;;		_lcd_clear
;;		_lcd_putch
;;		_lcd_goto
;;		_lcd_puts
;;		_curser
;;		_display_shift
;;		_curser_shift_left
;;		_curser_shift_right
;; This function uses a non-reentrant model
;;
psect	text603
	file	"E:\PIC\test\lcd.c"
	line	38
	global	__size_of_send
	__size_of_send	equ	__end_of_send-_send
	
_send:	
	opt	stack 5
; Regs used in _send: [wreg+status,2+status,0+pclath+cstack]
;send@x stored from wreg
	line	40
	movwf	(send@x)
	
l5874:	
;lcd.c: 39: char temp;
;lcd.c: 40: temp=x;
	movf	(send@x),w
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@temp)
	line	41
	
l5876:	
;lcd.c: 41: x=x&0XF0;
	movf	(send@x),w
	andlw	0F0h
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	42
	
l5878:	
;lcd.c: 42: PORTD=(PORTD&0X0F)|x;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w
	andlw	0Fh
	iorwf	(send@x),w
	movwf	(8)	;volatile
	line	43
	
l5880:	
;lcd.c: 43: if (mode==0)
	btfsc	(_mode/8),(_mode)&7
	goto	u3571
	goto	u3570
u3571:
	goto	l2136
u3570:
	line	44
	
l5882:	
;lcd.c: 44: RD2=0;
	bcf	(66/8),(66)&7
	goto	l5884
	line	45
	
l2136:	
	line	46
;lcd.c: 45: else
;lcd.c: 46: RD2=1;
	bsf	(66/8),(66)&7
	goto	l5884
	
l2137:	
	line	47
	
l5884:	
;lcd.c: 47: LCD_STROBE();
	fcall	_LCD_STROBE
	line	48
	
l5886:	
;lcd.c: 48: x=temp;
	movf	(send@temp),w
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	49
	
l5888:	
;lcd.c: 49: x=x<<4;
	movf	(send@x),w
	movwf	(??_send+0)+0
	movlw	(04h)-1
u3585:
	clrc
	rlf	(??_send+0)+0,f
	addlw	-1
	skipz
	goto	u3585
	clrc
	rlf	(??_send+0)+0,w
	movwf	(??_send+1)+0
	movf	(??_send+1)+0,w
	movwf	(send@x)
	line	50
	
l5890:	
;lcd.c: 50: x=x&0XF0;
	movf	(send@x),w
	andlw	0F0h
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	51
	
l5892:	
;lcd.c: 51: PORTD=(PORTD&0X0F)|x;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w
	andlw	0Fh
	iorwf	(send@x),w
	movwf	(8)	;volatile
	line	52
	
l5894:	
;lcd.c: 52: if(mode==0)
	btfsc	(_mode/8),(_mode)&7
	goto	u3591
	goto	u3590
u3591:
	goto	l2138
u3590:
	line	53
	
l5896:	
;lcd.c: 53: RD2=0;
	bcf	(66/8),(66)&7
	goto	l5898
	line	54
	
l2138:	
	line	55
;lcd.c: 54: else
;lcd.c: 55: RD2=1;
	bsf	(66/8),(66)&7
	goto	l5898
	
l2139:	
	line	56
	
l5898:	
;lcd.c: 56: LCD_STROBE();
	fcall	_LCD_STROBE
	line	57
	
l2140:	
	return
	opt stack 0
GLOBAL	__end_of_send
	__end_of_send:
;; =============== function _send ends ============

	signat	_send,4216
	global	___lwtoft
psect	text604,local,class=CODE,delta=2
global __ptext604
__ptext604:

;; *************** function ___lwtoft *****************
;; Defined at:
;;		line 29 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2   10[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3   10[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       3       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text604
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwtoft.c"
	line	29
	global	__size_of___lwtoft
	__size_of___lwtoft	equ	__end_of___lwtoft-___lwtoft
	
___lwtoft:	
	opt	stack 6
; Regs used in ___lwtoft: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l5870:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwtoft@c),w
	movwf	(?___ftpack)
	movf	(___lwtoft@c+1),w
	movwf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	(??___lwtoft+0)+0
	movf	(??___lwtoft+0)+0,w
	movwf	0+(?___ftpack)+03h
	clrf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lwtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___lwtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___lwtoft+2)
	goto	l3817
	
l5872:	
	line	31
	
l3817:	
	return
	opt stack 0
GLOBAL	__end_of___lwtoft
	__end_of___lwtoft:
;; =============== function ___lwtoft ends ============

	signat	___lwtoft,4219
	global	___ftmul
psect	text605,local,class=CODE,delta=2
global __ptext605
__ptext605:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3   13[BANK0 ] float 
;;  f2              3   16[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   24[BANK0 ] unsigned um
;;  sign            1   28[BANK0 ] unsigned char 
;;  cntr            1   27[BANK0 ] unsigned char 
;;  exp             1   23[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   13[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text605
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 6
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l5820:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@exp)
	movf	((___ftmul@exp)),f
	skipz
	goto	u3431
	goto	u3430
u3431:
	goto	l5826
u3430:
	line	57
	
l5822:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l3693
	
l5824:	
	goto	l3693
	
l3692:	
	line	58
	
l5826:	
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	movf	((___ftmul@sign)),f
	skipz
	goto	u3441
	goto	u3440
u3441:
	goto	l5832
u3440:
	line	59
	
l5828:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l3693
	
l5830:	
	goto	l3693
	
l3694:	
	line	60
	
l5832:	
	movf	(___ftmul@sign),w
	addlw	07Bh
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	addwf	(___ftmul@exp),f
	line	61
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u3455:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3450:
	addlw	-1
	skipz
	goto	u3455
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	line	62
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u3465:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3460:
	addlw	-1
	skipz
	goto	u3465
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	xorwf	(___ftmul@sign),f
	line	63
	movlw	(080h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	andwf	(___ftmul@sign),f
	line	64
	
l5834:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l5836:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l5838:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l5840:	
	movlw	0
	movwf	(___ftmul@f3_as_product)
	movlw	0
	movwf	(___ftmul@f3_as_product+1)
	movlw	0
	movwf	(___ftmul@f3_as_product+2)
	line	69
	
l5842:	
	movlw	(07h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l5844
	line	70
	
l3695:	
	line	71
	
l5844:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3471
	goto	u3470
u3471:
	goto	l5848
u3470:
	line	72
	
l5846:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3481
	addwf	(___ftmul@f3_as_product+1),f
u3481:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3482
	addwf	(___ftmul@f3_as_product+2),f
u3482:

	goto	l5848
	
l3696:	
	line	73
	
l5848:	
	movlw	01h
u3495:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3495

	line	74
	
l5850:	
	movlw	01h
u3505:
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	addlw	-1
	skipz
	goto	u3505
	line	75
	
l5852:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3511
	goto	u3510
u3511:
	goto	l5844
u3510:
	goto	l5854
	
l3697:	
	line	76
	
l5854:	
	movlw	(09h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l5856
	line	77
	
l3698:	
	line	78
	
l5856:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3521
	goto	u3520
u3521:
	goto	l5860
u3520:
	line	79
	
l5858:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3531
	addwf	(___ftmul@f3_as_product+1),f
u3531:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3532
	addwf	(___ftmul@f3_as_product+2),f
u3532:

	goto	l5860
	
l3699:	
	line	80
	
l5860:	
	movlw	01h
u3545:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3545

	line	81
	
l5862:	
	movlw	01h
u3555:
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	addlw	-1
	skipz
	goto	u3555

	line	82
	
l5864:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3561
	goto	u3560
u3561:
	goto	l5856
u3560:
	goto	l5866
	
l3700:	
	line	83
	
l5866:	
	movf	(___ftmul@f3_as_product),w
	movwf	(?___ftpack)
	movf	(___ftmul@f3_as_product+1),w
	movwf	(?___ftpack+1)
	movf	(___ftmul@f3_as_product+2),w
	movwf	(?___ftpack+2)
	movf	(___ftmul@exp),w
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftmul@sign),w
	movwf	(??___ftmul+1)+0
	movf	(??___ftmul+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	goto	l3693
	
l5868:	
	line	84
	
l3693:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	_LCD_STROBE
psect	text606,local,class=CODE,delta=2
global __ptext606
__ptext606:

;; *************** function _LCD_STROBE *****************
;; Defined at:
;;		line 32 in file "E:\PIC\test\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_init
;;		_send
;; This function uses a non-reentrant model
;;
psect	text606
	file	"E:\PIC\test\lcd.c"
	line	32
	global	__size_of_LCD_STROBE
	__size_of_LCD_STROBE	equ	__end_of_LCD_STROBE-_LCD_STROBE
	
_LCD_STROBE:	
	opt	stack 5
; Regs used in _LCD_STROBE: [wreg]
	line	33
	
l5814:	
;lcd.c: 33: RD3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(67/8),(67)&7
	line	34
	
l5816:	
;lcd.c: 34: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_LCD_STROBE+0)+0+1),f
	movlw	118
movwf	((??_LCD_STROBE+0)+0),f
u3777:
	decfsz	((??_LCD_STROBE+0)+0),f
	goto	u3777
	decfsz	((??_LCD_STROBE+0)+0+1),f
	goto	u3777
	clrwdt
opt asmopt_on

	line	35
	
l5818:	
;lcd.c: 35: RD3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(67/8),(67)&7
	line	36
	
l2133:	
	return
	opt stack 0
GLOBAL	__end_of_LCD_STROBE
	__end_of_LCD_STROBE:
;; =============== function _LCD_STROBE ends ============

	signat	_LCD_STROBE,88
	global	_i2c_read
psect	text607,local,class=CODE,delta=2
global __ptext607
__ptext607:

;; *************** function _i2c_read *****************
;; Defined at:
;;		line 75 in file "E:\PIC\test\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_i2c_Wait
;; This function is called by:
;;		_rtc_read
;; This function uses a non-reentrant model
;;
psect	text607
	file	"E:\PIC\test\i2c.c"
	line	75
	global	__size_of_i2c_read
	__size_of_i2c_read	equ	__end_of_i2c_read-_i2c_read
	
_i2c_read:	
	opt	stack 5
; Regs used in _i2c_read: [wreg+status,2+status,0+pclath+cstack]
	line	78
	
l5804:	
;i2c.c: 77: char temp;
;i2c.c: 78: RCEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1163/8)^080h,(1163)&7
	line	79
	
l5806:	
;i2c.c: 79: i2c_Wait();
	fcall	_i2c_Wait
	line	80
	
l5808:	
;i2c.c: 80: temp = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_i2c_read+0)+0
	movf	(??_i2c_read+0)+0,w
	movwf	(i2c_read@temp)
	line	81
	
l5810:	
;i2c.c: 81: return temp;
	movf	(i2c_read@temp),w
	goto	l1425
	
l5812:	
	line	83
	
l1425:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_read
	__end_of_i2c_read:
;; =============== function _i2c_read ends ============

	signat	_i2c_read,89
	global	_i2c_write
psect	text608,local,class=CODE,delta=2
global __ptext608
__ptext608:

;; *************** function _i2c_write *****************
;; Defined at:
;;		line 35 in file "E:\PIC\test\i2c.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_i2c_Wait
;; This function is called by:
;;		_rtc_read
;; This function uses a non-reentrant model
;;
psect	text608
	file	"E:\PIC\test\i2c.c"
	line	35
	global	__size_of_i2c_write
	__size_of_i2c_write	equ	__end_of_i2c_write-_i2c_write
	
_i2c_write:	
	opt	stack 5
; Regs used in _i2c_write: [wreg+status,2+status,0+pclath+cstack]
;i2c_write@data stored from wreg
	line	37
	movwf	(i2c_write@data)
	
l5800:	
;i2c.c: 37: SSPBUF = data;
	movf	(i2c_write@data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	38
	
l5802:	
;i2c.c: 38: i2c_Wait();
	fcall	_i2c_Wait
	line	42
	
l1407:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_write
	__end_of_i2c_write:
;; =============== function _i2c_write ends ============

	signat	_i2c_write,4216
	global	_read_adc
psect	text609,local,class=CODE,delta=2
global __ptext609
__ptext609:

;; *************** function _read_adc *****************
;; Defined at:
;;		line 18 in file "E:\PIC\test\adc.c"
;; Parameters:    Size  Location     Type
;;  chnl            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  chnl            1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text609
	file	"E:\PIC\test\adc.c"
	line	18
	global	__size_of_read_adc
	__size_of_read_adc	equ	__end_of_read_adc-_read_adc
	
_read_adc:	
	opt	stack 7
; Regs used in _read_adc: [wreg+status,2+status,0+btemp+1]
;read_adc@chnl stored from wreg
	movwf	(read_adc@chnl)
	line	19
	
l5784:	
;adc.c: 19: ADCON0=0B01000000|(chnl<<3);
	movf	(read_adc@chnl),w
	movwf	(??_read_adc+0)+0
	movlw	(03h)-1
u3415:
	clrc
	rlf	(??_read_adc+0)+0,f
	addlw	-1
	skipz
	goto	u3415
	clrc
	rlf	(??_read_adc+0)+0,w
	iorlw	040h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	20
	
l5786:	
;adc.c: 20: ADIF=0;
	bcf	(102/8),(102)&7
	line	21
	
l5788:	
;adc.c: 21: ADON=1;
	bsf	(248/8),(248)&7
	line	22
	
l5790:	
;adc.c: 22: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_read_adc+0)+0+1),f
	movlw	125
movwf	((??_read_adc+0)+0),f
u3787:
	decfsz	((??_read_adc+0)+0),f
	goto	u3787
	decfsz	((??_read_adc+0)+0+1),f
	goto	u3787
opt asmopt_on

	line	23
	
l5792:	
;adc.c: 23: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7
	line	24
;adc.c: 24: while(ADIF==0);
	goto	l696
	
l697:	
	
l696:	
	btfss	(102/8),(102)&7
	goto	u3421
	goto	u3420
u3421:
	goto	l696
u3420:
	
l698:	
	line	25
;adc.c: 25: GO=0;
	bcf	(250/8),(250)&7
	line	26
	
l5794:	
;adc.c: 26: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_read_adc+0)+0+1),f
	movlw	125
movwf	((??_read_adc+0)+0),f
u3797:
	decfsz	((??_read_adc+0)+0),f
	goto	u3797
	decfsz	((??_read_adc+0)+0+1),f
	goto	u3797
opt asmopt_on

	line	27
	
l5796:	
;adc.c: 27: return((ADRESH<<8) | ADRESL);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(??_read_adc+0)+0
	clrf	(??_read_adc+0)+0+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(30),w	;volatile
	movwf	(??_read_adc+2)+0
	clrf	(??_read_adc+2)+0+1
	movf	(??_read_adc+2)+0,w
	movwf	(??_read_adc+2)+1
	clrf	(??_read_adc+2)+0
	movf	0+(??_read_adc+0)+0,w
	iorwf	0+(??_read_adc+2)+0,w
	movwf	(?_read_adc)
	movf	1+(??_read_adc+0)+0,w
	iorwf	1+(??_read_adc+2)+0,w
	movwf	1+(?_read_adc)
	goto	l699
	
l5798:	
	line	29
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_read_adc
	__end_of_read_adc:
;; =============== function _read_adc ends ============

	signat	_read_adc,4218
	global	___awmod
psect	text610,local,class=CODE,delta=2
global __ptext610
__ptext610:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text610
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 7
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l5708:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u3261
	goto	u3260
u3261:
	goto	l5712
u3260:
	line	10
	
l5710:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l5712
	line	12
	
l3802:	
	line	13
	
l5712:	
	btfss	(___awmod@divisor+1),7
	goto	u3271
	goto	u3270
u3271:
	goto	l5716
u3270:
	line	14
	
l5714:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l5716
	
l3803:	
	line	15
	
l5716:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u3281
	goto	u3280
u3281:
	goto	l5734
u3280:
	line	16
	
l5718:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l5724
	
l3806:	
	line	18
	
l5720:	
	movlw	01h
	
u3295:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u3295
	line	19
	
l5722:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l5724
	line	20
	
l3805:	
	line	17
	
l5724:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u3301
	goto	u3300
u3301:
	goto	l5720
u3300:
	goto	l5726
	
l3807:	
	goto	l5726
	line	21
	
l3808:	
	line	22
	
l5726:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u3315
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u3315:
	skipc
	goto	u3311
	goto	u3310
u3311:
	goto	l5730
u3310:
	line	23
	
l5728:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l5730
	
l3809:	
	line	24
	
l5730:	
	movlw	01h
	
u3325:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u3325
	line	25
	
l5732:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u3331
	goto	u3330
u3331:
	goto	l5726
u3330:
	goto	l5734
	
l3810:	
	goto	l5734
	line	26
	
l3804:	
	line	27
	
l5734:	
	movf	(___awmod@sign),w
	skipz
	goto	u3340
	goto	l5738
u3340:
	line	28
	
l5736:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l5738
	
l3811:	
	line	29
	
l5738:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l3812
	
l5740:	
	line	30
	
l3812:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text611,local,class=CODE,delta=2
global __ptext611
__ptext611:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    7[COMMON] int 
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         9       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text611
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 7
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l5668:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u3161
	goto	u3160
u3161:
	goto	l5672
u3160:
	line	11
	
l5670:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l5672
	line	13
	
l3734:	
	line	14
	
l5672:	
	btfss	(___awdiv@dividend+1),7
	goto	u3171
	goto	u3170
u3171:
	goto	l5678
u3170:
	line	15
	
l5674:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l5676:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l5678
	line	17
	
l3735:	
	line	18
	
l5678:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l5680:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u3181
	goto	u3180
u3181:
	goto	l5700
u3180:
	line	20
	
l5682:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l5688
	
l3738:	
	line	22
	
l5684:	
	movlw	01h
	
u3195:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u3195
	line	23
	
l5686:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l5688
	line	24
	
l3737:	
	line	21
	
l5688:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u3201
	goto	u3200
u3201:
	goto	l5684
u3200:
	goto	l5690
	
l3739:	
	goto	l5690
	line	25
	
l3740:	
	line	26
	
l5690:	
	movlw	01h
	
u3215:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u3215
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u3225
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u3225:
	skipc
	goto	u3221
	goto	u3220
u3221:
	goto	l5696
u3220:
	line	28
	
l5692:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l5694:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l5696
	line	30
	
l3741:	
	line	31
	
l5696:	
	movlw	01h
	
u3235:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u3235
	line	32
	
l5698:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u3241
	goto	u3240
u3241:
	goto	l5690
u3240:
	goto	l5700
	
l3742:	
	goto	l5700
	line	33
	
l3736:	
	line	34
	
l5700:	
	movf	(___awdiv@sign),w
	skipz
	goto	u3250
	goto	l5704
u3250:
	line	35
	
l5702:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l5704
	
l3743:	
	line	36
	
l5704:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l3744
	
l5706:	
	line	37
	
l3744:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___fttol
psect	text612,local,class=CODE,delta=2
global __ptext612
__ptext612:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[COMMON] float 
;; Auto vars:     Size  Location     Type
;;  lval            4    5[BANK0 ] unsigned long 
;;  exp1            1    9[BANK0 ] unsigned char 
;;  sign1           1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    8[COMMON] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         4      10       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text612
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 7
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l5604:	
	movf	(___fttol@f1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@exp1)
	movf	((___fttol@exp1)),f
	skipz
	goto	u3041
	goto	u3040
u3041:
	goto	l5610
u3040:
	line	50
	
l5606:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l3704
	
l5608:	
	goto	l3704
	
l3703:	
	line	51
	
l5610:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u3055:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u3050:
	addlw	-1
	skipz
	goto	u3055
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l5612:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l5614:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l5616:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l5618:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l5620:	
	btfss	(___fttol@exp1),7
	goto	u3061
	goto	u3060
u3061:
	goto	l5630
u3060:
	line	57
	
l5622:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u3071
	goto	u3070
u3071:
	goto	l5628
u3070:
	line	58
	
l5624:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l3704
	
l5626:	
	goto	l3704
	
l3706:	
	goto	l5628
	line	59
	
l3707:	
	line	60
	
l5628:	
	movlw	01h
u3085:
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	addlw	-1
	skipz
	goto	u3085

	line	61
	movlw	(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u3091
	goto	u3090
u3091:
	goto	l5628
u3090:
	goto	l5640
	
l3708:	
	line	62
	goto	l5640
	
l3705:	
	line	63
	
l5630:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u3101
	goto	u3100
u3101:
	goto	l5638
u3100:
	line	64
	
l5632:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l3704
	
l5634:	
	goto	l3704
	
l3710:	
	line	65
	goto	l5638
	
l3712:	
	line	66
	
l5636:	
	movlw	01h
	movwf	(??___fttol+0)+0
u3115:
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	(??___fttol+0)+0
	goto	u3115
	line	67
	movlw	low(01h)
	subwf	(___fttol@exp1),f
	goto	l5638
	line	68
	
l3711:	
	line	65
	
l5638:	
	movf	(___fttol@exp1),f
	skipz
	goto	u3121
	goto	u3120
u3121:
	goto	l5636
u3120:
	goto	l5640
	
l3713:	
	goto	l5640
	line	69
	
l3709:	
	line	70
	
l5640:	
	movf	(___fttol@sign1),w
	skipz
	goto	u3130
	goto	l5644
u3130:
	line	71
	
l5642:	
	comf	(___fttol@lval),f
	comf	(___fttol@lval+1),f
	comf	(___fttol@lval+2),f
	comf	(___fttol@lval+3),f
	incf	(___fttol@lval),f
	skipnz
	incf	(___fttol@lval+1),f
	skipnz
	incf	(___fttol@lval+2),f
	skipnz
	incf	(___fttol@lval+3),f
	goto	l5644
	
l3714:	
	line	72
	
l5644:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	goto	l3704
	
l5646:	
	line	73
	
l3704:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text613,local,class=CODE,delta=2
global __ptext613
__ptext613:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    0[COMMON] unsigned um
;;  exp             1    3[COMMON] unsigned char 
;;  sign            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         5       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftmul
;;		___lwtoft
;;		___ftadd
;;		___ftdiv
;;		___lbtoft
;;		___abtoft
;;		___awtoft
;;		___altoft
;;		___lltoft
;;		___attoft
;;		___lttoft
;; This function uses a non-reentrant model
;;
psect	text613
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 6
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l5530:	
	movf	(___ftpack@exp),w
	skipz
	goto	u2850
	goto	l5534
u2850:
	
l5532:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u2861
	goto	u2860
u2861:
	goto	l5540
u2860:
	goto	l5534
	
l3928:	
	line	65
	
l5534:	
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	goto	l3929
	
l5536:	
	goto	l3929
	
l3926:	
	line	66
	goto	l5540
	
l3931:	
	line	67
	
l5538:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
	movlw	01h
u2875:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2875

	goto	l5540
	line	69
	
l3930:	
	line	66
	
l5540:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2881
	goto	u2880
u2881:
	goto	l5538
u2880:
	goto	l3933
	
l3932:	
	line	70
	goto	l3933
	
l3934:	
	line	71
	
l5542:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
l5544:	
	movlw	01h
	addwf	(___ftpack@arg),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+2),f
	line	73
	
l5546:	
	movlw	01h
u2895:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2895

	line	74
	
l3933:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2901
	goto	u2900
u2901:
	goto	l5542
u2900:
	goto	l5550
	
l3935:	
	line	75
	goto	l5550
	
l3937:	
	line	76
	
l5548:	
	movlw	low(01h)
	subwf	(___ftpack@exp),f
	line	77
	movlw	01h
u2915:
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	addlw	-1
	skipz
	goto	u2915
	goto	l5550
	line	78
	
l3936:	
	line	75
	
l5550:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u2921
	goto	u2920
u2921:
	goto	l5548
u2920:
	
l3938:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u2931
	goto	u2930
u2931:
	goto	l3939
u2930:
	line	80
	
l5552:	
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
l3939:	
	line	81
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
l5554:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u2945:
	clrc
	rlf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u2940:
	addlw	-1
	skipz
	goto	u2945
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l5556:	
	movf	(___ftpack@sign),w
	skipz
	goto	u2950
	goto	l3940
u2950:
	line	84
	
l5558:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l3940:	
	line	85
	line	86
	
l3929:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	___bmul
psect	text614,local,class=CODE,delta=2
global __ptext614
__ptext614:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    3[COMMON] unsigned char 
;;  product         1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text614
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 7
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	line	4
	
l5446:	
	clrf	(___bmul@product)
	line	6
	
l3588:	
	line	7
	btfss	(___bmul@multiplier),(0)&7
	goto	u2591
	goto	u2590
u2591:
	goto	l5450
u2590:
	line	8
	
l5448:	
	movf	(___bmul@multiplicand),w
	movwf	(??___bmul+0)+0
	movf	(??___bmul+0)+0,w
	addwf	(___bmul@product),f
	goto	l5450
	
l3589:	
	line	9
	
l5450:	
	clrc
	rlf	(___bmul@multiplicand),f

	line	10
	
l5452:	
	clrc
	rrf	(___bmul@multiplier),f

	line	11
	
l5454:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u2601
	goto	u2600
u2601:
	goto	l3588
u2600:
	goto	l5456
	
l3590:	
	line	12
	
l5456:	
	movf	(___bmul@product),w
	goto	l3591
	
l5458:	
	line	13
	
l3591:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_pwm1_init
psect	text615,local,class=CODE,delta=2
global __ptext615
__ptext615:

;; *************** function _pwm1_init *****************
;; Defined at:
;;		line 141 in file "E:\PIC\test\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text615
	file	"E:\PIC\test\main.c"
	line	141
	global	__size_of_pwm1_init
	__size_of_pwm1_init	equ	__end_of_pwm1_init-_pwm1_init
	
_pwm1_init:	
	opt	stack 7
; Regs used in _pwm1_init: [wreg+status,2]
	line	142
	
l5438:	
;main.c: 142: CCP1CON = 0B00001111;
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(23)	;volatile
	line	143
;main.c: 143: PR2 = 0X3F;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	144
	
l5440:	
;main.c: 144: CCPR1L = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(21)	;volatile
	line	145
	
l5442:	
;main.c: 145: TRISC2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1082/8)^080h,(1082)&7
	line	146
	
l5444:	
;main.c: 146: T2CON = 0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(18)	;volatile
	line	147
	
l2911:	
	return
	opt stack 0
GLOBAL	__end_of_pwm1_init
	__end_of_pwm1_init:
;; =============== function _pwm1_init ends ============

	signat	_pwm1_init,88
	global	_i2c_nack
psect	text616,local,class=CODE,delta=2
global __ptext616
__ptext616:

;; *************** function _i2c_nack *****************
;; Defined at:
;;		line 86 in file "E:\PIC\test\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rtc_read
;; This function uses a non-reentrant model
;;
psect	text616
	file	"E:\PIC\test\i2c.c"
	line	86
	global	__size_of_i2c_nack
	__size_of_i2c_nack	equ	__end_of_i2c_nack-_i2c_nack
	
_i2c_nack:	
	opt	stack 6
; Regs used in _i2c_nack: []
	line	87
	
l5406:	
;i2c.c: 87: ACKDT = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1165/8)^080h,(1165)&7
	line	88
;i2c.c: 88: ACKEN = 1;
	bsf	(1164/8)^080h,(1164)&7
	line	89
;i2c.c: 89: while (ACKEN);
	goto	l1428
	
l1429:	
	
l1428:	
	btfsc	(1164/8)^080h,(1164)&7
	goto	u2551
	goto	u2550
u2551:
	goto	l1428
u2550:
	goto	l1431
	
l1430:	
	line	91
	
l1431:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_nack
	__end_of_i2c_nack:
;; =============== function _i2c_nack ends ============

	signat	_i2c_nack,88
	global	_i2c_Wait
psect	text617,local,class=CODE,delta=2
global __ptext617
__ptext617:

;; *************** function _i2c_Wait *****************
;; Defined at:
;;		line 94 in file "E:\PIC\test\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_i2c_write
;;		_i2c_read
;;		_i2c_address
;; This function uses a non-reentrant model
;;
psect	text617
	file	"E:\PIC\test\i2c.c"
	line	94
	global	__size_of_i2c_Wait
	__size_of_i2c_Wait	equ	__end_of_i2c_Wait-_i2c_Wait
	
_i2c_Wait:	
	opt	stack 5
; Regs used in _i2c_Wait: []
	line	95
	
l5392:	
;i2c.c: 95: SSPIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	96
;i2c.c: 96: while (SSPIF == 0);
	goto	l1434
	
l1435:	
	
l1434:	
	btfss	(99/8),(99)&7
	goto	u2541
	goto	u2540
u2541:
	goto	l1434
u2540:
	goto	l1437
	
l1436:	
	line	97
	
l1437:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_Wait
	__end_of_i2c_Wait:
;; =============== function _i2c_Wait ends ============

	signat	_i2c_Wait,88
	global	_i2c_restart
psect	text618,local,class=CODE,delta=2
global __ptext618
__ptext618:

;; *************** function _i2c_restart *****************
;; Defined at:
;;		line 27 in file "E:\PIC\test\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rtc_read
;; This function uses a non-reentrant model
;;
psect	text618
	file	"E:\PIC\test\i2c.c"
	line	27
	global	__size_of_i2c_restart
	__size_of_i2c_restart	equ	__end_of_i2c_restart-_i2c_restart
	
_i2c_restart:	
	opt	stack 6
; Regs used in _i2c_restart: []
	line	29
	
l5390:	
;i2c.c: 29: RSEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1161/8)^080h,(1161)&7
	line	30
;i2c.c: 30: while (SEN == 1);
	goto	l1401
	
l1402:	
	
l1401:	
	btfsc	(1160/8)^080h,(1160)&7
	goto	u2531
	goto	u2530
u2531:
	goto	l1401
u2530:
	goto	l1404
	
l1403:	
	line	32
	
l1404:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_restart
	__end_of_i2c_restart:
;; =============== function _i2c_restart ends ============

	signat	_i2c_restart,88
	global	_i2c_stop
psect	text619,local,class=CODE,delta=2
global __ptext619
__ptext619:

;; *************** function _i2c_stop *****************
;; Defined at:
;;		line 21 in file "E:\PIC\test\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rtc_read
;; This function uses a non-reentrant model
;;
psect	text619
	file	"E:\PIC\test\i2c.c"
	line	21
	global	__size_of_i2c_stop
	__size_of_i2c_stop	equ	__end_of_i2c_stop-_i2c_stop
	
_i2c_stop:	
	opt	stack 6
; Regs used in _i2c_stop: []
	line	22
	
l5388:	
;i2c.c: 22: PEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	23
;i2c.c: 23: while (PEN == 1);
	goto	l1395
	
l1396:	
	
l1395:	
	btfsc	(1162/8)^080h,(1162)&7
	goto	u2521
	goto	u2520
u2521:
	goto	l1395
u2520:
	goto	l1398
	
l1397:	
	line	24
	
l1398:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_stop
	__end_of_i2c_stop:
;; =============== function _i2c_stop ends ============

	signat	_i2c_stop,88
	global	_i2c_start
psect	text620,local,class=CODE,delta=2
global __ptext620
__ptext620:

;; *************** function _i2c_start *****************
;; Defined at:
;;		line 14 in file "E:\PIC\test\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rtc_read
;; This function uses a non-reentrant model
;;
psect	text620
	file	"E:\PIC\test\i2c.c"
	line	14
	global	__size_of_i2c_start
	__size_of_i2c_start	equ	__end_of_i2c_start-_i2c_start
	
_i2c_start:	
	opt	stack 6
; Regs used in _i2c_start: []
	line	15
	
l5386:	
;i2c.c: 15: SEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	16
;i2c.c: 16: while (SEN == 1);
	goto	l1389
	
l1390:	
	
l1389:	
	btfsc	(1160/8)^080h,(1160)&7
	goto	u2511
	goto	u2510
u2511:
	goto	l1389
u2510:
	goto	l1392
	
l1391:	
	line	18
	
l1392:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_start
	__end_of_i2c_start:
;; =============== function _i2c_start ends ============

	signat	_i2c_start,88
	global	_i2c_init
psect	text621,local,class=CODE,delta=2
global __ptext621
__ptext621:

;; *************** function _i2c_init *****************
;; Defined at:
;;		line 4 in file "E:\PIC\test\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text621
	file	"E:\PIC\test\i2c.c"
	line	4
	global	__size_of_i2c_init
	__size_of_i2c_init	equ	__end_of_i2c_init-_i2c_init
	
_i2c_init:	
	opt	stack 7
; Regs used in _i2c_init: [wreg]
	line	6
	
l5382:	
;i2c.c: 6: TRISC3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1083/8)^080h,(1083)&7
	line	7
;i2c.c: 7: TRISC4 = 1;
	bsf	(1084/8)^080h,(1084)&7
	line	9
	
l5384:	
;i2c.c: 9: SSPCON = 0X28;
	movlw	(028h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	11
;i2c.c: 11: SSPADD = 9;
	movlw	(09h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(147)^080h	;volatile
	line	12
	
l1386:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_init
	__end_of_i2c_init:
;; =============== function _i2c_init ends ============

	signat	_i2c_init,88
	global	_adc_init
psect	text622,local,class=CODE,delta=2
global __ptext622
__ptext622:

;; *************** function _adc_init *****************
;; Defined at:
;;		line 12 in file "E:\PIC\test\adc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text622
	file	"E:\PIC\test\adc.c"
	global	__size_of_adc_init
	__size_of_adc_init	equ	__end_of_adc_init-_adc_init
	
_adc_init:	
	opt	stack 7
; Regs used in _adc_init: [wreg]
	line	13
	
l5380:	
;adc.c: 13: ADCON0=0B01000000;
	movlw	(040h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	14
;adc.c: 14: ADCON1=(0B00000000|(1<<7))|0B1001;
	movlw	(089h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	15
	
l693:	
	return
	opt stack 0
GLOBAL	__end_of_adc_init
	__end_of_adc_init:
;; =============== function _adc_init ends ============

	signat	_adc_init,88
psect	text623,local,class=CODE,delta=2
global __ptext623
__ptext623:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
