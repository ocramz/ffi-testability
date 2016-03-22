step1:
	ghc src/InlineC.hs -isrc/

step2:
	cc -c src/InlineC.hs -o lib/InlineC.o

step3:
	ghci src/PutGet.hs

all:
	make step1
	make step2
	make step3

main:
	stack build --extra-include-dirs=.. 
