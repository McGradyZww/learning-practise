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
OBJ1 = ProductAcco.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ2 = ProductCapital.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ3 = ProductCapitalBack.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ4 = ProductAccoBack.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ5 = ProductPubIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ6 = ProductClearIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ7 = ProductExchIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ8 = ProductRiskIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ9 = ProductSyncIF.$(TO) ldstring.$(TO) lddate.$(TO)

#(2)编译依赖.cpp.o:
#先清除目标文件
all : clean  	$(COM1)	$(COM2)	$(COM3)	$(COM4)	$(COM5)	$(COM6)	$(COM7)	$(COM8)	$(COM9)

ProductAcco.$(TO):ProductAcco.cpp
	$(CC) $(CFLAGS) ProductAcco.cpp -I$(INCDIR)
ProductCapital.$(TO):ProductCapital.cpp
	$(CC) $(CFLAGS) ProductCapital.cpp -I$(INCDIR)
ProductCapitalBack.$(TO):ProductCapitalBack.cpp
	$(CC) $(CFLAGS) ProductCapitalBack.cpp -I$(INCDIR)
ProductAccoBack.$(TO):ProductAccoBack.cpp
	$(CC) $(CFLAGS) ProductAccoBack.cpp -I$(INCDIR)
ProductPubIF.$(TO):ProductPubIF.cpp
	$(CC) $(CFLAGS) ProductPubIF.cpp -I$(INCDIR)
ProductClearIF.$(TO):ProductClearIF.cpp
	$(CC) $(CFLAGS) ProductClearIF.cpp -I$(INCDIR)
ProductExchIF.$(TO):ProductExchIF.cpp
	$(CC) $(CFLAGS) ProductExchIF.cpp -I$(INCDIR)
ProductRiskIF.$(TO):ProductRiskIF.cpp
	$(CC) $(CFLAGS) ProductRiskIF.cpp -I$(INCDIR)
ProductSyncIF.$(TO):ProductSyncIF.cpp
	$(CC) $(CFLAGS) ProductSyncIF.cpp -I$(INCDIR)

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

#(3)清理命令
cleanobj:
	$(RMOBJ)
clean:cleanobj
	@echo clean all
	$(RMALL)
