opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

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
	FNCALL	_main,_lcd_goto
	FNCALL	_main,_lcd_puts
	FNCALL	_main,_read_keypad
	FNCALL	_main,_lcd_putch
	FNCALL	_main,_delay
	FNCALL	_lcd_goto,_send
	FNCALL	_lcd_putch,_send
	FNCALL	_lcd_puts,_send
	FNCALL	_lcd_init,_LCD_STROBE
	FNCALL	_lcd_init,_send
	FNCALL	_send,_LCD_STROBE
	FNCALL	_delay,_DelayMs
	FNROOT	_main
	global	_a
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\main.c"
	line	7

;initializer for _a
	retlw	0E1h
	retlw	010h

	global	_count
	global	_n
	global	_kpd_value
	global	_mode
	global	_PORTB
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
	global	_RD2
_RD2	set	66
	global	_RD3
_RD3	set	67
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_nRBPU
_nRBPU	set	1039
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
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_1:	
	retlw	78	;'N'
	retlw	85	;'U'
	retlw	77	;'M'
	retlw	66	;'B'
	retlw	69	;'E'
	retlw	82	;'R'
	retlw	32	;' '
	retlw	76	;'L'
	retlw	79	;'O'
	retlw	67	;'C'
	retlw	75	;'K'
	retlw	0
psect	strings
	
STR_2:	
	retlw	118	;'v'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	105	;'i'
	retlw	100	;'d'
	retlw	32	;' '
	retlw	112	;'p'
	retlw	97	;'a'
	retlw	115	;'s'
	retlw	115	;'s'
	retlw	0
psect	strings
	
STR_3:	
	retlw	119	;'w'
	retlw	114	;'r'
	retlw	111	;'o'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	32	;' '
	retlw	112	;'p'
	retlw	97	;'a'
	retlw	115	;'s'
	retlw	115	;'s'
	retlw	0
psect	strings
	file	"4x4 pts.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_mode:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_n:
       ds      2

_kpd_value:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_count:
       ds      2

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\main.c"
_a:
       ds      2

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_LCD_STROBE
?_LCD_STROBE:	; 0 bytes @ 0x0
	global	??_LCD_STROBE
??_LCD_STROBE:	; 0 bytes @ 0x0
	global	?_send
?_send:	; 0 bytes @ 0x0
	global	??_read_keypad
??_read_keypad:	; 0 bytes @ 0x0
	global	?_DelayMs
?_DelayMs:	; 0 bytes @ 0x0
	global	??_DelayMs
??_DelayMs:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_lcd_puts
?_lcd_puts:	; 0 bytes @ 0x0
	global	?_lcd_putch
?_lcd_putch:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_read_keypad
?_read_keypad:	; 1 bytes @ 0x0
	ds	1
	global	DelayMs@cnt
DelayMs@cnt:	; 1 bytes @ 0x1
	ds	1
	global	??_send
??_send:	; 0 bytes @ 0x2
	global	DelayMs@i
DelayMs@i:	; 1 bytes @ 0x2
	ds	1
	global	DelayMs@_dcnt
DelayMs@_dcnt:	; 1 bytes @ 0x3
	ds	1
	global	?_delay
?_delay:	; 0 bytes @ 0x4
	global	send@temp
send@temp:	; 1 bytes @ 0x4
	global	delay@dly
delay@dly:	; 2 bytes @ 0x4
	ds	1
	global	send@x
send@x:	; 1 bytes @ 0x5
	ds	1
	global	??_delay
??_delay:	; 0 bytes @ 0x6
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x6
	global	??_lcd_puts
??_lcd_puts:	; 0 bytes @ 0x6
	global	??_lcd_putch
??_lcd_putch:	; 0 bytes @ 0x6
	global	?_lcd_goto
?_lcd_goto:	; 0 bytes @ 0x6
	global	lcd_putch@c
lcd_putch@c:	; 1 bytes @ 0x6
	global	lcd_goto@pos
lcd_goto@pos:	; 1 bytes @ 0x6
	global	delay@dly1
delay@dly1:	; 2 bytes @ 0x6
	ds	1
	global	??_lcd_goto
??_lcd_goto:	; 0 bytes @ 0x7
	global	lcd_puts@s
lcd_puts@s:	; 1 bytes @ 0x7
	global	lcd_goto@line
lcd_goto@line:	; 1 bytes @ 0x7
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x8
	ds	1
;;Data sizes: Strings 34, constant 0, data 2, bss 5, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9      13
;; BANK0           80      0       4
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_puts@s	PTR const unsigned char  size(1) Largest target is 12
;;		 -> STR_3(CODE[11]), STR_2(CODE[11]), STR_1(CODE[12]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_init
;;   _main->_lcd_goto
;;   _main->_lcd_puts
;;   _main->_delay
;;   _lcd_goto->_send
;;   _lcd_putch->_send
;;   _lcd_puts->_send
;;   _lcd_init->_send
;;   _send->_LCD_STROBE
;;   _delay->_DelayMs
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0     949
;;                                              8 COMMON     1     1      0
;;                           _lcd_init
;;                           _lcd_goto
;;                           _lcd_puts
;;                        _read_keypad
;;                          _lcd_putch
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _lcd_goto                                             2     1      1     291
;;                                              6 COMMON     2     1      1
;;                               _send
;; ---------------------------------------------------------------------------------
;; (1) _lcd_putch                                            1     1      0     181
;;                                              6 COMMON     1     1      0
;;                               _send
;; ---------------------------------------------------------------------------------
;; (1) _lcd_puts                                             2     2      0     204
;;                                              6 COMMON     2     2      0
;;                               _send
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             2     2      0     159
;;                                              6 COMMON     2     2      0
;;                         _LCD_STROBE
;;                               _send
;; ---------------------------------------------------------------------------------
;; (2) _send                                                 4     4      0     159
;;                                              2 COMMON     4     4      0
;;                         _LCD_STROBE
;; ---------------------------------------------------------------------------------
;; (3) _LCD_STROBE                                           2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                4     2      2     114
;;                                              4 COMMON     4     2      2
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (1) _read_keypad                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _DelayMs                                              4     4      0      68
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _LCD_STROBE
;;     _send
;;       _LCD_STROBE
;;   _lcd_goto
;;     _send
;;       _LCD_STROBE
;;   _lcd_puts
;;     _send
;;       _LCD_STROBE
;;   _read_keypad
;;   _lcd_putch
;;     _send
;;       _LCD_STROBE
;;   _delay
;;     _DelayMs
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      14      12        0.0%
;;ABS                  0      0      11       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50      0       4       5        5.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      9       D       1       92.9%
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 11 in file "F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_init
;;		_lcd_goto
;;		_lcd_puts
;;		_read_keypad
;;		_lcd_putch
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\main.c"
	line	11
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	12
	
l4655:	
;main.c: 12: TRISB=0B00001111;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	13
;main.c: 13: PORTB=0XFF;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	14
	
l4657:	
;main.c: 14: nRBPU=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1039/8)^080h,(1039)&7
	line	15
	
l4659:	
;main.c: 15: lcd_init();
	fcall	_lcd_init
	goto	l4661
	line	16
;main.c: 16: while(1)
	
l1460:	
	line	18
	
l4661:	
;main.c: 17: {
;main.c: 18: lcd_goto(1,0);
	clrf	(?_lcd_goto)
	movlw	(01h)
	fcall	_lcd_goto
	line	19
	
l4663:	
;main.c: 19: lcd_puts("NUMBER LOCK");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_puts
	line	20
	
l4665:	
;main.c: 20: lcd_goto(2,0);
	clrf	(?_lcd_goto)
	movlw	(02h)
	fcall	_lcd_goto
	line	21
	
l4667:	
;main.c: 21: n=0;
	clrf	(_n)
	clrf	(_n+1)
	goto	l4669
	line	22
;main.c: 22: while(1)
	
l1461:	
	line	24
	
l4669:	
;main.c: 23: {
;main.c: 24: kpd_value=read_keypad();
	fcall	_read_keypad
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_kpd_value)
	line	26
	
l4671:	
;main.c: 26: if(kpd_value==0)
	movf	(_kpd_value),f
	skipz
	goto	u2811
	goto	u2810
u2811:
	goto	l4675
u2810:
	line	28
	
l4673:	
;main.c: 27: {
;main.c: 28: kpd_value=' ';
	movlw	(020h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_kpd_value)
	line	29
;main.c: 29: }
	goto	l4715
	line	30
	
l1462:	
	line	32
	
l4675:	
;main.c: 30: else
;main.c: 31: {
;main.c: 32: if(kpd_value=='1')
	movf	(_kpd_value),w
	xorlw	031h
	skipz
	goto	u2821
	goto	u2820
u2821:
	goto	l4683
u2820:
	line	34
	
l4677:	
;main.c: 33: {
;main.c: 34: n=n+1;
	movf	(_n),w
	addlw	low(01h)
	movwf	(_n)
	movf	(_n+1),w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+(_n)
	line	35
	
l4679:	
;main.c: 35: count++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_count),f
	skipnc
	incf	(_count+1),f
	movlw	high(01h)
	addwf	(_count+1),f
	line	36
	
l4681:	
;main.c: 36: lcd_putch(kpd_value);
	movf	(_kpd_value),w
	fcall	_lcd_putch
	line	37
;main.c: 37: }
	goto	l4711
	line	38
	
l1464:	
	
l4683:	
;main.c: 38: else if(kpd_value=='2')
	movf	(_kpd_value),w
	xorlw	032h
	skipz
	goto	u2831
	goto	u2830
u2831:
	goto	l4691
u2830:
	line	40
	
l4685:	
;main.c: 39: {
;main.c: 40: n=n+2*10;
	movf	(_n),w
	addlw	low(014h)
	movwf	(_n)
	movf	(_n+1),w
	skipnc
	addlw	1
	addlw	high(014h)
	movwf	1+(_n)
	line	41
	
l4687:	
;main.c: 41: count++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_count),f
	skipnc
	incf	(_count+1),f
	movlw	high(01h)
	addwf	(_count+1),f
	line	42
	
l4689:	
;main.c: 42: lcd_putch(kpd_value);
	movf	(_kpd_value),w
	fcall	_lcd_putch
	line	43
;main.c: 43: }
	goto	l4711
	line	44
	
l1466:	
	
l4691:	
;main.c: 44: else if(kpd_value=='3')
	movf	(_kpd_value),w
	xorlw	033h
	skipz
	goto	u2841
	goto	u2840
u2841:
	goto	l4699
u2840:
	line	46
	
l4693:	
;main.c: 45: {
;main.c: 46: n=n+3*100;
	movf	(_n),w
	addlw	low(012Ch)
	movwf	(_n)
	movf	(_n+1),w
	skipnc
	addlw	1
	addlw	high(012Ch)
	movwf	1+(_n)
	line	47
	
l4695:	
;main.c: 47: count++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_count),f
	skipnc
	incf	(_count+1),f
	movlw	high(01h)
	addwf	(_count+1),f
	line	48
	
l4697:	
;main.c: 48: lcd_putch(kpd_value);
	movf	(_kpd_value),w
	fcall	_lcd_putch
	line	49
;main.c: 49: }
	goto	l4711
	line	50
	
l1468:	
	
l4699:	
;main.c: 50: else if(kpd_value=='4')
	movf	(_kpd_value),w
	xorlw	034h
	skipz
	goto	u2851
	goto	u2850
u2851:
	goto	l4707
u2850:
	line	52
	
l4701:	
;main.c: 51: {
;main.c: 52: n=n+4*1000;
	movf	(_n),w
	addlw	low(0FA0h)
	movwf	(_n)
	movf	(_n+1),w
	skipnc
	addlw	1
	addlw	high(0FA0h)
	movwf	1+(_n)
	line	53
	
l4703:	
;main.c: 53: count++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_count),f
	skipnc
	incf	(_count+1),f
	movlw	high(01h)
	addwf	(_count+1),f
	line	54
	
l4705:	
;main.c: 54: lcd_putch(kpd_value);
	movf	(_kpd_value),w
	fcall	_lcd_putch
	line	55
;main.c: 55: }
	goto	l4711
	line	56
	
l1470:	
	line	58
	
l4707:	
;main.c: 56: else
;main.c: 57: {
;main.c: 58: lcd_putch(kpd_value);count++;
	movf	(_kpd_value),w
	fcall	_lcd_putch
	
l4709:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_count),f
	skipnc
	incf	(_count+1),f
	movlw	high(01h)
	addwf	(_count+1),f
	goto	l4711
	line	59
	
l1471:	
	goto	l4711
	
l1469:	
	goto	l4711
	
l1467:	
	goto	l4711
	
l1465:	
	line	60
	
l4711:	
;main.c: 59: }
;main.c: 60: if(count==3)
	movlw	03h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_count),w
	iorwf	(_count+1),w
	skipz
	goto	u2861
	goto	u2860
u2861:
	goto	l4715
u2860:
	goto	l4717
	line	62
	
l4713:	
;main.c: 61: {
;main.c: 62: break;
	goto	l4717
	line	63
	
l1472:	
	goto	l4715
	line	64
	
l1463:	
	line	65
	
l4715:	
;main.c: 63: }
;main.c: 64: }
;main.c: 65: delay(1);
	movlw	low(01h)
	movwf	(?_delay)
	movlw	high(01h)
	movwf	((?_delay))+1
	fcall	_delay
	goto	l4669
	line	66
	
l1474:	
	line	22
	goto	l4669
	
l1473:	
	line	67
	
l4717:	
;main.c: 66: }
;main.c: 67: if(a==n)
	movf	(_n+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_a+1),w
	skipz
	goto	u2875
	movf	(_n),w
	xorwf	(_a),w
u2875:

	skipz
	goto	u2871
	goto	u2870
u2871:
	goto	l4725
u2870:
	line	69
	
l4719:	
;main.c: 68: {
;main.c: 69: lcd_goto(2,0);
	clrf	(?_lcd_goto)
	movlw	(02h)
	fcall	_lcd_goto
	line	70
;main.c: 70: lcd_puts("valid pass");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_lcd_puts
	line	71
	
l4721:	
;main.c: 71: n=0;
	clrf	(_n)
	clrf	(_n+1)
	line	72
	
l4723:	
;main.c: 72: delay(1);
	movlw	low(01h)
	movwf	(?_delay)
	movlw	high(01h)
	movwf	((?_delay))+1
	fcall	_delay
	line	73
;main.c: 73: }
	goto	l4661
	line	74
	
l1475:	
	line	76
	
