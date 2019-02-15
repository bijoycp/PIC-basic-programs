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
	FNCALL	_main,___lwtoft
	FNCALL	_main,___ftmul
	FNCALL	_main,___fttol
	FNCALL	_main,_DelayMs
	FNCALL	_lcd_goto,_send
	FNCALL	_lcd_puts,_send
	FNCALL	_lcd_init,_LCD_STROBE
	FNCALL	_lcd_init,_send
	FNCALL	_itoa,_utoa
	FNCALL	_send,_LCD_STROBE
	FNCALL	___lwtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	_utoa,___lwdiv
	FNCALL	_utoa,___lwmod
	FNCALL	_read_adc,_DelayMs
	FNROOT	_main
	global	_buf1
	global	_k
	global	_v
	global	_mode
	global	_buf
	global	_adc_val
	global	_ADCON0
psect	text418,local,class=CODE,delta=2
global __ptext418
__ptext418:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTD
_PORTD	set	8
	global	_CARRY
_CARRY	set	24
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
	
STR_3:	
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
	retlw	84	;'T'
	retlw	69	;'E'
	retlw	77	;'M'
	retlw	80	;'P'
	retlw	69	;'E'
	retlw	82	;'R'
	retlw	65	;'A'
	retlw	84	;'T'
	retlw	85	;'U'
	retlw	82	;'R'
	retlw	69	;'E'
	retlw	0
psect	strings
	
STR_2:	
	retlw	32	;' '
	retlw	99	;'c'
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
_buf1:
       ds      4

_k:
       ds      2

_v:
       ds      2

_buf:
       ds      4

_adc_val:
       ds      2

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
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
	clrf	((__pbssBANK0)+10)&07Fh
	clrf	((__pbssBANK0)+11)&07Fh
	clrf	((__pbssBANK0)+12)&07Fh
	clrf	((__pbssBANK0)+13)&07Fh
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
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
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
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	?_read_adc
?_read_adc:	; 2 bytes @ 0x4
	global	send@temp
send@temp:	; 1 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x5
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
	global	?___fttol
?___fttol:	; 4 bytes @ 0x8
	global	utoa@val
utoa@val:	; 2 bytes @ 0x8
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x8
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
	global	??___lwtoft
??___lwtoft:	; 0 bytes @ 0xC
	ds	1
	global	??_itoa
??_itoa:	; 0 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??___fttol
??___fttol:	; 0 bytes @ 0x0
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
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x4
	global	itoa@val
itoa@val:	; 2 bytes @ 0x4
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x5
	ds	1
	global	itoa@base
itoa@base:	; 2 bytes @ 0x6
	ds	2
	global	itoa@cp
itoa@cp:	; 1 bytes @ 0x8
	ds	1
	global	itoa@buf
itoa@buf:	; 1 bytes @ 0x9
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
	ds	1
;;Data sizes: Strings 30, constant 0, data 0, bss 14, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     30      45
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?_utoa	PTR unsigned char  size(1) Largest target is 4
;;		 -> buf(BANK0[4]), 
;;
;; ?_read_adc	unsigned int  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___lwtoft	float  size(1) Largest target is 0
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
;;		 -> STR_3(CODE[15]), STR_2(CODE[3]), buf(BANK0[4]), STR_1(CODE[12]), 
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
;;   ___lwtoft->___fttol
;;   ___ftmul->___lwtoft
;;   _utoa->___lwdiv
;;   _read_adc->_DelayMs
;;   ___fttol->___ftpack
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->___ftmul
;;   _itoa->_utoa
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0    2662
;;                                             29 BANK0      1     1      0
;;                           _init_adc
;;                           _lcd_init
;;                           _lcd_goto
;;                           _lcd_puts
;;                           _read_adc
;;                               _itoa
;;                           ___lwtoft
;;                            ___ftmul
;;                            ___fttol
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
;; (1) ___fttol                                             14    10      4     252
;;                                              8 COMMON     4     0      4
;;                                              0 BANK0     10    10      0
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftpack                                             8     3      5     209
;;                                              0 COMMON     8     3      5
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
;;ABS                  0      0      3B       3        0.0%
;;BITBANK0            50      0       1       4        1.3%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     1E      2D       5       56.3%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      3E      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 14 in file "F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\main.c"
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
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_init_adc
;;		_lcd_init
;;		_lcd_goto
;;		_lcd_puts
;;		_read_adc
;;		_itoa
;;		___lwtoft
;;		___ftmul
;;		___fttol
;;		_DelayMs
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\main.c"
	line	14
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	15
	
