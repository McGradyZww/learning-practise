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
OBJ1 = ProductFutuAcco.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ2 = ProductFutuCapital.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ3 = ProductFutuPosi.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ4 = ProductFutuPubIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ5 = ProductFutuClearIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ6 = ProductFutuExchIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ7 = ProductFutuAccoBack.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ8 = ProductFutuRiskIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ9 = ProductFutuPosiBack.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ10 = ProductFutuCapitalBack.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ11 = ProductFutuSyncIF.$(TO) ldstring.$(TO) lddate.$(TO)

#(2)编译依赖.cpp.o:
#先清除目标文件
all : clean  	$(COM1)	$(COM2)	$(COM3)	$(COM4)	$(COM5)	$(COM6)	$(COM7)	$(COM8)	$(COM9)	$(COM10)	$(COM11)

ProductFutuAcco.$(TO):ProductFutuAcco.cpp
	$(CC) $(CFLAGS) ProductFutuAcco.cpp -I$(INCDIR)
ProductFutuCapital.$(TO):ProductFutuCapital.cpp
	$(CC) $(CFLAGS) ProductFutuCapital.cpp -I$(INCDIR)
ProductFutuPosi.$(TO):ProductFutuPosi.cpp
	$(CC) $(CFLAGS) ProductFutuPosi.cpp -I$(INCDIR)
ProductFutuPubIF.$(TO):ProductFutuPubIF.cpp
	$(CC) $(CFLAGS) ProductFutuPubIF.cpp -I$(INCDIR)
ProductFutuClearIF.$(TO):ProductFutuClearIF.cpp
	$(CC) $(CFLAGS) ProductFutuClearIF.cpp -I$(INCDIR)
ProductFutuExchIF.$(TO):ProductFutuExchIF.cpp
	$(CC) $(CFLAGS) ProductFutuExchIF.cpp -I$(INCDIR)
ProductFutuAccoBack.$(TO):ProductFutuAccoBack.cpp
	$(CC) $(CFLAGS) ProductFutuAccoBack.cpp -I$(INCDIR)
ProductFutuRiskIF.$(TO):ProductFutuRiskIF.cpp
	$(CC) $(CFLAGS) ProductFutuRiskIF.cpp -I$(INCDIR)
ProductFutuPosiBack.$(TO):ProductFutuPosiBack.cpp
	$(CC) $(CFLAGS) ProductFutuPosiBack.cpp -I$(INCDIR)
ProductFutuCapitalBack.$(TO):ProductFutuCapitalBack.cpp
	$(CC) $(CFLAGS) ProductFutuCapitalBack.cpp -I$(INCDIR)
ProductFutuSyncIF.$(TO):ProductFutuSyncIF.cpp
	$(CC) $(CFLAGS) ProductFutuSyncIF.cpp -I$(INCDIR)

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

#(3)清理命令
cleanobj:
	$(RMOBJ)
clean:cleanobj
	@echo clean all
	$(RMALL)