l4725:	
;main.c: 74: else
;main.c: 75: {
;main.c: 76: lcd_goto(2,0);
	clrf	(?_lcd_goto)
	movlw	(02h)
	fcall	_lcd_goto
	line	77
;main.c: 77: lcd_puts("wrong pass");
	movlw	((STR_3-__stringbase))&0ffh
	fcall	_lcd_puts
	line	78
	
l4727:	
;main.c: 78: n=0;
	clrf	(_n)
	clrf	(_n+1)
	goto	l4661
	line	79
	
l1476:	
	goto	l4661
	line	80
	
l1477:	
	line	16
	goto	l4661
	
l1478:	
	line	81
	
l1479:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_goto
psect	text243,local,class=CODE,delta=2
global __ptext243
__ptext243:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 77 in file "F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\lcd.c"
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
psect	text243
	file	"F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\lcd.c"
	line	77
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 5
; Regs used in _lcd_goto: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_goto@line stored from wreg
	movwf	(lcd_goto@line)
	line	78
	
l4639:	
;lcd.c: 78: switch(line)
	goto	l4653
	line	80
;lcd.c: 79: {
;lcd.c: 80: case 1:
	
l735:	
	line	81
;lcd.c: 81: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	82
	
l4641:	
;lcd.c: 82: send(0X80+pos);
	movf	(lcd_goto@pos),w
	addlw	080h
	fcall	_send
	line	83
;lcd.c: 83: break;
	goto	l741
	line	85
;lcd.c: 85: case 2:
	
l737:	
	line	86
;lcd.c: 86: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	87
	
l4643:	
;lcd.c: 87: send(0XC0+pos);
	movf	(lcd_goto@pos),w
	addlw	0C0h
	fcall	_send
	line	88
;lcd.c: 88: break;
	goto	l741
	line	90
;lcd.c: 90: case 3:
	
l738:	
	line	91
;lcd.c: 91: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	92
	
l4645:	
;lcd.c: 92: send(0X94+pos);
	movf	(lcd_goto@pos),w
	addlw	094h
	fcall	_send
	line	93
;lcd.c: 93: break;
	goto	l741
	line	95
;lcd.c: 95: case 4:
	
l739:	
	line	96
;lcd.c: 96: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	97
	
l4647:	
;lcd.c: 97: send(0XD4+pos);
	movf	(lcd_goto@pos),w
	addlw	0D4h
	fcall	_send
	line	98
;lcd.c: 98: break;
	goto	l741
	line	100
;lcd.c: 100: default:
	
l740:	
	line	101
;lcd.c: 101: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	102
	
l4649:	
;lcd.c: 102: send(0XD4+pos);
	movf	(lcd_goto@pos),w
	addlw	0D4h
	fcall	_send
	line	103
;lcd.c: 103: break;
	goto	l741
	line	104
	
l4651:	
;lcd.c: 104: }
	goto	l741
	line	78
	
l734:	
	
l4653:	
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
	goto	l735
	xorlw	2^1	; case 2
	skipnz
	goto	l737
	xorlw	3^2	; case 3
	skipnz
	goto	l738
	xorlw	4^3	; case 4
	skipnz
	goto	l739
	goto	l740
	opt asmopt_on

	line	104
	
l736:	
	line	105
	
l741:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto
	__end_of_lcd_goto:
;; =============== function _lcd_goto ends ============

	signat	_lcd_goto,8312
	global	_lcd_putch
psect	text244,local,class=CODE,delta=2
global __ptext244
__ptext244:

;; *************** function _lcd_putch *****************
;; Defined at:
;;		line 72 in file "F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\lcd.c"
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
psect	text244
	file	"F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\lcd.c"
	line	72
	global	__size_of_lcd_putch
	__size_of_lcd_putch	equ	__end_of_lcd_putch-_lcd_putch
	
_lcd_putch:	
	opt	stack 5
; Regs used in _lcd_putch: [wreg+status,2+status,0+pclath+cstack]
;lcd_putch@c stored from wreg
	movwf	(lcd_putch@c)
	line	73
	
l4635:	
;lcd.c: 73: mode = 1;
	bsf	(_mode/8),(_mode)&7
	line	74
	
l4637:	
;lcd.c: 74: send( c );
	movf	(lcd_putch@c),w
	fcall	_send
	line	75
	
l731:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_putch
	__end_of_lcd_putch:
;; =============== function _lcd_putch ends ============

	signat	_lcd_putch,4216
	global	_lcd_puts
psect	text245,local,class=CODE,delta=2
global __ptext245
__ptext245:

;; *************** function _lcd_puts *****************
;; Defined at:
;;		line 60 in file "F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR const unsigned char 
;;		 -> STR_3(11), STR_2(11), STR_1(12), 
;; Auto vars:     Size  Location     Type
;;  s               1    7[COMMON] PTR const unsigned char 
;;		 -> STR_3(11), STR_2(11), STR_1(12), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_send
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text245
	file	"F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\lcd.c"
	line	60
	global	__size_of_lcd_puts
	__size_of_lcd_puts	equ	__end_of_lcd_puts-_lcd_puts
	
_lcd_puts:	
	opt	stack 5
; Regs used in _lcd_puts: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_puts@s stored from wreg
	movwf	(lcd_puts@s)
	line	61
	
l4627:	
;lcd.c: 61: mode = 1;
	bsf	(_mode/8),(_mode)&7
	line	62
;lcd.c: 62: while(*s)
	goto	l4633
	
l723:	
	line	63
	
l4629:	
;lcd.c: 63: send(*s++);
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringdir
	fcall	_send
	
l4631:	
	movlw	(01h)
	movwf	(??_lcd_puts+0)+0
	movf	(??_lcd_puts+0)+0,w
	addwf	(lcd_puts@s),f
	goto	l4633
	
l722:	
	line	62
	
l4633:	
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2801
	goto	u2800
u2801:
	goto	l4629
u2800:
	goto	l725
	
l724:	
	line	64
	
l725:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_puts
	__end_of_lcd_puts:
;; =============== function _lcd_puts ends ============

	signat	_lcd_puts,4216
	global	_lcd_init
psect	text246,local,class=CODE,delta=2
global __ptext246
__ptext246:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 13 in file "F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\lcd.c"
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
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_LCD_STROBE
;;		_send
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text246
	file	"F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\lcd.c"
	line	13
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 5
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	14
	
l4613:	
;lcd.c: 14: TRISD=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	15
	
l4615:	
;lcd.c: 15: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_lcd_init+0)+0+1),f
	movlw	221
