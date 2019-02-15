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
	FNCALL	_main,_DelayMs
	FNROOT	_main
	global	_count
	global	_PORTC
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RC3
_RC3	set	59
	global	_RD0
_RD0	set	64
	global	_TRISC
_TRISC	set	135
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
	file	"EF.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_count:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_DelayMs
?_DelayMs:	; 0 bytes @ 0x0
	global	??_DelayMs
??_DelayMs:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	1
	global	DelayMs@cnt
DelayMs@cnt:	; 1 bytes @ 0x1
	ds	1
	global	DelayMs@i
DelayMs@i:	; 1 bytes @ 0x2
	ds	1
	global	DelayMs@_dcnt
DelayMs@_dcnt:	; 1 bytes @ 0x3
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x4
;;Data sizes: Strings 0, constant 0, data 0, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4       6
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_DelayMs
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
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0      45
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (1) _DelayMs                                              4     4      0      45
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DelayMs
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      4       6       1       42.9%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       6       3        0.0%
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
;;DATA                 0      0       7      12        0.0%

	global	_main
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 9 in file "F:\Prolific\pic_s\pic_pgm\6   TWO KEY PRESS ON TWO KEY PRESS OFF\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayMs
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"F:\Prolific\pic_s\pic_pgm\6   TWO KEY PRESS ON TWO KEY PRESS OFF\main.c"
	line	9
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	10
	
l2634:	
;main.c: 10: TRISC=0X0f;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	11
	
l2636:	
;main.c: 11: PORTC=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	12
	
l2638:	
;main.c: 12: TRISD=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	13
	
l2640:	
;main.c: 13: PORTD=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	goto	l2642
	line	14
;main.c: 14: while(1)
	
l705:	
	line	16
	
l2642:	
;main.c: 15: {
;main.c: 16: if(RC3==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(59/8),(59)&7
	goto	u2261
	goto	u2260
u2261:
	goto	l2650
u2260:
	goto	l707
	line	18
	
l2644:	
;main.c: 17: {
;main.c: 18: while(RC3==1);
	goto	l707
	
l708:	
	
l707:	
	btfsc	(59/8),(59)&7
	goto	u2271
	goto	u2270
u2271:
	goto	l707
u2270:
	goto	l2646
	
l709:	
	line	19
	
l2646:	
;main.c: 19: DelayMs(30);
	movlw	(01Eh)
	fcall	_DelayMs
	line	20
	
l2648:	
;main.c: 20: count++;
	movlw	low(01h)
	addwf	(_count),f
	skipnc
	incf	(_count+1),f
	movlw	high(01h)
	addwf	(_count+1),f
	goto	l2650
	line	21
	
l706:	
	line	22
	
l2650:	
;main.c: 21: }
;main.c: 22: if(count==2)
	movlw	02h
	xorwf	(_count),w
	iorwf	(_count+1),w
	skipz
	goto	u2281
	goto	u2280
u2281:
	goto	l2642
u2280:
	line	24
	
l2652:	
;main.c: 23: {
;main.c: 24: count=0;
	clrf	(_count)
	clrf	(_count+1)
	line	25
	
l2654:	
;main.c: 25: RD0=!RD0;
	movlw	1<<((64)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((64)/8),f
	goto	l2642
	line	26
	
l710:	
	goto	l2642
	line	28
	
l711:	
	line	14
	goto	l2642
	
l712:	
	line	29
	
l713:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_DelayMs
psect	text72,local,class=CODE,delta=2
global __ptext72
__ptext72:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 12 in file "F:\Prolific\pic_s\pic_pgm\6   TWO KEY PRESS ON TWO KEY PRESS OFF\delay.c"
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
psect	text72
	file	"F:\Prolific\pic_s\pic_pgm\6   TWO KEY PRESS ON TWO KEY PRESS OFF\delay.c"
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
	
l1760:	
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
	goto	l1762
	
l6:	
	goto	l1762
	
l5:	
	
l1762:	
	movlw	low(01h)
	subwf	(DelayMs@_dcnt),f
	btfss	status,2
	goto	u11
	goto	u10
u11:
	goto	l1762
u10:
	goto	l1764
	
l7:	
	line	25
	
l1764:	
;delay.c: 25: } while(--i);
	movlw	low(01h)
	subwf	(DelayMs@i),f
	btfss	status,2
	goto	u21
	goto	u20
u21:
	goto	l4
u20:
	goto	l1766
	
l8:	
	line	26
	
l1766:	
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
psect	text73,local,class=CODE,delta=2
global __ptext73
__ptext73:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
