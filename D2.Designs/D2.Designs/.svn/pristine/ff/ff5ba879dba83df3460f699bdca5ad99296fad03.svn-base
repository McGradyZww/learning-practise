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
OBJ1 = ProductSecuAcco.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ2 = ProductSecuCapital.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ3 = ProductSecuPosi.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ4 = ProductSecuPubIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ5 = ProductSecuClearIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ6 = ProductSecuExchIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ7 = ProductSecuAccoBack.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ8 = ProductSecuRiskIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ9 = ProductSecuPosiBack.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ10 = ProductSecuCapitalBack.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ11 = ProductSecuCrdt.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ12 = ProductSecuCrdtClearIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ13 = ProductSecuSyncIF.$(TO) ldstring.$(TO) lddate.$(TO)

#(2)编译依赖.cpp.o:
#先清除目标文件
all : clean  	$(COM1)	$(COM2)	$(COM3)	$(COM4)	$(COM5)	$(COM6)	$(COM7)	$(COM8)	$(COM9)	$(COM10)	$(COM11)	$(COM12)	$(COM13)

ProductSecuAcco.$(TO):ProductSecuAcco.cpp
	$(CC) $(CFLAGS) ProductSecuAcco.cpp -I$(INCDIR)
ProductSecuCapital.$(TO):ProductSecuCapital.cpp
	$(CC) $(CFLAGS) ProductSecuCapital.cpp -I$(INCDIR)
ProductSecuPosi.$(TO):ProductSecuPosi.cpp
	$(CC) $(CFLAGS) ProductSecuPosi.cpp -I$(INCDIR)
ProductSecuPubIF.$(TO):ProductSecuPubIF.cpp
	$(CC) $(CFLAGS) ProductSecuPubIF.cpp -I$(INCDIR)
ProductSecuClearIF.$(TO):ProductSecuClearIF.cpp
	$(CC) $(CFLAGS) ProductSecuClearIF.cpp -I$(INCDIR)
ProductSecuExchIF.$(TO):ProductSecuExchIF.cpp
	$(CC) $(CFLAGS) ProductSecuExchIF.cpp -I$(INCDIR)
ProductSecuAccoBack.$(TO):ProductSecuAccoBack.cpp
	$(CC) $(CFLAGS) ProductSecuAccoBack.cpp -I$(INCDIR)
ProductSecuRiskIF.$(TO):ProductSecuRiskIF.cpp
	$(CC) $(CFLAGS) ProductSecuRiskIF.cpp -I$(INCDIR)
ProductSecuPosiBack.$(TO):ProductSecuPosiBack.cpp
	$(CC) $(CFLAGS) ProductSecuPosiBack.cpp -I$(INCDIR)
ProductSecuCapitalBack.$(TO):ProductSecuCapitalBack.cpp
	$(CC) $(CFLAGS) ProductSecuCapitalBack.cpp -I$(INCDIR)
ProductSecuCrdt.$(TO):ProductSecuCrdt.cpp
	$(CC) $(CFLAGS) ProductSecuCrdt.cpp -I$(INCDIR)
ProductSecuCrdtClearIF.$(TO):ProductSecuCrdtClearIF.cpp
	$(CC) $(CFLAGS) ProductSecuCrdtClearIF.cpp -I$(INCDIR)
ProductSecuSyncIF.$(TO):ProductSecuSyncIF.cpp
	$(CC) $(CFLAGS) ProductSecuSyncIF.cpp -I$(INCDIR)

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

#(3)清理命令
cleanobj:
	$(RMOBJ)
clean:cleanobj
	@echo clean all
	$(RMALL)