movwf	((??_lcd_init+0)+0),f
u2887:
	decfsz	((??_lcd_init+0)+0),f
	goto	u2887
	decfsz	((??_lcd_init+0)+0+1),f
	goto	u2887
	nop2
opt asmopt_on

	line	16
	
l4617:	
;lcd.c: 16: RD2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	17
	
l4619:	
;lcd.c: 17: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	18
	
l4621:	
;lcd.c: 18: RD3=0;
	bcf	(67/8),(67)&7
	line	20
;lcd.c: 20: PORTD=(PORTD&0X0F)|0x30;
	movf	(8),w
	andlw	0Fh
	iorlw	030h
	movwf	(8)	;volatile
	line	21
	
l4623:	
;lcd.c: 21: LCD_STROBE();
	fcall	_LCD_STROBE
	line	22
	
l4625:	
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
	
l709:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_send
psect	text247,local,class=CODE,delta=2
global __ptext247
__ptext247:

;; *************** function _send *****************
;; Defined at:
;;		line 38 in file "F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\lcd.c"
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
;;		_lcd_puts
;;		_lcd_putch
;;		_lcd_goto
;;		_lcd_clear
;;		_curser
;;		_display_shift
;;		_curser_shift_left
;;		_curser_shift_right
;; This function uses a non-reentrant model
;;
psect	text247
	file	"F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\lcd.c"
	line	38
	global	__size_of_send
	__size_of_send	equ	__end_of_send-_send
	
_send:	
	opt	stack 5
; Regs used in _send: [wreg+status,2+status,0+pclath+cstack]
;send@x stored from wreg
	line	40
	movwf	(send@x)
	
l4587:	
;lcd.c: 39: char temp;
;lcd.c: 40: temp=x;
	movf	(send@x),w
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@temp)
	line	41
	
l4589:	
;lcd.c: 41: x=x&0XF0;
	movf	(send@x),w
	andlw	0F0h
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	42
	
l4591:	
;lcd.c: 42: PORTD=(PORTD&0X0F)|x;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w
	andlw	0Fh
	iorwf	(send@x),w
	movwf	(8)	;volatile
	line	43
	
l4593:	
;lcd.c: 43: if (mode==0)
	btfsc	(_mode/8),(_mode)&7
	goto	u2771
	goto	u2770
u2771:
	goto	l715
u2770:
	line	44
	
l4595:	
;lcd.c: 44: RD2=0;
	bcf	(66/8),(66)&7
	goto	l4597
	line	45
	
l715:	
	line	46
;lcd.c: 45: else
;lcd.c: 46: RD2=1;
	bsf	(66/8),(66)&7
	goto	l4597
	
l716:	
	line	47
	
l4597:	
;lcd.c: 47: LCD_STROBE();
	fcall	_LCD_STROBE
	line	48
	
l4599:	
;lcd.c: 48: x=temp;
	movf	(send@temp),w
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	49
	
l4601:	
;lcd.c: 49: x=x<<4;
	movf	(send@x),w
	movwf	(??_send+0)+0
	movlw	(04h)-1
u2785:
	clrc
	rlf	(??_send+0)+0,f
	addlw	-1
	skipz
	goto	u2785
	clrc
	rlf	(??_send+0)+0,w
	movwf	(??_send+1)+0
	movf	(??_send+1)+0,w
	movwf	(send@x)
	line	50
	
l4603:	
;lcd.c: 50: x=x&0XF0;
	movf	(send@x),w
	andlw	0F0h
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	51
	
l4605:	
;lcd.c: 51: PORTD=(PORTD&0X0F)|x;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w
	andlw	0Fh
	iorwf	(send@x),w
	movwf	(8)	;volatile
	line	52
	
