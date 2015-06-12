CXXFLAGS += -O2 -Wall -Wextra -march=native -mtune=native -std=c++11

DEPSRC=depsrc
DEPINST=depinst

LDFLAGS += -L $(DEPINST)/lib -Wl,-rpath $(DEPINST)/lib
LDLIBS += -lgmpxx -lgmp
CXXFLAGS += -I $(DEPINST)/include -DBN_SUPPORT_SNARK
LDLIBS += -lzm

EXECUTABLES = \
	test

$(EXECUTABLES): %: %.o $(OBJS)
	$(CXX) -o $@ $^ $(CXXFLAGS) $(LDFLAGS) $(LDLIBS)
