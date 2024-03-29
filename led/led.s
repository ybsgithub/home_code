/**********************************************
for baisongyang's test
**********************************************/
.global _start /* 全局标号 */

/* 
     * 描述： _start函数，程序从此函数开始执行此函数完成时钟使能
     * GPIO初始化、最终控制GPIO输出低电平来点亮LED灯。
*/

_start:
/* 1、使能所有时钟 */

    ldr r0, =0X020C4068 /* 寄存器CCGR0 */
    ldr r1, =0XFFFFFFFF
    str r1, [r0]

    ldr r0, =0X020C406C /* 寄存器CCGR1 */
    str r1, [r0]

    ldr r0, =0X020C4070 /* 寄存器CCGR2 */
    str r1, [r0]

    ldr r0, =0X020C4074 /* 寄存器CCGR3 */
    str r1, [r0]

    ldr r0, =0X020C4078 /* 寄存器CCGR4 */
    str r1, [r0]

    ldr r0, =0X020C407C /* 寄存器CCGR5 */
    str r1, [r0]

    ldr r0, =0X020C4080 /* 寄存器CCGR6 */
    str r1, [r0]

/* 2、设置GPIO1_IO03复用为GPIO1_IO03 */
    ldr r0, =0X020E0068 /* 将寄存器SW_MUX_GPIO1_IO03_BASE加载到r0中 */
    ldr r1, =0X5        /* 设置寄存器SW_MUX_GPIO1_IO03_BASE的MUX_MODE为5 */
    str r1, [r0]

/* 3、配置GPIO1_IO03的IO属性 
    *bit 16:0 HYS关闭 
    *bit [15:14]: 00 默认下拉 
    *bit [13]: 0 kepper功能 
    *bit [12]: 1 pull/keeper使能 
    *bit [11]: 0 关闭开路输出 
    *bit [7:6]: 10 速度100Mhz 
    *bit [5:3]: 110 R0/6驱动能力 
    *bit [0]: 0 低转换率 
*/

    ldr r0, =0X020E02F4 /*寄存器SW_PAD_GPIO1_IO03_BASE */
    ldr r1, =0X10B0
    str r1, [r0]

/* 4、设置GPIO1_IO03为输出 */
    ldr r0, =0X0209C004 /*寄存器GPIO1_GDIR */
    ldr r1, =0X0000008
    str r1, [r0]

/* 5、打开LED0 
 * 设置GPIO1_IO03输出低电平 
 */
    ldr r0, =0X0209C000 /*寄存器GPIO1_DR */
    ldr r1, =0
    str r1, [r0]

/* 
 * 描述： loop死循环 
 */ 
loop: 
    b loop
