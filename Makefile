#LLVM_SRC=llvm

-include config.local

# Use our version of clang (even without installing)
LLVM_BIN= $(CURDIR)/_install/bin

LLVM_CONFIG := $(shell $(LLVM_BIN)/llvm-config --cxxflags --ldflags --libs all)

g++ : bp.cpp
	g++ bp.cpp -g -lclangParse -lclangFrontend -lclangSerialization \
	-lclangDriver -lclangCodeGen -lclangSema -lclangChecker \
	-lclangAnalysis -lclangRewrite -lclangAST -lclangLex -lclangBasic \
	$(LLVM_CONFIG)
