3000 E003: LEA R[PC]+3 -> R[0] #nzp
3001 F022: TRAP R[R7]=R[PC]; puts(mem[R[R0]]..00)
3002 F020: TRAP R[R7]=R[PC]; getchar() -> R[R0] #nzp
3003 E39: BR [7&R[COND] ? R[PC]+=57]
3004 57: W
3005 65: e
3006 6C: l
3007 63: c
3008 6F: o
3009 6D: m
300A 65: e
300B 20:  
300C 74: t
300D 6F: o
300E 20:  
300F 4C: L
3010 43: C
3011 33: 3
3012 20:  
3013 52: R
3014 6F: o
3015 67: g
3016 75: u
3017 65: e
3018 2E: .
3019 A: 

301A 55: U
301B 73: s
301C 65: e
301D 20:  
301E 57: W
301F 53: S
3020 41: A
3021 44: D
3022 20:  
3023 74: t
3024 6F: o
3025 20:  
3026 6D: m
3027 6F: o
3028 76: v
3029 65: e
302A 2E: .
302B A: 

302C 50: P
302D 72: r
302E 65: e
302F 73: s
3030 73: s
3031 20:  
3032 61: a
3033 6E: n
3034 79: y
3035 20:  
3036 6B: k
3037 65: e
3038 79: y
3039 2E: .
303A 2E: .
303B A: 

303C 0:  
303D 2C53: LD mem[R[PC]+83] -> R[6] #nzp
303E 48D5: JSR R[PC]->R[R7];R[PC]+=213
303F 2057: LD mem[R[PC]+87] -> R[0] #nzp
3040 203: BR [1&R[COND] ? R[PC]+=3]
3041 4893: JSR R[PC]->R[R7];R[PC]+=147
3042 4856: JSR R[PC]->R[R7];R[PC]+=86
3043 F025: TRAP R[R7]=R[PC]; halt;exit
3044 5020: AND [R[0] & 0] -> R[0] #nzp
3045 3051: ST 0 -> mem[R[PC]+81]
3046 E006: LEA R[PC]+6 -> R[0] #nzp
3047 F022: TRAP R[R7]=R[PC]; puts(mem[R[R0]]..00)
3048 F020: TRAP R[R7]=R[PC]; getchar() -> R[R0] #nzp
3049 2246: LD mem[R[PC]+70] -> R[1] #nzp
304A 1201: ADD R[0]+R[1]->R[1]
304B BF1: BR [5&R[COND] ? R[PC]+=-15]
304C F025: TRAP R[R7]=R[PC]; halt;exit
304D 59: Y
304E 6F: o
304F 75: u
3050 20:  
3051 73: s
3052 75: u
3053 72: r
3054 76: v
3055 69: i
3056 76: v
3057 65: e
3058 64: d
3059 21: !
305A A: 

305B 4F: O
305C 6E: n
305D 20:  
305E 74: t
305F 6F: o
3060 20:  
3061 61: a
3062 6E: n
3063 6F: o
3064 74: t
3065 68: h
3066 65: e
3067 72: r
3068 20:  
3069 64: d
306A 75: u
306B 6E: n
306C 67: g
306D 65: e
306E 6F: o
306F 6E: n
3070 3F: ?
3071 20:  
3072 28: (
3073 6E: n
3074 29: )
3075 6F: o
3076 20:  
3077 6F: o
3078 72: r
3079 20:  
307A 61: a
307B 6E: n
307C 79: y
307D 20:  
307E 6B: k
307F 65: e
3080 79: y
3081 20:  
3082 74: t
3083 6F: o
3084 20:  
3085 63: c
3086 6F: o
3087 6E: n
3088 74: t
3089 69: i
308A 6E: n
308B 75: u
308C 65: e
308D 2E: .
308E A: 

