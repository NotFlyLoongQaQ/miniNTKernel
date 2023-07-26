# os/loader.s
# 多引导项头
.set MAGIC, 0x1badb002;                 # 魔数块
.set FLAGS, (1<<0 | 1<<1);              # 标志块
.set CHECKSUM, -(MAGIC + FLAGS);        # 校验块

# 下面的伪指令声明了Multiboot标准中的多引导项头
# 三个块都是32位字段
.section .multiboot
    .long MAGIC
    .long FLAGS
    .long CHECKSUM
.section .multiboot
    # ...
    .long CHECKSUM

.section .text
.extern kernelMain
.global loader

loader:
    mov $kernel_stack, %esp
    call __Z16callConstructorsv
    push %eax
    push %ebx
    call __Z10kernelMain

stop:
    # 禁用中断
    cli
    # 禁用中断后使用hlt暂停CPU，以后无法再唤醒
    hlt
    jmp stop

.section .bss
.space 2 * 1024 * 1024
kernel_stack: