#define ADC_PIN_SELECT 0B1001
#define LEFTorRIGHT_JUSTIFIED 0       //1 for RJ, 0 for LJ

void adc_init (void);
unsigned int read_adc(unsigned char);