l4921:	
;main.c: 15: init_adc();
	fcall	_init_adc
	line	16
;main.c: 16: lcd_init();
	fcall	_lcd_init
	line	18
	
l4923:	
;main.c: 18: lcd_goto(1,0);
	clrf	(?_lcd_goto)
	movlw	(01h)
	fcall	_lcd_goto
	line	19
	
l4925:	
;main.c: 19: lcd_puts("TEMPERATURE");
	movlw	low((STR_1-__stringbase))
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	goto	l4927
	line	20
;main.c: 20: while(1)
	
l1464:	
	line	22
	
l4927:	
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
	
l4929:	
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
	
l4931:	
;main.c: 24: lcd_goto(2,6);
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_lcd_goto)
	movlw	(02h)
	fcall	_lcd_goto
	line	25
	
l4933:	
;main.c: 25: lcd_puts(buf);
	movlw	(_buf&0ffh)
	movwf	(?_lcd_puts)
	movlw	(0x0/2)
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	line	26
	
l4935:	
;main.c: 26: k=(int)(adc_val * 0.0048828125 * 100);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adc_val+1),w
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adc_val),w
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
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0xfa
	movwf	(?___ftmul+1)
	movlw	0x3e
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
	movf	1+(((0+(?___fttol)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_k+1)
	addwf	(_k+1)
	movf	0+(((0+(?___fttol)))),w
	clrf	(_k)
	addwf	(_k)

	line	27
	
l4937:	
;main.c: 27: itoa(buf,k,10);
	movf	(_k+1),w
	clrf	(?_itoa+1)
	addwf	(?_itoa+1)
	movf	(_k),w
	clrf	(?_itoa)
	addwf	(?_itoa)

	movlw	low(0Ah)
	movwf	0+(?_itoa)+02h
	movlw	high(0Ah)
	movwf	(0+(?_itoa)+02h)+1
	movlw	(_buf)&0ffh
	fcall	_itoa
	line	28
	
l4939:	
;main.c: 28: lcd_goto(2,0);
	clrf	(?_lcd_goto)
	movlw	(02h)
	fcall	_lcd_goto
	line	29
	
l4941:	
;main.c: 29: lcd_puts(buf);
	movlw	(_buf&0ffh)
	movwf	(?_lcd_puts)
	movlw	(0x0/2)
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	line	30
	
l4943:	
;main.c: 30: lcd_puts(" c");
	movlw	low((STR_2-__stringbase))
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	line	31
	
l4945:	
;main.c: 31: DelayMs(200);
	movlw	(0C8h)
	fcall	_DelayMs
	line	32
;main.c: 32: lcd_goto(2,0);
	clrf	(?_lcd_goto)
	movlw	(02h)
	fcall	_lcd_goto
	line	33
	
l4947:	
;main.c: 33: lcd_puts("              ");
	movlw	low((STR_3-__stringbase))
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	goto	l4927
	line	34
	
l1465:	
	line	20
	goto	l4927
	
l1466:	
	line	35
	
l1467:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_goto
psect	text419,local,class=CODE,delta=2
global __ptext419
__ptext419:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 77 in file "F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\lcd.c"
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
psect	text419
	file	"F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\lcd.c"
	line	77
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 5
; Regs used in _lcd_goto: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_goto@line stored from wreg
	movwf	(lcd_goto@line)
	line	78
	
l4905:	
;lcd.c: 78: switch(line)
	goto	l4919
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
	
l4907:	
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
	
l4909:	
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
	
l4911:	
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
	
l4913:	
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
	
l4915:	
;lcd.c: 102: send(0XD4+pos);
	movf	(lcd_goto@pos),w
	addlw	0D4h
	fcall	_send
	line	103
;lcd.c: 103: break;
	goto	l741
	line	104
	
l4917:	
;lcd.c: 104: }
	goto	l741
	line	78
	
l734:	
	
l4919:	
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
psect	text420,local,class=CODE,delta=2
global __ptext420
__ptext420:

;; *************** function _lcd_puts *****************
;; Defined at:
;;		line 60 in file "F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               2    6[COMMON] PTR const unsigned char 
;;		 -> STR_3(15), STR_2(3), buf(4), STR_1(12), 
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
psect	text420
	file	"F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\lcd.c"
	line	60
	global	__size_of_lcd_puts
	__size_of_lcd_puts	equ	__end_of_lcd_puts-_lcd_puts
	
_lcd_puts:	
	opt	stack 5
; Regs used in _lcd_puts: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	61
	
l4897:	
;lcd.c: 61: mode = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_mode/8),(_mode)&7
	line	62
