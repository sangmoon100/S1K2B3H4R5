################################################################################
#  [종합인사정보시스템] 급여이체                                               #
#  프로그램명 : EDI전송 프로그램인 rcvd 파일을 생성하는 makefile               # 
###############################################################################

.SUFFIXES : .c .o

CC       = cc

###### Include 디렉토리  ###################################################
HINSA   = /hper/insa/HINSA
INCDIR  = $(HINSA)/proc/src/EDIsrc/include
INCINSA = $(HINSA)/common/inc
################################################################################

#64bit Compile Option(-Ae +DD64) 추가 2007.02.
CFLAGS   = -Ae +DD64 -I. -O -D_HPUX_SOURCE -w1 -I$(INCDIR) -I$(INCINSA)

TARGET   = rcvd
SRCS     = rcv.c sigset.c lib.c makedir.c
OBJS     = $(SRCS:.c=.o)

nooption :
	@echo
	@echo ========== 옵션[all or clean]을 사용하세요.============================
	@echo

all : $(TARGET

$(TARGET) : $(OBJS
	@echo
	@echo ============ Make Application Start ===================================
	@echo
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS) \
		-L/hper/insa/HINSA/proc/src/EDIsrc/lib -l:hostlib.a \
		-L/hper/insa/HINSA/common/lib -lhinsa_common
		
	@echo	
	rm -rf *.o
	@echo
	@echo ============ Make Application End =====================================

clean :
	@echo ============ Remove Object file and Library Start.=====================
	@echo
	rm -rf $(OBJS) $(TARGET) core
	rm -rf *.o
	@echo
	@echo ============ Remove Object file and Library End.=======================

.c.o :
	$(CC) $(CFLAGS) -c $*.c
