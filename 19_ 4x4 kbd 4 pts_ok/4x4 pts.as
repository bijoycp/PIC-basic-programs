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
	FNCALL	_main,_DelayMs
	FNCALL	_main,_lcd_clear
	FNCALL	_lcd_goto,_send
	FNCALL	_lcd_putch,_send
	FNCALL	_lcd_clear,_send
	FNCALL	_lcd_puts,_send
	FNCALL	_lcd_init,_LCD_STROBE
	FNCALL	_lcd_init,_send
	FNCALL	_send,_LCD_STROBE
	FNROOT	_main
	global	_kpd_value
	global	_mode
	global	_PORTB
psect	text147,local,class=CODE,delta=2
global __ptext147
__ptext147:
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
	retlw	112	;'p'
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	115	;'s'
	retlw	115	;'s'
	retlw	32	;' '
	retlw	116	;'t'
	retlw	104	;'h'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	107	;'k'
	retlw	101	;'e'
	retlw	121	;'y'
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
_kpd_value:
       ds      1

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
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
	global	?_lcd_clear
?_lcd_clear:	; 0 bytes @ 0x0
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
;;Data sizes: Strings 14, constant 0, data 0, bss 1, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9      11
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_puts@s	PTR const unsigned char  size(1) Largest target is 14
;;		 -> STR_1(CODE[14]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_init
;;   _main->_lcd_goto
;;   _main->_lcd_puts
;;   _lcd_goto->_send
;;   _lcd_putch->_send
;;   _lcd_clear->_send
;;   _lcd_puts->_send
;;   _lcd_init->_send
;;   _send->_LCD_STROBE
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
;; (0) _main                                                 1     1      0     705
;;                                              8 COMMON     1     1      0
;;                           _lcd_init
;;                           _lcd_goto
;;                           _lcd_puts
;;                        _read_keypad
;;                          _lcd_putch
;;                            _DelayMs
;;                          _lcd_clear
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
;; (3) _LCD_STROBE                                           2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _read_keypad                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _DelayMs                                              4     4      0      45
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
;;   _DelayMs
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
;;COMMON               E      9       B       1       78.6%
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
;;		line 9 in file "F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\main.c"
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
;;		_DelayMs
;;		_lcd_clear
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\main.c"
	line	9
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	10
	
l4320:	
;main.c: 10: TRISB=0B00001111;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	11
;main.c: 11: PORTB=0XFF;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	12
	
l4322:	
;main.c: 12: nRBPU=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1039/8)^080h,(1039)&7
	line	13
	
l4324:	
;main.c: 13: lcd_init();
	fcall	_lcd_init
	goto	l4326
	line	14
;main.c: 14: while(1)
	
l1456:	
	line	16
	
l4326:	
;main.c: 15: {
;main.c: 16: lcd_goto(1,0);
	clrf	(?_lcd_goto)
	movlw	(01h)
	fcall	_lcd_goto
	line	17
	
l4328:	
;main.c: 17: lcd_puts("press the key");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_puts
	line	18
	
l4330:	
;main.c: 18: kpd_value=read_keypad();
	fcall	_read_keypad
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_kpd_value)
	line	19
	
l4332:	
;main.c: 19: if(kpd_value==0)
	movf	(_kpd_value),f
	skipz
	goto	u2481
	goto	u2480
u2481:
	goto	l4336
u2480:
	line	21
	
l4334:	
;main.c: 20: {
;main.c: 21: kpd_value=' ';
	movlw	(020h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_kpd_value)
	goto	l4336
	line	22
	
l1457:	
	line	23
	
l4336:	
;main.c: 22: }
;main.c: 23: lcd_goto(2,0);
	clrf	(?_lcd_goto)
	movlw	(02h)
	fcall	_lcd_goto
	line	24
	
l4338:	
;main.c: 24: lcd_putch(kpd_value);
	movf	(_kpd_value),w
	fcall	_lcd_putch
	line	25
	
l4340:	
;main.c: 25: DelayMs(100);
	movlw	(064h)
	fcall	_DelayMs
	line	26
	
