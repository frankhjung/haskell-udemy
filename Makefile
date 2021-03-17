#!/usr/bin/env make

# execute fib with parameters:
#
#   make ARGS="-i 12 -s 12" exec

.PHONY:	all bench build check clean cleanall doc exec ghci install lint setup style tags test

TARGET	:= chapter8
SUBS	:= $(wildcard */)
SRCS	:= $(wildcard $(addsuffix *.hs, $(SUBS)))
RTSOPTS	?= +RTS -N1

.PHONY: default
default:	check build exec

all:	check build test doc exec

check:	tags style lint

tags:
	@hasktags --ctags --extendedctag $(SRCS)

style:
	@stylish-haskell --config=.stylish-haskell.yaml --inplace $(SRCS)

lint:
	@hlint --color $(SRCS)

build:
	@stack build

test:
	@stack test

bench:
	@stack bench --benchmark-arguments '-o .stack-work/benchmark.html $(RTSOPTS)'

doc:
	@stack test --coverage --no-run-tests --test-arguments '$(RTSOPTS)'
	@stack haddock

exec:
	@stack exec $(TARGET) -- $(RTSOPTS) -s

setup:
	-stack setup
	-stack build --dependencies-only
	-stack query
	-stack ls dependencies

ghci:
	@stack ghci --ghci-options -Wno-type-defaults

clean:
	@stack clean
	@$(RM) -rf $(TARGET).tix

cleanall: clean
	@stack clean --full
	# @$(RM) -rf .stack-work/ $(TARGET)
