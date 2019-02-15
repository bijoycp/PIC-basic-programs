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
	FNCALL	_main,_interrupt_ini
	FNCALL	_main,_DelayMs
	FNROOT	_main
	FNCALL	_abc,i1_DelayMs
	FNCALL	intlevel1,_abc
	global	intlevel1
	FNROOT	intlevel1
	global	_PORTB
psect	text139,local,class=CODE,delta=2
global __ptext139
__ptext139:
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_TRISB
_TRISB	set	134
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
	file	"FRR.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_interrupt_ini
?_interrupt_ini:	; 0 bytes @ 0x0
	global	?_DelayMs
?_DelayMs:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_abc
?_abc:	; 0 bytes @ 0x0
	global	?i1_DelayMs
?i1_DelayMs:	; 0 bytes @ 0x0
	global	??i1_DelayMs
??i1_DelayMs:	; 0 bytes @ 0x0
	ds	1
	global	i1DelayMs@cnt
i1DelayMs@cnt:	; 1 bytes @ 0x1
	ds	1
	global	i1DelayMs@i
i1DelayMs@i:	; 1 bytes @ 0x2
	ds	1
	global	i1DelayMs@_dcnt
i1DelayMs@_dcnt:	; 1 bytes @ 0x3
	ds	1
	global	??_abc
??_abc:	; 0 bytes @ 0x4
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_interrupt_ini
??_interrupt_ini:	; 0 bytes @ 0x0
	global	??_DelayMs
??_DelayMs:	; 0 bytes @ 0x0
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
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8       8
;; BANK0           80      4       4
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _abc in COMMON
;;
;;   _abc->i1_DelayMs
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_DelayMs
;;
;; Critical Paths under _abc in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _abc in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _abc in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _abc in BANK2
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
;; (0) _main                                                 0     0      0      68
;;                      _interrupt_ini
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (1) _interrupt_ini                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _DelayMs                                              4     4      0      68
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _abc                                                  4     4      0     223
;;                                              4 COMMON     4     4      0
;;                          i1_DelayMs
;; ---------------------------------------------------------------------------------
;; (3) i1_DelayMs                                            4     4      0     223
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _interrupt_ini
;;   _DelayMs
;;
;; _abc (ROOT)
;;   i1_DelayMs
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      8       8       1       57.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       5       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      4       4       5        5.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 8 in file "F:\Prolific\pic_s\pic_pgm\11  RB0INTERRUPT\main.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_interrupt_ini
;;		_DelayMs
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"F:\Prolific\pic_s\pic_pgm\11  RB0INTERRUPT\main.c"
	line	8
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	9
	
l2718:	
;main.c: 9: TRISB=0XFF;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	10
	
l2720:	
;main.c: 10: PORTB=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	11
	
l2722:	
;main.c: 11: TRISD=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	12
	
l2724:	
;main.c: 12: PORTD=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	13
	
l2726:	
;main.c: 13: interrupt_ini();
	fcall	_interrupt_ini
	goto	l2728
	line	14
;main.c: 14: while(1)
	
l705:	
	line	16
	
