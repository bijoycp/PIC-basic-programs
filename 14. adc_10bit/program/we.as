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
	FNCALL	_main,_init_adc
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_goto
	FNCALL	_main,_lcd_puts
	FNCALL	_main,_read_adc
	FNCALL	_main,_itoa
	FNCALL	_main,_DelayMs
	FNCALL	_lcd_goto,_send
	FNCALL	_lcd_puts,_send
	FNCALL	_lcd_init,_LCD_STROBE
	FNCALL	_lcd_init,_send
	FNCALL	_itoa,_utoa
	FNCALL	_send,_LCD_STROBE
	FNCALL	_utoa,___lwdiv
	FNCALL	_utoa,___lwmod
	FNCALL	_read_adc,_DelayMs
	FNROOT	_main
	global	_adc_val
	global	_mode
	global	_buf
	global	_ADCON0
psect	text334,local,class=CODE,delta=2
global __ptext334
__ptext334:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTD
_PORTD	set	8
	global	_CARRY
_CARRY	set	24
	global	_CHS0
_CHS0	set	251
	global	_CHS1
_CHS1	set	252
	global	_CHS2
_CHS2	set	253
	global	_GIE
_GIE	set	95
	global	_GO
_GO	set	250
	global	_RD2
_RD2	set	66
	global	_RD3
_RD3	set	67
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_TRISA
_TRISA	set	133
	global	_TRISD
_TRISD	set	136
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
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_2:	
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_1:	
	retlw	65	;'A'
	retlw	68	;'D'
	retlw	67	;'C'
	retlw	32	;' '
	retlw	86	;'V'
	retlw	65	;'A'
	retlw	76	;'L'
	retlw	85	;'U'
	retlw	69	;'E'
	retlw	0
psect	strings
	file	"we.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssBANK0,class=BANK0,bit,space=1
global __pbitbssBANK0
__pbitbssBANK0:
_mode:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_adc_val:
       ds      2

_buf:
       ds      4

; Clear objects allocated to BITBANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssBANK0/8)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
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
	global	?_init_adc
?_init_adc:	; 0 bytes @ 0x0
	global	??_init_adc
??_init_adc:	; 0 bytes @ 0x0
	global	?_DelayMs
?_DelayMs:	; 0 bytes @ 0x0
	global	??_DelayMs
??_DelayMs:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	DelayMs@cnt
DelayMs@cnt:	; 1 bytes @ 0x1
	ds	1
	global	??_send
??_send:	; 0 bytes @ 0x2
	global	DelayMs@i
DelayMs@i:	; 1 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	DelayMs@_dcnt
DelayMs@_dcnt:	; 1 bytes @ 0x3
	ds	1
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	?_read_adc
?_read_adc:	; 2 bytes @ 0x4
	global	send@temp
send@temp:	; 1 bytes @ 0x4
	ds	1
	global	send@x
send@x:	; 1 bytes @ 0x5
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	1
	global	??_read_adc
??_read_adc:	; 0 bytes @ 0x6
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x6
	global	?_lcd_puts
?_lcd_puts:	; 0 bytes @ 0x6
	global	?_lcd_goto
?_lcd_goto:	; 0 bytes @ 0x6
	global	lcd_goto@pos
lcd_goto@pos:	; 1 bytes @ 0x6
	global	lcd_puts@s
lcd_puts@s:	; 2 bytes @ 0x6
	ds	1
	global	??_lcd_goto
??_lcd_goto:	; 0 bytes @ 0x7
	global	lcd_goto@line
lcd_goto@line:	; 1 bytes @ 0x7
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	ds	1
	global	??_lcd_puts
??_lcd_puts:	; 0 bytes @ 0x8
	global	?_utoa
?_utoa:	; 1 bytes @ 0x8
	global	utoa@val
utoa@val:	; 2 bytes @ 0x8
	ds	2
	global	read_adc@channel
read_adc@channel:	; 1 bytes @ 0xA
	global	utoa@base
utoa@base:	; 2 bytes @ 0xA
	ds	1
	global	read_adc@adc_value
read_adc@adc_value:	; 2 bytes @ 0xB
	ds	1
	global	??_utoa
??_utoa:	; 0 bytes @ 0xC
	ds	1
	global	??_itoa
??_itoa:	; 0 bytes @ 0xD
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	utoa@v
utoa@v:	; 2 bytes @ 0x0
	ds	2
	global	utoa@c