;lcd.c: 62: while(*s)
	goto	l4903
	
l723:	
	line	63
	
l4899:	
;lcd.c: 63: send(*s++);
	movf	(lcd_puts@s+1),w
	movwf	btemp+1
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_send
	
l4901:	
	movlw	low(01h)
	addwf	(lcd_puts@s),f
	skipnc
	incf	(lcd_puts@s+1),f
	movlw	high(01h)
	addwf	(lcd_puts@s+1),f
	goto	l4903
	
l722:	
	line	62
	
l4903:	
	movf	(lcd_puts@s+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u3411
	goto	u3410
u3411:
	goto	l4899
u3410:
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
psect	text421,local,class=CODE,delta=2
global __ptext421
__ptext421:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 13 in file "F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\lcd.c"
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
psect	text421
	file	"F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\lcd.c"
	line	13
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 5
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	14
	
l4883:	
;lcd.c: 14: TRISD=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	15
	
l4885:	
;lcd.c: 15: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_lcd_init+0)+0+2),f
movlw	138
movwf	((??_lcd_init+0)+0+1),f
	movlw	86
movwf	((??_lcd_init+0)+0),f
u3427:
	decfsz	((??_lcd_init+0)+0),f
	goto	u3427
	decfsz	((??_lcd_init+0)+0+1),f
	goto	u3427
	decfsz	((??_lcd_init+0)+0+2),f
	goto	u3427
	nop2
opt asmopt_on

	line	16
	
l4887:	
;lcd.c: 16: RD2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	17
	
l4889:	
;lcd.c: 17: mode=0;
	bcf	(_mode/8),(_mode)&7
	line	18
	
l4891:	
;lcd.c: 18: RD3=0;
	bcf	(67/8),(67)&7
	line	20
;lcd.c: 20: PORTD=(PORTD&0X0F)|0x30;
	movf	(8),w
	andlw	0Fh
	iorlw	030h
	movwf	(8)	;volatile
	line	21
	
l4893:	
;lcd.c: 21: LCD_STROBE();
	fcall	_LCD_STROBE
	line	22
	
l4895:	
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
psect	text422,local,class=CODE,delta=2
global __ptext422
__ptext422:

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
psect	text422
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
	
l4869:	
	movf	(itoa@buf),w
	movwf	(??_itoa+0)+0
	movf	(??_itoa+0)+0,w
	movwf	(itoa@cp)
	line	8
	
l4871:	
	btfss	(itoa@val+1),7
	goto	u3401
	goto	u3400
u3401:
	goto	l4879
u3400:
	line	9
	
l4873:	
	movlw	(02Dh)
	movwf	(??_itoa+0)+0
	movf	(itoa@buf),w
	movwf	fsr0
	movf	(??_itoa+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l4875:	
	movlw	(01h)
	movwf	(??_itoa+0)+0
	movf	(??_itoa+0)+0,w
	addwf	(itoa@buf),f
	line	10
	
l4877:	
	comf	(itoa@val),f
	comf	(itoa@val+1),f
	incf	(itoa@val),f
	skipnz
	incf	(itoa@val+1),f
	goto	l4879
	line	11
	
l2839:	
	line	12
	
l4879:	
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
	goto	l2840
	line	13
	
l4881:	
	line	14
;	Return value of _itoa is never used
	
l2840:	
	return
	opt stack 0
GLOBAL	__end_of_itoa
	__end_of_itoa:
;; =============== function _itoa ends ============

	signat	_itoa,12409
	global	_send
psect	text423,local,class=CODE,delta=2
global __ptext423
__ptext423:

;; *************** function _send *****************
;; Defined at:
;;		line 38 in file "F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\lcd.c"
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
psect	text423
	file	"F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\lcd.c"
	line	38
	global	__size_of_send
	__size_of_send	equ	__end_of_send-_send
	
_send:	
	opt	stack 5
; Regs used in _send: [wreg+status,2+status,0+pclath+cstack]
;send@x stored from wreg
	line	40
	movwf	(send@x)
	
l4843:	
;lcd.c: 39: char temp;
;lcd.c: 40: temp=x;
	movf	(send@x),w
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@temp)
	line	41
	
