# sinstdlib makefile

# General macros
SRC_DIR=./src
ASM_DIR=./src/asm
C_DIR=./src/C
SIN_DIR=./src/SIN
OBJ_DIR=./bin

SIN_FILES=$(wildcard $(SIN_DIR)/*.sin)
sinobj=$(patsubst %.sin, $(OBJ_DIR)/%.o, $(notdir $(SIN_FILES)))

# Get the OS for proper build
os_name := $(shell uname)

# ASM macros
asm=nasm
asm_flags=-g -i ../SRE/src/asm/
ifeq ($(os_name), Linux)
	asm_flags += -f elf64
endif
ifeq ($(os_name), Darwin)
	asm_flags += -f macho64
endif
# todo: more checks for OS-agnosticism

# C, C++ macros
cc=gcc
cpp_c=g++
cpp_version=c++14
cpp_flags=-std=$(cpp_version) -g

# SIN macros
sin=../SINx86/sinx86
# todo: flags for SIN compiler

target=libSIN.a

default: $(target)

$(target): $(sinobj)
	@echo "Building sinstdlib..."
	ar rcs $@ $(sinobj) $(cobj) $(asmobj)
	@echo "Done."

$(OBJ_DIR)/%.o: $(SIN_DIR)/%.sin
	$(sin) $<
	$(asm) $(asm_flags) -o $@ $(addsuffix .s, $(basename $<))

clean:
	rm bin/*.o
	rm $(SIN_DIR)/*.s

.PHONY: $(target) clean