308F 0:  
3090 FF92: TRAP unknown:65426
3091 4000: JSRR R[PC]->R[R7];R[PC]=0
3092 41: A
3093 20:  
3094 10: 
3095 0:  
3096 0:  
3097 0:  
3098 3500: ST 2 -> mem[R[PC]-256]
3099 23FB: LD mem[R[PC]-5] -> R[1] #nzp
309A 25FB: LD mem[R[PC]-5] -> R[2] #nzp
309B F020: TRAP R[R7]=R[PC]; getchar() -> R[R0] #nzp
309C 2633: LD mem[R[PC]+51] -> R[3] #nzp
309D 1603: ADD R[0]+R[3]->R[3]
309E 40A: BR [2&R[COND] ? R[PC]+=10]
309F 2632: LD mem[R[PC]+50] -> R[3] #nzp
30A0 1603: ADD R[0]+R[3]->R[3]
30A1 409: BR [2&R[COND] ? R[PC]+=9]
30A2 262E: LD mem[R[PC]+46] -> R[3] #nzp
30A3 1603: ADD R[0]+R[3]->R[3]
30A4 408: BR [2&R[COND] ? R[PC]+=8]
30A5 262D: LD mem[R[PC]+45] -> R[3] #nzp
30A6 1603: ADD R[0]+R[3]->R[3]
30A7 407: BR [2&R[COND] ? R[PC]+=7]
30A8 FF0: BR [7&R[COND] ? R[PC]+=-16]
30A9 14BF: ADD  R[2]-1->R[2]
30AA E06: BR [7&R[COND] ? R[PC]+=6]
30AB 14A1: ADD  R[2]+1->R[2]
30AC E04: BR [7&R[COND] ? R[PC]+=4]
30AD 127F: ADD  R[1]-1->R[1]
30AE E02: BR [7&R[COND] ? R[PC]+=2]
30AF 1261: ADD  R[1]+1->R[1]
30B0 E00: BR [7&R[COND] ? R[PC]+=0]
30B1 527F: AND [R[1] & -1] -> R[1] #nzp
30B2 54AF: AND [R[2] & 15] -> R[2] #nzp
30B3 73BF: STR: 1->mem[R[6]+31]
30B4 75BE: STR: 2->mem[R[6]+30]
30B5 1DBE: ADD  R[6]-2->R[6]
30B6 484A: JSR R[PC]->R[R7];R[PC]+=74
30B7 66C0: LDR mem[R[3]+0] -> R[3] #nzp
30B8 404: BR [2&R[COND] ? R[PC]+=4]
30B9 281A: LD mem[R[PC]+26] -> R[4] #nzp
30BA 16C4: ADD R[3]+R[4]->R[3]
30BB 410: BR [2&R[COND] ? R[PC]+=16]
30BC 4F82: JSR R[PC]->R[R7];R[PC]+=-126
30BD 23D7: LD mem[R[PC]-41] -> R[1] #nzp
30BE 25D7: LD mem[R[PC]-41] -> R[2] #nzp
30BF 4841: JSR R[PC]->R[R7];R[PC]+=65
30C0 5920: AND [R[4] & 0] -> R[4] #nzp
30C1 78C0: STR: 4->mem[R[3]+0]
30C2 6580: LDR mem[R[6]+0] -> R[2] #nzp
30C3 6381: LDR mem[R[6]+1] -> R[1] #nzp
30C4 1DA2: ADD  R[6]+2->R[6]
30C5 483B: JSR R[PC]->R[R7];R[PC]+=59
30C6 5920: AND [R[4] & 0] -> R[4] #nzp
30C7 1922: ADD  R[4]+2->R[4]
30C8 78C0: STR: 4->mem[R[3]+0]
30C9 33CB: ST 1 -> mem[R[PC]-53]
30CA 35CB: ST 2 -> mem[R[PC]-53]
30CB 4F73: JSR R[PC]->R[R7];R[PC]+=-141
30CC 5920: AND [R[4] & 0] -> R[4] #nzp
30CD 1921: ADD  R[4]+1->R[4]
30CE 39C8: ST 4 -> mem[R[PC]-56]
30CF 4F6F: JSR R[PC]->R[R7];R[PC]+=-145
30D0 FF89: TRAP unknown:65417
30D1 FF9F: TRAP unknown:65439
30D2 FF8D: TRAP unknown:65421
30D3 FF9C: TRAP unknown:65436
30D4 FFFC: TRAP unknown:65532
30D5 7FBF: STR: 7->mem[R[6]+31]
30D6 1DBF: ADD  R[6]-1->R[6]
30D7 27BB: LD mem[R[PC]-69] -> R[3] #nzp
30D8 29BB: LD mem[R[PC]-69] -> R[4] #nzp
30D9 2BBE: LD mem[R[PC]-66] -> R[5] #nzp
30DA E01A: LEA R[PC]+26 -> R[0] #nzp
30DB F022: TRAP R[R7]=R[PC]; puts(mem[R[R0]]..00)
30DC 6340: LDR mem[R[5]+0] -> R[1] #nzp
30DD E411: LEA R[PC]+17 -> R[2] #nzp
30DE 1481: ADD R[2]+R[1]->R[2]
30DF 6080: LDR mem[R[2]+0] -> R[0] #nzp
30E0 F021: TRAP R[R7]=R[PC]; putc(R[R0])
30E1 1B61: ADD  R[5]+1->R[5]
30E2 16FF: ADD  R[3]-1->R[3]
30E3 3F8: BR [1&R[COND] ? R[PC]+=-8]
30E4 2009: LD mem[R[PC]+9] -> R[0] #nzp
30E5 F021: TRAP R[R7]=R[PC]; putc(R[R0])
30E6 27AC: LD mem[R[PC]-84] -> R[3] #nzp
30E7 193F: ADD  R[4]-1->R[4]
30E8 3F3: BR [1&R[COND] ? R[PC]+=-13]
30E9 2004: LD mem[R[PC]+4] -> R[0] #nzp
30EA F021: TRAP R[R7]=R[PC]; putc(R[R0])
30EB 6F80: LDR mem[R[6]+0] -> R[7] #nzp
30EC 1DA1: ADD  R[6]+1->R[6]
30ED C1C0: RET R[R7] -> R[PC]
30EE A: 

