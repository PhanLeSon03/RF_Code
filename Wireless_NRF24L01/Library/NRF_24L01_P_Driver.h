
//////////config HW IO for communication///////////

#define NRF24L01P_PIN GPIOB
#define NRF_CE_PIN    GPIO_Pin_2
#define NRF_CSN_PIN   GPIO_Pin_4 ////////SPI_NSS
#define NRF_SCK_PIN   GPIO_Pin_5 ////////SPI_SCK
#define NRF_MOSI_PIN  GPIO_Pin_6////////SPI_MOSI
#define NRF_MISO_PIN  GPIO_Pin_7////////SPI_MISO
#define NRF_IRQ_PIN   GPIO_Pin_3

///////////// define register address //////////

#define CONFIG_REG        (uint8_t)0x00
#define EN_AA_REG         (uint8_t)0x01
#define EN_RXADDR_REG     (uint8_t)0x02
#define SETUP_AW_REG      (uint8_t)0x03
#define SETUP_RETR_REG    (uint8_t)0x04
#define RF_CH_REG         (uint8_t)0x05
#define RF_SETUP_REG      (uint8_t)0x06
#define STATUS_REG        (uint8_t)0x07
#define OBSERVE_TX_REG    (uint8_t)0x08
#define RPD_REG           (uint8_t)0x09
#define RX_ADDR_P0_REG    (uint8_t)0x0A
#define RX_ADDR_P1_REG    (uint8_t)0x0B
#define RX_ADDR_P2_REG    (uint8_t)0x0C
#define RX_ADDR_P3_REG    (uint8_t)0x0D
#define RX_ADDR_P4_REG    (uint8_t)0x0E
#define RX_ADDR_P5_REG    (uint8_t)0x0F
#define TX_ADDR_REG       (uint8_t)0x10
#define RX_PW_P0_REG      (uint8_t)0x11
#define RX_PW_P1_REG      (uint8_t)0x12
#define RX_PW_P2_REG      (uint8_t)0x13
#define RX_PW_P3_REG      (uint8_t)0x14
#define RX_PW_P4_REG      (uint8_t)0x15
#define RX_PW_P5_REG      (uint8_t)0x16
#define FIFO_STATUS_REG   (uint8_t)0x17
#define DYNPD_REG         (uint8_t)0x1C
#define FEATURE_REG       (uint8_t)0x1D

////////////// define command byte //////////////

#define R_REGISTER_CMD          (uint8_t)0x00
#define W_REGISTER_CMD          (uint8_t)0x20
#define R_RX_PAYLOAD_CMD        (uint8_t)0x61
#define W_TX_PAYLOAD_CMD        (uint8_t)0xA0
#define FLUSH_TX_CMD            (uint8_t)0xE1
#define FLUSH_RX_CMD            (uint8_t)0xE2
#define REUSE_TX_PL_CMD         (uint8_t)0xE3
#define R_RX_PL_WID_CMD         (uint8_t)0x60
#define W_ACK_PAYLOAD           (uint8_t)0xA8
#define W_TX_PAYLOAD_NO_ACK_CMD (uint8_t)0xB0
#define NOP_CMD                 (uint8_t)0xFF

//////// define struct for register/////////

typedef struct _CONFIG_REG_Typedef
{
    uint8_t reserved    :1;
    uint8_t MASK_RX_DR  :1;
    uint8_t MASK_TX_DS  :1;
    uint8_t MASK_MAX_RT :1;
    uint8_t EN_CRC      :1;
    uint8_t CRCO        :1;
    uint8_t PWR_UP      :1;
    uint8_t PRIM_RX     :1;
} CONFIG_REG_Typedef;

typedef struct _EN_AA_REG_Typedef
{
    uint8_t reserved    :2;
    uint8_t ENAA_P5     :1;
    uint8_t ENAA_P4     :1;
    uint8_t ENAA_P3     :1;
    uint8_t ENAA_P2     :1;
    uint8_t ENAA_P1     :1;
    uint8_t ENAA_P0     :1;  
} EN_AA_REG_Typedef;

typedef struct _EN_RXADDR_REG_Typedef
{
    uint8_t reserved   :2;
    uint8_t ERX_P5     :1;
    uint8_t ERX_P4     :1;
    uint8_t ERX_P3     :1;
    uint8_t ERX_P2     :1;
    uint8_t ERX_P1     :1;
    uint8_t ERX_P0     :1;
} EN_RXADDR_REG_Typedef;

typedef struct _SETUP_AW_REG_Typedef
{
    uint8_t reserved   :6;
    uint8_t AW         :2;
} SETUP_AW_REG_Typedef;

typedef struct _SETUP_RETR_REG_Typedef
{
    
    uint8_t ARD        :4;
    uint8_t ARC        :4;
} SETUP_RETR_REG_Typedef;

