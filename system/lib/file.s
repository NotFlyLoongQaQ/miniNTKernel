; 数据 区
[section.data];

; 代 码 区
[section.text];

global	read_sector;
global	io_hlt;
;
global	io_in8;
global	io_in16;
global	io_in32;
global	io_out8;
global	io_out16;
global	io_out32;
;
global	io_read_eflags;
global	io_write_eflags;
;
global	io_cli;
global	io_sti;


;
; 功能	: 读取 一 个 扇 区
; 入口	: 无
; 出口	: 无
; 堆 栈 使 用: 无
	 ; 全局变量 :
	 ; 函数 签： void read_sector( int sector, int dst );


read_sector:
	 mov ecx, [esp + 4]; 参数1 ： sector
	 mov ebx, [esp + 8]; 参数2 ： dst

	 mov dx, 0x1f2;
	 mov al, 0x01; 1 sector
	 out dx, al;
	 mov dx, 0x1f3;
	 mov al, cl; 0 - 7
	 out dx, al;

	 mov dx, 0x1f4;
	 mov al, ch; 8 - 15
	 out dx, al

	 mov dx, 0x1f5;
	 mov al, 0x00; 16 - 23
	 out dx, al;

	 mov dx, 0x1f6;
	 mov al, 0xe0;
	 out dx, al;

	 ; ask for read
	 mov dx, 0x1f7;
	 mov al, 0x20;
	 out dx, al;

	 ; wait for finish
	 mov dx, 0x1f7;
_rs_wait:
	 in al, dx;
	 and al, 0x88;
	 cmp al, 0x08;
	 jnz _rs_wait;

	 ; read data to bx
	 mov cx, 256;
	 mov dx, 0x1f0;

_rs_read_loop:
	 in ax, dx;
	 mov word[ebx], ax;
	 add ebx, 2;
	 loop _rs_read_loop;

	 ret;


	 ; 功能    :  挂 起
	 ; 入口    : 无
	 ; 出口    : 无
	 ; 堆 栈 使 用: 无
		  ; 全局变量 :
		  ; 函数 签： void io_hlt( void );
io_hlt:
		  hlt;
		  ret;


		  ; 功能    : 读取 eflags
		  ; 函数 签： int read_eflags( void );
io_read_eflags:
		  pushfd; 将 eflags 压入 栈
		  pop eax; 将 eflags 弹 出并保存至eax
		  ret

		  ; 功能    : 往端口写入1 个 字节
		  ; 函数 签： void io_out8( int port, int value );
io_out8:
		  mov edx, [esp + 4]; 参数1 : port
		  mov al, [esp + 8]; 参数2 ： value
		  out dx, al
		  ret


		  ; 功能    : 从端口读取1 个 字节
		  ; 函数 签： uint8_t io_in8( int port );
io_in8:
		  mov edx, [esp + 4]; 参数1 : port
		  mov eax, 0; 将 数据置 为 0 防 止干扰
		  in al, dx;
		  ret


		  ; 功能    : 从端口读取2 个 字节
		  ; 函数 签： uint16_t io_in16( int port );
io_in16:
		  mov edx, [esp + 4]; 参数1 : port
		  mov eax, 0; 将 数据置 为 0 防 止干扰
		  in ax, dx;
		  ret


		  ; 功能    : 从端口读取4 个 字节
		  ; 函数 签： uint32_t io_in32( int port );
io_in32:
		  mov edx, [esp + 4]; 参数1 : port
		  mov eax, 0; 将 数据置 为 0 防 止干扰
		  in eax, dx;
		  ret


		  ; 功能    : 往端口写入2 个 字节
		  ; 函数 签： void io_out16( int port, int value );
io_out16:
		  mov edx, [esp + 4]; 参数1 : port
		  mov al, [esp + 8]; 参数2 ： value
		  out dx, ax
		  ret


		  ; 功能    : 往端口写入4 个 字节
		  ; 函数 签： void io_out32( int port, int value );
io_out32:
		  mov edx, [esp + 4]; 参数1 : port
		  mov al, [esp + 8]; 参数2 ： value
		  out dx, eax
		  ret


		  ; 功能    : 关闭 中 断
		  ; 函数 签： void io_cli( void );
io_cli:
		  cli; clean interrupt flag
		  ret


		  ; 功能    : 打 开 中 断
		  ; 函数 签： void io_sti( void );
io_sti:
		  sti; set interrupt flag
		  ret


		  ; 功能    : 写入 eflags
		  ; 函数 签： void write_eflags( int flags );
io_write_eflags:
		  mov eax, [esp + 4]; 参数1 ： eflags
		  push eax; 将 参数 eflags压入 栈 中
		  popfd; 从 栈 中 弹 出eflags的 值 并 将 之写入到 EFLAGS 寄存器
		  ret