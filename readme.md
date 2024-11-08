## lc3 学习文档

### 
LC-3 有 65,536 个内存位置  
LC-3 总共有 10 个寄存器，每个都是 16 比特。  

- 8 个通用目的寄存器（R0-R7）
- 1 个程序计数器（program counter, PC）寄存器
- 1 个条件标志位（condition flags，COND）寄存器

指令
文档：lc3-isa.pdf  

R_COND 寄存器存储条件标记，其中记录了最近一次计算的执行结果。

lc3-tools目录下go写的把二进制转为指令格式的工具
> go build && ./lc3-tools.exe
> 