l2728:	
;main.c: 15: {
;main.c: 16: RD0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	17
	
l2730:	
;main.c: 17: DelayMs(100);
	movlw	(064h)
	fcall	_DelayMs
	line	18
	
l2732:	
;main.c: 18: RD0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	19
	
l2734:	
;main.c: 19: DelayMs(100);
	movlw	(064h)
	fcall	_DelayMs
	goto	l2728
	line	20
	
l706:	
	line	14
	goto	l2728
	
l707:	
	line	21
	
l708:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_interrupt_ini
psect	text140,local,class=CODE,delta=2
global __ptext140
__ptext140:

;; *************** function _interrupt_ini *****************
;; Defined at:
;;		line 24 in file "F:\Prolific\pic_s\pic_pgm\11  RB0INTERRUPT\main.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text140
	file	"F:\Prolific\pic_s\pic_pgm\11  RB0INTERRUPT\main.c"
	line	24
	global	__size_of_interrupt_ini
	__size_of_interrupt_ini	equ	__end_of_interrupt_ini-_interrupt_ini
	
_interrupt_ini:	
	opt	stack 5
; Regs used in _interrupt_ini: []
	line	25
	
l2698:	
;main.c: 25: GIE=1;
	bsf	(95/8),(95)&7
	line	26
;main.c: 26: INTE=1;
	bsf	(92/8),(92)&7
	line	27
;main.c: 27: INTF=0;
	bcf	(89/8),(89)&7
	line	28
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_interrupt_ini
	__end_of_interrupt_ini:
;; =============== function _interrupt_ini ends ============

	signat	_interrupt_ini,88
	global	_DelayMs
psect	text141,local,class=CODE,delta=2
global __ptext141
__ptext141:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 12 in file "F:\Prolific\pic_s\pic_pgm\11  RB0INTERRUPT\delay.c"
;; Parameters:    Size  Location     Type
;;  cnt             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cnt             1    1[BANK0 ] unsigned char 
;;  _dcnt           1    3[BANK0 ] unsigned char 
;;  i               1    2[BANK0 ] unsigned char 
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
;;      Locals:         0       3       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_delay
;; This function uses a non-reentrant model
;;
psect	text141
	file	"F:\Prolific\pic_s\pic_pgm\11  RB0INTERRUPT\delay.c"
	line	12
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 5
; Regs used in _DelayMs: [wreg+status,2+status,0]
;DelayMs@cnt stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(DelayMs@cnt)
	line	21
;delay.c: 20: unsigned char i;
;delay.c: 21: do {
	
l3:	
	line	22
	
l2682:	
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
	goto	l2684
	
l6:	
	goto	l2684
	
l5:	
	
l2684:	
	movlw	low(01h)
	subwf	(DelayMs@_dcnt),f
	btfss	status,2
	goto	u2331
	goto	u2330
u2331:
	goto	l2684
u2330:
	goto	l2686
	
l7:	
	line	25
	
l2686:	
;delay.c: 25: } while(--i);
	movlw	low(01h)
	subwf	(DelayMs@i),f
	btfss	status,2
	goto	u2341
	goto	u2340
u2341:
	goto	l4
u2340:
	goto	l2688
	
l8:	
	line	26
	
l2688:	
;delay.c: 26: } while(--cnt);
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u2351
	goto	u2350
u2351:
	goto	l3
u2350:
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
	global	_abc
psect	text142,local,class=CODE,delta=2
global __ptext142
__ptext142:

;; *************** function _abc *****************
;; Defined at:
;;		line 31 in file "F:\Prolific\pic_s\pic_pgm\11  RB0INTERRUPT\main.c"
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
;;      Temps:          4       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_DelayMs
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text142
	file	"F:\Prolific\pic_s\pic_pgm\11  RB0INTERRUPT\main.c"
	line	31
	global	__size_of_abc
	__size_of_abc	equ	__end_of_abc-_abc
	
_abc:	
	opt	stack 5
; Regs used in _abc: [wreg+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_abc+0)
	movf	fsr0,w
	movwf	(??_abc+1)
	movf	pclath,w
	movwf	(??_abc+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_abc+3)
	ljmp	_abc
psect	text142
	line	32
	
i1l2700:	
;main.c: 32: GIE=0;
	bcf	(95/8),(95)&7
	line	33
;main.c: 33: if(INTF==1)
	btfss	(89/8),(89)&7
	goto	u237_21
	goto	u237_20
u237_21:
	goto	i1l2708
u237_20:
	line	35
	