l4342:	
;main.c: 26: lcd_clear();
	fcall	_lcd_clear
	goto	l4326
	line	27
	
l1458:	
	line	14
	goto	l4326
	
l1459:	
	line	28
	
l1460:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_goto
psect	text148,local,class=CODE,delta=2
global __ptext148
__ptext148:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 77 in file "F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\lcd.c"
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
psect	text148
	file	"F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\lcd.c"
	line	77
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 5
; Regs used in _lcd_goto: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_goto@line stored from wreg
	movwf	(lcd_goto@line)
	line	78
	
l4304:	
;lcd.c: 78: switch(line)
	goto	l4318
	line	80
;lcd.c: 79: {
;lcd.c: 80: case 1:
	
l735:	
	line	81
;lcd.c: 81: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	82
	
l4306:	
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
	
l4308:	
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
	
l4310:	
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
	
l4312:	
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
	
l4314:	
;lcd.c: 102: send(0XD4+pos);
	movf	(lcd_goto@pos),w
	addlw	0D4h
	fcall	_send
	line	103
;lcd.c: 103: break;
	goto	l741
	line	104
	
l4316:	
;lcd.c: 104: }
	goto	l741
	line	78
	
l734:	
	
l4318:	
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
psect	text149,local,class=CODE,delta=2
global __ptext149
__ptext149:

;; *************** function _lcd_putch *****************
;; Defined at:
;;		line 72 in file "F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\lcd.c"
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
psect	text149
	file	"F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\lcd.c"
	line	72
	global	__size_of_lcd_putch
	__size_of_lcd_putch	equ	__end_of_lcd_putch-_lcd_putch
	
_lcd_putch:	
	opt	stack 5
; Regs used in _lcd_putch: [wreg+status,2+status,0+pclath+cstack]
;lcd_putch@c stored from wreg
	movwf	(lcd_putch@c)
	line	73
	
l4300:	
;lcd.c: 73: mode = 1;
	bsf	(_mode/8),(_mode)&7
	line	74
	
l4302:	
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
	global	_lcd_clear
psect	text150,local,class=CODE,delta=2
global __ptext150
__ptext150:

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 67 in file "F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\lcd.c"
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
psect	text150
	file	"F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\lcd.c"
	line	67
	global	__size_of_lcd_clear
	__size_of_lcd_clear	equ	__end_of_lcd_clear-_lcd_clear
	
_lcd_clear:	
	opt	stack 5
; Regs used in _lcd_clear: [wreg+status,2+status,0+pclath+cstack]
	line	68
	
l4296:	
;lcd.c: 68: mode = 0;
	bcf	(_mode/8),(_mode)&7
	line	69
	
l4298:	
;lcd.c: 69: send(0x01);
	movlw	(01h)
	fcall	_send
	line	70
	
l728:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
;; =============== function _lcd_clear ends ============

	signat	_lcd_clear,88
	global	_lcd_puts
psect	text151,local,class=CODE,delta=2
global __ptext151
__ptext151:

;; *************** function _lcd_puts *****************
;; Defined at:
;;		line 60 in file "F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR const unsigned char 
;;		 -> STR_1(14), 
;; Auto vars:     Size  Location     Type
;;  s               1    7[COMMON] PTR const unsigned char 
;;		 -> STR_1(14), 
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
psect	text151
	file	"F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\lcd.c"
	line	60
	global	__size_of_lcd_puts
	__size_of_lcd_puts	equ	__end_of_lcd_puts-_lcd_puts
	
_lcd_puts:	
	opt	stack 5
; Regs used in _lcd_puts: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_puts@s stored from wreg
	movwf	(lcd_puts@s)
	line	61
	
l4288:	
;lcd.c: 61: mode = 1;
	bsf	(_mode/8),(_mode)&7
	line	62
;lcd.c: 62: while(*s)
	goto	l4294
	
l723:	
	line	63
	
l4290:	
;lcd.c: 63: send(*s++);
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringdir
	fcall	_send
	
l4292:	
	movlw	(01h)
	movwf	(??_lcd_puts+0)+0
	movf	(??_lcd_puts+0)+0,w
	addwf	(lcd_puts@s),f
	goto	l4294
	
