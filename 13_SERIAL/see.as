opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6446"

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
	FNCALL	_main,_sci_init
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_clear
	FNCALL	_main,_lcd_puts
	FNCALL	_main,_sci_puts
	FNCALL	_main,_sci_getch
	FNCALL	_main,_sci_putch
	FNCALL	_main,_lcd_goto
	FNCALL	_main,_lcd_putch
	FNCALL	_lcd_goto,_send
	FNCALL	_lcd_putch,_send
	FNCALL	_lcd_clear,_send
	FNCALL	_lcd_puts,_send
	FNCALL	_lcd_init,_LCD_STROBE
	FNCALL	_lcd_init,_send
	FNCALL	_send,_LCD_STROBE
	FNCALL	_sci_puts,_sci_putch
	FNROOT	_main
	global	_mode
	global	_PORTD
psect	text150,local,class=CODE,delta=2
global __ptext150
__ptext150:
_PORTD	set	8
	global	_RCREG
_RCREG	set	26
	global	_TXREG
_TXREG	set	25
	global	_CREN
_CREN	set	196
	global	_OERR
_OERR	set	193
	global	_RCIF
_RCIF	set	101
	global	_RD2
_RD2	set	66
	global	_RD3
_RD3	set	67
	global	_RX9
_RX9	set	198
	global	_SPEN
_SPEN	set	199
	global	_TXIF
_TXIF	set	100
	global	_SPBRG
_SPBRG	set	153
	global	_TRISD
_TRISD	set	136
	global	_BRGH
_BRGH	set	1218
	global	_RCIE
_RCIE	set	1125
	global	_SYNC
_SYNC	set	1220
	global	_TX9
_TX9	set	1222
	global	_TXEN
_TXEN	set	1221
	global	_TXIE
_TXIE	set	1124
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
	retlw	115	;'s'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	105	;'i'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	32	;' '
	retlw	100	;'d'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	97	;'a'
	retlw	0
psect	strings
	
STR_2:	
	retlw	115	;'s'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	105	;'i'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	0
psect	strings
	file	"see.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_mode:
       ds      1

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
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
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_lcd_puts
?_lcd_puts:	; 0 bytes @ 0x0
	global	?_lcd_clear
?_lcd_clear:	; 0 bytes @ 0x0
	global	?_lcd_putch
?_lcd_putch:	; 0 bytes @ 0x0
	global	?_sci_init
?_sci_init:	; 0 bytes @ 0x0
	global	?_sci_putch
?_sci_putch:	; 0 bytes @ 0x0
	global	??_sci_putch
??_sci_putch:	; 0 bytes @ 0x0
	global	?_sci_puts
?_sci_puts:	; 0 bytes @ 0x0
	global	??_sci_getch
??_sci_getch:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_sci_getch
?_sci_getch:	; 1 bytes @ 0x0
	global	sci_putch@byte
sci_putch@byte:	; 1 bytes @ 0x0
	global	sci_init@bd_rt
sci_init@bd_rt:	; 2 bytes @ 0x0
	ds	1
	global	??_sci_puts
??_sci_puts:	; 0 bytes @ 0x1
	ds	1
	global	??_send
??_send:	; 0 bytes @ 0x2
	global	??_sci_init
??_sci_init:	; 0 bytes @ 0x2
	ds	1
	global	sci_puts@aa
sci_puts@aa:	; 1 bytes @ 0x3
	ds	1
	global	send@temp
send@temp:	; 1 bytes @ 0x4
	ds	1
	global	send@x
send@x:	; 1 bytes @ 0x5
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x6
	global	??_lcd_puts
??_lcd_puts:	; 0 bytes @ 0x6
	global	??_lcd_clear
??_lcd_clear:	; 0 bytes @ 0x6
	global	??_lcd_putch
??_lcd_putch:	; 0 bytes @ 0x6
	global	?_lcd_goto
?_lcd_goto:	; 0 bytes @ 0x6
	global	lcd_putch@c
lcd_putch@c:	; 1 bytes @ 0x6
	global	lcd_goto@pos
