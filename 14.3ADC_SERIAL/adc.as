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
	FNCALL	_main,_adc_init
	FNCALL	_main,_read_adc
	FNCALL	_main,___lwdiv
	FNCALL	_main,___wmul
	FNCALL	_main,_sci_puts
	FNCALL	_main,_sci_putch
	FNCALL	_main,_delay
	FNCALL	_sci_puts,_sci_putch
	FNCALL	_delay,_DelayMs
	FNROOT	_main
	global	_chs0
	global	_chs1
	global	_chs2
	global	_mode
	global	_ADC_value
psect	nvBANK0,class=BANK0,space=1
global __pnvBANK0
__pnvBANK0:
_ADC_value:
       ds      2

	global	_digit1
_digit1:
       ds      2

	global	_digit2
_digit2:
       ds      2

	global	_digit3
_digit3:
       ds      2

	global	_digit4
_digit4:
       ds      2

	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTD
_PORTD	set	8
	global	_RCREG
_RCREG	set	26
	global	_TXREG
_TXREG	set	25
	global	_ADGO
_ADGO	set	250
	global	_ADIF
_ADIF	set	102
	global	_ADON
_ADON	set	248
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
	global	_ADCON1
_ADCON1	set	159
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
	retlw	97	;'a'
	retlw	100	;'d'
	retlw	99	;'c'
	retlw	58	;':'
	retlw	0
psect	strings
	file	"adc.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssBANK0,class=BANK0,bit,space=1
global __pbitbssBANK0
__pbitbssBANK0:
_chs0:
       ds      1

_chs1:
       ds      1

_chs2:
       ds      1

_mode:
       ds      1

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
	global	?_adc_init
?_adc_init:	; 0 bytes @ 0x0
	global	??_adc_init
??_adc_init:	; 0 bytes @ 0x0
	global	?_DelayMs
?_DelayMs:	; 0 bytes @ 0x0
	global	??_DelayMs
??_DelayMs:	; 0 bytes @ 0x0
	global	?_sci_init
?_sci_init:	; 0 bytes @ 0x0
	global	?_sci_putch
?_sci_putch:	; 0 bytes @ 0x0
	global	??_sci_putch
??_sci_putch:	; 0 bytes @ 0x0
	global	?_sci_puts
?_sci_puts:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_read_adc
?_read_adc:	; 2 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	sci_putch@byte
sci_putch@byte:	; 1 bytes @ 0x0
	global	sci_init@bd_rt
sci_init@bd_rt:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	ds	1
	global	??_sci_puts
??_sci_puts:	; 0 bytes @ 0x1
	global	DelayMs@cnt
DelayMs@cnt:	; 1 bytes @ 0x1
	ds	1
	global	??_read_adc
??_read_adc:	; 0 bytes @ 0x2
	global	??_sci_init
??_sci_init:	; 0 bytes @ 0x2
	global	DelayMs@i
DelayMs@i:	; 1 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	ds	1
	global	DelayMs@_dcnt
DelayMs@_dcnt:	; 1 bytes @ 0x3
	global	sci_puts@aa
sci_puts@aa:	; 1 bytes @ 0x3
	ds	1
	global	?_delay
?_delay:	; 0 bytes @ 0x4
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	read_adc@chnl
read_adc@chnl:	; 1 bytes @ 0x4
	global	delay@dly
delay@dly:	; 2 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x6
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x6
	global	delay@dly1