l722:	
	line	62
	
l4294:	
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2471
	goto	u2470
u2471:
	goto	l4290
u2470:
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
psect	text152,local,class=CODE,delta=2
global __ptext152
__ptext152:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 13 in file "F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\lcd.c"
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
psect	text152
	file	"F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\lcd.c"
	line	13
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 5
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	14
	
l4274:	
;lcd.c: 14: TRISD=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	15
	
l4276:	
;lcd.c: 15: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_lcd_init+0)+0+1),f
	movlw	221
movwf	((??_lcd_init+0)+0),f
u2497:
	decfsz	((??_lcd_init+0)+0),f
	goto	u2497
	decfsz	((??_lcd_init+0)+0+1),f
	goto	u2497
	nop2
opt asmopt_on

	line	16
	
l4278:	
;lcd.c: 16: RD2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	17
	
l4280:	
;lcd.c: 17: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	18
	
l4282:	
;lcd.c: 18: RD3=0;
	bcf	(67/8),(67)&7
	line	20
;lcd.c: 20: PORTD=(PORTD&0X0F)|0x30;
	movf	(8),w
	andlw	0Fh
	iorlw	030h
	movwf	(8)	;volatile
	line	21
	
l4284:	
;lcd.c: 21: LCD_STROBE();
	fcall	_LCD_STROBE
	line	22
	
l4286:	
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
psect	text153,local,class=CODE,delta=2
global __ptext153
__ptext153:

;; *************** function _send *****************
;; Defined at:
;;		line 38 in file "F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\lcd.c"
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
psect	text153
	file	"F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\lcd.c"
	line	38
	global	__size_of_send
	__size_of_send	equ	__end_of_send-_send
	
_send:	
	opt	stack 5
; Regs used in _send: [wreg+status,2+status,0+pclath+cstack]
;send@x stored from wreg
	line	40
	movwf	(send@x)
	
l4248:	
;lcd.c: 39: char temp;
;lcd.c: 40: temp=x;
	movf	(send@x),w
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@temp)
	line	41
	
l4250:	
;lcd.c: 41: x=x&0XF0;
	movf	(send@x),w
	andlw	0F0h
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	42
	
l4252:	
;lcd.c: 42: PORTD=(PORTD&0X0F)|x;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w
	andlw	0Fh
	iorwf	(send@x),w
	movwf	(8)	;volatile
	line	43
	
l4254:	
;lcd.c: 43: if (mode==0)
	btfsc	(_mode/8),(_mode)&7
	goto	u2441
	goto	u2440
u2441:
	goto	l715
u2440:
	line	44
	
l4256:	
;lcd.c: 44: RD2=0;
	bcf	(66/8),(66)&7
	goto	l4258
	line	45
	
l715:	
	line	46
;lcd.c: 45: else
;lcd.c: 46: RD2=1;
	bsf	(66/8),(66)&7
	goto	l4258
	
l716:	
	line	47
	
l4258:	
;lcd.c: 47: LCD_STROBE();
	fcall	_LCD_STROBE
	line	48
	
l4260:	
;lcd.c: 48: x=temp;
	movf	(send@temp),w
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	49
	
l4262:	
;lcd.c: 49: x=x<<4;
	movf	(send@x),w
	movwf	(??_send+0)+0
	movlw	(04h)-1
u2455:
	clrc
	rlf	(??_send+0)+0,f
	addlw	-1
	skipz
	goto	u2455
	clrc
	rlf	(??_send+0)+0,w
	movwf	(??_send+1)+0
	movf	(??_send+1)+0,w
	movwf	(send@x)
	line	50
	
l4264:	
;lcd.c: 50: x=x&0XF0;
	movf	(send@x),w
	andlw	0F0h
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	51
	
l4266:	
;lcd.c: 51: PORTD=(PORTD&0X0F)|x;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w
	andlw	0Fh
	iorwf	(send@x),w
	movwf	(8)	;volatile
	line	52
	
