package main

import (
	"encoding/binary"
	"fmt"
	"log"
	"os"
)

func main() {
	decodeBin()
}
func decodeBin() {
	data, err := os.ReadFile("../2048.obj")
	if err != nil {
		log.Fatalln("read file failed", err)
	}
	wf, err := os.Create("../2048.asm")
	if err != nil {
		log.Fatalln("create file failed", err)
	}
	defer wf.Close()
	cmds := make([]uint16, len(data)/2)
	for i := 2; i < len(data); i += 2 {
		cmds[i/2-1] = binary.BigEndian.Uint16(data[i : i+2])

	}
	for i := 0; i < len(cmds); i++ {
		if cmds[i] < 0x100 {
			line := fmt.Sprintf("%X %X: %c", 0x3000+i, cmds[i], cmds[i])
			wf.WriteString(line + "\n")
			continue
		}
		line := fmt.Sprintf("%X %X", 0x3000+i, cmds[i])
		wf.WriteString(line + ": " + opDesc(cmds[i]) + "\n")
	}

}
func opDesc(cmd uint16) string {
	op := cmd >> 12 & 0b1111
	switch op {
	case 0b0001:
		{
			sr1 := cmd >> 6 & 0b111
			if cmd>>5&1 == 1 {
				return fmt.Sprintf("ADD  R[%d]%+d->R[%v]", sr1, sign_extend(cmd&0x1F, 5), cmd>>9&0b111)
			} else {
				return fmt.Sprintf("ADD R[%v]+R[%v]->R[%v]", sr1, cmd&0b111, cmd>>9&0b111)
			}
		}

	case 0b0101:
		{
			if cmd>>5&1 == 1 {
				sr1 := cmd >> 6 & 0b111
				return fmt.Sprintf("AND [R[%v] & %d] -> R[%v] #nzp", sr1, sign_extend(cmd&0x1F, 5), cmd>>9&0b111)

			} else {
				return fmt.Sprintf("AND [R[%v] & R[%v]] ->  R[%v]", cmd>>6&0b111, cmd&0b111, cmd>>9&0b111)
			}

		}
	case 0b0000:
		{
			pc_offset := sign_extend(cmd&0x1FF, 9)
			cond_flag := cmd >> 9 & 0b111
			return fmt.Sprintf("BR [%d&R[COND] ? R[PC]+=%d]", cond_flag, pc_offset)
		}
	case 0b1100:
		{
			if cmd>>6&0b111 == 0b111 {
				return fmt.Sprintf("RET R[R7] -> R[PC]")
			} else {
				return fmt.Sprintf("JMP R[%d] -> R[PC]", cmd>>6&0b111)
			}
		}
	case 0b0100:
		{
			long_flag := cmd >> 11 & 1
			if long_flag == 1 {
				pc_offset := sign_extend(cmd&0x7FF, 11)
				return fmt.Sprintf("JSR R[PC]->R[R7];R[PC]+=%d", pc_offset)
			} else {
				r1 := cmd >> 6 & 0b111
				return fmt.Sprintf("JSRR R[PC]->R[R7];R[PC]=%d", r1)
			}
		}
	case 0b0010:
		{
			dr := cmd >> 9 & 0b111
			pc_offset := sign_extend(cmd&0x1FF, 9)
			return fmt.Sprintf("LD mem[R[PC]%+d] -> R[%d] #nzp", pc_offset, dr)
		}
	case 0b1010:
		{
			dr := cmd >> 9 & 0b111
			pc_offset := sign_extend(cmd&0x1F, 9)
			return fmt.Sprintf("LDI mem[mem[R[PC]%+d]] -> R[%d] #nzp", pc_offset, dr)
		}
	case 0b0110:
		{
			baseR := cmd >> 6 & 0b111
			pc_offset := sign_extend(cmd&0x3F, 6)
			dr := cmd >> 9 & 0b111
			return fmt.Sprintf("LDR mem[R[%d]%+d] -> R[%d] #nzp", baseR, pc_offset, dr)
		}
	case 0b1110:
		{
			dr := cmd >> 9 & 0b111
			pc_offset := sign_extend(cmd&0x1ff, 9)
			return fmt.Sprintf("LEA R[PC]%+d -> R[%d] #nzp", pc_offset, dr)
		}
	case 0b1001:
		{
			dr := cmd >> 9 & 0b111
			sr := cmd >> 6 & 0b111
			return fmt.Sprintf("NOT ~R[%d] -> R[%d] #nzp", sr, dr)
		}
	case 0b1000:
		{
			return "RTI"
		}
	case 0b0011:
		{
			sr := cmd >> 9 & 0b111
			pc_offset := sign_extend(cmd&0x1FF, 9)
			return fmt.Sprintf("ST %v -> mem[R[PC]%+d]", sr, pc_offset)
		}
	case 0b1011:
		{
			sr := cmd >> 9 & 0b111
			pc_offset := sign_extend(cmd&0x1FF, 9)
			return fmt.Sprintf("STI %v -> mem[mem[R[PC]+%v]]", sr, pc_offset)
		}
	case 0b0111:
		{
			sr := cmd >> 9 & 0b111
			baseR := cmd >> 6 & 0b111
			return fmt.Sprintf("STR: %d->mem[R[%d]%+d]", sr, baseR, sign_extend(cmd&0x1F, 9))
		}
	case 0b1111:
		{
			base_str := "TRAP R[R7]=R[PC];"
			trap_cmd := cmd & 0xFF
			if trap_cmd == 0x20 {
				// get c
				return fmt.Sprintf("%v getchar() -> R[R0] #nzp", base_str)
			} else if trap_cmd == 0x21 {
				// out
				return fmt.Sprintf("%v putc(R[R0])", base_str)
			} else if trap_cmd == 0x22 {
				// puts
				return fmt.Sprintf("%v puts(mem[R[R0]]..00)", base_str)
			} else if trap_cmd == 0x23 {
				// in
				return fmt.Sprintf("%v getc()->c;putc(c);c->R[0]", base_str)
			} else if trap_cmd == 0x24 {
				// putsp
				return fmt.Sprintf("%v puts[mem+R[0]->c1,c2..00]", base_str)
			} else if trap_cmd == 0x25 {
				// halt
				return fmt.Sprintf("%v halt;exit", base_str)
			}
			return fmt.Sprintf("TRAP unknown:%d", cmd)
		}

	default:
		return "unknown opCode"
	}

}

func sign_extend(x, count uint16) int16 {
	if x>>(count-1)&1 == 1 {
		return int16(x | (0xFFFF << count))
	}
	return int16(x)
}
