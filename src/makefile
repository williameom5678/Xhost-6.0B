#CC=gcc -O3 -W

# Set this to your MySQL installation-path
MYSQLINC=-I/usr/local/mysql/include/mysql
MYSQLLIB=-L/usr/local/mysql/lib/mysql
EXTRALIBS= -lmysqlclient -lm

CC=gcc -O3 -W $(MYSQLINC) $(MYSQLLIB)
# rules
all:	m

MAIN	=main.o find.o us.o check.o bbs.o bbssub.o bbsread.o write.o xchat.o xchatut.o mail.o down.o comm.o sub.o gocode.o logo.o mterm.o mess.o ut.o utdb.o utbase.o utview.o startid.o notice.o exec.o sys_menu.o sbook.o
m: $(MAIN)
	./makenum;$(CC) -o $@ $(MAIN) -s $(MYSQLLIB) $(EXTRALIBS)

u:
	cp -f m  /bbs/bin/main
	cp -f guest  /bbs/bin/
	cp -f cguest  /bbs/bin/
	cp -f ed_menu  /bbs/bin/
	cp -f xfrm  /bbs/bin/
	cp -f bsysop /bbs/bin/
	cp -f txt2bbs /bbs/bin/


XFRM	=xfrm.o ut.o utdb.o utbase.o utview.o 
xfrm: $(XFRM)
	$(CC) -o $@ $(XFRM) $(MYSQLINC) -s -L. $(MYSQLLIB) $(EXTRALIBS)

FINDMENU	=findmenu.o ut.o utdb.o utbase.o utview.o 
findmenu: $(FINDMENU)
	$(CC) -o $@ $(FINDMENU) $(MYSQLINC) -s -L. $(MYSQLLIB) $(EXTRALIBS)

MAILLIST	=maillist.o ut.o utdb.o utbase.o utview.o 
maillist: $(MAILLIST)
	$(CC) -o $@ $(MAILLIST) $(MYSQLINC) -s -L. $(MYSQLLIB) $(EXTRALIBS)


PF	=pf.o ut.o utdb.o utbase.o utview.o 
pf: $(PF)
	$(CC) -o $@ $(PF) $(MYSQLINC) -s -L. $(MYSQLLIB) $(EXTRALIBS)
#	$(CC) -o $@ $(PF) $(MYSQLINC) -s -L. $(MYSQLLIB) $(EXTRALIBS)



GUEST	=guest.o ut.o utdb.o utbase.o utview.o 
guest: $(GUEST)
	$(CC) -o $@ $(GUEST) $(MYSQLINC) -s -L. $(MYSQLLIB) $(EXTRALIBS)

CGUEST	=cguest.o ut.o utdb.o utbase.o utview.o 
cguest: $(CGUEST)
	$(CC) -o $@ $(CGUEST) $(MYSQLINC) -s -L. $(MYSQLLIB) $(EXTRALIBS)

BSYSOP	=bsysop.o ut.o utdb.o utbase.o utview.o 
bsysop: $(BSYSOP)
	$(CC) -o $@ $(BSYSOP) $(MYSQLINC) -s -L. $(MYSQLLIB) $(EXTRALIBS)



TXT2BBS	=txt2bbs.o txt2bbsu.o ut.o utdb.o utbase.o utview.o 
txt2bbs: $(TXT2BBS)
	$(CC) -o $@ $(TXT2BBS) $(MYSQLINC) -s -L. $(MYSQLLIB) $(EXTRALIBS)


ED_MENU	=ed_menu.o ut.o utdb.o utbase.o utview.o
ed_menu: $(ED_MENU)
	$(CC) -o $@ $(ED_MENU) $(MYSQLINC) -s -L. $(MYSQLLIB) $(EXTRALIBS)