typedef struct _RF_CH_REG_Typedef
{
    uint8_t reserved   :1;
    uint8_t RF_CH      :7;
} RF_CH_REG_Typedef;

typedef struct _RF_SETUP_REG_Typedef
{
    uint8_t CONT_WAVE  :1;
    uint8_t reserved   :1;
    uint8_t RF_DR_LOW  :1;
    uint8_t PLL_LOCK   :1;
    uint8_t RF_DR_HIGH :1;
    uint8_t RF_PWR     :2;
    uint8_t Obsolete   :1;
} RF_SETUP_REG_Typedef;


typedef struct _STATUS_REG_Typedef
{
    uint8_t reserved   :1;
    uint8_t RX_DR      :1;
    uint8_t TX_DS      :1;
    uint8_t MAX_RT     :1;
    uint8_t RX_P_NO    :3;
    uint8_t TX_FULL    :1;
} STATUS_REG_Typedef;

typedef struct _OBSERVE_TX_REG_Typedef
{
    uint8_t PLOS_CNT   :4;
    uint8_t ARC_CNT    :4;
} OBSERVE_TX_REG_Typedef;

typedef struct _RPD_REG_Typedef
{
    uint8_t reserved   :7;
    uint8_t RPD        :1;
} RPD_REG_Typedef;

typedef struct _RX_PW_P0_REG_Typedef
{
    uint8_t reserved   :2;
    uint8_t RX_PW_P0   :6;
} RX_PW_P0_REG_Typedef;

typedef struct _RX_PW_P1_REG_Typedef
{
    uint8_t reserved   :2;
    uint8_t RX_PW_P1   :6;
} RX_PW_P1_REG_Typedef;


typedef struct _RX_PW_P2_REG_Typedef
{
    uint8_t reserved   :2;
    uint8_t RX_PW_P2   :6;
} RX_PW_P2_REG_Typedef;

typedef struct _RX_PW_P3_REG_Typedef
{
    uint8_t reserved   :2;
    uint8_t RX_PW_P3   :6;
} RX_PW_P3_REG_Typedef;

typedef struct _RX_PW_P4_REG_Typedef
{
    uint8_t reserved   :2;
    uint8_t RX_PW_P4   :6;
} RX_PW_P4_REG_Typedef;

typedef struct _RX_PW_P5_REG_Typedef
{
    uint8_t reserved   :2;
    uint8_t RX_PW_P5   :6;
} RX_PW_P5_REG_Typedef;

typedef struct _FIFO_STATUS_REG_Typedef
{
    uint8_t reserved   :1;
    uint8_t TX_REUSE   :1;
    uint8_t TX_FULL    :1;
    uint8_t TX_EMPTY   :1;
    uint8_t reserved_1 :2;
    uint8_t RX_FULL    :1;
    uint8_t RX_EMPTY   :1;
} FIFO_STATUS_REG_Typedef;

typedef struct _DYNPD_REG_Typedef
{
    uint8_t reserved   :2;
    uint8_t DPL_P5     :1;
    uint8_t DPL_P4     :1;
    uint8_t DPL_P3     :1;
    uint8_t DPL_P2     :1;
    uint8_t DPL_P1     :1;
    uint8_t DPL_P0     :1;
} DYNPD_REG_Typedef;

typedef struct _FEATURE_REG_Typedef
{
    uint8_t reserved    :5;
    uint8_t EN_DPL      :1;
    uint8_t EN_ACK_PAY  :1;
    uint8_t EN_DYN_ACK  :1;
} FEATURE_REG_Typedef;

//////////end of registers struct define/////////

//////////// NRF24LP01 functions ////////////
  
void NRF_GPIO_Init(void);
void NRF24L01_SPI_INIT(void);
void NRF24L01_SPI_RW_Status_Reg(uint8_t comand_cmd, uint8_t reg_address, uint8_t byte,uint8_t *data);
void NRF24L01_Read_Payload_CMD(uint8_t cmd, uint8_t byte, uint8_t *data);
void NRF24L01_Write_TX_PAYLOAD_CMD(uint8_t cmd, uint8_t byte, uint8_t *data);
void NRF24L01_FLUSH_CMD(uint8_t cmd);
void NRF24L01_REUSE_TX_PL_CMD(uint8_t cmd);
void NRF24L01_R_RX_PL_WID_CMD(uint8_t cmd, uint8_t *data);
void NRF24L01_W_ACK_PAYLOAD(uint8_t cmd, uint8_t PPP, uint8_t byte, uint8_t *data);
void NRF24L01_W_TX_PAYLOAD_NO_ACK_CMD(uint8_t cmd, uint8_t byte, uint8_t *data);
void NRF24L01_NOP(uint8_t cmd);
void NRF_Power_Up(void);