l4845:	
;lcd.c: 41: x=x&0XF0;
	movf	(send@x),w
	andlw	0F0h
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	42
	
l4847:	
;lcd.c: 42: PORTD=(PORTD&0X0F)|x;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w
	andlw	0Fh
	iorwf	(send@x),w
	movwf	(8)	;volatile
	line	43
	
l4849:	
;lcd.c: 43: if (mode==0)
	btfsc	(_mode/8),(_mode)&7
	goto	u3371
	goto	u3370
u3371:
	goto	l715
u3370:
	line	44
	
l4851:	
;lcd.c: 44: RD2=0;
	bcf	(66/8),(66)&7
	goto	l4853
	line	45
	
l715:	
	line	46
;lcd.c: 45: else
;lcd.c: 46: RD2=1;
	bsf	(66/8),(66)&7
	goto	l4853
	
l716:	
	line	47
	
l4853:	
;lcd.c: 47: LCD_STROBE();
	fcall	_LCD_STROBE
	line	48
	
l4855:	
;lcd.c: 48: x=temp;
	movf	(send@temp),w
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	49
	
l4857:	
;lcd.c: 49: x=x<<4;
	movf	(send@x),w
	movwf	(??_send+0)+0
	movlw	(04h)-1
u3385:
	clrc
	rlf	(??_send+0)+0,f
	addlw	-1
	skipz
	goto	u3385
	clrc
	rlf	(??_send+0)+0,w
	movwf	(??_send+1)+0
	movf	(??_send+1)+0,w
	movwf	(send@x)
	line	50
	
l4859:	
;lcd.c: 50: x=x&0XF0;
	movf	(send@x),w
	andlw	0F0h
	movwf	(??_send+0)+0
	movf	(??_send+0)+0,w
	movwf	(send@x)
	line	51
	
l4861:	
;lcd.c: 51: PORTD=(PORTD&0X0F)|x;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w
	andlw	0Fh
	iorwf	(send@x),w
	movwf	(8)	;volatile
	line	52
	
l4863:	
;lcd.c: 52: if(mode==0)
	btfsc	(_mode/8),(_mode)&7
	goto	u3391
	goto	u3390
u3391:
	goto	l717
u3390:
	line	53
	
l4865:	
;lcd.c: 53: RD2=0;
	bcf	(66/8),(66)&7
	goto	l4867
	line	54
	
l717:	
	line	55
;lcd.c: 54: else
;lcd.c: 55: RD2=1;
	bsf	(66/8),(66)&7
	goto	l4867
	
l718:	
	line	56
	
l4867:	
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
	global	___lwtoft
psect	text424,local,class=CODE,delta=2
global __ptext424
__ptext424:

;; *************** function ___lwtoft *****************
;; Defined at:
;;		line 29 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwtoft.c"
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
psect	text424
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwtoft.c"
	line	29
	global	__size_of___lwtoft
	__size_of___lwtoft	equ	__end_of___lwtoft-___lwtoft
	
___lwtoft:	
	opt	stack 6
; Regs used in ___lwtoft: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l4839:	
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
	goto	l3080
	
l4841:	
	line	31
	
l3080:	
	return
	opt stack 0
GLOBAL	__end_of___lwtoft
	__end_of___lwtoft:
;; =============== function ___lwtoft ends ============

	signat	___lwtoft,4219
	global	___ftmul
psect	text425,local,class=CODE,delta=2
global __ptext425
__ptext425:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftmul.c"
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
psect	text425
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 6
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l4789:	
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
	goto	u3231
	goto	u3230
u3231:
	goto	l4795
u3230:
	line	57
	
l4791:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l2956
	
l4793:	
	goto	l2956
	