lcd_goto@pos:	; 1 bytes @ 0x6
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
	global	main@x
main@x:	; 1 bytes @ 0x9
	ds	1
;;Data sizes: Strings 19, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      11
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; sci_puts@aa	PTR const unsigned char  size(1) Largest target is 7
;;		 -> STR_2(CODE[7]), 
;;
;; lcd_puts@s	PTR const unsigned char  size(1) Largest target is 12
;;		 -> STR_1(CODE[12]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_init
;;   _main->_lcd_puts
;;   _main->_lcd_goto
;;   _lcd_goto->_send
;;   _lcd_putch->_send
;;   _lcd_clear->_send
;;   _lcd_puts->_send
;;   _lcd_init->_send
;;   _send->_LCD_STROBE
;;   _sci_puts->_sci_putch
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
;; (0) _main                                                 2     2      0     765
;;                                              8 COMMON     2     2      0
;;                           _sci_init
;;                           _lcd_init
;;                          _lcd_clear
;;                           _lcd_puts
;;                           _sci_puts
;;                          _sci_getch
;;                          _sci_putch
;;                           _lcd_goto
;;                          _lcd_putch
;; ---------------------------------------------------------------------------------
;; (1) _lcd_goto                                             2     1      1     195
;;                                              6 COMMON     2     1      1
;;                               _send
;; ---------------------------------------------------------------------------------
;; (1) _lcd_putch                                            1     1      0     120
;;                                              6 COMMON     1     1      0
;;                               _send
;; ---------------------------------------------------------------------------------
;; (1) _lcd_clear                                            0     0      0     105
;;                               _send
;; ---------------------------------------------------------------------------------
;; (1) _lcd_puts                                             2     2      0     135
;;                                              6 COMMON     2     2      0
;;                               _send
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             2     2      0     105
;;                                              6 COMMON     2     2      0
;;                         _LCD_STROBE
;;                               _send
;; ---------------------------------------------------------------------------------
;; (2) _send                                                 4     4      0     105
;;                                              2 COMMON     4     4      0
;;                         _LCD_STROBE
;; ---------------------------------------------------------------------------------
;; (1) _sci_puts                                             3     3      0      45
;;                                              1 COMMON     3     3      0
;;                          _sci_putch
;; ---------------------------------------------------------------------------------
;; (3) _LCD_STROBE                                           2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _sci_getch                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _sci_putch                                            1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _sci_init                                             2     0      2      15
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _sci_init
;;   _lcd_init
;;     _LCD_STROBE
;;     _send
;;       _LCD_STROBE
;;   _lcd_clear
;;     _send
;;       _LCD_STROBE
;;   _lcd_puts
;;     _send
;;       _LCD_STROBE
;;   _sci_puts
;;     _sci_putch
;;   _sci_getch
;;   _sci_putch
;;   _lcd_goto
;;     _send
;;       _LCD_STROBE
;;   _lcd_putch
;;     _send
;;       _LCD_STROBE
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      A       B       1       78.6%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0       B       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       E      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 6 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  x               1    9[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_sci_init
;;		_lcd_init
;;		_lcd_clear
;;		_lcd_puts
;;		_sci_puts
;;		_sci_getch
;;		_sci_putch
;;		_lcd_goto
;;		_lcd_putch
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\main.c"
	line	6
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	7
	
l3100:	
;main.c: 7: sci_init(25);
	movlw	low(019h)
	movwf	(?_sci_init)
	movlw	high(019h)
	movwf	((?_sci_init))+1
	fcall	_sci_init
	line	8
;main.c: 8: lcd_init();
	fcall	_lcd_init
	line	9
;main.c: 9: lcd_clear();
	fcall	_lcd_clear
	line	10
	
l3102:	
;main.c: 10: lcd_puts("serial data");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_puts
	line	11
	
l3104:	
;main.c: 11: sci_puts("serial");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_sci_puts
	line	12
;main.c: 12: while(1)
	
l1786:	
	line	14
	
l3106:	
;main.c: 13: {
;main.c: 14: char x=sci_getch();
	fcall	_sci_getch
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@x)
	line	15
	
l3108:	
;main.c: 15: sci_putch(x);
	movf	(main@x),w
	fcall	_sci_putch
	line	16
	
l3110:	
;main.c: 16: lcd_goto(2,0);
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_lcd_goto)
	movlw	(02h)
	fcall	_lcd_goto
	line	17
	
l3112:	
;main.c: 17: lcd_putch(x);
	movf	(main@x),w
	fcall	_lcd_putch
	line	18
	
l1787:	
	line	12
	goto	l1786
	
l1788:	
	line	19
	
l1789:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_goto
psect	text151,local,class=CODE,delta=2
global __ptext151
__ptext151:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 77 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\lcd.c"
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
psect	text151
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\lcd.c"
	line	77
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 7
; Regs used in _lcd_goto: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_goto@line stored from wreg
	movwf	(lcd_goto@line)
	line	78
	
l3084:	
;lcd.c: 78: switch(line)
	goto	l608
	line	80
;lcd.c: 79: {
;lcd.c: 80: case 1:
	
l609:	
	line	81
;lcd.c: 81: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	82
	
l3086:	
;lcd.c: 82: send(0X80+pos);
	movf	(lcd_goto@pos),w
	addlw	080h
	fcall	_send
	line	83
;lcd.c: 83: break;
	goto	l610
	line	85
;lcd.c: 85: case 2:
	
l611:	
	line	86
;lcd.c: 86: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	87
	
l3088:	
;lcd.c: 87: send(0XC0+pos);
	movf	(lcd_goto@pos),w
	addlw	0C0h
	fcall	_send
	line	88
;lcd.c: 88: break;
	goto	l610
	line	90
;lcd.c: 90: case 3:
	
l612:	
	line	91
;lcd.c: 91: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	92
	
l3090:	
;lcd.c: 92: send(0X94+pos);
	movf	(lcd_goto@pos),w
	addlw	094h
	fcall	_send
	line	93
;lcd.c: 93: break;
	goto	l610
	line	95
;lcd.c: 95: case 4:
	
l613:	
	line	96
;lcd.c: 96: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	97
	
l3092:	
;lcd.c: 97: send(0XD4+pos);
	movf	(lcd_goto@pos),w
	addlw	0D4h
	fcall	_send
	line	98
;lcd.c: 98: break;
	goto	l610
	line	100
;lcd.c: 100: default:
	
l614:	
	line	101
;lcd.c: 101: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	102
	
l3094:	
;lcd.c: 102: send(0XD4+pos);
	movf	(lcd_goto@pos),w
	addlw	0D4h
	fcall	_send
	line	103
;lcd.c: 103: break;
	goto	l610
	line	104
	
l3096:	
;lcd.c: 104: }
	goto	l610
	line	78
	
l608:	
	
l3098:	
	movf	(lcd_goto@line),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 1 to 4
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    13     7 (average)
; direct_byte    34    22 (fixed)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l609
	xorlw	2^1	; case 2
	skipnz
	goto	l611
	xorlw	3^2	; case 3
	skipnz
	goto	l612
	xorlw	4^3	; case 4
	skipnz
	goto	l613
	goto	l614

	line	104
	
l610:	
	line	105
	
l615:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto
	__end_of_lcd_goto:
;; =============== function _lcd_goto ends ============

	signat	_lcd_goto,8312
	global	_lcd_putch
psect	text152,local,class=CODE,delta=2
global __ptext152
__ptext152:

;; *************** function _lcd_putch *****************
;; Defined at:
;;		line 72 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\lcd.c"
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
psect	text152
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\lcd.c"
	line	72
	global	__size_of_lcd_putch
	__size_of_lcd_putch	equ	__end_of_lcd_putch-_lcd_putch
	
_lcd_putch:	
	opt	stack 7
; Regs used in _lcd_putch: [wreg+status,2+status,0+pclath+cstack]
;lcd_putch@c stored from wreg
	movwf	(lcd_putch@c)
	line	73
	
l3080:	
;lcd.c: 73: mode = 1;
	bsf	(_mode/8),(_mode)&7
	line	74
	
l3082:	
;lcd.c: 74: send( c );
	movf	(lcd_putch@c),w
	fcall	_send
	line	75
	
l605:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_putch
	__end_of_lcd_putch:
;; =============== function _lcd_putch ends ============

	signat	_lcd_putch,4216
	global	_lcd_clear
psect	text153,local,class=CODE,delta=2
global __ptext153
__ptext153:

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 67 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\lcd.c"
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
psect	text153
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\lcd.c"
	line	67
	global	__size_of_lcd_clear
	__size_of_lcd_clear	equ	__end_of_lcd_clear-_lcd_clear
	
_lcd_clear:	
	opt	stack 7
; Regs used in _lcd_clear: [wreg+status,2+status,0+pclath+cstack]
	line	68
	
l3076:	
;lcd.c: 68: mode = 0;
	bcf	(_mode/8),(_mode)&7
	line	69
	
l3078:	
;lcd.c: 69: send(0x01);
	movlw	(01h)
	fcall	_send
	line	70
	
l602:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
;; =============== function _lcd_clear ends ============

	signat	_lcd_clear,88
	global	_lcd_puts
psect	text154,local,class=CODE,delta=2
global __ptext154
__ptext154:

;; *************** function _lcd_puts *****************
;; Defined at:
;;		line 60 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR const unsigned char 
;;		 -> STR_1(12), 
;; Auto vars:     Size  Location     Type
;;  s               1    7[COMMON] PTR const unsigned char 
;;		 -> STR_1(12), 
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
psect	text154
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\lcd.c"
	line	60
	global	__size_of_lcd_puts
	__size_of_lcd_puts	equ	__end_of_lcd_puts-_lcd_puts
	
_lcd_puts:	
	opt	stack 7
; Regs used in _lcd_puts: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_puts@s stored from wreg
	movwf	(lcd_puts@s)
	line	61
	
l3068:	
;lcd.c: 61: mode = 1;
	bsf	(_mode/8),(_mode)&7
	line	62
;lcd.c: 62: while(*s)
	goto	l596
	
l597:	
	line	63
	
l3070:	
;lcd.c: 63: send(*s++);
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringdir
	fcall	_send
	
l3072:	
	movlw	(01h)
	movwf	(??_lcd_puts+0)+0
	movf	(??_lcd_puts+0)+0,w
	addwf	(lcd_puts@s),f
	
l596:	
	line	62
	
l3074:	
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2271
	goto	u2270
u2271:
	goto	l597
u2270:
	
l598:	
	line	64
	
l599:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_puts
	__end_of_lcd_puts:
;; =============== function _lcd_puts ends ============

	signat	_lcd_puts,4216
	global	_lcd_init
psect	text155,local,class=CODE,delta=2
global __ptext155
__ptext155:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 13 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\lcd.c"
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
psect	text155
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\lcd.c"
	line	13
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 7
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	14
	
l3054:	
;lcd.c: 14: TRISD=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	15
	
l3056:	
;lcd.c: 15: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_lcd_init+0)+0+1),f
	movlw	221
