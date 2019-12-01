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
OBJ1 = BaseSecuData.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ2 = BaseDataSync.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ3 = Base.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ4 = BaseClient.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ5 = User.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ6 = UserClient.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ7 = Permission.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ8 = PermissionClient.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ9 = FeeSecu.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ10 = FeeSecuClient.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ11 = Message.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ12 = BaseFutuData.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ13 = FutuQuotServer.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ14 = FeeFutu.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ15 = FeeFutuClient.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ16 = SecuQuotServer.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ17 = PublicIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ18 = TradeIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ19 = RiskIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ20 = ClearIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ21 = PubSyncIF.$(TO) ldstring.$(TO) lddate.$(TO)
OBJ22 = BaseSecuMarginData.$(TO) ldstring.$(TO) lddate.$(TO)

#(2)编译依赖.cpp.o:
#先清除目标文件
all : clean  	$(COM1)	$(COM2)	$(COM3)	$(COM4)	$(COM5)	$(COM6)	$(COM7)	$(COM8)	$(COM9)	$(COM10)	$(COM11)	$(COM12)	$(COM13)	$(COM14)	$(COM15)	$(COM16)	$(COM17)	$(COM18)	$(COM19)	$(COM20)	$(COM21)	$(COM22)

BaseSecuData.$(TO):BaseSecuData.cpp
	$(CC) $(CFLAGS) BaseSecuData.cpp -I$(INCDIR)
BaseDataSync.$(TO):BaseDataSync.cpp
	$(CC) $(CFLAGS) BaseDataSync.cpp -I$(INCDIR)
Base.$(TO):Base.cpp
	$(CC) $(CFLAGS) Base.cpp -I$(INCDIR)
BaseClient.$(TO):BaseClient.cpp
	$(CC) $(CFLAGS) BaseClient.cpp -I$(INCDIR)
User.$(TO):User.cpp
	$(CC) $(CFLAGS) User.cpp -I$(INCDIR)
UserClient.$(TO):UserClient.cpp
	$(CC) $(CFLAGS) UserClient.cpp -I$(INCDIR)
Permission.$(TO):Permission.cpp
	$(CC) $(CFLAGS) Permission.cpp -I$(INCDIR)
PermissionClient.$(TO):PermissionClient.cpp
	$(CC) $(CFLAGS) PermissionClient.cpp -I$(INCDIR)
FeeSecu.$(TO):FeeSecu.cpp
	$(CC) $(CFLAGS) FeeSecu.cpp -I$(INCDIR)
FeeSecuClient.$(TO):FeeSecuClient.cpp
	$(CC) $(CFLAGS) FeeSecuClient.cpp -I$(INCDIR)
Message.$(TO):Message.cpp
	$(CC) $(CFLAGS) Message.cpp -I$(INCDIR)
BaseFutuData.$(TO):BaseFutuData.cpp
	$(CC) $(CFLAGS) BaseFutuData.cpp -I$(INCDIR)
FutuQuotServer.$(TO):FutuQuotServer.cpp
	$(CC) $(CFLAGS) FutuQuotServer.cpp -I$(INCDIR)
FeeFutu.$(TO):FeeFutu.cpp
	$(CC) $(CFLAGS) FeeFutu.cpp -I$(INCDIR)
FeeFutuClient.$(TO):FeeFutuClient.cpp
	$(CC) $(CFLAGS) FeeFutuClient.cpp -I$(INCDIR)
SecuQuotServer.$(TO):SecuQuotServer.cpp
	$(CC) $(CFLAGS) SecuQuotServer.cpp -I$(INCDIR)
PublicIF.$(TO):PublicIF.cpp
	$(CC) $(CFLAGS) PublicIF.cpp -I$(INCDIR)
TradeIF.$(TO):TradeIF.cpp
	$(CC) $(CFLAGS) TradeIF.cpp -I$(INCDIR)
RiskIF.$(TO):RiskIF.cpp
	$(CC) $(CFLAGS) RiskIF.cpp -I$(INCDIR)
ClearIF.$(TO):ClearIF.cpp
	$(CC) $(CFLAGS) ClearIF.cpp -I$(INCDIR)
PubSyncIF.$(TO):PubSyncIF.cpp
	$(CC) $(CFLAGS) PubSyncIF.cpp -I$(INCDIR)
BaseSecuMarginData.$(TO):BaseSecuMarginData.cpp
	$(CC) $(CFLAGS) BaseSecuMarginData.cpp -I$(INCDIR)

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
$(COM15):$(OBJ15)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM15)$(LIB_EXT) $(OBJ15) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM16):$(OBJ16)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM16)$(LIB_EXT) $(OBJ16) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM17):$(OBJ17)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM17)$(LIB_EXT) $(OBJ17) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM18):$(OBJ18)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM18)$(LIB_EXT) $(OBJ18) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM19):$(OBJ19)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM19)$(LIB_EXT) $(OBJ19) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM20):$(OBJ20)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM20)$(LIB_EXT) $(OBJ20) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM21):$(OBJ21)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM21)$(LIB_EXT) $(OBJ21) $(STDLIBS)  $(DEFLIBS) $(EXPS)
$(COM22):$(OBJ22)
	$(LD) $(LFLAGS) -o$(OUTDIR)/$(LIB_PRE)$(COM22)$(LIB_EXT) $(OBJ22) $(STDLIBS)  $(DEFLIBS) $(EXPS)

#(3)清理命令
cleanobj:
	$(RMOBJ)
clean:cleanobj
	@echo clean all
	$(RMALL)