l4268:	
;lcd.c: 52: if(mode==0)
	btfsc	(_mode/8),(_mode)&7
	goto	u2461
	goto	u2460
u2461:
	goto	l717
u2460:
	line	53
	
l4270:	
;lcd.c: 53: RD2=0;
	bcf	(66/8),(66)&7
	goto	l4272
	line	54
	
l717:	
	line	55
;lcd.c: 54: else
;lcd.c: 55: RD2=1;
	bsf	(66/8),(66)&7
	goto	l4272
	
l718:	
	line	56
	
l4272:	
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
psect	text154,local,class=CODE,delta=2
global __ptext154
__ptext154:

;; *************** function _LCD_STROBE *****************
;; Defined at:
;;		line 32 in file "F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\lcd.c"
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
psect	text154
	file	"F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\lcd.c"
	line	32
	global	__size_of_LCD_STROBE
	__size_of_LCD_STROBE	equ	__end_of_LCD_STROBE-_LCD_STROBE
	
_LCD_STROBE:	
	opt	stack 5
; Regs used in _LCD_STROBE: [wreg]
	line	33
	
l4242:	
;lcd.c: 33: RD3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(67/8),(67)&7
	line	34
	
l4244:	
;lcd.c: 34: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_LCD_STROBE+0)+0+1),f
	movlw	151
movwf	((??_LCD_STROBE+0)+0),f
u2507:
	decfsz	((??_LCD_STROBE+0)+0),f
	goto	u2507
	decfsz	((??_LCD_STROBE+0)+0+1),f
	goto	u2507
	nop2
opt asmopt_on

	line	35
	
l4246:	
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
	global	_read_keypad
psect	text155,local,class=CODE,delta=2
global __ptext155
__ptext155:

;; *************** function _read_keypad *****************
;; Defined at:
;;		line 6 in file "F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\MatrixKeypad.c"
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
psect	text155
	file	"F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\MatrixKeypad.c"
	line	6
	global	__size_of_read_keypad
	__size_of_read_keypad	equ	__end_of_read_keypad-_read_keypad
	
_read_keypad:	
	opt	stack 7
; Regs used in _read_keypad: [wreg]
	line	7
	
l3258:	
;MatrixKeypad.c: 7: RB7=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	8
;MatrixKeypad.c: 8: if(RB3==0) {RB7=1; return '7';}
	btfsc	(51/8),(51)&7
	goto	u71
	goto	u70
u71:
	goto	l2145
u70:
	
l3260:	
	bsf	(55/8),(55)&7
	
l3262:	
	movlw	(037h)
	goto	l2146
	
l3264:	
	goto	l2146
	
l3266:	
	goto	l2147
	line	9
	
l2145:	
;MatrixKeypad.c: 9: else if(RB2==0) {RB7=1; return '8';}
	btfsc	(50/8),(50)&7
	goto	u81
	goto	u80
u81:
	goto	l2148
u80:
	
l3268:	
	bsf	(55/8),(55)&7
	
l3270:	
	movlw	(038h)
	goto	l2146
	
l3272:	
	goto	l2146
	
l3274:	
	goto	l2147
	line	10
	
l2148:	
;MatrixKeypad.c: 10: else if(RB1==0) {RB7=1; return '9';}
	btfsc	(49/8),(49)&7
	goto	u91
	goto	u90
u91:
	goto	l2150
u90:
	
l3276:	
	bsf	(55/8),(55)&7
	
l3278:	
	movlw	(039h)
	goto	l2146
	
l3280:	
	goto	l2146
	
l3282:	
	goto	l2147
	line	11
	
l2150:	
;MatrixKeypad.c: 11: else if(RB0==0) {RB7=1; return 'A';}
	btfsc	(48/8),(48)&7
	goto	u101
	goto	u100
u101:
	goto	l2147
u100:
	
l3284:	
	bsf	(55/8),(55)&7
	
l3286:	
	movlw	(041h)
	goto	l2146
	
l3288:	
	goto	l2146
	
l2152:	
	goto	l2147
	line	12
	
l2151:	
	goto	l2147
	
l2149:	
	