movwf	((??_lcd_init+0)+0),f
u2287:
	decfsz	((??_lcd_init+0)+0),f
	goto	u2287
	decfsz	((??_lcd_init+0)+0+1),f
	goto	u2287
	nop2
opt asmopt_on

	line	16
	
l3058:	
;lcd.c: 16: RD2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	17
	
l3060:	
;lcd.c: 17: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	18
	
l3062:	
;lcd.c: 18: RD3=0;
	bcf	(67/8),(67)&7
	line	20
;lcd.c: 20: PORTD=(PORTD&0X0F)|0x30;
	movf	(8),w
	andlw	0Fh
	iorlw	030h
	movwf	(8)	;volatile
	line	21
	
l3064:	
;lcd.c: 21: LCD_STROBE();
	fcall	_LCD_STROBE
	line	22
	
l3066:	
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
	
l583:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_send
psect	text156,local,class=CODE,delta=2
global __ptext156
__ptext156:

;; *************** function _send *****************
;; Defined at:
;;		line 38 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\lcd.c"
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
;;		_lcd_clear
;;		_lcd_putch
;;		_lcd_goto
;;		_curser
;;		_display_shift
;;		_curser_shift_left
;;		_curser_shift_right
;; This function uses a non-reentrant model
;;
psect	text156
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\lcd.c"
	line	38
	global	__size_of_send
	__size_of_send	equ	__end_of_send-_send
	
