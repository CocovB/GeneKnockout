\ENCODING=ISO-8859-1
\Problem name: 

Maximize
 pd_R09: R09 + 0 pADP + 0 pATP + 0 pM1 + 0 pM10 + 0 pM11 + 0 pM12 + 0 pM13
         + 0 pM2 + 0 pM3 + 0 pM4 + 0 pM6 + 0 pM7 + 0 pM8 + 0 pM9
Subject To
 pADP:     R01 - R03 - R13  = 0
 pATP:     - R01 + R03 + R13  = 0
 pM1:      R01 - R02 - R10  = 0
 pM10:     R12  = 0
 pM11:     R13 - R14  = 0
 pM12:     0.7 R14 - R16  = 0
 pM13:     0.3 R14 - R15  = 0
 pM2:      - R03 + R02 + R11  = 0
 pM3:      R03 - R04 - R06 - R18  = 0
 pM4:      R04 - R05  = 0
 pM5:      - R17 + R16 + R05 + 0.5 R08  = 0
 pM6:      R06 - R07  = 0
 pM7:      - R08 + R07  = 0
 pM8:      2 R18 + 0.5 R08 - R09  = 0
 pM9:      - R13 + R10 - R12 - R11  = 0
 dR17:     - pM5 - l1 + u1  = 1
 objLinkC: R17 + 10 l1 - 1000 l5 - 1000 l6 - 1000 l11 - 1000 l12 - 1000 l15
           - 1000 u1 - 100 u2 - 1000 u3 - 1000 u4 - 1000 u5 - 1000 u6 - 1000 u7
           - 1000 u8 - 1000 u9 - 1000 u10 - 1000 u11 - 1000 u12 - 1000 u13
           - 1000 u14 - 1000 u15 - 1000 u16 - 1000 u17 - 1000 u18  = 0
 MinActR:  bin_R01 + bin_R03 + bin_R13 + bin_R02 + bin_R10 + bin_R12 + bin_R14
           + bin_R16 + bin_R15 + bin_R11 + bin_R04 + bin_R06 + bin_R18
           + bin_R05 + bin_R08 + bin_R07 + bin_R09 >= 15
 ind_R01:  bin_R01 = 0 -> R01  = 0
 ind_R03:  bin_R03 = 0 -> R03  = 0
 ind_R13:  bin_R13 = 0 -> R13  = 0
 ind_R02:  bin_R02 = 0 -> R02  = 0
 ind_R10:  bin_R10 = 0 -> R10  = 0
 ind_R12:  bin_R12 = 0 -> R12  = 0
 ind_R14:  bin_R14 = 0 -> R14  = 0
 ind_R16:  bin_R16 = 0 -> R16  = 0
 ind_R15:  bin_R15 = 0 -> R15  = 0
 ind_R11:  bin_R11 = 0 -> R11  = 0
 ind_R04:  bin_R04 = 0 -> R04  = 0
 ind_R06:  bin_R06 = 0 -> R06  = 0
 ind_R18:  bin_R18 = 0 -> R18  = 0
 ind_R05:  bin_R05 = 0 -> R05  = 0
 ind_R08:  bin_R08 = 0 -> R08  = 0
 ind_R07:  bin_R07 = 0 -> R07  = 0
 ind_R09:  bin_R09 = 0 -> R09  = 0
 ind_dR01: bin_R01 = 1 -> pADP - pATP + pM1 + u2 >= 0
 ind_dR03: bin_R03 = 1 -> - pADP + pATP - pM2 + pM3 + u3 >= 0
 ind_dR13: bin_R13 = 1 -> - pADP + pATP + pM11 - pM9 + u4 >= 0
 ind_dR02: bin_R02 = 1 -> - pM1 + pM2 - l5 + u5  = 0
 ind_dR10: bin_R10 = 1 -> - pM1 + pM9 - l6 + u6  = 0
 ind_dR12: bin_R12 = 1 -> pM10 - pM9 + u7 >= 0
 ind_dR14: bin_R14 = 1 -> - pM11 + 0.7 pM12 + 0.3 pM13 + u8 >= 0
 ind_dR16: bin_R16 = 1 -> - pM12 + pM5 + u9 >= 0
 ind_dR15: bin_R15 = 1 -> - pM13 + u10 >= 0
 ind_dR11: bin_R11 = 1 -> pM2 - pM9 - l11 + u11  = 0
 ind_dR04: bin_R04 = 1 -> - pM3 + pM4 - l12 + u12  = 0
 ind_dR06: bin_R06 = 1 -> - pM3 + pM6 + u13 >= 0
 ind_dR18: bin_R18 = 1 -> - pM3 + 2 pM8 + u14 >= 0
 ind_dR05: bin_R05 = 1 -> - pM4 + pM5 - l15 + u15  = 0
 ind_dR08: bin_R08 = 1 -> 0.5 pM5 - pM7 + 0.5 pM8 + u16 >= 0
 ind_dR07: bin_R07 = 1 -> - pM6 + pM7 + u17 >= 0
 ind_dR09: bin_R09 = 1 -> - pM8 + u18 >= 0
Bounds
 10 <= R17 <= 1000
 0 <= R01 <= 100
 0 <= R03 <= 1000
 0 <= R13 <= 1000
-1000 <= R02 <= 1000
-1000 <= R10 <= 1000
 0 <= R12 <= 1000
 0 <= R14 <= 1000
 0 <= R16 <= 1000
 0 <= R15 <= 1000
-1000 <= R11 <= 1000
-1000 <= R04 <= 1000
 0 <= R06 <= 1000
 0 <= R18 <= 1000
-1000 <= R05 <= 1000
 0 <= R08 <= 1000
 0 <= R07 <= 1000
 0 <= R09 <= 1000
      pADP Free
      pATP Free
      pM1 Free
      pM10 Free
      pM11 Free
      pM12 Free
      pM13 Free
      pM2 Free
      pM3 Free
      pM4 Free
      pM5 Free
      pM6 Free
      pM7 Free
      pM8 Free
      pM9 Free
 0 <= bin_R01 <= 1
 0 <= bin_R03 <= 1
 0 <= bin_R13 <= 1
 0 <= bin_R02 <= 1
 0 <= bin_R10 <= 1
 0 <= bin_R12 <= 1
 0 <= bin_R14 <= 1
 0 <= bin_R16 <= 1
 0 <= bin_R15 <= 1
 0 <= bin_R11 <= 1
 0 <= bin_R04 <= 1
 0 <= bin_R06 <= 1
 0 <= bin_R18 <= 1
 0 <= bin_R05 <= 1
 0 <= bin_R08 <= 1
 0 <= bin_R07 <= 1
 0 <= bin_R09 <= 1
Binaries
 bin_R01  bin_R03  bin_R13  bin_R02  bin_R10  bin_R12  bin_R14  bin_R16 
 bin_R15  bin_R11  bin_R04  bin_R06  bin_R18  bin_R05  bin_R08  bin_R07 
 bin_R09 
End