l4607:	
;lcd.c: 52: if(mode==0)
	btfsc	(_mode/8),(_mode)&7
	goto	u2791
	goto	u2790
u2791:
	goto	l717
u2790:
	line	53
	
l4609:	
;lcd.c: 53: RD2=0;
	bcf	(66/8),(66)&7
	goto	l4611
	line	54
	
l717:	
	line	55
;lcd.c: 54: else
;lcd.c: 55: RD2=1;
	bsf	(66/8),(66)&7
	goto	l4611
	
l718:	
	line	56
	
l4611:	
;lcd.c: 56: LCD_STROBE();
	fcall	_LCD_STROBE
	line	57
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_send
	__end_of_send:
;; =============== function _send ends ============

	signat	_send,4216
	global	_LCD_STROBE
psect	text248,local,class=CODE,delta=2
global __ptext248
__ptext248:

;; *************** function _LCD_STROBE *****************
;; Defined at:
;;		line 32 in file "F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\lcd.c"
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
psect	text248
	file	"F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\lcd.c"
	line	32
	global	__size_of_LCD_STROBE
	__size_of_LCD_STROBE	equ	__end_of_LCD_STROBE-_LCD_STROBE
	
_LCD_STROBE:	
	opt	stack 5
; Regs used in _LCD_STROBE: [wreg]
	line	33
	
l4581:	
;lcd.c: 33: RD3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(67/8),(67)&7
	line	34
	
l4583:	
;lcd.c: 34: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_LCD_STROBE+0)+0+1),f
	movlw	151
movwf	((??_LCD_STROBE+0)+0),f
u2897:
	decfsz	((??_LCD_STROBE+0)+0),f
	goto	u2897
	decfsz	((??_LCD_STROBE+0)+0+1),f
	goto	u2897
	nop2
opt asmopt_on

	line	35
	
l4585:	
;lcd.c: 35: RD3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(67/8),(67)&7
	line	36
	
l712:	
	return
	opt stack 0
GLOBAL	__end_of_LCD_STROBE
	__end_of_LCD_STROBE:
;; =============== function _LCD_STROBE ends ============

	signat	_LCD_STROBE,88
	global	_delay
psect	text249,local,class=CODE,delta=2
global __ptext249
__ptext249:

