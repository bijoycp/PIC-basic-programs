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
	FNCALL	_main,_delay
	FNROOT	_main
	global	_PORTD
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_PORTD	set	8
	global	_RD0
_RD0	set	64
	global	_TRISD
_TRISD	set	136
	file	"led.as"
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
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	delay@n
delay@n:	; 2 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	ds	1
	global	delay@i
delay@i:	; 2 bytes @ 0x3
	ds	2
	global	delay@j
delay@j:	; 2 bytes @ 0x5
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x7
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7       7
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_delay
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
;; (0) _main                                                 0     0      0      60
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                7     5      2      60
;;                                              0 COMMON     7     5      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      7       7       1       50.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       0       3        0.0%
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
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 6 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S -git\1    INTERFACING ONE LED\program\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+0, pclath, cstack
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
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S -git\1    INTERFACING ONE LED\program\main.c"
	line	6
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2-btemp+0+pclath+cstack]
	line	7
	
l1741:	
;main.c: 7: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	8
;main.c: 8: PORTD=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	9
;main.c: 9: while(1)
	
l561:	
	line	11
	
l1743:	
;main.c: 10: {
;main.c: 11: RD0=1;
	bsf	(64/8),(64)&7
	line	12
	
l1745:	
;main.c: 12: delay(1);
	movlw	low(01h)
	movwf	(?_delay)
	movlw	high(01h)
	movwf	((?_delay))+1
	fcall	_delay
	line	13
	
l1747:	
;main.c: 13: RD0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	14
	
l1749:	
;main.c: 14: delay(1);
	movlw	low(01h)
	movwf	(?_delay)
	movlw	high(01h)
	movwf	((?_delay))+1
	fcall	_delay
	line	16
	
l562:	
	line	9
	goto	l561
	
l563:	
	line	17
	
l564:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_delay
psect	text55,local,class=CODE,delta=2
global __ptext55
__ptext55:

;; *************** function _delay *****************
;; Defined at:
;;		line 20 in file "D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S -git\1    INTERFACING ONE LED\program\main.c"
;; Parameters:    Size  Location     Type
;;  n               2    0[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  j               2    5[COMMON] int 
;;  i               2    3[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, btemp+0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         4       0       0       0       0
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
psect	text55
	file	"D:\EMBEDDED\PROLIFIC\PIC\PIC_PGM_S -git\1    INTERFACING ONE LED\program\main.c"
	line	20
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg+btemp+0]
	line	21
	
l941:	
;main.c: 21: for(int i=0;i<n;i++)
	movlw	low(0)
	movwf	(delay@i)
	movlw	high(0)
	movwf	((delay@i))+1
	goto	l567
	line	22
	
l568:	
	
l943:	
;main.c: 22: for(int j=0;j<100;j++)
	movlw	low(0)
	movwf	(delay@j)
	movlw	high(0)
	movwf	((delay@j))+1
	
l945:	
	movf	(delay@j+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(064h))^80h
	subwf	btemp+0,w
	skipz
	goto	u15
	movlw	low(064h)
	subwf	(delay@j),w
u15:

	skipc
	goto	u11
	goto	u10
u11:
	goto	l569
u10:
	
l947:	
	goto	l570
	line	23
	
l569:	
	line	22
	
l949:	
;main.c: 23: {
	movlw	low(01h)
	addwf	(delay@j),f
	skipnc
	incf	(delay@j+1),f
	movlw	high(01h)
	addwf	(delay@j+1),f
	
l951:	
	movf	(delay@j+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(064h))^80h
	subwf	btemp+0,w
	skipz
	goto	u25
	movlw	low(064h)
	subwf	(delay@j),w
u25:

	skipc
	goto	u21
	goto	u20
u21:
	goto	l569
u20:
	
l570:	
	line	21
	
l953:	
	movlw	low(01h)
	addwf	(delay@i),f
	skipnc
	incf	(delay@i+1),f
	movlw	high(01h)
	addwf	(delay@i+1),f
	
l567:	
	movf	(delay@i+1),w
	xorlw	80h
	movwf	(??_delay+0)+0
	movf	(delay@n+1),w
	xorlw	80h
	subwf	(??_delay+0)+0,w
	skipz
	goto	u35
	movf	(delay@n),w
	subwf	(delay@i),w
u35:

	skipc
	goto	u31
	goto	u30
u31:
	goto	l568
u30:
	
l571:	
	line	26
	
l572:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text56,local,class=CODE,delta=2
global __ptext56
__ptext56:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