delay@dly1:	; 2 bytes @ 0x6
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x6
	ds	2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x8
	ds	2
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0xA
	ds	1
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0xB
	ds	2
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	6
;;Data sizes: Strings 5, constant 0, data 0, bss 0, persistent 10 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80      6      17
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?_read_adc	unsigned int  size(1) Largest target is 0
;;
;; sci_puts@aa	PTR const unsigned char  size(1) Largest target is 5
;;		 -> STR_1(CODE[5]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->___lwdiv
;;   _sci_puts->_sci_putch
;;   _delay->_DelayMs
;;   ___lwdiv->___wmul
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
;;Main: autosize = 0, tempsize = 6, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 8     8      0     501
;;                                              0 BANK0      6     6      0
;;                           _sci_init
;;                           _adc_init
;;                           _read_adc
;;                            ___lwdiv
;;                             ___wmul
;;                           _sci_puts
;;                          _sci_putch
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _sci_puts                                             3     3      0      67
;;                                              1 COMMON     3     3      0
;;                          _sci_putch
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                4     2      2     114
;;                                              4 COMMON     4     2      2
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (1) _read_adc                                             5     3      2      22
;;                                              0 COMMON     5     3      2
;; ---------------------------------------------------------------------------------
;; (1) ___lwdiv                                              8     4      4     162
;;                                              6 COMMON     8     4      4
;;                             ___wmul (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___wmul                                               6     2      4      92
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (1) _sci_putch                                            1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _sci_init                                             2     0      2      22
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _DelayMs                                              4     4      0      68
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _adc_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _sci_init
;;   _adc_init
;;   _read_adc
;;   ___lwdiv
;;     ___wmul (ARG)
;;   ___wmul
;;   _sci_puts
;;     _sci_putch
;;   _sci_putch
;;   _delay
;;     _DelayMs
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
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      1F       3        0.0%
;;BITBANK0            50      0       1       4        1.3%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      6      11       5       21.3%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      21      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 11 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  adcv            2    0        int 
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
;;      Temps:          0       6       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_sci_init
;;		_adc_init
;;		_read_adc
;;		___lwdiv
;;		___wmul
;;		_sci_puts
;;		_sci_putch
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\main.c"
	line	11
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	14
	
l4055:	
;main.c: 12: int adcv;
;main.c: 14: sci_init(25);
	movlw	low(019h)
	movwf	(?_sci_init)
	movlw	high(019h)
	movwf	((?_sci_init))+1
	fcall	_sci_init
	line	15
;main.c: 15: adc_init();
	fcall	_adc_init
	line	19
;main.c: 19: while(1)
	
l2363:	
	line	21
;main.c: 20: {
;main.c: 21: ADC_value=read_adc(0);
	movlw	(0)
	fcall	_read_adc
	movf	(1+(?_read_adc)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_ADC_value+1)
	addwf	(_ADC_value+1)
	movf	(0+(?_read_adc)),w
	clrf	(_ADC_value)
	addwf	(_ADC_value)

	line	23
;main.c: 23: digit1 = (unsigned int)(ADC_value/1000);
	movlw	low(03E8h)
	movwf	(?___lwdiv)
	movlw	high(03E8h)
	movwf	((?___lwdiv))+1
	movf	(_ADC_value+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_ADC_value),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_digit1+1)
	addwf	(_digit1+1)
	movf	(0+(?___lwdiv)),w
	clrf	(_digit1)
	addwf	(_digit1)

	line	24
;main.c: 24: digit2 = (unsigned int)((ADC_value - digit1*1000)/100);
	movlw	low(064h)
	movwf	(?___lwdiv)
	movlw	high(064h)
	movwf	((?___lwdiv))+1
	movf	(_digit1+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(_digit1),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(03E8h)
	movwf	0+(?___wmul)+02h
	movlw	high(03E8h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	comf	(0+(?___wmul)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	comf	(1+(?___wmul)),w
	movwf	((??_main+0)+0+1)
	incf	(??_main+0)+0,f
	skipnz
	incf	((??_main+0)+0+1),f
	movf	(_ADC_value),w
	addwf	0+(??_main+0)+0,w
	movwf	0+(?___lwdiv)+02h
	movf	(_ADC_value+1),w
	skipnc
	incf	(_ADC_value+1),w
	addwf	1+(??_main+0)+0,w
	movwf	1+0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_digit2+1)
	addwf	(_digit2+1)
	movf	(0+(?___lwdiv)),w
	clrf	(_digit2)
	addwf	(_digit2)

	line	25
;main.c: 25: digit3 = (unsigned int)((ADC_value - (digit1*1000+digit2*100))/10);
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	movf	(_digit1+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(_digit1),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(03E8h)
	movwf	0+(?___wmul)+02h
	movlw	high(03E8h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(0+?___wmul),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(1+?___wmul),w
	movwf	((??_main+0)+0+1)
	movf	(_digit2+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(_digit2),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(064h)
	movwf	0+(?___wmul)+02h
	movlw	high(064h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(0+(?___wmul)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	0+(??_main+0)+0,w
	movwf	(??_main+2)+0
	movf	(1+(?___wmul)),w
	skipnc
	incf	(1+(?___wmul)),w
	addwf	1+(??_main+0)+0,w
	movwf	1+(??_main+2)+0
	comf	(??_main+2)+0,f
	comf	(??_main+2)+1,f
	incf	(??_main+2)+0,f
	skipnz
	incf	(??_main+2)+1,f
	movf	(_ADC_value),w
	addwf	0+(??_main+2)+0,w
	movwf	0+(?___lwdiv)+02h
	movf	(_ADC_value+1),w
	skipnc
	incf	(_ADC_value+1),w
	addwf	1+(??_main+2)+0,w
	movwf	1+0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_digit3+1)
	addwf	(_digit3+1)
	movf	(0+(?___lwdiv)),w
	clrf	(_digit3)
	addwf	(_digit3)

	line	26
;main.c: 26: digit4 = (unsigned int)(ADC_value - (digit1*1000+digit2*100+digit3*10));
	movf	(_digit1+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(_digit1),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(03E8h)
	movwf	0+(?___wmul)+02h
	movlw	high(03E8h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(0+?___wmul),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(1+?___wmul),w
	movwf	((??_main+0)+0+1)
	movf	(_digit2+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(_digit2),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(064h)
	movwf	0+(?___wmul)+02h
	movlw	high(064h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(0+(?___wmul)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	0+(??_main+0)+0,w
	movwf	(??_main+2)+0
	movf	(1+(?___wmul)),w
	skipnc
	incf	(1+(?___wmul)),w
	addwf	1+(??_main+0)+0,w
	movwf	1+(??_main+2)+0
	movf	(_digit3+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(_digit3),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(0Ah)
	movwf	0+(?___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(0+(?___wmul)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	0+(??_main+2)+0,w
	movwf	(??_main+4)+0
	movf	(1+(?___wmul)),w
	skipnc
	incf	(1+(?___wmul)),w
	addwf	1+(??_main+2)+0,w
	movwf	1+(??_main+4)+0
	comf	(??_main+4)+0,f
	comf	(??_main+4)+1,f
	incf	(??_main+4)+0,f
	skipnz
	incf	(??_main+4)+1,f
	movf	(_ADC_value),w
	addwf	0+(??_main+4)+0,w
	movwf	(_digit4)
	movf	(_ADC_value+1),w
	skipnc
	incf	(_ADC_value+1),w
	addwf	1+(??_main+4)+0,w
	movwf	1+(_digit4)
	line	27
	
l4057:	
;main.c: 27: sci_puts("adc:");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_sci_puts
	line	28
	
l4059:	
;main.c: 28: sci_putch(digit1+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_digit1),w
	addlw	030h
	fcall	_sci_putch
	line	29
	
l4061:	
;main.c: 29: sci_putch(digit2+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_digit2),w
	addlw	030h
	fcall	_sci_putch
	line	30
	
l4063:	
;main.c: 30: sci_putch(digit3+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_digit3),w
	addlw	030h
	fcall	_sci_putch
	line	31
	
l4065:	
;main.c: 31: sci_putch(digit4+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_digit4),w
	addlw	030h
	fcall	_sci_putch
	line	33
	
l4067:	
;main.c: 33: delay(1);
	movlw	low(01h)
	movwf	(?_delay)
	movlw	high(01h)
	movwf	((?_delay))+1
	fcall	_delay
	line	34
	
l2364:	
	line	19
	goto	l2363
	
l2365:	
	line	35
	
l2366:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_sci_puts
psect	text248,local,class=CODE,delta=2
global __ptext248
__ptext248:

;; *************** function _sci_puts *****************
;; Defined at:
;;		line 34 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\sci.c"
;; Parameters:    Size  Location     Type
;;  aa              1    wreg     PTR const unsigned char 
;;		 -> STR_1(5), 
;; Auto vars:     Size  Location     Type
;;  aa              1    3[COMMON] PTR const unsigned char 
;;		 -> STR_1(5), 
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
psect	text248
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\sci.c"
	line	34
	global	__size_of_sci_puts
	__size_of_sci_puts	equ	__end_of_sci_puts-_sci_puts
	
_sci_puts:	
	opt	stack 7
; Regs used in _sci_puts: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;sci_puts@aa stored from wreg
	movwf	(sci_puts@aa)
	line	35
	
l4045:	
;sci.c: 35: while(*aa)
	goto	l1772
	
l1773:	
	line	37
	
l4047:	
;sci.c: 36: {
;sci.c: 37: sci_putch(*aa++);
	movf	(sci_puts@aa),w
	movwf	fsr0
	fcall	stringdir
	fcall	_sci_putch
	
l4049:	
	movlw	(01h)
	movwf	(??_sci_puts+0)+0
	movf	(??_sci_puts+0)+0,w
	addwf	(sci_puts@aa),f
	line	38
	
l4051:	
;sci.c: 38: _delay((unsigned long)((15)*(4000000/4000.0)));
	opt asmopt_off
movlw	20
movwf	((??_sci_puts+0)+0+1),f
	movlw	121
movwf	((??_sci_puts+0)+0),f
u2557:
	decfsz	((??_sci_puts+0)+0),f
	goto	u2557
	decfsz	((??_sci_puts+0)+0+1),f
	goto	u2557
	nop2
opt asmopt_on

	line	39
	
l1772:	
	line	35
	
l4053:	
	movf	(sci_puts@aa),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2541
	goto	u2540
u2541:
	goto	l1773
u2540:
	
l1774:	
	line	40
	
l1775:	
	return
	opt stack 0
GLOBAL	__end_of_sci_puts
	__end_of_sci_puts:
;; =============== function _sci_puts ends ============

	signat	_sci_puts,4216
	global	_delay
psect	text249,local,class=CODE,delta=2
global __ptext249
__ptext249:

;; *************** function _delay *****************
;; Defined at:
;;		line 31 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\delay.c"
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
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\delay.c"
	line	31
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg+status,2+status,0+pclath+cstack]
	line	33
	
l4037:	
;delay.c: 32: unsigned int dly1;
;delay.c: 33: for(dly1=0;dly1<dly;dly1++)
	movlw	low(0)
	movwf	(delay@dly1)
	movlw	high(0)
	movwf	((delay@dly1))+1
	goto	l586
	line	34
	
l587:	
	line	35
	
l4039:	
;delay.c: 34: {
;delay.c: 35: DelayMs(98);
	movlw	(062h)
	fcall	_DelayMs
	line	33
	
l4041:	
	movlw	low(01h)
	addwf	(delay@dly1),f
	skipnc
	incf	(delay@dly1+1),f
	movlw	high(01h)
	addwf	(delay@dly1+1),f
	
l586:	
	
l4043:	
	movf	(delay@dly+1),w
	subwf	(delay@dly1+1),w
	skipz
	goto	u2535
	movf	(delay@dly),w
	subwf	(delay@dly1),w
u2535:
	skipc
	goto	u2531
	goto	u2530
u2531:
	goto	l587
u2530:
	
l588:	
	line	37
	
l589:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_read_adc
psect	text250,local,class=CODE,delta=2
global __ptext250
__ptext250:

;; *************** function _read_adc *****************
;; Defined at:
;;		line 18 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\adc.c"
;; Parameters:    Size  Location     Type
;;  chnl            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  chnl            1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text250
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\adc.c"
	line	18
	global	__size_of_read_adc
	__size_of_read_adc	equ	__end_of_read_adc-_read_adc
	
_read_adc:	
	opt	stack 7
; Regs used in _read_adc: [wreg+status,2+status,0]
;read_adc@chnl stored from wreg
	movwf	(read_adc@chnl)
	line	19
	
l4023:	
;adc.c: 19: ADCON0=0B01000000|(chnl<<3);
	movf	(read_adc@chnl),w
	movwf	(??_read_adc+0)+0
	movlw	(03h)-1
u2515:
	clrc
	rlf	(??_read_adc+0)+0,f
	addlw	-1
	skipz
	goto	u2515
	clrc
	rlf	(??_read_adc+0)+0,w
	iorlw	040h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	20
	
l4025:	
;adc.c: 20: ADIF=0;
	bcf	(102/8),(102)&7
	line	21
	
l4027:	
;adc.c: 21: ADON=1;
	bsf	(248/8),(248)&7
	line	22
	
l4029:	
;adc.c: 22: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_read_adc+0)+0,f
u2567:
	clrwdt
decfsz	(??_read_adc+0)+0,f
	goto	u2567
	nop2	;nop
	clrwdt
opt asmopt_on

	line	23
	
l4031:	
;adc.c: 23: ADGO=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7
	line	24
;adc.c: 24: while(ADIF==0);
	goto	l570
	
l571:	
	
l570:	
	btfss	(102/8),(102)&7
	goto	u2521
	goto	u2520
u2521:
	goto	l571
u2520:
	
l572:	
	line	25
;adc.c: 25: ADGO=0;
	bcf	(250/8),(250)&7
	line	26
	
l4033:	
;adc.c: 26: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_read_adc+0)+0,f
u2577:
	clrwdt
decfsz	(??_read_adc+0)+0,f
	goto	u2577
	nop2	;nop
	clrwdt
opt asmopt_on

	line	28
;adc.c: 28: return(ADRESH);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(30),w	;volatile
	movwf	(??_read_adc+0)+0
	clrf	(??_read_adc+0)+0+1
	movf	0+(??_read_adc+0)+0,w
	movwf	(?_read_adc)
	movf	1+(??_read_adc+0)+0,w
	movwf	(?_read_adc+1)
	
l4035:	
	line	29
	
l573:	
	return
	opt stack 0
GLOBAL	__end_of_read_adc
	__end_of_read_adc:
;; =============== function _read_adc ends ============

	signat	_read_adc,4218
	global	___lwdiv
psect	text251,local,class=CODE,delta=2
global __ptext251
__ptext251:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    6[COMMON] unsigned int 
;;  dividend        2    8[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   11[COMMON] unsigned int 
;;  counter         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    6[COMMON] unsigned int 
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text251
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 7
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l3999:	
	movlw	low(0)
	movwf	(___lwdiv@quotient)
	movlw	high(0)
	movwf	((___lwdiv@quotient))+1
	line	10
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2441
	goto	u2440
u2441:
	goto	l2381
u2440:
	line	11
	
l4001:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l2382
	
l2383:	
	line	13
	
l4003:	
	movlw	01h
	
u2455:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2455
	line	14
	
l4005:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	line	15
	
l2382:	
	line	12
	
l4007:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2461
	goto	u2460
u2461:
	goto	l2383
u2460:
	
l2384:	
	line	16
	
l2385:	
	line	17
	
l4009:	
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
	goto	l2386
u2480:
	line	19
	
l4011:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l4013:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	21
	
l2386:	
	line	22
	
l4015:	
	movlw	01h
	
u2495:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2495
	line	23
	
l4017:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2501
	goto	u2500
u2501:
	goto	l2385
u2500:
	
l2387:	
	line	24
	
l2381:	
	line	25
	
l4019:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	
l4021:	
	line	26
	
l2388:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text252,local,class=CODE,delta=2
global __ptext252
__ptext252:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[COMMON] unsigned int 
;;  multiplicand    2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[COMMON] unsigned int 
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
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text252
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 7
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l3987:	
	movlw	low(0)
	movwf	(___wmul@product)
	movlw	high(0)
	movwf	((___wmul@product))+1
	line	6
	
l2375:	
	line	7
	
l3989:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l2376
u2400:
	line	8
	
l3991:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l2376:	
	line	9
	movlw	01h
	
u2415:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u2415
	line	10
	
l3993:	
	movlw	01h
	
u2425:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u2425
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u2431
	goto	u2430
u2431:
	goto	l2375
u2430:
	
l2377:	
	line	12
	
l3995:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	
l3997:	
	line	13
	
l2378:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_sci_putch
psect	text253,local,class=CODE,delta=2
global __ptext253
__ptext253:

;; *************** function _sci_putch *****************
;; Defined at:
;;		line 27 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\sci.c"
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
psect	text253
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\sci.c"
	line	27
	global	__size_of_sci_putch
	__size_of_sci_putch	equ	__end_of_sci_putch-_sci_putch
	
_sci_putch:	
	opt	stack 7
; Regs used in _sci_putch: [wreg]
;sci_putch@byte stored from wreg
	movwf	(sci_putch@byte)
	line	28
	
l3983:	
;sci.c: 28: while(!TXIF)
	goto	l1766
	
l1767:	
	line	29
;sci.c: 29: continue;
	
l1766:	
	line	28
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(100/8),(100)&7
	goto	u2391
	goto	u2390
u2391:
	goto	l1767
u2390:
	
l1768:	
	line	30
	
l3985:	
;sci.c: 30: TXREG=byte;
	movf	(sci_putch@byte),w
	movwf	(25)	;volatile
	line	31
	
l1769:	
	return
	opt stack 0
GLOBAL	__end_of_sci_putch
	__end_of_sci_putch:
;; =============== function _sci_putch ends ============

	signat	_sci_putch,4216
	global	_sci_init
psect	text254,local,class=CODE,delta=2
global __ptext254
__ptext254:

;; *************** function _sci_init *****************
;; Defined at:
;;		line 11 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\sci.c"
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
psect	text254
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\sci.c"
	line	11
	global	__size_of_sci_init
	__size_of_sci_init	equ	__end_of_sci_init-_sci_init
	
_sci_init:	
	opt	stack 7
; Regs used in _sci_init: [wreg]
	line	12
	
l3969:	
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
	
l3971:	
;sci.c: 18: SPBRG=bd_rt;
	movf	(sci_init@bd_rt),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	19
	
l3973:	
;sci.c: 19: RCIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(101/8),(101)&7
	line	20
	
l3975:	
;sci.c: 20: TXEN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1221/8)^080h,(1221)&7
	line	21
	
l3977:	
;sci.c: 21: TXIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(100/8),(100)&7
	line	22
	
l3979:	
;sci.c: 22: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	23
	
l3981:	
;sci.c: 23: RCIE=0;
	bcf	(1125/8)^080h,(1125)&7
	line	24
	
l1763:	
	return
	opt stack 0
GLOBAL	__end_of_sci_init
	__end_of_sci_init:
;; =============== function _sci_init ends ============

	signat	_sci_init,4216
	global	_DelayMs
psect	text255,local,class=CODE,delta=2
global __ptext255
__ptext255:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 12 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\delay.c"
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
psect	text255
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\delay.c"
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
	
l576:	
	line	22
	
l3861:	
;delay.c: 22: i = 4;
	movlw	(04h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(DelayMs@i)
	line	23
;delay.c: 23: do {
	
l577:	
	line	24
;delay.c: 24: { unsigned char _dcnt; _dcnt = (250)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(053h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(DelayMs@_dcnt)
	goto	l578
	
l579:	
	
l578:	
	
l3863:	
	movlw	low(01h)
	subwf	(DelayMs@_dcnt),f
	btfss	status,2
	goto	u2301
	goto	u2300
u2301:
	goto	l579
u2300:
	
l580:	
	line	25
	
l3865:	
;delay.c: 25: } while(--i);
	movlw	low(01h)
	subwf	(DelayMs@i),f
	btfss	status,2
	goto	u2311
	goto	u2310
u2311:
	goto	l577
u2310:
	
l581:	
	line	26
	
l3867:	
;delay.c: 26: } while(--cnt);
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u2321
	goto	u2320
u2321:
	goto	l576
u2320:
	
l582:	
	line	28
	
l583:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
	global	_adc_init
psect	text256,local,class=CODE,delta=2
global __ptext256
__ptext256:

;; *************** function _adc_init *****************
;; Defined at:
;;		line 12 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\adc.c"
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
psect	text256
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S\14.3ADC_SERIAL\adc.c"
	line	12
	global	__size_of_adc_init
	__size_of_adc_init	equ	__end_of_adc_init-_adc_init
	
_adc_init:	
	opt	stack 7
; Regs used in _adc_init: [wreg]
	line	13
	
l3859:	
;adc.c: 13: ADCON0=0B01000000;
	movlw	(040h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	14
;adc.c: 14: ADCON1=(0B00000000|(0<<7))|0B1001;
	movlw	(09h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	15
	
l567:	
	return
	opt stack 0
GLOBAL	__end_of_adc_init
	__end_of_adc_init:
;; =============== function _adc_init ends ============

	signat	_adc_init,88
psect	text257,local,class=CODE,delta=2
global __ptext257
__ptext257:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