_send:	
	opt	stack 6
; Regs used in _send: [wreg+status,2+status,0+pclath+cstack]
;send@x stored from wreg
	line	40
	movwf	(send@x)
	
l3028:	
;lcd.c: 39: char temp;
;lcd.c: 40: temp=x;
	movf	(send@x),w
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@temp)
	line	41
	
l3030:	
;lcd.c: 41: x=x&0XF0;
	movf	(send@x),w
	andlw	0F0h
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	42
	
l3032:	
;lcd.c: 42: PORTD=(PORTD&0X0F)|x;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w
	andlw	0Fh
	iorwf	(send@x),w
	movwf	(8)	;volatile
	line	43
	
l3034:	
;lcd.c: 43: if (mode==0)
	btfsc	(_mode/8),(_mode)&7
	goto	u2241
	goto	u2240
u2241:
	goto	l589
u2240:
	line	44
	
l3036:	
;lcd.c: 44: RD2=0;
	bcf	(66/8),(66)&7
	goto	l590
	line	45
	
l589:	
	line	46
;lcd.c: 45: else
;lcd.c: 46: RD2=1;
	bsf	(66/8),(66)&7
	
l590:	
	line	47
	
l3038:	
;lcd.c: 47: LCD_STROBE();
	fcall	_LCD_STROBE
	line	48
	
