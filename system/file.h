#ifndef _FILE_h_
#define _FILE_H_

#include <stdint.h>


/**
 * 读取扇区的数据
 * @param sector 扇区号。
 * @param dst 目标地址
 */
void read_sector( int sector, uint8_t *dst );


/**
 * 挂起
 */
void io_hlt();


/**
 * 读取 eflags
 * @return
 */
uint32_t io_read_eflags();


/**
 * 写入 eflags
 * @param flags
 */
void io_write_eflags( uint32_t flags );


/**
 * 从端口读取1个字节
 * @param port 端口号
 * @return 端口上的数据
 */
uint8_t io_in8( uint16_t port );


/**
 * 从端口读取2个字节
 * @param port 端口号
 * @return 端口上的数据
 */
uint16_t io_in16( uint16_t port );


/**
 * 从端口读取4个字节
 * @param port 端口号
 * @return 端口上的数据
 */
uint32_t io_in32( uint16_t port );


/**
 * 往端口写入1个字节
 * @param port 端口号
 * @param value 要写入的值
 * @return
 */
void io_out8( uint16_t port, uint8_t value );


/**
 * 往端口写入2个字节
 * @param port 端口号
 * @param value 要写入的值
 * @return
 */
void io_out16( uint16_t port, uint16_t value );


/**
 * 往端口写入4个字节
 * @param port 端口号
 * @param value 要写入的值
 * @return
 */
void io_out32( uint16_t port, uint32_t value );


/**
 * 关闭中断
 */
void io_cli();


/**
 * 打开中断
 */
void io_sti();


#endif /* _FILE_H_ */