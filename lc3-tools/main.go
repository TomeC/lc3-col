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
	data, err := os.ReadFile("./rogue.obj")
	if err != nil {
		log.Fatalln("read file failed", err)
	}
	wf, err := os.Create("./rogue.asm")
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
				return fmt.Sprintf("ADD  REG[%d]%+d->R[%v]", sr1, sign_extend(cmd&0x1F, 5), cmd>>9&0b111)
			} else {
				return fmt.Sprintf("ADD R[%v]+R[%v]->R[%v]", sr1, cmd&0b111, cmd>>9&0b111)
			}
		}

	case 0b0101:
		{
			if cmd>>5&1 == 1 {
				sr1 := cmd >> 6 & 0b111
				return fmt.Sprintf("AND [REG[%v] & %d] -> R[%v] #nzp", sr1, sign_extend(cmd&0x1F, 5), cmd>>9&0b111)

			} else {
				return fmt.Sprintf("AND [R[%v] & R[%v]] ->  R[%v]", cmd>>6&0b111, cmd&0b111, cmd>>9&0b111)
			}

		}
	case 0b0000:
		{
			pc_offset := sign_extend(cmd&0x1FF, 9)
			cond_flag := cmd >> 9 & 0b111
			return fmt.Sprintf("BR [%d&REG[COND] ? REG[PC]+=%d]", cond_flag, pc_offset)
		}
	case 0b1100:
		{
			if cmd>>6&0b111 == 0b111 {
				return "RET"
			} else {
				return "JMP"
			}
		}
	case 0b0100:
		{
			long_flag := cmd >> 11 & 1
			if long_flag == 1 {
				pc_offset := sign_extend(cmd&0x7FF, 11)
				return fmt.Sprintf("JSR REG[PC]->REG[R7];Reg[PC]+=%d", pc_offset)
			} else {
				r1 := cmd >> 6 & 0b111
				return fmt.Sprintf("JSRR REG[PC]->REG[R7];Reg[PC]=%d", r1)
			}
		}

	case 0b0010:
		{
			dr := cmd >> 9 & 0b111
			pc_offset := sign_extend(cmd&0x1FF, 9)
			return fmt.Sprintf("LD mem[REG[PC]%+d] -> REG[%d] #nzp", pc_offset, dr)
		}
	case 0b1010:
		return "LDI"
	case 0b0110:
		return "LDR"
	case 0b1110:
		{
			dr := cmd >> 9 & 0b111
			pc_offset := sign_extend(cmd&0x1ff, 9)
			return fmt.Sprintf("LEA REG[PC]%+d -> REG[%d] #nzp", pc_offset, dr)
		}
	case 0b1001:
		return "NOT"
	// case 0b1100:
	// 	return "RET"
	case 0b1000:
		return "RTI"
	case 0b0011:
		{
			sr := cmd >> 9 & 0b111
			pc_offset := sign_extend(cmd&0x1FF, 9)
			return fmt.Sprintf("ST %v -> mem[REG[PC]%+d]", sr, pc_offset)
		}
	case 0b1011:
		{
			sr := cmd >> 9 & 0b111
			pc_offset := sign_extend(cmd&0x1FF, 9)
			return fmt.Sprintf("STI %v -> mem[mem[REG[PC]+%v]]", sr, pc_offset)
		}
	case 0b0111:
		return "STR"
	case 0b1111:
		{
			base_str := "TRAP REG[R7]=REG[PC];"
			trap_cmd := cmd & 0xFF
			if trap_cmd == 0x20 {
				// get c
				return fmt.Sprintf("%v getchar() -> REG[R0] #nzp", base_str)
			} else if trap_cmd == 0x21 {
				// out
				return fmt.Sprintf("%v putc(REG[R0])", base_str)
			} else if trap_cmd == 0x22 {
				// puts
				return fmt.Sprintf("%v puts(mem[REG[R0]]..00)", base_str)
			} else if trap_cmd == 0x23 {
				// in
				return fmt.Sprintf("%v getc()->c;putc(c);c->REG[0]", base_str)
			} else if trap_cmd == 0x24 {
				// putsp
				return fmt.Sprintf("%v puts[mem+REG[0]->c1,c2..00]", base_str)
			} else if trap_cmd == 0x25 {
				// halt
				return fmt.Sprintf("%v halt;exit", base_str)
			}
			return fmt.Sprintf("TRAP unknown")
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