l3040:	
;lcd.c: 48: x=temp;
	movf	(send@temp),w
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	49
	
l3042:	
;lcd.c: 49: x=x<<4;
	movf	(send@x),w
	movwf	(??_send+0)+0
	movlw	(04h)-1
u2255:
	clrc
	rlf	(??_send+0)+0,f
	addlw	-1
	skipz
	goto	u2255
	clrc
	rlf	(??_send+0)+0,w
	movwf	(??_send+1)+0
	movf	(??_send+1)+0,w
	movwf	(send@x)
	line	50
	
l3044:	
;lcd.c: 50: x=x&0XF0;
	movf	(send@x),w
	andlw	0F0h
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	51
	
l3046:	
;lcd.c: 51: PORTD=(PORTD&0X0F)|x;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w
	andlw	0Fh
	iorwf	(send@x),w
	movwf	(8)	;volatile
	line	52
	
l3048:	
;lcd.c: 52: if(mode==0)
	btfsc	(_mode/8),(_mode)&7
	goto	u2261
	goto	u2260
u2261:
	goto	l591
u2260:
	line	53
	
l3050:	
;lcd.c: 53: RD2=0;
	bcf	(66/8),(66)&7
	goto	l592
	line	54
	
l591:	
	line	55
;lcd.c: 54: else
;lcd.c: 55: RD2=1;
	bsf	(66/8),(66)&7
	
l592:	
	line	56
	
l3052:	
;lcd.c: 56: LCD_STROBE();
	fcall	_LCD_STROBE
	line	57
	
l593:	
	return
	opt stack 0
GLOBAL	__end_of_send
	__end_of_send:
;; =============== function _send ends ============

	signat	_send,4216
	global	_sci_puts
psect	text157,local,class=CODE,delta=2
global __ptext157
__ptext157:

;; *************** function _sci_puts *****************
;; Defined at:
;;		line 34 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\sci.c"
;; Parameters:    Size  Location     Type
;;  aa              1    wreg     PTR const unsigned char 
;;		 -> STR_2(7), 
;; Auto vars:     Size  Location     Type
;;  aa              1    3[COMMON] PTR const unsigned char 
;;		 -> STR_2(7), 
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
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_sci_putch
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text157
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\sci.c"
	line	34
	global	__size_of_sci_puts
	__size_of_sci_puts	equ	__end_of_sci_puts-_sci_puts
	
_sci_puts:	
	opt	stack 7
; Regs used in _sci_puts: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;sci_puts@aa stored from wreg
	movwf	(sci_puts@aa)
	line	35
	
l3018:	
;sci.c: 35: while(*aa)
	goto	l1199
	
l1200:	
	line	37
	
l3020:	
;sci.c: 36: {
;sci.c: 37: sci_putch(*aa++);
	movf	(sci_puts@aa),w
	movwf	fsr0
	fcall	stringdir
	fcall	_sci_putch
	
l3022:	
	movlw	(01h)
	movwf	(??_sci_puts+0)+0
	movf	(??_sci_puts+0)+0,w
	addwf	(sci_puts@aa),f
	line	38
	
l3024:	
;sci.c: 38: _delay((unsigned long)((15)*(4000000/4000.0)));
	opt asmopt_off
movlw	20
movwf	((??_sci_puts+0)+0+1),f
	movlw	121
movwf	((??_sci_puts+0)+0),f
u2297:
	decfsz	((??_sci_puts+0)+0),f
	goto	u2297
	decfsz	((??_sci_puts+0)+0+1),f
	goto	u2297
	nop2
opt asmopt_on

	line	39
	
l1199:	
	line	35
	
l3026:	
	movf	(sci_puts@aa),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2231
	goto	u2230
u2231:
	goto	l1200
u2230:
	
l1201:	
	line	40
	
l1202:	
	return
	opt stack 0
GLOBAL	__end_of_sci_puts
	__end_of_sci_puts:
;; =============== function _sci_puts ends ============

	signat	_sci_puts,4216
	global	_LCD_STROBE
psect	text158,local,class=CODE,delta=2
global __ptext158
__ptext158:

;; *************** function _LCD_STROBE *****************
;; Defined at:
;;		line 32 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\lcd.c"
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
psect	text158
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\lcd.c"
	line	32
	global	__size_of_LCD_STROBE
	__size_of_LCD_STROBE	equ	__end_of_LCD_STROBE-_LCD_STROBE
	
_LCD_STROBE:	
	opt	stack 5
; Regs used in _LCD_STROBE: [wreg]
	line	33
	
l3012:	
;lcd.c: 33: RD3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(67/8),(67)&7
	line	34
	
l3014:	
;lcd.c: 34: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_LCD_STROBE+0)+0+1),f
	movlw	151
movwf	((??_LCD_STROBE+0)+0),f
u2307:
	decfsz	((??_LCD_STROBE+0)+0),f
	goto	u2307
	decfsz	((??_LCD_STROBE+0)+0+1),f
	goto	u2307
	nop2
opt asmopt_on

	line	35
	
l3016:	
;lcd.c: 35: RD3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(67/8),(67)&7
	line	36
	
l586:	
	return
	opt stack 0
GLOBAL	__end_of_LCD_STROBE
	__end_of_LCD_STROBE:
;; =============== function _LCD_STROBE ends ============

	signat	_LCD_STROBE,88
	global	_sci_getch
psect	text159,local,class=CODE,delta=2
global __ptext159
__ptext159:

;; *************** function _sci_getch *****************
;; Defined at:
;;		line 43 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\sci.c"
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
psect	text159
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\sci.c"
	line	43
	global	__size_of_sci_getch
	__size_of_sci_getch	equ	__end_of_sci_getch-_sci_getch
	
_sci_getch:	
	opt	stack 7
; Regs used in _sci_getch: [wreg]
	line	44
	
l2218:	
;sci.c: 44: while(!RCIF)
	goto	l1205
	
l1206:	
	line	45
;sci.c: 45: continue;
	
l1205:	
	line	44
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u81
	goto	u80
u81:
	goto	l1206
u80:
	
l1207:	
	line	46
;sci.c: 46: if(OERR==1)
	btfss	(193/8),(193)&7
	goto	u91
	goto	u90