l2147:	
;MatrixKeypad.c: 12: RB7=1;
	bsf	(55/8),(55)&7
	line	14
;MatrixKeypad.c: 14: RB6=0;
	bcf	(54/8),(54)&7
	line	15
;MatrixKeypad.c: 15: if(RB3==0) {RB6=1; return '4';}
	btfsc	(51/8),(51)&7
	goto	u111
	goto	u110
u111:
	goto	l2153
u110:
	
l3290:	
	bsf	(54/8),(54)&7
	
l3292:	
	movlw	(034h)
	goto	l2146
	
l3294:	
	goto	l2146
	
l3296:	
	goto	l2154
	line	16
	
l2153:	
;MatrixKeypad.c: 16: else if(RB2==0) {RB6=1; return '5';}
	btfsc	(50/8),(50)&7
	goto	u121
	goto	u120
u121:
	goto	l2155
u120:
	
l3298:	
	bsf	(54/8),(54)&7
	
l3300:	
	movlw	(035h)
	goto	l2146
	
l3302:	
	goto	l2146
	
l3304:	
	goto	l2154
	line	17
	
l2155:	
;MatrixKeypad.c: 17: else if(RB1==0) {RB6=1; return '6';}
	btfsc	(49/8),(49)&7
	goto	u131
	goto	u130
u131:
	goto	l2157
u130:
	
l3306:	
	bsf	(54/8),(54)&7
	
l3308:	
	movlw	(036h)
	goto	l2146
	
l3310:	
	goto	l2146
	
l3312:	
	goto	l2154
	line	18
	
l2157:	
;MatrixKeypad.c: 18: else if(RB0==0) {RB6=1; return 'B';}
	btfsc	(48/8),(48)&7
	goto	u141
	goto	u140
u141:
	goto	l2154
u140:
	
l3314:	
	bsf	(54/8),(54)&7
	
l3316:	
	movlw	(042h)
	goto	l2146
	
l3318:	
	goto	l2146
	
l2159:	
	goto	l2154
	line	19
	
l2158:	
	goto	l2154
	
l2156:	
	
l2154:	
;MatrixKeypad.c: 19: RB6=1;
	bsf	(54/8),(54)&7
	line	21
;MatrixKeypad.c: 21: RB5=0;
	bcf	(53/8),(53)&7
	line	22
;MatrixKeypad.c: 22: if(RB3==0) {RB5=1; return '1';}
	btfsc	(51/8),(51)&7
	goto	u151
	goto	u150
u151:
	goto	l2160
u150:
	
l3320:	
	bsf	(53/8),(53)&7
	
l3322:	
	movlw	(031h)
	goto	l2146
	
l3324:	
	goto	l2146
	
l3326:	
	goto	l2161
	line	23
	
l2160:	
;MatrixKeypad.c: 23: else if(RB2==0) {RB5=1; return '2';}
	btfsc	(50/8),(50)&7
	goto	u161
	goto	u160
u161:
	goto	l2162
u160:
	
l3328:	
	bsf	(53/8),(53)&7
	
l3330:	
	movlw	(032h)
	goto	l2146
	
l3332:	
	goto	l2146
	
l3334:	
	goto	l2161
	line	24
	
l2162:	
;MatrixKeypad.c: 24: else if(RB1==0) {RB5=1; return '3';}
	btfsc	(49/8),(49)&7
	goto	u171
	goto	u170
u171:
	goto	l2164
u170:
	
l3336:	
	bsf	(53/8),(53)&7
	
l3338:	
	movlw	(033h)
	goto	l2146
	
l3340:	
	goto	l2146
	
l3342:	
	goto	l2161
	line	25
	
l2164:	
;MatrixKeypad.c: 25: else if(RB0==0) {RB5=1; return 'C';}
	btfsc	(48/8),(48)&7
	goto	u181
	goto	u180
u181:
	goto	l2161
u180:
	
l3344:	
	bsf	(53/8),(53)&7
	
l3346:	
	movlw	(043h)
	goto	l2146
	
l3348:	
	goto	l2146
	
l2166:	
	goto	l2161
	line	26
	
l2165:	
	goto	l2161
	
