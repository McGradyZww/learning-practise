##########################################################################
##
##  makefile.inc
##
##########################################################################
## win32 平台
##    .cpp  .obj:
##        $(CPP) $(CFLAGS) /c -Fo$*.obj $< $(DEFS) $(INCDIR)
##
## linux 平台
##    .cpp  .o:
##        $(CC) $(CFLAGS) -o $*.o $(INCDIR)  $*.cpp
##########################################################################

#(1)主程序目标文件
OBJ1 = TrdSecuPublic.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ2 = TrdSecuAcco.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ3 = TrdSecuAppr.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ4 = TrdSecuTrd.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ5 = TrdSecuRpt.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ6 = TrdSecuT0.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ7 = TrdSecuZt.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ8 = TrdSecuTrdIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ9 = TrdSecuRiskIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ10 = TrdSecuPushIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ11 = TrdSecuBack.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ12 = TrdSecuStrategy.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ13 = TrdSecuAccoBack.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ14 = TrdSecuSyncIF.$(TO) ldstring.$(TO) lddate.$(TO)

#(2)编译依赖.cpp.o:
#先清除目标文件
all : clean  	$(COM1)	$(COM2)	$(COM3)	$(COM4)	$(COM5)	$(COM6)	$(COM7)	$(COM8)	$(COM9)	$(COM10)	$(COM11)	$(COM12)	$(COM13)	$(COM14)

TrdSecuPublic.$(TO):TrdSecuPublic.cpp
	$(CC) $(CFLAGS) TrdSecuPublic.cpp -I$(INCDIR)
TrdSecuAcco.$(TO):TrdSecuAcco.cpp
	$(CC) $(CFLAGS) TrdSecuAcco.cpp -I$(INCDIR)
TrdSecuAppr.$(TO):TrdSecuAppr.cpp
	$(CC) $(CFLAGS) TrdSecuAppr.cpp -I$(INCDIR)
TrdSecuTrd.$(TO):TrdSecuTrd.cpp
	$(CC) $(CFLAGS) TrdSecuTrd.cpp -I$(INCDIR)
TrdSecuRpt.$(TO):TrdSecuRpt.cpp
	$(CC) $(CFLAGS) TrdSecuRpt.cpp -I$(INCDIR)
TrdSecuT0.$(TO):TrdSecuT0.cpp
	$(CC) $(CFLAGS) TrdSecuT0.cpp -I$(INCDIR)
TrdSecuZt.$(TO):TrdSecuZt.cpp
	$(CC) $(CFLAGS) TrdSecuZt.cpp -I$(INCDIR)
TrdSecuTrdIF.$(TO):TrdSecuTrdIF.cpp
	$(CC) $(CFLAGS) TrdSecuTrdIF.cpp -I$(INCDIR)
TrdSecuRiskIF.$(TO):TrdSecuRiskIF.cpp
	$(CC) $(CFLAGS) TrdSecuRiskIF.cpp -I$(INCDIR)
TrdSecuPushIF.$(TO):TrdSecuPushIF.cpp
	$(CC) $(CFLAGS) TrdSecuPushIF.cpp -I$(INCDIR)
TrdSecuBack.$(TO):TrdSecuBack.cpp
	$(CC) $(CFLAGS) TrdSecuBack.cpp -I$(INCDIR)
TrdSecuStrategy.$(TO):TrdSecuStrategy.cpp
	$(CC) $(CFLAGS) TrdSecuStrategy.cpp -I$(INCDIR)
TrdSecuAccoBack.$(TO):TrdSecuAccoBack.cpp
	$(CC) $(CFLAGS) TrdSecuAccoBack.cpp -I$(INCDIR)
TrdSecuSyncIF.$(TO):TrdSecuSyncIF.cpp
	$(CC) $(CFLAGS) TrdSecuSyncIF.cpp -I$(INCDIR)

ldstring.$(TO):../../pub/ldstring.cpp
	$(CC) $(CFLAGS) ../../pub/ldstring.cpp -I$(INCDIR)
lddate.$(TO):../../pub/lddate.cpp
	$(CC) $(CFLAGS) ../../pub/lddate.cpp -I$(INCDIR)

$(COM1):$(OBJ1)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM1)$(LIB_EXT) $(OBJ1) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM2):$(OBJ2)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM2)$(LIB_EXT) $(OBJ2) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM3):$(OBJ3)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM3)$(LIB_EXT) $(OBJ3) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM4):$(OBJ4)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM4)$(LIB_EXT) $(OBJ4) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM5):$(OBJ5)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM5)$(LIB_EXT) $(OBJ5) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM6):$(OBJ6)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM6)$(LIB_EXT) $(OBJ6) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM7):$(OBJ7)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM7)$(LIB_EXT) $(OBJ7) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM8):$(OBJ8)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM8)$(LIB_EXT) $(OBJ8) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM9):$(OBJ9)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM9)$(LIB_EXT) $(OBJ9) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM10):$(OBJ10)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM10)$(LIB_EXT) $(OBJ10) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM11):$(OBJ11)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM11)$(LIB_EXT) $(OBJ11) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM12):$(OBJ12)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM12)$(LIB_EXT) $(OBJ12) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM13):$(OBJ13)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM13)$(LIB_EXT) $(OBJ13) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM14):$(OBJ14)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM14)$(LIB_EXT) $(OBJ14) $(STDLIBS)  $(DEFLIBS) $(EXPS)

#(3)清理命令
cleanobj:
	$(RMOBJ)
clean:cleanobj
	@echo clean all
	$(RMALL)
