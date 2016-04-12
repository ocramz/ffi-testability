WORKDIR = $(PWD)
SRCDIR = src
LIBDIR = lib

step1:
	ghc ${SRCDIR}/InlineC.hs -i${SRCDIR}/

step2:
	cc -c ${SRCDIR}/InlineC.c -o ${LIBDIR}/InlineC.o

step3:
	ghci ${SRCDIR}/PutGet.hs ${LIBDIR}/InlineC.o

all:
	make step1
	make step2
	make step3

main:
	stack build --extra-include-dirs=.. 