;; *************** function _delay *****************
;; Defined at:
;;		line 31 in file "F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\delay.c"
;; Parameters:    Size  Location     Type
;;  dly             2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  dly1            2    6[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayMs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text249
	file	"F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\delay.c"
	line	31
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 6
; Regs used in _delay: [wreg+status,2+status,0+pclath+cstack]
	line	33
	
l4573:	
;delay.c: 32: unsigned int dly1;
;delay.c: 33: for(dly1=0;dly1<dly;dly1++)
	clrf	(delay@dly1)
	clrf	(delay@dly1+1)
	goto	l4579
	line	34
	
l14:	
	line	35
	
l4575:	
;delay.c: 34: {
;delay.c: 35: DelayMs(98);
	movlw	(062h)
	fcall	_DelayMs
	line	33
	
l4577:	
	movlw	low(01h)
	addwf	(delay@dly1),f
	skipnc
	incf	(delay@dly1+1),f
	movlw	high(01h)
	addwf	(delay@dly1+1),f
	goto	l4579
	
l13:	
	
l4579:	
	movf	(delay@dly+1),w
	subwf	(delay@dly1+1),w
	skipz
	goto	u2765
	movf	(delay@dly),w
	subwf	(delay@dly1),w
u2765:
	skipc
	goto	u2761
	goto	u2760
u2761:
	goto	l4575
u2760:
	goto	l16
	
l15:	
	line	37
	
l16:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_read_keypad
psect	text250,local,class=CODE,delta=2
global __ptext250
__ptext250:

;; *************** function _read_keypad *****************
;; Defined at:
;;		line 6 in file "F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\MatrixKeypad.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
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
psect	text250
	file	"F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\MatrixKeypad.c"
	line	6
	global	__size_of_read_keypad
	__size_of_read_keypad	equ	__end_of_read_keypad-_read_keypad
	
_read_keypad:	
	opt	stack 7
; Regs used in _read_keypad: [wreg]
	line	7
	
l4447:	
;MatrixKeypad.c: 7: RB7=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	8
;MatrixKeypad.c: 8: if(RB3==0) {RB7=1; return '7';}
	btfsc	(51/8),(51)&7
	goto	u2601
	goto	u2600
u2601:
	goto	l2164
u2600:
	
l4449:	
	bsf	(55/8),(55)&7
	
l4451:	
	movlw	(037h)
	goto	l2165
	
l4453:	
	goto	l2165
	
l4455:	
	goto	l2166
	line	9
	
l2164:	
;MatrixKeypad.c: 9: else if(RB2==0) {RB7=1; return '8';}
	btfsc	(50/8),(50)&7
	goto	u2611
	goto	u2610
u2611:
	goto	l2167
u2610:
	
l4457:	
	bsf	(55/8),(55)&7
	
l4459:	
	movlw	(038h)
	goto	l2165
	
l4461:	
	goto	l2165
	
l4463:	
	goto	l2166
	line	10
	
l2167:	
;MatrixKeypad.c: 10: else if(RB1==0) {RB7=1; return '9';}
	btfsc	(49/8),(49)&7
	goto	u2621
	goto	u2620
u2621:
	goto	l2169
u2620:
	
l4465:	
	bsf	(55/8),(55)&7
	
l4467:	
	movlw	(039h)
	goto	l2165
	
l4469:	
	goto	l2165
	
l4471:	
	goto	l2166
	line	11
	
l2169:	
;MatrixKeypad.c: 11: else if(RB0==0) {RB7=1; return 'A';}
	btfsc	(48/8),(48)&7
	goto	u2631
	goto	u2630
u2631:
	goto	l2166
u2630:
	
l4473:	
	bsf	(55/8),(55)&7
	
l4475:	
	movlw	(041h)
	goto	l2165
	
l4477:	
	goto	l2165
	
l2171:	
	goto	l2166
	line	12
	
l2170:	
	goto	l2166
	
l2168:	
	
l2166:	
;MatrixKeypad.c: 12: RB7=1;
	bsf	(55/8),(55)&7
	line	14
;MatrixKeypad.c: 14: RB6=0;
	bcf	(54/8),(54)&7
	line	15
;MatrixKeypad.c: 15: if(RB3==0) {RB6=1; return '4';}
	btfsc	(51/8),(51)&7
	goto	u2641
	goto	u2640
u2641:
	goto	l2172
u2640:
	
l4479:	
	bsf	(54/8),(54)&7
	
l4481:	
	movlw	(034h)
	goto	l2165
	
l4483:	
	goto	l2165
	
l4485:	
	goto	l2173
	line	16
	
l2172:	
;MatrixKeypad.c: 16: else if(RB2==0) {RB6=1; return '5';}
	btfsc	(50/8),(50)&7
	goto	u2651
	goto	u2650
u2651:
	goto	l2174
u2650:
	
l4487:	
	bsf	(54/8),(54)&7
	
l4489:	
	movlw	(035h)
	goto	l2165
	
l4491:	
	goto	l2165
	
l4493:	
	goto	l2173
	line	17
	
l2174:	
;MatrixKeypad.c: 17: else if(RB1==0) {RB6=1; return '6';}
	btfsc	(49/8),(49)&7
	goto	u2661
	goto	u2660
u2661:
	goto	l2176
u2660:
	
l4495:	
	bsf	(54/8),(54)&7
	
l4497:	
	movlw	(036h)
	goto	l2165
	
l4499:	
	goto	l2165
	
l4501:	
	goto	l2173
	line	18
	
l2176:	
;MatrixKeypad.c: 18: else if(RB0==0) {RB6=1; return 'B';}
	btfsc	(48/8),(48)&7
	goto	u2671
	goto	u2670
u2671:
	goto	l2173
u2670:
	
l4503:	
	bsf	(54/8),(54)&7
	
l4505:	
	movlw	(042h)
	goto	l2165
	
l4507:	
	goto	l2165
	
l2178:	
	goto	l2173
	line	19
	
l2177:	
	goto	l2173
	
l2175:	
	
l2173:	
;MatrixKeypad.c: 19: RB6=1;
	bsf	(54/8),(54)&7
	line	21
;MatrixKeypad.c: 21: RB5=0;
	bcf	(53/8),(53)&7
	line	22
;MatrixKeypad.c: 22: if(RB3==0) {RB5=1; return '1';}
	btfsc	(51/8),(51)&7
	goto	u2681
	goto	u2680
u2681:
	goto	l2179
u2680:
	
l4509:	
	bsf	(53/8),(53)&7
	
l4511:	
	movlw	(031h)
	goto	l2165
	
l4513:	
	goto	l2165
	
l4515:	
	goto	l2180
	line	23
	
l2179:	
;MatrixKeypad.c: 23: else if(RB2==0) {RB5=1; return '2';}
	btfsc	(50/8),(50)&7
	goto	u2691
	goto	u2690
u2691:
	goto	l2181
u2690:
	
l4517:	
	bsf	(53/8),(53)&7
	
l4519:	
	movlw	(032h)
	goto	l2165
	
l4521:	
	goto	l2165
	
l4523:	
	goto	l2180
	line	24
	
l2181:	
;MatrixKeypad.c: 24: else if(RB1==0) {RB5=1; return '3';}
	btfsc	(49/8),(49)&7
	goto	u2701
	goto	u2700
u2701:
	goto	l2183
u2700:
	
l4525:	
	bsf	(53/8),(53)&7
	
l4527:	
	movlw	(033h)
	goto	l2165
	
l4529:	
	goto	l2165
	
l4531:	
	goto	l2180
	line	25
	
l2183:	
;MatrixKeypad.c: 25: else if(RB0==0) {RB5=1; return 'C';}
	btfsc	(48/8),(48)&7
	goto	u2711
	goto	u2710
u2711:
	goto	l2180
u2710:
	
l4533:	
	bsf	(53/8),(53)&7
	
l4535:	
	movlw	(043h)
	goto	l2165
	
l4537:	
	goto	l2165
	
l2185:	
	goto	l2180
	line	26
	
l2184:	
	goto	l2180
	
l2182:	
	
l2180:	
;MatrixKeypad.c: 26: RB5=1;
	bsf	(53/8),(53)&7
	line	28
;MatrixKeypad.c: 28: RB4=0;
	bcf	(52/8),(52)&7
	line	29
;MatrixKeypad.c: 29: if(RB3==0) {RB4=1; return '.';}
	btfsc	(51/8),(51)&7
	goto	u2721
	goto	u2720
u2721:
	goto	l2186
u2720:
	
l4539:	
	bsf	(52/8),(52)&7
	
l4541:	
	movlw	(02Eh)
	goto	l2165
	
l4543:	
	goto	l2165
	
l4545:	
	goto	l2187
	line	30
	
l2186:	
;MatrixKeypad.c: 30: else if(RB2==0) {RB4=1; return '0';}
	btfsc	(50/8),(50)&7
	goto	u2731
	goto	u2730
u2731:
	goto	l2188
u2730:
	
l4547:	
	bsf	(52/8),(52)&7
	
l4549:	
	movlw	(030h)
	goto	l2165
	
l4551:	
	goto	l2165
	
l4553:	
	goto	l2187
	line	31
	
l2188:	
;MatrixKeypad.c: 31: else if(RB1==0) {RB4=1; return '#';}
	btfsc	(49/8),(49)&7
	goto	u2741
	goto	u2740
u2741:
	goto	l2190
u2740:
	
l4555:	
	bsf	(52/8),(52)&7
	
l4557:	
	movlw	(023h)
	goto	l2165
	
l4559:	
	goto	l2165
	
l4561:	
	goto	l2187
	line	32
	
l2190:	
;MatrixKeypad.c: 32: else if(RB0==0) {RB4=1; return 'D';}
	btfsc	(48/8),(48)&7
	goto	u2751
	goto	u2750
u2751:
	goto	l2187
u2750:
	
l4563:	
	bsf	(52/8),(52)&7
	
l4565:	
	movlw	(044h)
	goto	l2165
	
l4567:	
	goto	l2165
	
l2192:	
	goto	l2187
	line	33
	
l2191:	
	goto	l2187
	
l2189:	
	
l2187:	
;MatrixKeypad.c: 33: RB4=1;
	bsf	(52/8),(52)&7
	line	35
	
l4569:	
;MatrixKeypad.c: 35: return 0;
	movlw	(0)
	goto	l2165
	
l4571:	
	line	36
	
l2165:	
	return
	opt stack 0
GLOBAL	__end_of_read_keypad
	__end_of_read_keypad:
;; =============== function _read_keypad ends ============

	signat	_read_keypad,89
	global	_DelayMs
psect	text251,local,class=CODE,delta=2
global __ptext251
__ptext251:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 12 in file "F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\delay.c"
;; Parameters:    Size  Location     Type
;;  cnt             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cnt             1    1[COMMON] unsigned char 
;;  _dcnt           1    3[COMMON] unsigned char 
;;  i               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_delay
;; This function uses a non-reentrant model
;;
psect	text251
	file	"F:\Prolific\pic_s\pic_pgm\19  4x4 kbd 4_numberlock\delay.c"
	line	12
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 6
; Regs used in _DelayMs: [wreg+status,2+status,0]
;DelayMs@cnt stored from wreg
	movwf	(DelayMs@cnt)
	line	21
;delay.c: 20: unsigned char i;
;delay.c: 21: do {
	
l3:	
	line	22
	
l4413:	
;delay.c: 22: i = 4;
	movlw	(04h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(DelayMs@i)
	line	23
;delay.c: 23: do {
	
l4:	
	line	24
;delay.c: 24: { unsigned char _dcnt; _dcnt = (250)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(053h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(DelayMs@_dcnt)
	goto	l4415
	
l6:	
	goto	l4415
	
l5:	
	
l4415:	
	movlw	low(01h)
	subwf	(DelayMs@_dcnt),f
	btfss	status,2
	goto	u2551
	goto	u2550
u2551:
	goto	l4415
u2550:
	goto	l4417
	
l7:	
	line	25
	
l4417:	
;delay.c: 25: } while(--i);
	movlw	low(01h)
	subwf	(DelayMs@i),f
	btfss	status,2
	goto	u2561
	goto	u2560
u2561:
	goto	l4
u2560:
	goto	l4419
	
l8:	
	line	26
	
l4419:	
;delay.c: 26: } while(--cnt);
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u2571
	goto	u2570
u2571:
	goto	l3
u2570:
	goto	l10
	
l9:	
	line	28
	
l10:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
psect	text252,local,class=CODE,delta=2
global __ptext252
__ptext252:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
