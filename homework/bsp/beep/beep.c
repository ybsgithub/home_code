#include "beep.h"

void beep_init(void)
{
    IOMUXC_SetPinMux(IOMUXC_SNVS_SNVS_TAMPER1_GPIO5_IO01, 0);

    IOMUXC_SetPinConfig(IOMUXC_SNVS_SNVS_TAMPER1_GPIO5_IO01,0X10B0);

    GPIO5->GDIR |= (1 << 1);
    GPIO5->DR |= (1 << 1);
}

void beep_switch(int status)
{
    if (status == ON) {
        GPIO5->DR &= ~(1 << 1);
    }
    else if (status == OFF) {
        GPIO5->DR |= (1 << 1);
    }
}