u91:
	goto	l1208
u90:
	line	48
	
l2220:	
;sci.c: 47: {
;sci.c: 48: CREN=0;
	bcf	(196/8),(196)&7
	line	49
;sci.c: 49: CREN=1;
	bsf	(196/8),(196)&7
	line	50
	
l1208:	
	line	51
	
l2222:	
;sci.c: 50: }
;sci.c: 51: return RCREG;
	movf	(26),w	;volatile
	
l2224:	
	line	52
	
l1209:	
	return
	opt stack 0
GLOBAL	__end_of_sci_getch
	__end_of_sci_getch:
;; =============== function _sci_getch ends ============

	signat	_sci_getch,89
	global	_sci_putch
psect	text160,local,class=CODE,delta=2
global __ptext160
__ptext160:

;; *************** function _sci_putch *****************
;; Defined at:
;;		line 27 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\sci.c"
;; Parameters:    Size  Location     Type
;;  byte            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  byte            1    0[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sci_puts
;;		_main
;; This function uses a non-reentrant model
;;
psect	text160
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\sci.c"
	line	27
	global	__size_of_sci_putch
	__size_of_sci_putch	equ	__end_of_sci_putch-_sci_putch
	
_sci_putch:	
	opt	stack 7
; Regs used in _sci_putch: [wreg]
;sci_putch@byte stored from wreg
	movwf	(sci_putch@byte)
	line	28
	
l2214:	
;sci.c: 28: while(!TXIF)
	goto	l1193
	
l1194:	
	line	29
;sci.c: 29: continue;
	
l1193:	
	line	28
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(100/8),(100)&7
	goto	u71
	goto	u70
u71:
	goto	l1194
u70:
	
l1195:	
	line	30
	
l2216:	
;sci.c: 30: TXREG=byte;
	movf	(sci_putch@byte),w
	movwf	(25)	;volatile
	line	31
	
l1196:	
	return
	opt stack 0
GLOBAL	__end_of_sci_putch
	__end_of_sci_putch:
;; =============== function _sci_putch ends ============

	signat	_sci_putch,4216
	global	_sci_init
psect	text161,local,class=CODE,delta=2
global __ptext161
__ptext161:

;; *************** function _sci_init *****************
;; Defined at:
;;		line 11 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\sci.c"
;; Parameters:    Size  Location     Type
;;  bd_rt           2    0[COMMON] unsigned int 
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
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text161
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\13_SERIAL\sci.c"
	line	11
	global	__size_of_sci_init
	__size_of_sci_init	equ	__end_of_sci_init-_sci_init
	
_sci_init:	
	opt	stack 7
; Regs used in _sci_init: [wreg]
	line	12
	
l2200:	
;sci.c: 12: TX9=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1222/8)^080h,(1222)&7
	line	13
;sci.c: 13: SYNC=0;
	bcf	(1220/8)^080h,(1220)&7
	line	14
;sci.c: 14: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	15
;sci.c: 15: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	16
;sci.c: 16: RX9=0;
	bcf	(198/8),(198)&7
	line	17
;sci.c: 17: CREN=1;
	bsf	(196/8),(196)&7
	line	18
	
l2202:	
;sci.c: 18: SPBRG=bd_rt;
	movf	(sci_init@bd_rt),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	19
	
l2204:	
;sci.c: 19: RCIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(101/8),(101)&7
	line	20
	
l2206:	
;sci.c: 20: TXEN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1221/8)^080h,(1221)&7
	line	21
	
l2208:	
;sci.c: 21: TXIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(100/8),(100)&7
	line	22
	
l2210:	
;sci.c: 22: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	23
	
l2212:	
;sci.c: 23: RCIE=0;
	bcf	(1125/8)^080h,(1125)&7
	line	24
	
l1190:	
	return
	opt stack 0
GLOBAL	__end_of_sci_init
	__end_of_sci_init:
;; =============== function _sci_init ends ============

	signat	_sci_init,4216
psect	text162,local,class=CODE,delta=2
global __ptext162
__ptext162:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