utoa@c:	; 1 bytes @ 0x2
	ds	1
	global	utoa@buf
utoa@buf:	; 1 bytes @ 0x3
	ds	1
	global	?_itoa
?_itoa:	; 1 bytes @ 0x4
	global	itoa@val
itoa@val:	; 2 bytes @ 0x4
	ds	2
	global	itoa@base
itoa@base:	; 2 bytes @ 0x6
	ds	2
	global	itoa@cp
itoa@cp:	; 1 bytes @ 0x8
	ds	1
	global	itoa@buf
itoa@buf:	; 1 bytes @ 0x9
	ds	1
;;Data sizes: Strings 25, constant 0, data 0, bss 6, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     10      17
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?_utoa	PTR unsigned char  size(1) Largest target is 4
;;		 -> buf(BANK0[4]), 
;;
;; ?_read_adc	unsigned int  size(1) Largest target is 0
;;
;; ?_itoa	PTR unsigned char  size(1) Largest target is 4
;;		 -> buf(BANK0[4]), 
;;
;; utoa@buf	PTR unsigned char  size(1) Largest target is 4
;;		 -> buf(BANK0[4]), 
;;
;; sp__utoa	PTR unsigned char  size(1) Largest target is 4
;;		 -> buf(BANK0[4]), 
;;
;; itoa@buf	PTR unsigned char  size(1) Largest target is 4
;;		 -> buf(BANK0[4]), 
;;
;; itoa@cp	PTR unsigned char  size(1) Largest target is 4
;;		 -> buf(BANK0[4]), 
;;
;; sp__itoa	PTR unsigned char  size(1) Largest target is 4
;;		 -> buf(BANK0[4]), 
;;
;; lcd_puts@s	PTR const unsigned char  size(2) Largest target is 15
;;		 -> STR_2(CODE[15]), buf(BANK0[4]), STR_1(CODE[10]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_itoa
;;   _lcd_goto->_send
;;   _lcd_puts->_send
;;   _lcd_init->_send
;;   _itoa->_utoa
;;   _send->_LCD_STROBE
;;   _utoa->___lwdiv
;;   _read_adc->_DelayMs
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_itoa
;;   _itoa->_utoa
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
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0    1644
;;                           _init_adc
;;                           _lcd_init
;;                           _lcd_goto
;;                           _lcd_puts
;;                           _read_adc
;;                               _itoa
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (1) _lcd_goto                                             2     1      1     291
;;                                              6 COMMON     2     1      1
;;                               _send
;; ---------------------------------------------------------------------------------
;; (1) _lcd_puts                                             2     0      2     204
;;                                              6 COMMON     2     0      2
;;                               _send
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             3     3      0     159
;;                                              6 COMMON     3     3      0
;;                         _LCD_STROBE
;;                               _send
;; ---------------------------------------------------------------------------------
;; (1) _itoa                                                 7     3      4     785
;;                                             13 COMMON     1     1      0
;;                                              4 BANK0      6     2      4
;;                               _utoa
;; ---------------------------------------------------------------------------------
;; (2) _send                                                 4     4      0     159
;;                                              2 COMMON     4     4      0
;;                         _LCD_STROBE
;; ---------------------------------------------------------------------------------
;; (2) _utoa                                                 9     5      4     622
;;                                              8 COMMON     5     1      4
;;                                              0 BANK0      4     4      0
;;                            ___lwdiv
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (1) _read_adc                                             9     7      2     137
;;                                              4 COMMON     9     7      2
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (3) _LCD_STROBE                                           2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (3) ___lwmod                                              6     2      4     159
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (3) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (1) _init_adc                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _DelayMs                                              4     4      0      68
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init_adc
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
;;   _read_adc
;;     _DelayMs
;;   _itoa
;;     _utoa
;;       ___lwdiv
;;       ___lwmod
;;   _DelayMs
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0      1F       3        0.0%
;;BITBANK0            50      0       1       4        1.3%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      A      11       5       21.3%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      22      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 14 in file "F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_init_adc
;;		_lcd_init
;;		_lcd_goto
;;		_lcd_puts
;;		_read_adc
;;		_itoa
;;		_DelayMs
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\main.c"
	line	14
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	15
	
l4553:	
;main.c: 15: init_adc();
	fcall	_init_adc
	line	16
;main.c: 16: lcd_init();
	fcall	_lcd_init
	line	18
	
l4555:	
;main.c: 18: lcd_goto(1,0);
	clrf	(?_lcd_goto)
	movlw	(01h)
	fcall	_lcd_goto
	line	19
	
l4557:	
;main.c: 19: lcd_puts("ADC VALUE");
	movlw	low((STR_1-__stringbase))
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	goto	l4559
	line	20
;main.c: 20: while(1)
	
l1458:	
	line	22
	
l4559:	
;main.c: 21: {
;main.c: 22: adc_val=read_adc(0);
	movlw	(0)
	fcall	_read_adc
	movf	(1+(?_read_adc)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_adc_val+1)
	addwf	(_adc_val+1)
	movf	(0+(?_read_adc)),w
	clrf	(_adc_val)
	addwf	(_adc_val)

	line	23
	
l4561:	
;main.c: 23: itoa(buf,adc_val,10);
	movf	(_adc_val+1),w
	clrf	(?_itoa+1)
	addwf	(?_itoa+1)
	movf	(_adc_val),w
	clrf	(?_itoa)
	addwf	(?_itoa)

	movlw	low(0Ah)
	movwf	0+(?_itoa)+02h
	movlw	high(0Ah)
	movwf	(0+(?_itoa)+02h)+1
	movlw	(_buf)&0ffh
	fcall	_itoa
	line	24
	
l4563:	
;main.c: 24: lcd_goto(2,0);
	clrf	(?_lcd_goto)
	movlw	(02h)
	fcall	_lcd_goto
	line	25
	
l4565:	
;main.c: 25: lcd_puts(buf);
	movlw	(_buf&0ffh)
	movwf	(?_lcd_puts)
	movlw	(0x0/2)
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	line	26
	
l4567:	
;main.c: 26: DelayMs(200);
	movlw	(0C8h)
	fcall	_DelayMs
	line	27
	
l4569:	
;main.c: 27: lcd_goto(2,0);
	clrf	(?_lcd_goto)
	movlw	(02h)
	fcall	_lcd_goto
	line	28
	
l4571:	
;main.c: 28: lcd_puts("              ");
	movlw	low((STR_2-__stringbase))
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	goto	l4559
	line	29
	
l1459:	
	line	20
	goto	l4559
	
l1460:	
	line	30
	
l1461:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_goto
psect	text335,local,class=CODE,delta=2
global __ptext335
__ptext335:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 77 in file "F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\lcd.c"
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
psect	text335
	file	"F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\lcd.c"
	line	77
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 5
; Regs used in _lcd_goto: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_goto@line stored from wreg
	movwf	(lcd_goto@line)
	line	78
	
l4537:	
;lcd.c: 78: switch(line)
	goto	l4551
	line	80
;lcd.c: 79: {
;lcd.c: 80: case 1:
	
l735:	
	line	81
;lcd.c: 81: mode=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(_mode/8),(_mode)&7
	line	82
	
l4539:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(_mode/8),(_mode)&7
	line	87
	
l4541:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(_mode/8),(_mode)&7
	line	92
	
l4543:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(_mode/8),(_mode)&7
	line	97
	
l4545:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(_mode/8),(_mode)&7
	line	102
	
l4547:	
;lcd.c: 102: send(0XD4+pos);
	movf	(lcd_goto@pos),w
	addlw	0D4h
	fcall	_send
	line	103
;lcd.c: 103: break;
	goto	l741
	line	104
	
l4549:	
;lcd.c: 104: }
	goto	l741
	line	78
	
l734:	
	
l4551:	
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
	global	_lcd_puts
psect	text336,local,class=CODE,delta=2
global __ptext336
__ptext336:

;; *************** function _lcd_puts *****************
;; Defined at:
;;		line 60 in file "F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               2    6[COMMON] PTR const unsigned char 
;;		 -> STR_2(15), buf(4), STR_1(10), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_send
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text336
	file	"F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\lcd.c"
	line	60
	global	__size_of_lcd_puts
	__size_of_lcd_puts	equ	__end_of_lcd_puts-_lcd_puts
	
_lcd_puts:	
	opt	stack 5
; Regs used in _lcd_puts: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	61
	
l4529:	
;lcd.c: 61: mode = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_mode/8),(_mode)&7
	line	62
;lcd.c: 62: while(*s)
	goto	l4535
	
l723:	
	line	63
	
l4531:	
;lcd.c: 63: send(*s++);
	movf	(lcd_puts@s+1),w
	movwf	btemp+1
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_send
	
l4533:	
	movlw	low(01h)
	addwf	(lcd_puts@s),f
	skipnc
	incf	(lcd_puts@s+1),f
	movlw	high(01h)
	addwf	(lcd_puts@s+1),f
	goto	l4535
	
l722:	
	line	62
	
l4535:	
	movf	(lcd_puts@s+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u2661
	goto	u2660
u2661:
	goto	l4531
u2660:
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
psect	text337,local,class=CODE,delta=2
global __ptext337
__ptext337:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 13 in file "F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\lcd.c"
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
psect	text337
	file	"F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\lcd.c"
	line	13
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 5
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	14
	
l4515:	
;lcd.c: 14: TRISD=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	15
	
l4517:	
;lcd.c: 15: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_lcd_init+0)+0+2),f
movlw	138
movwf	((??_lcd_init+0)+0+1),f
	movlw	86
