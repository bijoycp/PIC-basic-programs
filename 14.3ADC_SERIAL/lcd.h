#define RS RD2
#define E RD3
#define lcd_data PORTD
#define lcd_data_dir TRISD

extern void lcd_init(void);
extern void LCD_STROBE(void);
extern void send(unsigned char);
extern void lcd_puts(const char * s);
extern void lcd_clear(void);
extern void lcd_putch(char);
extern void lcd_goto(unsigned char,unsigned char);
extern void curser(unsigned char);
void display_shift(void);
void curser_shift_left(void);
void curser_shift_right(void);