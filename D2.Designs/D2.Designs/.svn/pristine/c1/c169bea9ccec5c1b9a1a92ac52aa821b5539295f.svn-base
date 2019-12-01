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
OBJ1 = ClearSecuPublic.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ2 = ClearSecuClear.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ3 = ClearSecuSett.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ4 = ClearSecuBaseDataSync.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ5 = ClearSecuCrdtClear.$(TO) ldstring.$(TO) lddate.$(TO)

#(2)编译依赖.cpp.o:
#先清除目标文件
all : clean  	$(COM1)	$(COM2)	$(COM3)	$(COM4)	$(COM5)

ClearSecuPublic.$(TO):ClearSecuPublic.cpp
	$(CC) $(CFLAGS) ClearSecuPublic.cpp -I$(INCDIR)
ClearSecuClear.$(TO):ClearSecuClear.cpp
	$(CC) $(CFLAGS) ClearSecuClear.cpp -I$(INCDIR)
ClearSecuSett.$(TO):ClearSecuSett.cpp
	$(CC) $(CFLAGS) ClearSecuSett.cpp -I$(INCDIR)
ClearSecuBaseDataSync.$(TO):ClearSecuBaseDataSync.cpp
	$(CC) $(CFLAGS) ClearSecuBaseDataSync.cpp -I$(INCDIR)
ClearSecuCrdtClear.$(TO):ClearSecuCrdtClear.cpp
	$(CC) $(CFLAGS) ClearSecuCrdtClear.cpp -I$(INCDIR)

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

#(3)清理命令
cleanobj:
	$(RMOBJ)
clean:cleanobj
	@echo clean all
	$(RMALL)