30EF 20:  
30F0 23: #
30F1 40: @
30F2 4B: K
30F3 44: D
30F4 0:  
30F5 1B: 
30F6 5B: [
30F7 32: 2
30F8 4A: J
30F9 1B: 
30FA 5B: [
30FB 48: H
30FC 1B: 
30FD 5B: [
30FE 33: 3
30FF 4A: J
3100 0:  
3101 71BF: STR: 0->mem[R[6]+31]
3102 79BE: STR: 4->mem[R[6]+30]
3103 7BBD: STR: 5->mem[R[6]+29]
3104 7FBC: STR: 7->mem[R[6]+28]
3105 1DBC: ADD  R[6]-4->R[6]
3106 2791: LD mem[R[PC]-111] -> R[3] #nzp
3107 16C1: ADD R[3]+R[1]->R[3]
3108 18A0: ADD  R[2]+0->R[4]
3109 404: BR [2&R[COND] ? R[PC]+=4]
310A 2B88: LD mem[R[PC]-120] -> R[5] #nzp
310B 16C5: ADD R[3]+R[5]->R[3]
310C 193F: ADD  R[4]-1->R[4]
310D 3FD: BR [1&R[COND] ? R[PC]+=-3]
310E 6F80: LDR mem[R[6]+0] -> R[7] #nzp
310F 6B81: LDR mem[R[6]+1] -> R[5] #nzp
3110 6982: LDR mem[R[6]+2] -> R[4] #nzp
3111 6183: LDR mem[R[6]+3] -> R[0] #nzp
3112 1DA4: ADD  R[6]+4->R[6]
3113 C1C0: RET R[R7] -> R[PC]
3114 7FBF: STR: 7->mem[R[6]+31]
3115 1DBF: ADD  R[6]-1->R[6]
3116 237C: LD mem[R[PC]-132] -> R[1] #nzp
3117 257C: LD mem[R[PC]-132] -> R[2] #nzp
3118 56E0: AND [R[3] & 0] -> R[3] #nzp
3119 16E1: ADD  R[3]+1->R[3]
311A 2B7D: LD mem[R[PC]-131] -> R[5] #nzp
311B 7740: STR: 3->mem[R[5]+0]
311C 1B61: ADD  R[5]+1->R[5]
311D 127F: ADD  R[1]-1->R[1]
311E 3FC: BR [1&R[COND] ? R[PC]+=-4]
311F 2373: LD mem[R[PC]-141] -> R[1] #nzp
3120 14BF: ADD  R[2]-1->R[2]
3121 3F9: BR [1&R[COND] ? R[PC]+=-7]
3122 4826: JSR R[PC]->R[R7];R[PC]+=38
3123 2370: LD mem[R[PC]-144] -> R[1] #nzp
3124 4842: JSR R[PC]->R[R7];R[PC]+=66
3125 1420: ADD  R[0]+0->R[2]
3126 5260: AND [R[1] & 0] -> R[1] #nzp
3127 4FD9: JSR R[PC]->R[R7];R[PC]+=-39
3128 5920: AND [R[4] & 0] -> R[4] #nzp
3129 1922: ADD  R[4]+2->R[4]
312A 78C0: STR: 4->mem[R[3]+0]
312B 3369: ST 1 -> mem[R[PC]-151]
312C 3569: ST 2 -> mem[R[PC]-151]
312D 2965: LD mem[R[PC]-155] -> R[4] #nzp
312E 193F: ADD  R[4]-1->R[4]
312F 993F: NOT ~R[4] -> R[4] #nzp
3130 1921: ADD  R[4]+1->R[4]
3131 1261: ADD  R[1]+1->R[1]
3132 4FCE: JSR R[PC]->R[R7];R[PC]+=-50
3133 5B60: AND [R[5] & 0] -> R[5] #nzp
3134 7AC0: STR: 5->mem[R[3]+0]
3135 73BF: STR: 1->mem[R[6]+31]
3136 1DBF: ADD  R[6]-1->R[6]
3137 4811: JSR R[PC]->R[R7];R[PC]+=17
3138 5260: AND [R[1] & 0] -> R[1] #nzp
3139 1263: ADD  R[1]+3->R[1]
313A 482C: JSR R[PC]->R[R7];R[PC]+=44
313B 103F: ADD  R[0]-1->R[0]
313C 1480: ADD R[2]+R[0]->R[2]
313D 54AF: AND [R[2] & 15] -> R[2] #nzp
313E 6380: LDR mem[R[6]+0] -> R[1] #nzp
313F 1DA1: ADD  R[6]+1->R[6]
3140 4FC0: JSR R[PC]->R[R7];R[PC]+=-64
3141 7AC0: STR: 5->mem[R[3]+0]
3142 1A44: ADD R[1]+R[4]->R[5]
3143 9ED: BR [4&R[COND] ? R[PC]+=-19]
3144 1B64: ADD  R[5]+4->R[5]
3145 7AC0: STR: 5->mem[R[3]+0]
3146 6F80: LDR mem[R[6]+0] -> R[7] #nzp
3147 1DA1: ADD  R[6]+1->R[6]
3148 C1C0: RET R[R7] -> R[PC]
3149 73BF: STR: 1->mem[R[6]+31]
314A 75BE: STR: 2->mem[R[6]+30]
314B 77BD: STR: 3->mem[R[6]+29]
314C 79BC: STR: 4->mem[R[6]+28]
314D 7BBB: STR: 5->mem[R[6]+27]
314E 7FBA: STR: 7->mem[R[6]+26]
314F 1DBA: ADD  R[6]-6->R[6]
3150 2213: LD mem[R[PC]+19] -> R[1] #nzp
3151 2411: LD mem[R[PC]+17] -> R[2] #nzp
3152 5020: AND [R[0] & 0] -> R[0] #nzp
3153 1002: ADD R[0]+R[2]->R[0]
3154 127F: ADD  R[1]-1->R[1]
3155 3FD: BR [1&R[COND] ? R[PC]+=-3]
3156 220E: LD mem[R[PC]+14] -> R[1] #nzp
3157 1001: ADD R[0]+R[1]->R[0]
3158 220D: LD mem[R[PC]+13] -> R[1] #nzp
3159 5001: AND [R[0] & R[1]] ->  R[0]
315A 3008: ST 0 -> mem[R[PC]+8]
315B 6F80: LDR mem[R[6]+0] -> R[7] #nzp
315C 6B81: LDR mem[R[6]+1] -> R[5] #nzp
315D 6982: LDR mem[R[6]+2] -> R[4] #nzp
315E 6783: LDR mem[R[6]+3] -> R[3] #nzp
315F 6584: LDR mem[R[6]+4] -> R[2] #nzp
3160 6385: LDR mem[R[6]+5] -> R[1] #nzp
3161 1DA6: ADD  R[6]+6->R[6]
3162 C1C0: RET R[R7] -> R[PC]
3163 AC34: LDI mem[mem[R[PC]+20]] -> R[6] #nzp
3164 3B8D: ST 5 -> mem[R[PC]-115]
3165 83: 
3166 7FFF: STR: 7->mem[R[7]+31]
3167 75BF: STR: 2->mem[R[6]+31]
3168 77BE: STR: 3->mem[R[6]+30]
3169 79BD: STR: 4->mem[R[6]+29]
316A 7BBC: STR: 5->mem[R[6]+28]
316B 7FBB: STR: 7->mem[R[6]+27]
316C 1DBB: ADD  R[6]-5->R[6]
316D 927F: NOT ~R[1] -> R[1] #nzp
316E 1261: ADD  R[1]+1->R[1]
316F 405: BR [2&R[COND] ? R[PC]+=5]
3170 1401: ADD R[0]+R[1]->R[2]
3171 803: BR [4&R[COND] ? R[PC]+=3]
3172 1001: ADD R[0]+R[1]->R[0]
3173 1401: ADD R[0]+R[1]->R[2]
3174 7FD: BR [3&R[COND] ? R[PC]+=-3]
3175 6F80: LDR mem[R[6]+0] -> R[7] #nzp
3176 6B81: LDR mem[R[6]+1] -> R[5] #nzp
3177 6982: LDR mem[R[6]+2] -> R[4] #nzp
3178 6783: LDR mem[R[6]+3] -> R[3] #nzp
3179 6584: LDR mem[R[6]+4] -> R[2] #nzp
317A 1DA5: ADD  R[6]+5->R[6]
317B C1C0: RET R[R7] -> R[PC]
317C 0:  
