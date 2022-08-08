#!/usr/bin/env ipython

#------------------------------------------------------------#

from __future__ import print_function

from unicorn import *
from unicorn.x86_const import *

from pwn import *

from capstone import *

#------------------------------------------------------------#
result=[]

CODE=read('payload.bin')

md = Cs(CS_ARCH_X86, CS_MODE_64)

print("\nDisassembler code:\n")

for i in md.disasm(CODE, 0x1000):
    print("0x%x:\t%s\t%s" %
          (i.address, i.mnemonic, i.op_str))

#------------------------------------------------------------#

CODE = open("payload.bin","rb").read()

address = 0x1000

print("\nIn RAX saves decoded payload:\n")

def hook_code(uc, address, size, user_data):
    rax = mu.reg_read(UC_X86_REG_RAX)
    result.append(hex(rax))
    print(">>> RAX = 0x%x" %rax)


mu=Uc(UC_ARCH_X86,UC_MODE_64)
mu.mem_map(address,address+0x2000)
mu.mem_write(address,CODE)
mu.reg_write(UC_X86_REG_ESP,address+0x1000)
mu.hook_add(UC_HOOK_CODE, hook_code, begin=0x1001, end=0x107c)
mu.emu_start(address,address+len(CODE))

final = list(dict.fromkeys(result)) 

final.remove('0x0')

print("\nResult string in hex unorder: ",final)

str = "".join(final)

str = str.replace("0x","")         

print("\nResult string: ",binascii.unhexlify(str)[::-1] )
#------------------------------------------------------------#