i1l2702:	
;main.c: 34: {
;main.c: 35: INTF=0;
	bcf	(89/8),(89)&7
	line	36
;main.c: 36: RD1=1;
	bsf	(65/8),(65)&7
	line	37
	
i1l2704:	
;main.c: 37: DelayMs(100);
	movlw	(064h)
	fcall	i1_DelayMs
	line	38
	
i1l2706:	
;main.c: 38: RD1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	goto	i1l2708
	line	39
	
i1l714:	
	line	40
	
i1l2708:	
;main.c: 39: }
;main.c: 40: GIE=1;
	bsf	(95/8),(95)&7
	line	41
	
i1l715:	
	movf	(??_abc+3),w
	movwf	btemp+1
	movf	(??_abc+2),w
	movwf	pclath
	movf	(??_abc+1),w
	movwf	fsr0
	swapf	(??_abc+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_abc
	__end_of_abc:
;; =============== function _abc ends ============

	signat	_abc,88
	global	i1_DelayMs
psect	text143,local,class=CODE,delta=2
global __ptext143
__ptext143:

;; *************** function i1_DelayMs *****************
;; Defined at:
;;		line 12 in file "F:\Prolific\pic_s\pic_pgm\11  RB0INTERRUPT\delay.c"
;; Parameters:    Size  Location     Type
;;  DelayMs         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  DelayMs         1    1[COMMON] unsigned char 
;;  DelayMs         1    3[COMMON] unsigned char 
;;  DelayMs         1    2[COMMON] unsigned char 
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
;;		_abc
;; This function uses a non-reentrant model
;;
psect	text143
	file	"F:\Prolific\pic_s\pic_pgm\11  RB0INTERRUPT\delay.c"
	line	12
	global	__size_ofi1_DelayMs
	__size_ofi1_DelayMs	equ	__end_ofi1_DelayMs-i1_DelayMs
	
i1_DelayMs:	
	opt	stack 5
; Regs used in i1_DelayMs: [wreg+status,2+status,0]
;i1DelayMs@cnt stored from wreg
	movwf	(i1DelayMs@cnt)
	line	21
;delay.c: 20: unsigned char i;
;delay.c: 21: do {
	
i1l3:	
	line	22
	
i1l2710:	
;delay.c: 22: i = 4;
	movlw	(04h)
	movwf	(??i1_DelayMs+0)+0
	movf	(??i1_DelayMs+0)+0,w
	movwf	(i1DelayMs@i)
	line	23
;delay.c: 23: do {
	
i1l4:	
	line	24
;delay.c: 24: { unsigned char _dcnt; _dcnt = (250)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(053h)
	movwf	(??i1_DelayMs+0)+0
	movf	(??i1_DelayMs+0)+0,w
	movwf	(i1DelayMs@_dcnt)
	goto	i1l2712
	
i1l6:	
	goto	i1l2712
	
i1l5:	
	
i1l2712:	
	movlw	low(01h)
	subwf	(i1DelayMs@_dcnt),f
	btfss	status,2
	goto	u238_21
	goto	u238_20
u238_21:
	goto	i1l2712
u238_20:
	goto	i1l2714
	
i1l7:	
	line	25
	
i1l2714:	
;delay.c: 25: } while(--i);
	movlw	low(01h)
	subwf	(i1DelayMs@i),f
	btfss	status,2
	goto	u239_21
	goto	u239_20
u239_21:
	goto	i1l4
u239_20:
	goto	i1l2716
	
i1l8:	
	line	26
	
i1l2716:	
;delay.c: 26: } while(--cnt);
	movlw	low(01h)
	subwf	(i1DelayMs@cnt),f
	btfss	status,2
	goto	u240_21
	goto	u240_20
u240_21:
	goto	i1l3
u240_20:
	goto	i1l10
	
i1l9:	
	line	28
	
i1l10:	
	return
	opt stack 0
GLOBAL	__end_ofi1_DelayMs
	__end_ofi1_DelayMs:
;; =============== function i1_DelayMs ends ============

	signat	i1_DelayMs,88
psect	text144,local,class=CODE,delta=2
global __ptext144
__ptext144:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