l2955:	
	line	58
	
l4795:	
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
	goto	u3241
	goto	u3240
u3241:
	goto	l4801
u3240:
	line	59
	
l4797:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l2956
	
l4799:	
	goto	l2956
	
l2957:	
	line	60
	
l4801:	
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
u3255:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3250:
	addlw	-1
	skipz
	goto	u3255
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
u3265:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3260:
	addlw	-1
	skipz
	goto	u3265
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
	
l4803:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l4805:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l4807:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l4809:	
	movlw	0
	movwf	(___ftmul@f3_as_product)
	movlw	0
	movwf	(___ftmul@f3_as_product+1)
	movlw	0
	movwf	(___ftmul@f3_as_product+2)
	line	69
	
l4811:	
	movlw	(07h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l4813
	line	70
	
l2958:	
	line	71
	
l4813:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3271
	goto	u3270
u3271:
	goto	l4817
u3270:
	line	72
	
l4815:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3281
	addwf	(___ftmul@f3_as_product+1),f
u3281:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3282
	addwf	(___ftmul@f3_as_product+2),f
u3282:

	goto	l4817
	
l2959:	
	line	73
	
l4817:	
	movlw	01h
u3295:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3295

	line	74
	
l4819:	
	movlw	01h
u3305:
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	addlw	-1
	skipz
	goto	u3305
	line	75
	
l4821:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3311
	goto	u3310
u3311:
	goto	l4813
u3310:
	goto	l4823
	
l2960:	
	line	76
	
l4823:	
	movlw	(09h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l4825
	line	77
	
l2961:	
	line	78
	
l4825:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3321
	goto	u3320
u3321:
	goto	l4829
u3320:
	line	79
	
l4827:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3331
	addwf	(___ftmul@f3_as_product+1),f
u3331:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3332
	addwf	(___ftmul@f3_as_product+2),f
u3332:

	goto	l4829
	
l2962:	
	line	80
	
l4829:	
	movlw	01h
u3345:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3345

	line	81
	
l4831:	
	movlw	01h
u3355:
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	addlw	-1
	skipz
	goto	u3355

	line	82
	
l4833:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3361
	goto	u3360
u3361:
	goto	l4825
u3360:
	goto	l4835
	
l2963:	
	line	83
	
l4835:	
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
	goto	l2956
	
l4837:	
	line	84
	
l2956:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	_utoa
psect	text426,local,class=CODE,delta=2
global __ptext426
__ptext426:

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
psect	text426
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
	
l4763:	
	movf	(utoa@val+1),w
	clrf	(utoa@v+1)
	addwf	(utoa@v+1)
	movf	(utoa@val),w
	clrf	(utoa@v)
	addwf	(utoa@v)

	goto	l4765
	line	23
	
l2843:	
	line	24
	
l4765:	
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
	
l4767:	
	movlw	(01h)
	movwf	(??_utoa+0)+0
	movf	(??_utoa+0)+0,w
	addwf	(utoa@buf),f
	line	26
	
l4769:	
	movf	((utoa@v+1)),w
	iorwf	((utoa@v)),w
	skipz
	goto	u3201
	goto	u3200
u3201:
	goto	l4765
u3200:
	goto	l4771
	
l2844:	
	line	27
	
l4771:	
	movf	(utoa@buf),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	
l4773:	
	movlw	low(01h)
	subwf	(utoa@buf),f
	goto	l4775
	line	28
	
l2845:	
	line	29
	
l4775:	
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
	
l4777:	
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
	
l4779:	
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(utoa@c),w
	skipc
	goto	u3211
	goto	u3210
u3211:
	goto	l2846
u3210:
	line	32
	
l4781:	
	movlw	(07h)
	movwf	(??_utoa+0)+0
	movf	(??_utoa+0)+0,w
	addwf	(utoa@c),f
	
l2846:	
	line	33
	movlw	(030h)
	movwf	(??_utoa+0)+0
	movf	(??_utoa+0)+0,w
	addwf	(utoa@c),f
	line	34
	
l4783:	
	movf	(utoa@c),w
	movwf	(??_utoa+0)+0
	movf	(utoa@buf),w
	movwf	fsr0
	movf	(??_utoa+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l4785:	
	movlw	low(01h)
	subwf	(utoa@buf),f
	line	35
	
l4787:	
	movf	((utoa@val+1)),w
	iorwf	((utoa@val)),w
	skipz
	goto	u3221
	goto	u3220
u3221:
	goto	l4775
u3220:
	goto	l2848
	
l2847:	
	line	37
;	Return value of _utoa is never used
	
l2848:	
	return
	opt stack 0
GLOBAL	__end_of_utoa
	__end_of_utoa:
;; =============== function _utoa ends ============

	signat	_utoa,12409
	global	_read_adc
psect	text427,local,class=CODE,delta=2
global __ptext427
__ptext427:

;; *************** function _read_adc *****************
;; Defined at:
;;		line 16 in file "F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\my_adc.c"
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
psect	text427
	file	"F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\my_adc.c"
	line	16
	global	__size_of_read_adc
	__size_of_read_adc	equ	__end_of_read_adc-_read_adc
	
_read_adc:	
	opt	stack 6
; Regs used in _read_adc: [wreg+status,2+status,0+pclath+cstack]
;read_adc@channel stored from wreg
	movwf	(read_adc@channel)
	line	17
	
l4749:	
;my_adc.c: 17: unsigned int adc_value=0;
	clrf	(read_adc@adc_value)
	clrf	(read_adc@adc_value+1)
	line	18
	
l4751:	
;my_adc.c: 18: ADCON0 = ADCON0|(channel << 3);
	movf	(read_adc@channel),w
	movwf	(??_read_adc+0)+0
	movlw	(03h)-1
u3185:
	clrc
	rlf	(??_read_adc+0)+0,f
	addlw	-1
	skipz
	goto	u3185
	clrc
	rlf	(??_read_adc+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	(31),w	;volatile
	movwf	(31)	;volatile
	line	19
	
l4753:	
;my_adc.c: 19: DelayMs(50);
	movlw	(032h)
	fcall	_DelayMs
	line	20
	
l4755:	
;my_adc.c: 20: GO = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7
	line	21
;my_adc.c: 21: while(GO);
	goto	l2157
	
l2158:	
	
l2157:	
	btfsc	(250/8),(250)&7
	goto	u3191
	goto	u3190
u3191:
	goto	l2157
u3190:
	goto	l4757
	
l2159:	
	line	22
	
l4757:	
;my_adc.c: 22: adc_value = ADRESH;
	movf	(30),w	;volatile
	movwf	(??_read_adc+0)+0
	clrf	(??_read_adc+0)+0+1
	movf	0+(??_read_adc+0)+0,w
	movwf	(read_adc@adc_value)
	movf	1+(??_read_adc+0)+0,w
	movwf	(read_adc@adc_value+1)
	line	23
;my_adc.c: 23: adc_value = (adc_value << 8) | ADRESL;
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
	line	24
	
l4759:	
;my_adc.c: 24: return(adc_value);
	movf	(read_adc@adc_value+1),w
	clrf	(?_read_adc+1)
	addwf	(?_read_adc+1)
	movf	(read_adc@adc_value),w
	clrf	(?_read_adc)
	addwf	(?_read_adc)

	goto	l2160
	
l4761:	
	line	26
	
l2160:	
	return
	opt stack 0
GLOBAL	__end_of_read_adc
	__end_of_read_adc:
;; =============== function _read_adc ends ============

	signat	_read_adc,4218
	global	_LCD_STROBE
psect	text428,local,class=CODE,delta=2
global __ptext428
__ptext428:

;; *************** function _LCD_STROBE *****************
;; Defined at:
;;		line 32 in file "F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\lcd.c"
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
psect	text428
	file	"F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\lcd.c"
	line	32
	global	__size_of_LCD_STROBE
	__size_of_LCD_STROBE	equ	__end_of_LCD_STROBE-_LCD_STROBE
	
_LCD_STROBE:	
	opt	stack 5
; Regs used in _LCD_STROBE: [wreg]
	line	33
	
l4743:	
;lcd.c: 33: RD3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(67/8),(67)&7
	line	34
	
l4745:	
;lcd.c: 34: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_LCD_STROBE+0)+0+1),f
	movlw	251
movwf	((??_LCD_STROBE+0)+0),f
u3437:
	decfsz	((??_LCD_STROBE+0)+0),f
	goto	u3437
	decfsz	((??_LCD_STROBE+0)+0+1),f
	goto	u3437
	nop2
opt asmopt_on

	line	35
	
l4747:	
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
	global	___fttol
psect	text429,local,class=CODE,delta=2
global __ptext429
__ptext429:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\fttol.c"
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
psect	text429
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 7
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l4637:	
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
	goto	u3001
	goto	u3000
u3001:
	goto	l4643
u3000:
	line	50
	
l4639:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l2967
	
l4641:	
	goto	l2967
	
l2966:	
	line	51
	
l4643:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u3015:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u3010:
	addlw	-1
	skipz
	goto	u3015
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l4645:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l4647:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l4649:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l4651:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l4653:	
	btfss	(___fttol@exp1),7
	goto	u3021
	goto	u3020
u3021:
	goto	l4663
u3020:
	line	57
	
l4655:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u3031
	goto	u3030
u3031:
	goto	l4661
u3030:
	line	58
	
l4657:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l2967
	
l4659:	
	goto	l2967
	
l2969:	
	goto	l4661
	line	59
	
l2970:	
	line	60
	
l4661:	
	movlw	01h
u3045:
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	addlw	-1
	skipz
	goto	u3045

	line	61
	movlw	(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u3051
	goto	u3050
u3051:
	goto	l4661
u3050:
	goto	l4673
	
l2971:	
	line	62
	goto	l4673
	
l2968:	
	line	63
	
l4663:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u3061
	goto	u3060
u3061:
	goto	l4671
u3060:
	line	64
	
l4665:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l2967
	
l4667:	
	goto	l2967
	
l2973:	
	line	65
	goto	l4671
	
l2975:	
	line	66
	
l4669:	
	movlw	01h
	movwf	(??___fttol+0)+0
u3075:
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	(??___fttol+0)+0
	goto	u3075
	line	67
	movlw	low(01h)
	subwf	(___fttol@exp1),f
	goto	l4671
	line	68
	
l2974:	
	line	65
	
l4671:	
	movf	(___fttol@exp1),f
	skipz
	goto	u3081
	goto	u3080
u3081:
	goto	l4669
u3080:
	goto	l4673
	
l2976:	
	goto	l4673
	line	69
	
l2972:	
	line	70
	
l4673:	
	movf	(___fttol@sign1),w
	skipz
	goto	u3090
	goto	l4677
u3090:
	line	71
	
l4675:	
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
	goto	l4677
	
l2977:	
	line	72
	
l4677:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	goto	l2967
	
l4679:	
	line	73
	
l2967:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text430,local,class=CODE,delta=2
global __ptext430
__ptext430:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\float.c"
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
psect	text430
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 6
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l4563:	
	movf	(___ftpack@exp),w
	skipz
	goto	u2810
	goto	l4567
u2810:
	
l4565:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u2821
	goto	u2820
u2821:
	goto	l4573
u2820:
	goto	l4567
	
l3191:	
	line	65
	
l4567:	
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	goto	l3192
	
l4569:	
	goto	l3192
	
l3189:	
	line	66
	goto	l4573
	
l3194:	
	line	67
	
l4571:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
	movlw	01h
u2835:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2835

	goto	l4573
	line	69
	
l3193:	
	line	66
	
l4573:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2841
	goto	u2840
u2841:
	goto	l4571
u2840:
	goto	l3196
	
l3195:	
	line	70
	goto	l3196
	
l3197:	
	line	71
	
l4575:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
l4577:	
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
	
l4579:	
	movlw	01h
u2855:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2855

	line	74
	
l3196:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2861
	goto	u2860
u2861:
	goto	l4575
u2860:
	goto	l4583
	
l3198:	
	line	75
	goto	l4583
	
l3200:	
	line	76
	
l4581:	
	movlw	low(01h)
	subwf	(___ftpack@exp),f
	line	77
	movlw	01h
u2875:
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	addlw	-1
	skipz
	goto	u2875
	goto	l4583
	line	78
	
l3199:	
	line	75
	
l4583:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u2881
	goto	u2880
u2881:
	goto	l4581
u2880:
	
l3201:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u2891
	goto	u2890
u2891:
	goto	l3202
u2890:
	line	80
	
l4585:	
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
l3202:	
	line	81
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
l4587:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u2905:
	clrc
	rlf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u2900:
	addlw	-1
	skipz
	goto	u2905
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l4589:	
	movf	(___ftpack@sign),w
	skipz
	goto	u2910
	goto	l3203
u2910:
	line	84
	
l4591:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l3203:	
	line	85
	line	86
	
l3192:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	___lwmod
psect	text431,local,class=CODE,delta=2
global __ptext431
__ptext431:

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
psect	text431
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 5
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l4471:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u2511
	goto	u2510
u2511:
	goto	l4489
u2510:
	line	9
	
l4473:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l4479
	
l2875:	
	line	11
	
l4475:	
	movlw	01h
	
u2525:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2525
	line	12
	
l4477:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l4479
	line	13
	
l2874:	
	line	10
	
l4479:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u2531
	goto	u2530
u2531:
	goto	l4475
u2530:
	goto	l4481
	
l2876:	
	goto	l4481
	line	14
	
l2877:	
	line	15
	
l4481:	
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
	goto	l4485
u2540:
	line	16
	
l4483:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l4485
	
l2878:	
	line	17
	
l4485:	
	movlw	01h
	
u2555:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u2555
	line	18
	
l4487:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u2561
	goto	u2560
u2561:
	goto	l4481
u2560:
	goto	l4489
	
l2879:	
	goto	l4489
	line	19
	
l2873:	
	line	20
	
l4489:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l2880
	
l4491:	
	line	21
	
l2880:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text432,local,class=CODE,delta=2
global __ptext432
__ptext432:

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
psect	text432
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 5
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l4445:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l4447:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2441
	goto	u2440
u2441:
	goto	l4467
u2440:
	line	11
	
l4449:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l4455
	
l2865:	
	line	13
	
l4451:	
	movlw	01h
	
u2455:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2455
	line	14
	
l4453:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l4455
	line	15
	
l2864:	
	line	12
	
l4455:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2461
	goto	u2460
u2461:
	goto	l4451
u2460:
	goto	l4457
	
l2866:	
	goto	l4457
	line	16
	
l2867:	
	line	17
	
l4457:	
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
	goto	l4463
u2480:
	line	19
	
l4459:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l4461:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l4463
	line	21
	
l2868:	
	line	22
	
l4463:	
	movlw	01h
	
u2495:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2495
	line	23
	
l4465:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2501
	goto	u2500
u2501:
	goto	l4457
u2500:
	goto	l4467
	
l2869:	
	goto	l4467
	line	24
	
l2863:	
	line	25
	
l4467:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l2870
	
l4469:	
	line	26
	
l2870:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_init_adc
psect	text433,local,class=CODE,delta=2
global __ptext433
__ptext433:

;; *************** function _init_adc *****************
;; Defined at:
;;		line 7 in file "F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\my_adc.c"
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
psect	text433
	file	"F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\my_adc.c"
	line	7
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 7
; Regs used in _init_adc: [wreg]
	line	8
	
l4443:	
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
	
l2154:	
	return
	opt stack 0
GLOBAL	__end_of_init_adc
	__end_of_init_adc:
;; =============== function _init_adc ends ============

	signat	_init_adc,88
	global	_DelayMs
psect	text434,local,class=CODE,delta=2
global __ptext434
__ptext434:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 12 in file "F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\delay.c"
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
psect	text434
	file	"F:\Prolific\pic_s\pic_pgm\12.2 adc lm35(temp)_10bit - Copy\program\delay.c"
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
	
l4397:	
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
	goto	l4399
	
l6:	
	goto	l4399
	
l5:	
	
l4399:	
	movlw	low(01h)
	subwf	(DelayMs@_dcnt),f
	btfss	status,2
	goto	u2381
	goto	u2380
u2381:
	goto	l4399
u2380:
	goto	l4401
	
l7:	
	line	25
	
l4401:	
;delay.c: 25: } while(--i);
	movlw	low(01h)
	subwf	(DelayMs@i),f
	btfss	status,2
	goto	u2391
	goto	u2390
u2391:
	goto	l4
u2390:
	goto	l4403
	
l8:	
	line	26
	
l4403:	
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
psect	text435,local,class=CODE,delta=2
global __ptext435
__ptext435:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