l2163:	
	
l2161:	
;MatrixKeypad.c: 26: RB5=1;
	bsf	(53/8),(53)&7
	line	28
;MatrixKeypad.c: 28: RB4=0;
	bcf	(52/8),(52)&7
	line	29
;MatrixKeypad.c: 29: if(RB3==0) {RB4=1; return '.';}
	btfsc	(51/8),(51)&7
	goto	u191
	goto	u190
u191:
	goto	l2167
u190:
	
l3350:	
	bsf	(52/8),(52)&7
	
l3352:	
	movlw	(02Eh)
	goto	l2146
	
l3354:	
	goto	l2146
	
l3356:	
	goto	l2168
	line	30
	
l2167:	
;MatrixKeypad.c: 30: else if(RB2==0) {RB4=1; return '0';}
	btfsc	(50/8),(50)&7
	goto	u201
	goto	u200
u201:
	goto	l2169
u200:
	
l3358:	
	bsf	(52/8),(52)&7
	
l3360:	
	movlw	(030h)
	goto	l2146
	
l3362:	
	goto	l2146
	
l3364:	
	goto	l2168
	line	31
	
l2169:	
;MatrixKeypad.c: 31: else if(RB1==0) {RB4=1; return '#';}
	btfsc	(49/8),(49)&7
	goto	u211
	goto	u210
u211:
	goto	l2171
u210:
	
l3366:	
	bsf	(52/8),(52)&7
	
l3368:	
	movlw	(023h)
	goto	l2146
	
l3370:	
	goto	l2146
	
l3372:	
	goto	l2168
	line	32
	
l2171:	
;MatrixKeypad.c: 32: else if(RB0==0) {RB4=1; return 'D';}
	btfsc	(48/8),(48)&7
	goto	u221
	goto	u220
u221:
	goto	l2168
u220:
	
l3374:	
	bsf	(52/8),(52)&7
	
l3376:	
	movlw	(044h)
	goto	l2146
	
l3378:	
	goto	l2146
	
l2173:	
	goto	l2168
	line	33
	
l2172:	
	goto	l2168
	
l2170:	
	
l2168:	
;MatrixKeypad.c: 33: RB4=1;
	bsf	(52/8),(52)&7
	line	35
	
l3380:	
;MatrixKeypad.c: 35: return 0;
	movlw	(0)
	goto	l2146
	
l3382:	
	line	36
	
l2146:	
	return
	opt stack 0
GLOBAL	__end_of_read_keypad
	__end_of_read_keypad:
;; =============== function _read_keypad ends ============

	signat	_read_keypad,89
	global	_DelayMs
psect	text156,local,class=CODE,delta=2
global __ptext156
__ptext156:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 12 in file "F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\delay.c"
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
;;		_main
;;		_delay
;; This function uses a non-reentrant model
;;
psect	text156
	file	"F:\Prolific\PIC\pic_pgm\19  4x4 kbd 4 pts_ok\delay.c"
	line	12
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 7
; Regs used in _DelayMs: [wreg+status,2+status,0]
;DelayMs@cnt stored from wreg
	movwf	(DelayMs@cnt)
	line	21
;delay.c: 20: unsigned char i;
;delay.c: 21: do {
	
l3:	
	line	22
	
l3220:	
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
	goto	l3222
	
l6:	
	goto	l3222
	
l5:	
	
l3222:	
	movlw	low(01h)
	subwf	(DelayMs@_dcnt),f
	btfss	status,2
	goto	u11
	goto	u10
u11:
	goto	l3222
u10:
	goto	l3224
	
l7:	
	line	25
	
l3224:	
;delay.c: 25: } while(--i);
	movlw	low(01h)
	subwf	(DelayMs@i),f
	btfss	status,2
	goto	u21
	goto	u20
u21:
	goto	l4
u20:
	goto	l3226
	
l8:	
	line	26
	
l3226:	
;delay.c: 26: } while(--cnt);
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u31
	goto	u30
u31:
	goto	l3
u30:
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
psect	text157,local,class=CODE,delta=2
global __ptext157
__ptext157:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