movwf	((??_lcd_init+0)+0),f
u2677:
	decfsz	((??_lcd_init+0)+0),f
	goto	u2677
	decfsz	((??_lcd_init+0)+0+1),f
	goto	u2677
	decfsz	((??_lcd_init+0)+0+2),f
	goto	u2677
	nop2
opt asmopt_on

	line	16
	
l4519:	
;lcd.c: 16: RD2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	17
	
l4521:	
;lcd.c: 17: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	18
	
l4523:	
;lcd.c: 18: RD3=0;
	bcf	(67/8),(67)&7
	line	20
;lcd.c: 20: PORTD=(PORTD&0X0F)|0x30;
	movf	(8),w
	andlw	0Fh
	iorlw	030h
	movwf	(8)	;volatile
	line	21
	
l4525:	
;lcd.c: 21: LCD_STROBE();
	fcall	_LCD_STROBE
	line	22
	
l4527:	
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
	global	_itoa
psect	text338,local,class=CODE,delta=2
global __ptext338
__ptext338:

;; *************** function _itoa *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\itoa.c"
;; Parameters:    Size  Location     Type
;;  buf             1    wreg     PTR unsigned char 
;;		 -> buf(4), 
;;  val             2    4[BANK0 ] int 
;;  base            2    6[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  buf             1    9[BANK0 ] PTR unsigned char 
;;		 -> buf(4), 
;;  cp              1    8[BANK0 ] PTR unsigned char 
;;		 -> buf(4), 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       6       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_utoa
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text338
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\itoa.c"
	line	5
	global	__size_of_itoa
	__size_of_itoa	equ	__end_of_itoa-_itoa
	
_itoa:	
	opt	stack 5
; Regs used in _itoa: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;itoa@buf stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(itoa@buf)
	line	6
	
l4501:	
	movf	(itoa@buf),w
	movwf	(??_itoa+0)+0
	movf	(??_itoa+0)+0,w
	movwf	(itoa@cp)
	line	8
	
l4503:	
	btfss	(itoa@val+1),7
	goto	u2651
	goto	u2650
u2651:
	goto	l4511
u2650:
	line	9
	
l4505:	
	movlw	(02Dh)
	movwf	(??_itoa+0)+0
	movf	(itoa@buf),w
	movwf	fsr0
	movf	(??_itoa+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l4507:	
	movlw	(01h)
	movwf	(??_itoa+0)+0
	movf	(??_itoa+0)+0,w
	addwf	(itoa@buf),f
	line	10
	
l4509:	
	comf	(itoa@val),f
	comf	(itoa@val+1),f
	incf	(itoa@val),f
	skipnz
	incf	(itoa@val+1),f
	goto	l4511
	line	11
	
l2833:	
	line	12
	
l4511:	
	movf	(itoa@val+1),w
	clrf	(?_utoa+1)
	addwf	(?_utoa+1)
	movf	(itoa@val),w
	clrf	(?_utoa)
	addwf	(?_utoa)

	movf	(itoa@base+1),w
	clrf	1+(?_utoa)+02h
	addwf	1+(?_utoa)+02h
	movf	(itoa@base),w
	clrf	0+(?_utoa)+02h
	addwf	0+(?_utoa)+02h

	movf	(itoa@buf),w
	fcall	_utoa
	goto	l2834
	line	13
	
l4513:	
	line	14
;	Return value of _itoa is never used
	
l2834:	
	return
	opt stack 0
GLOBAL	__end_of_itoa
	__end_of_itoa:
;; =============== function _itoa ends ============

	signat	_itoa,12409
	global	_send
psect	text339,local,class=CODE,delta=2
global __ptext339
__ptext339:

;; *************** function _send *****************
;; Defined at:
;;		line 38 in file "F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\lcd.c"
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
;;		_lcd_goto
;;		_lcd_clear
;;		_lcd_putch
;;		_curser
;;		_display_shift
;;		_curser_shift_left
;;		_curser_shift_right
;; This function uses a non-reentrant model
;;
psect	text339
	file	"F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\lcd.c"
	line	38
	global	__size_of_send
	__size_of_send	equ	__end_of_send-_send
	
_send:	
	opt	stack 5
; Regs used in _send: [wreg+status,2+status,0+pclath+cstack]
;send@x stored from wreg
	line	40
	movwf	(send@x)
	
l4475:	
;lcd.c: 39: char temp;
;lcd.c: 40: temp=x;
	movf	(send@x),w
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@temp)
	line	41
	
l4477:	
;lcd.c: 41: x=x&0XF0;
	movf	(send@x),w
	andlw	0F0h
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	42
	
l4479:	
;lcd.c: 42: PORTD=(PORTD&0X0F)|x;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w
	andlw	0Fh
	iorwf	(send@x),w
	movwf	(8)	;volatile
	line	43
	
l4481:	
;lcd.c: 43: if (mode==0)
	btfsc	(_mode/8),(_mode)&7
	goto	u2621
	goto	u2620
u2621:
	goto	l715
u2620:
	line	44
	
l4483:	
;lcd.c: 44: RD2=0;
	bcf	(66/8),(66)&7
	goto	l4485
	line	45
	
l715:	
	line	46
;lcd.c: 45: else
;lcd.c: 46: RD2=1;
	bsf	(66/8),(66)&7
	goto	l4485
	
l716:	
	line	47
	
l4485:	
;lcd.c: 47: LCD_STROBE();
	fcall	_LCD_STROBE
	line	48
	
l4487:	
;lcd.c: 48: x=temp;
	movf	(send@temp),w
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	49
	
l4489:	
;lcd.c: 49: x=x<<4;
	movf	(send@x),w
	movwf	(??_send+0)+0
	movlw	(04h)-1
u2635:
	clrc
	rlf	(??_send+0)+0,f
	addlw	-1
	skipz
	goto	u2635
	clrc
	rlf	(??_send+0)+0,w
	movwf	(??_send+1)+0
	movf	(??_send+1)+0,w
	movwf	(send@x)
	line	50
	
l4491:	
;lcd.c: 50: x=x&0XF0;
	movf	(send@x),w
	andlw	0F0h
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	51
	
l4493:	
;lcd.c: 51: PORTD=(PORTD&0X0F)|x;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w
	andlw	0Fh
	iorwf	(send@x),w
	movwf	(8)	;volatile
	line	52
	
l4495:	
;lcd.c: 52: if(mode==0)
	btfsc	(_mode/8),(_mode)&7
	goto	u2641
	goto	u2640
u2641:
	goto	l717
u2640:
	line	53
	
l4497:	
;lcd.c: 53: RD2=0;
	bcf	(66/8),(66)&7
	goto	l4499
	line	54
	
l717:	
	line	55
;lcd.c: 54: else
;lcd.c: 55: RD2=1;
	bsf	(66/8),(66)&7
	goto	l4499
	
l718:	
	line	56
	
l4499:	
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
	global	_utoa
psect	text340,local,class=CODE,delta=2
global __ptext340
__ptext340:

;; *************** function _utoa *****************
;; Defined at:
;;		line 18 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\itoa.c"
;; Parameters:    Size  Location     Type
;;  buf             1    wreg     PTR unsigned char 
;;		 -> buf(4), 
;;  val             2    8[COMMON] unsigned int 
;;  base            2   10[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  buf             1    3[BANK0 ] PTR unsigned char 
;;		 -> buf(4), 
;;  v               2    0[BANK0 ] unsigned int 
;;  c               1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         5       4       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_itoa
;; This function uses a non-reentrant model
;;
psect	text340
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\itoa.c"
	line	18
	global	__size_of_utoa
	__size_of_utoa	equ	__end_of_utoa-_utoa
	
_utoa:	
	opt	stack 5
; Regs used in _utoa: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;utoa@buf stored from wreg
	line	22
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(utoa@buf)
	
l4449:	
	movf	(utoa@val+1),w
	clrf	(utoa@v+1)
	addwf	(utoa@v+1)
	movf	(utoa@val),w
	clrf	(utoa@v)
	addwf	(utoa@v)

	goto	l4451
	line	23
	
l2837:	
	line	24
	
l4451:	
	movf	(utoa@base+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(utoa@base),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	movf	(utoa@v+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(utoa@v),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(utoa@v+1)
	addwf	(utoa@v+1)
	movf	(0+(?___lwdiv)),w
	clrf	(utoa@v)
	addwf	(utoa@v)

	line	25
	
l4453:	
	movlw	(01h)
	movwf	(??_utoa+0)+0
	movf	(??_utoa+0)+0,w
	addwf	(utoa@buf),f
	line	26
	
l4455:	
	movf	((utoa@v+1)),w
	iorwf	((utoa@v)),w
	skipz
	goto	u2591
	goto	u2590
u2591:
	goto	l4451
u2590:
	goto	l4457
	
l2838:	
	line	27
	
l4457:	
	movf	(utoa@buf),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	
l4459:	
	movlw	low(01h)
	subwf	(utoa@buf),f
	goto	l4461
	line	28
	
l2839:	
	line	29
	
l4461:	
	movf	(utoa@base+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(utoa@base),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	movf	(utoa@val+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(utoa@val),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	movwf	(??_utoa+0)+0
	movf	(??_utoa+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(utoa@c)
	line	30
	
l4463:	
	movf	(utoa@base+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(utoa@base),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	movf	(utoa@val+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(utoa@val),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	clrf	(utoa@val+1)
	addwf	(utoa@val+1)
	movf	(0+(?___lwdiv)),w
	clrf	(utoa@val)
	addwf	(utoa@val)

	line	31
	
l4465:	
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(utoa@c),w
	skipc
	goto	u2601
	goto	u2600
u2601:
	goto	l2840
u2600:
	line	32
	
l4467:	
	movlw	(07h)
	movwf	(??_utoa+0)+0
	movf	(??_utoa+0)+0,w
	addwf	(utoa@c),f
	
l2840:	
	line	33
	movlw	(030h)
	movwf	(??_utoa+0)+0
	movf	(??_utoa+0)+0,w
	addwf	(utoa@c),f
	line	34
	
l4469:	
	movf	(utoa@c),w
	movwf	(??_utoa+0)+0
	movf	(utoa@buf),w
	movwf	fsr0
	movf	(??_utoa+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l4471:	
	movlw	low(01h)
	subwf	(utoa@buf),f
	line	35
	
l4473:	
	movf	((utoa@val+1)),w
	iorwf	((utoa@val)),w
	skipz
	goto	u2611
	goto	u2610
u2611:
	goto	l4461
u2610:
	goto	l2842
	
l2841:	
	line	37
;	Return value of _utoa is never used
	
l2842:	
	return
	opt stack 0
GLOBAL	__end_of_utoa
	__end_of_utoa:
;; =============== function _utoa ends ============

	signat	_utoa,12409
	global	_read_adc
psect	text341,local,class=CODE,delta=2
global __ptext341
__ptext341:

;; *************** function _read_adc *****************
;; Defined at:
;;		line 16 in file "F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\my_adc.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1   10[COMMON] unsigned char 
;;  adc_value       2   11[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    4[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         9       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayMs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text341
	file	"F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\my_adc.c"
	line	16
	global	__size_of_read_adc
	__size_of_read_adc	equ	__end_of_read_adc-_read_adc
	
_read_adc:	
	opt	stack 6
; Regs used in _read_adc: [wreg+status,2+status,0+pclath+cstack]
;read_adc@channel stored from wreg
	movwf	(read_adc@channel)
	line	17
	
l4429:	
;my_adc.c: 17: unsigned int adc_value=0;
	clrf	(read_adc@adc_value)
	clrf	(read_adc@adc_value+1)
	line	18
	
l4431:	
;my_adc.c: 18: CHS2=0;CHS1=0;CHS0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(253/8),(253)&7
	
l4433:	
	bcf	(252/8),(252)&7
	
l4435:	
	bcf	(251/8),(251)&7
	line	19
	
l4437:	
;my_adc.c: 19: ADCON0 = ADCON0|(channel << 3);
	movf	(read_adc@channel),w
	movwf	(??_read_adc+0)+0
	movlw	(03h)-1
u2575:
	clrc
	rlf	(??_read_adc+0)+0,f
	addlw	-1
	skipz
	goto	u2575
	clrc
	rlf	(??_read_adc+0)+0,w
	iorwf	(31),w	;volatile
	movwf	(31)	;volatile
	line	20
	
l4439:	
;my_adc.c: 20: DelayMs(50);
	movlw	(032h)
	fcall	_DelayMs
	line	21
	
l4441:	
;my_adc.c: 21: GO = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7
	line	22
;my_adc.c: 22: while(GO);
	goto	l2151
	
l2152:	
	
l2151:	
	btfsc	(250/8),(250)&7
	goto	u2581
	goto	u2580
u2581:
	goto	l2151
u2580:
	goto	l4443
	
l2153:	
	line	23
	
l4443:	
;my_adc.c: 23: adc_value = ADRESH;
	movf	(30),w	;volatile
	movwf	(??_read_adc+0)+0
	clrf	(??_read_adc+0)+0+1
	movf	0+(??_read_adc+0)+0,w
	movwf	(read_adc@adc_value)
	movf	1+(??_read_adc+0)+0,w
	movwf	(read_adc@adc_value+1)
	line	24
;my_adc.c: 24: adc_value = (adc_value << 8) | ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(??_read_adc+0)+0
	clrf	(??_read_adc+0)+0+1
	movf	(read_adc@adc_value),w
	movwf	(??_read_adc+2)+0+1
	clrf	(??_read_adc+2)+0
	movf	0+(??_read_adc+0)+0,w
	iorwf	0+(??_read_adc+2)+0,w
	movwf	(read_adc@adc_value)
	movf	1+(??_read_adc+0)+0,w
	iorwf	1+(??_read_adc+2)+0,w
	movwf	1+(read_adc@adc_value)
	line	25
	
l4445:	
;my_adc.c: 25: return(adc_value);
	movf	(read_adc@adc_value+1),w
	clrf	(?_read_adc+1)
	addwf	(?_read_adc+1)
	movf	(read_adc@adc_value),w
	clrf	(?_read_adc)
	addwf	(?_read_adc)

	goto	l2154
	
l4447:	
	line	27
	
l2154:	
	return
	opt stack 0
GLOBAL	__end_of_read_adc
	__end_of_read_adc:
;; =============== function _read_adc ends ============

	signat	_read_adc,4218
	global	_LCD_STROBE
psect	text342,local,class=CODE,delta=2
global __ptext342
__ptext342:

;; *************** function _LCD_STROBE *****************
;; Defined at:
;;		line 32 in file "F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\lcd.c"
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
psect	text342
	file	"F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\lcd.c"
	line	32
	global	__size_of_LCD_STROBE
	__size_of_LCD_STROBE	equ	__end_of_LCD_STROBE-_LCD_STROBE
	
_LCD_STROBE:	
	opt	stack 5
; Regs used in _LCD_STROBE: [wreg]
	line	33
	
l4423:	
;lcd.c: 33: RD3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(67/8),(67)&7
	line	34
	
l4425:	
;lcd.c: 34: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_LCD_STROBE+0)+0+1),f
	movlw	251
movwf	((??_LCD_STROBE+0)+0),f
u2687:
	decfsz	((??_LCD_STROBE+0)+0),f
	goto	u2687
	decfsz	((??_LCD_STROBE+0)+0+1),f
	goto	u2687
	nop2
opt asmopt_on

	line	35
	
l4427:	
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
	global	___lwmod
psect	text343,local,class=CODE,delta=2
global __ptext343
__ptext343:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_utoa
;; This function uses a non-reentrant model
;;
psect	text343
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 5
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l4401:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u2511
	goto	u2510
u2511:
	goto	l4419
u2510:
	line	9
	
l4403:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l4409
	
l2869:	
	line	11
	
l4405:	
	movlw	01h
	
u2525:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2525
	line	12
	
l4407:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l4409
	line	13
	
l2868:	
	line	10
	
l4409:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u2531
	goto	u2530
u2531:
	goto	l4405
u2530:
	goto	l4411
	
l2870:	
	goto	l4411
	line	14
	
l2871:	
	line	15
	
l4411:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u2545
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u2545:
	skipc
	goto	u2541
	goto	u2540
u2541:
	goto	l4415
u2540:
	line	16
	
l4413:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l4415
	
l2872:	
	line	17
	
l4415:	
	movlw	01h
	
u2555:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u2555
	line	18
	
l4417:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u2561
	goto	u2560
u2561:
	goto	l4411
u2560:
	goto	l4419
	
l2873:	
	goto	l4419
	line	19
	
l2867:	
	line	20
	
l4419:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l2874
	
l4421:	
	line	21
	
l2874:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text344,local,class=CODE,delta=2
global __ptext344
__ptext344:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[COMMON] unsigned int 
;;  counter         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_utoa
;; This function uses a non-reentrant model
;;
psect	text344
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 5
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l4375:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l4377:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2441
	goto	u2440
u2441:
	goto	l4397
u2440:
	line	11
	
l4379:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l4385
	
l2859:	
	line	13
	
l4381:	
	movlw	01h
	
u2455:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2455
	line	14
	
l4383:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l4385
	line	15
	
l2858:	
	line	12
	
l4385:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2461
	goto	u2460
u2461:
	goto	l4381
u2460:
	goto	l4387
	
l2860:	
	goto	l4387
	line	16
	
l2861:	
	line	17
	
l4387:	
	movlw	01h
	
u2475:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2475
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2485
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2485:
	skipc
	goto	u2481
	goto	u2480
u2481:
	goto	l4393
u2480:
	line	19
	
l4389:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l4391:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l4393
	line	21
	
l2862:	
	line	22
	
l4393:	
	movlw	01h
	
u2495:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2495
	line	23
	
l4395:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2501
	goto	u2500
u2501:
	goto	l4387
u2500:
	goto	l4397
	
l2863:	
	goto	l4397
	line	24
	
l2857:	
	line	25
	
l4397:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l2864
	
l4399:	
	line	26
	
l2864:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_init_adc
psect	text345,local,class=CODE,delta=2
global __ptext345
__ptext345:

;; *************** function _init_adc *****************
;; Defined at:
;;		line 7 in file "F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\my_adc.c"
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
psect	text345
	file	"F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\my_adc.c"
	line	7
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 7
; Regs used in _init_adc: [wreg]
	line	8
	
l4373:	
;my_adc.c: 8: ADCON0 = 0B01000001;
	movlw	(041h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	9
;my_adc.c: 9: ADCON1 = 0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	10
;my_adc.c: 10: TRISA = 0XFF;
	movlw	(0FFh)
	movwf	(133)^080h	;volatile
	line	11
	
l2148:	
	return
	opt stack 0
GLOBAL	__end_of_init_adc
	__end_of_init_adc:
;; =============== function _init_adc ends ============

	signat	_init_adc,88
	global	_DelayMs
psect	text346,local,class=CODE,delta=2
global __ptext346
__ptext346:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 12 in file "F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\delay.c"
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
;;		_read_adc
;;		_delay
;; This function uses a non-reentrant model
;;
psect	text346
	file	"F:\Prolific\pic_s\pic_pgm\29_b adc program(temperature)=10bit\program\delay.c"
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
	
l4327:	
;delay.c: 22: i = 4;
	movlw	(04h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(DelayMs@i)
	line	23
;delay.c: 23: do {
	
l4:	
	line	24
;delay.c: 24: { unsigned char _dcnt; _dcnt = (250)*((20*1000L)/(12*1000L)); while(--_dcnt != 0) continue; };
	movlw	(0FAh)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(DelayMs@_dcnt)
	goto	l4329
	
l6:	
	goto	l4329
	
l5:	
	
l4329:	
	movlw	low(01h)
	subwf	(DelayMs@_dcnt),f
	btfss	status,2
	goto	u2381
	goto	u2380
u2381:
	goto	l4329
u2380:
	goto	l4331
	
l7:	
	line	25
	
l4331:	
;delay.c: 25: } while(--i);
	movlw	low(01h)
	subwf	(DelayMs@i),f
	btfss	status,2
	goto	u2391
	goto	u2390
u2391:
	goto	l4
u2390:
	goto	l4333
	
l8:	
	line	26
	
l4333:	
;delay.c: 26: } while(--cnt);
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u2401
	goto	u2400
u2401:
	goto	l3
u2400:
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
psect	text347,local,class=CODE,delta=2
global __ptext347
__ptext347:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
