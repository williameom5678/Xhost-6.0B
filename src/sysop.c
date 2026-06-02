////////////////////////////////////////////////////////////////////////
// XHOST text sysop utility
////////////////////////////////////////////////////////////////////////
#include "bbs.h"

#define SYSOP_PAGE_LINES 20

static char sysop_club[21];
static char sysop_code[21];

static char *sysop_s(MYSQL_ROW row, int n)
{
	return (row && row[n]) ? row[n] : "";
}

static void sysop_wait()
{
	char buff[8];
	printf("\n[Enter] ");
	lineinput(buff, 5);
	printf("\n");
}

static void sysop_prompt(char *title, char *buff, int len)
{
	printf("%s", title);
	lineinput(buff, len);
	check_han(buff);
	printf("\n");
}

static int sysop_yesno(char *title, int def)
{
	char buff[8];
	printf("%s", title);
	lineinput(buff, 5);
	check_han(buff);
	printf("\n");
	if (strlen(buff) < 1) return def;
	if (buff[0] == 'y' || buff[0] == 'Y' || buff[0] == '1') return Yes;
	return No;
}

static void sysop_sql_escape(char *dst, const char *src, int dst_size)
{
	int i, n;

	if (dst_size < 1) return;
	for (i = 0, n = 0; src[i] && n < dst_size - 1; i++) {
		if ((src[i] == '\\' || src[i] == '\'' || src[i] == '"') && n < dst_size - 2)
			dst[n++] = '\\';
		if ((unsigned char)src[i] < 32) continue;
		dst[n++] = src[i];
	}
	dst[n] = 0;
}

static int sysop_safe_word(char *str)
{
	int i;

	if (strlen(str) < 1) return No;
	for (i = 0; str[i]; i++) {
		if (isalnum((unsigned char)str[i])) continue;
		if (str[i] == '_' || str[i] == '-' || str[i] == '.') continue;
		return No;
	}
	return Yes;
}

static void sysop_clean_word(char *str)
{
	del_space(str);
	del_esc(str);
}

static MYSQL *sysop_db(MYSQL *mysql, char *dbname)
{
	MYSQL *sock;

	if (!(sock = mysql_connect(mysql, DB_HOST, DB_USER, DB_PASSWD))) {
		printf("## SYSOP DB connect error: %s\n", mysql_error(mysql));
		return NULL;
	}
	if (mysql_select_db(sock, dbname) == -1) {
		printf("## SYSOP DB select error(%s): %s\n", dbname, mysql_error(sock));
		mysql_close(sock);
		return NULL;
	}
	return sock;
}

static int sysop_count(MYSQL *sock, char *table, char *where)
{
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char query[500];
	int count = 0;

	if (strlen(where) > 0)
		sprintf(query, "SELECT count(*) FROM %s WHERE %s", table, where);
	else
		sprintf(query, "SELECT count(*) FROM %s", table);
	if (mysql_query(sock, query) == -1) return -1;
	qres = mysql_store_result(sock);
	if ((qrow = mysql_fetch_row(qres)) != NULL && qrow[0])
		count = atoi(qrow[0]);
	mysql_free_result(qres);
	return count;
}

static int sysop_table_exists(MYSQL *sock, char *table)
{
	char query[300];
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	int found = No;

	if (!sysop_safe_word(table)) return No;
	sprintf(query, "SHOW TABLES LIKE '%s'", table);
	if (mysql_query(sock, query) == -1) return No;
	qres = mysql_store_result(sock);
	if ((qrow = mysql_fetch_row(qres)) != NULL) found = Yes;
	mysql_free_result(qres);
	return found;
}

static int sysop_user_exists(char *id)
{
	PF oldpf;
	int found;

	oldpf = pf;
	found = read_pf2(id);
	pf = oldpf;
	return found;
}

static int sysop_can_use()
{
	if (pf.type >= 18) return Yes;
	if (strlen(cfg.sysop) > 0 && is_same2(cfg.sysop, pf.id)) return Yes;
	return No;
}

static int sysop_page(int *line)
{
	char buff[8];

	(*line)++;
	if (*line < SYSOP_PAGE_LINES) return Yes;
	printf("-- more -- ");
	lineinput(buff, 5);
	printf("\n");
	if (is_quit(buff)) return No;
	*line = 0;
	return Yes;
}

static void sysop_summary()
{
	MYSQL mysql, *sock;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char query[500];
	int n;

	cls();
	printf(" XHOST SYSOP SUMMARY\n");
	printf(" ----------------------------------------------------------------------\n");
	printf(" DB_HOST : %s\n", DB_HOST);
	printf(" DB_NAME : %s\n", DB_NAME);
	printf(" DB_MAIL : %s\n", DB_MAIL);
	printf(" DB_CM   : %s\n\n", DB_CM);

	if (!(sock = sysop_db(&mysql, DB_NAME))) {
		sysop_wait();
		return;
	}

	sprintf(query, "SELECT hostname,sysop,itype,rtype,wtype,dtype FROM cfg LIMIT 1");
	if (mysql_query(sock, query) != -1) {
		qres = mysql_store_result(sock);
		if ((qrow = mysql_fetch_row(qres)) != NULL) {
			printf(" Hostname : %s\n", sysop_s(qrow, 0));
			printf(" Sysop ID : %s\n", sysop_s(qrow, 1));
			printf(" Limits   : I=%s R=%s W=%s D=%s\n\n",
				sysop_s(qrow, 2), sysop_s(qrow, 3),
				sysop_s(qrow, 4), sysop_s(qrow, 5));
		}
		mysql_free_result(qres);
	}

	n = sysop_count(sock, "user", "");
	printf(" Users          : %d\n", n);
	n = sysop_count(sock, "user", "del='D'");
	printf(" Deleted users  : %d\n", n);
	n = sysop_count(sock, "user", "type>=18");
	printf(" Sysop users    : %d\n", n);
	n = sysop_count(sock, "loginrec", "date>=CURDATE()");
	if (n >= 0) printf(" Today logins   : %d\n", n);
	mysql_close(sock);

	if ((sock = sysop_db(&mysql, DB_CM)) != NULL) {
		n = sysop_count(sock, "bcfg", "");
		printf(" Boards         : %d\n", n);
		n = sysop_count(sock, "ccfg", "");
		printf(" Clubs          : %d\n", n);
		mysql_close(sock);
	}
	sysop_wait();
}

static void sysop_current_board()
{
	MYSQL mysql, *sock;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char table[80];
	char query[700];
	int count = -1;

	sprintf(table, "%s_%s", sysop_club, sysop_code);
	cls();
	printf(" CURRENT CONTEXT\n");
	printf(" ----------------------------------------------------------------------\n");
	printf(" User  : %s (%s) type=%d\n", pf.id, pf.name, pf.type);
	printf(" Club  : %s\n", sysop_club);
	printf(" Code  : %s\n", sysop_code);
	printf(" Table : %s\n\n", table);

	if (!(sock = sysop_db(&mysql, DB_CM))) {
		sysop_wait();
		return;
	}

	sprintf(query,
		"SELECT name,total,sysop,sysop1,sysop2,sysop3,itype,rtype,wtype,dtype "
		"FROM bcfg WHERE table_name='%s'",
		table);
	if (mysql_query(sock, query) != -1) {
		qres = mysql_store_result(sock);
		if ((qrow = mysql_fetch_row(qres)) != NULL) {
			printf(" Board name : %s\n", sysop_s(qrow, 0));
			printf(" BCFG total : %s\n", sysop_s(qrow, 1));
			printf(" Managers   : %s %s %s %s\n",
				sysop_s(qrow, 2), sysop_s(qrow, 3),
				sysop_s(qrow, 4), sysop_s(qrow, 5));
			printf(" Limits     : I=%s R=%s W=%s D=%s\n",
				sysop_s(qrow, 6), sysop_s(qrow, 7),
				sysop_s(qrow, 8), sysop_s(qrow, 9));
		}
		else {
			printf(" No bcfg row for %s\n", table);
		}
		mysql_free_result(qres);
	}

	if (sysop_table_exists(sock, table))
		count = sysop_count(sock, table, "");
	printf(" Real rows  : %d\n", count);
	mysql_close(sock);
	sysop_wait();
}

static void sysop_user_find()
{
	MYSQL mysql, *sock;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char key[80], esc[180], query[700];
	int count = 0;

	cls();
	printf(" USER SEARCH\n");
	printf(" ----------------------------------------------------------------------\n");
	sysop_prompt(" ID/name keyword >> ", key, 60);
	if (strlen(key) < 1) return;
	sysop_sql_escape(esc, key, sizeof(esc));

	if (!(sock = sysop_db(&mysql, DB_NAME))) {
		sysop_wait();
		return;
	}
	sprintf(query,
		"SELECT num,id,name,type,del,login,logout,all_log,month_log "
		"FROM user WHERE id LIKE '%%%s%%' OR name LIKE '%%%s%%' "
		"ORDER BY id LIMIT 50",
		esc, esc);
	if (mysql_query(sock, query) == -1) {
		printf("## ERR: %s\n%s\n", mysql_error(sock), query);
		mysql_close(sock);
		sysop_wait();
		return;
	}
	qres = mysql_store_result(sock);
	printf(" num   id           name         ty del last-login          all month\n");
	printf(" ----------------------------------------------------------------------\n");
	while ((qrow = mysql_fetch_row(qres)) != NULL) {
		printf("%5s %-12.12s %-12.12s %2s  %-1.1s %-19.19s %5s %5s\n",
			sysop_s(qrow, 0), sysop_s(qrow, 1), sysop_s(qrow, 2),
			sysop_s(qrow, 3), sysop_s(qrow, 4), sysop_s(qrow, 5),
			sysop_s(qrow, 7), sysop_s(qrow, 8));
		count++;
	}
	mysql_free_result(qres);
	mysql_close(sock);
	printf(" ----------------------------------------------------------------------\n");
	printf(" %d row(s)\n", count);
	sysop_wait();
}

static void sysop_user_type()
{
	MYSQL mysql, *sock;
	char id[40], buff[20], query[300];
	int new_type;

	cls();
	printf(" USER TYPE CHANGE\n");
	printf(" ----------------------------------------------------------------------\n");
	sysop_prompt(" User ID >> ", id, 20);
	sysop_clean_word(id);
	if (!sysop_safe_word(id) || !read_pf2(id)) {
		printf("No such user or invalid ID.\n");
		sysop_wait();
		return;
	}
	if (pf2.type >= 18 && pf.type < 19) {
		printf("Only level 19 can change another sysop account.\n");
		sysop_wait();
		return;
	}

	printf(" Current: %s (%s) type=%d del=%c\n", pf2.id, pf2.name, pf2.type, pf2.del);
	sysop_prompt(" New type (0-19) >> ", buff, 5);
	new_type = atoi(buff);
	if (new_type < 0 || new_type > 19) {
		printf("Invalid type.\n");
		sysop_wait();
		return;
	}
	if (is_same2(id, pf.id) && new_type < 18) {
		if (!sysop_yesno("Lower your own sysop level? (y/N) >> ", No)) return;
	}
	if (!sysop_yesno("Update user type? (y/N) >> ", No)) return;

	if (!(sock = sysop_db(&mysql, DB_NAME))) {
		sysop_wait();
		return;
	}
	sprintf(query, "UPDATE user SET type=%d WHERE id='%s'", new_type, id);
	if (mysql_query(sock, query) == -1)
		printf("## ERR: %s\n%s\n", mysql_error(sock), query);
	else
		printf("Updated %s type to %d.\n", id, new_type);
	mysql_close(sock);
	sysop_wait();
}

static void sysop_user_del()
{
	MYSQL mysql, *sock;
	char id[40], buff[20], delch, query[300];

	cls();
	printf(" USER DELETE FLAG\n");
	printf(" ----------------------------------------------------------------------\n");
	sysop_prompt(" User ID >> ", id, 20);
	sysop_clean_word(id);
	if (!sysop_safe_word(id) || !read_pf2(id)) {
		printf("No such user or invalid ID.\n");
		sysop_wait();
		return;
	}
	if (pf2.type >= 18 && pf.type < 19) {
		printf("Only level 19 can change another sysop account.\n");
		sysop_wait();
		return;
	}

	printf(" Current: %s (%s) type=%d del=%c\n", pf2.id, pf2.name, pf2.type, pf2.del);
	printf(" 1. Mark deleted\n");
	printf(" 2. Restore\n");
	sysop_prompt(" Select >> ", buff, 5);
	if (buff[0] == '1') delch = 'D';
	else if (buff[0] == '2') delch = ' ';
	else return;
	if (!sysop_yesno("Update delete flag? (y/N) >> ", No)) return;

	if (!(sock = sysop_db(&mysql, DB_NAME))) {
		sysop_wait();
		return;
	}
	sprintf(query, "UPDATE user SET del='%c' WHERE id='%s'", delch, id);
	if (mysql_query(sock, query) == -1)
		printf("## ERR: %s\n%s\n", mysql_error(sock), query);
	else
		printf("Updated %s del flag to '%c'.\n", id, delch);
	mysql_close(sock);
	sysop_wait();
}

static void sysop_board_list()
{
	MYSQL mysql, *sock;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char key[80], esc[180], query[800];
	int count = 0, line = 0;

	cls();
	printf(" BOARD LIST\n");
	printf(" ----------------------------------------------------------------------\n");
	sysop_prompt(" Filter (Enter=all) >> ", key, 60);
	sysop_sql_escape(esc, key, sizeof(esc));

	if (!(sock = sysop_db(&mysql, DB_CM))) {
		sysop_wait();
		return;
	}
	if (strlen(key) > 0)
		sprintf(query,
			"SELECT table_name,name,total,sysop,sysop1,sysop2,sysop3 "
			"FROM bcfg WHERE table_name LIKE '%%%s%%' OR name LIKE '%%%s%%' "
			"ORDER BY table_name LIMIT 200",
			esc, esc);
	else
		sprintf(query,
			"SELECT table_name,name,total,sysop,sysop1,sysop2,sysop3 "
			"FROM bcfg ORDER BY table_name LIMIT 200");

	if (mysql_query(sock, query) == -1) {
		printf("## ERR: %s\n%s\n", mysql_error(sock), query);
		mysql_close(sock);
		sysop_wait();
		return;
	}
	qres = mysql_store_result(sock);
	printf(" table              total managers              name\n");
	printf(" ----------------------------------------------------------------------\n");
	while ((qrow = mysql_fetch_row(qres)) != NULL) {
		printf("%-18.18s %5s %-20.20s %.30s\n",
			sysop_s(qrow, 0), sysop_s(qrow, 2),
			sysop_s(qrow, 3), sysop_s(qrow, 1));
		if (strlen(sysop_s(qrow, 4)) || strlen(sysop_s(qrow, 5)) || strlen(sysop_s(qrow, 6)))
			printf("                         %s %s %s\n",
				sysop_s(qrow, 4), sysop_s(qrow, 5), sysop_s(qrow, 6));
		count++;
		if (!sysop_page(&line)) break;
	}
	mysql_free_result(qres);
	mysql_close(sock);
	printf(" ----------------------------------------------------------------------\n");
	printf(" %d row(s)\n", count);
	sysop_wait();
}

static int sysop_get_admin(char *title, char *old, char *out)
{
	char buff[40];

	printf(" %s [%s] (-=clear) >> ", title, old);
	lineinput(buff, 20);
	check_han(buff);
	printf("\n");
	sysop_clean_word(buff);
	if (strlen(buff) < 1) {
		strcpy(out, old);
		return Yes;
	}
	if (strcmp(buff, "-") == 0) {
		strcpy(out, "");
		return Yes;
	}
	if (!sysop_safe_word(buff)) {
		printf("Invalid ID.\n");
		return No;
	}
	if (!sysop_user_exists(buff)) {
		printf("No such user: %s\n", buff);
		return No;
	}
	strcpy(out, buff);
	return Yes;
}

static void sysop_board_admin()
{
	MYSQL mysql, *sock;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char table[80], query[1000];
	char old0[30], old1[30], old2[30], old3[30];
	char new0[30], new1[30], new2[30], new3[30];

	cls();
	printf(" BOARD MANAGER EDIT\n");
	printf(" ----------------------------------------------------------------------\n");
	sprintf(table, "%s_%s", sysop_club, sysop_code);
	printf(" Current table is %s\n", table);
	sysop_prompt(" Table name (Enter=current) >> ", query, 80);
	if (strlen(query) > 0) strcpy(table, query);
	sysop_clean_word(table);
	if (!sysop_safe_word(table)) {
		printf("Invalid table name.\n");
		sysop_wait();
		return;
	}

	if (!(sock = sysop_db(&mysql, DB_CM))) {
		sysop_wait();
		return;
	}
	sprintf(query, "SELECT sysop,sysop1,sysop2,sysop3,name FROM bcfg WHERE table_name='%s'", table);
	if (mysql_query(sock, query) == -1) {
		printf("## ERR: %s\n%s\n", mysql_error(sock), query);
		mysql_close(sock);
		sysop_wait();
		return;
	}
	qres = mysql_store_result(sock);
	if ((qrow = mysql_fetch_row(qres)) == NULL) {
		printf("No bcfg row for %s\n", table);
		mysql_free_result(qres);
		mysql_close(sock);
		sysop_wait();
		return;
	}
	strcpy(old0, sysop_s(qrow, 0));
	strcpy(old1, sysop_s(qrow, 1));
	strcpy(old2, sysop_s(qrow, 2));
	strcpy(old3, sysop_s(qrow, 3));
	printf(" Board: %s / %s\n", table, sysop_s(qrow, 4));
	mysql_free_result(qres);

	if (!sysop_get_admin("sysop ", old0, new0)) goto done;
	if (!sysop_get_admin("sysop1", old1, new1)) goto done;
	if (!sysop_get_admin("sysop2", old2, new2)) goto done;
	if (!sysop_get_admin("sysop3", old3, new3)) goto done;
	if (!sysop_yesno("Save board managers? (y/N) >> ", No)) goto done;

	sprintf(query,
		"UPDATE bcfg SET sysop='%s',sysop1='%s',sysop2='%s',sysop3='%s' "
		"WHERE table_name='%s'",
		new0, new1, new2, new3, table);
	if (mysql_query(sock, query) == -1)
		printf("## ERR: %s\n%s\n", mysql_error(sock), query);
	else
		printf("Updated managers for %s.\n", table);

done:
	mysql_close(sock);
	sysop_wait();
}

static void sysop_club_list()
{
	MYSQL mysql, *sock;
	MYSQL_RES *qres;
	MYSQL_ROW qrow;
	char key[80], esc[180], query[800];
	int count = 0, line = 0;

	cls();
	printf(" CLUB LIST\n");
	printf(" ----------------------------------------------------------------------\n");
	sysop_prompt(" Filter (Enter=all) >> ", key, 60);
	sysop_sql_escape(esc, key, sizeof(esc));

	if (!(sock = sysop_db(&mysql, DB_CM))) {
		sysop_wait();
		return;
	}
	if (strlen(key) > 0)
		sprintf(query,
			"SELECT club,name,sysop,total,guesttype,stop "
			"FROM ccfg WHERE club LIKE '%%%s%%' OR name LIKE '%%%s%%' "
			"ORDER BY club LIMIT 200",
			esc, esc);
	else
		sprintf(query,
			"SELECT club,name,sysop,total,guesttype,stop "
			"FROM ccfg ORDER BY club LIMIT 200");

	if (mysql_query(sock, query) == -1) {
		printf("## ERR: %s\n%s\n", mysql_error(sock), query);
		mysql_close(sock);
		sysop_wait();
		return;
	}
	qres = mysql_store_result(sock);
	printf(" club       total gt stop sysop        name\n");
	printf(" ----------------------------------------------------------------------\n");
	while ((qrow = mysql_fetch_row(qres)) != NULL) {
		printf("%-10.10s %5s %2s %4s %-12.12s %.34s\n",
			sysop_s(qrow, 0), sysop_s(qrow, 3),
			sysop_s(qrow, 4), sysop_s(qrow, 5),
			sysop_s(qrow, 2), sysop_s(qrow, 1));
		count++;
		if (!sysop_page(&line)) break;
	}
	mysql_free_result(qres);
	mysql_close(sock);
	printf(" ----------------------------------------------------------------------\n");
	printf(" %d row(s)\n", count);
	sysop_wait();
}

static void sysop_loop()
{
	char buff[20];

	while (1) {
		cls();
		printf(" XHOST TEXT SYSOP UTILITY\n");
		printf(" ----------------------------------------------------------------------\n");
		printf(" Login : %s (%s) type=%d\n", pf.id, pf.name, pf.type);
		printf(" Place : %s / %s\n", sysop_club, sysop_code);
		printf(" ----------------------------------------------------------------------\n");
		printf("  1. System DB summary\n");
		printf("  2. Current board info\n");
		printf("  3. User search\n");
		printf("  4. Change user type\n");
		printf("  5. Set user delete flag\n");
		printf("  6. Board list\n");
		printf("  7. Edit board managers\n");
		printf("  8. Club list\n");
		printf("  Q. Quit\n");
		printf(" ----------------------------------------------------------------------\n");
		sysop_prompt(" Select >> ", buff, 10);
		if (is_quit(buff)) break;
		if (strcmp(buff, "1") == 0) sysop_summary();
		else if (strcmp(buff, "2") == 0) sysop_current_board();
		else if (strcmp(buff, "3") == 0) sysop_user_find();
		else if (strcmp(buff, "4") == 0) sysop_user_type();
		else if (strcmp(buff, "5") == 0) sysop_user_del();
		else if (strcmp(buff, "6") == 0) sysop_board_list();
		else if (strcmp(buff, "7") == 0) sysop_board_admin();
		else if (strcmp(buff, "8") == 0) sysop_club_list();
	}
}

int main(int argc, char **argv)
{
	char uid[40];

	if (argc < 4) {
		printf("usage: sysop <club> <code> <id>\n");
		return 1;
	}

	read_db_name("db.cfg");
	read_aname(0);
	read_abbsname(0);
	read_cfg();
	findport(tty);
	set_tmpfile();

	strncpy(sysop_club, argv[1], sizeof(sysop_club) - 1);
	strncpy(sysop_code, argv[2], sizeof(sysop_code) - 1);
	strncpy(uid, argv[3], sizeof(uid) - 1);
	sysop_club[sizeof(sysop_club) - 1] = 0;
	sysop_code[sizeof(sysop_code) - 1] = 0;
	uid[sizeof(uid) - 1] = 0;
	sysop_clean_word(sysop_club);
	sysop_clean_word(sysop_code);
	sysop_clean_word(uid);
	if (!sysop_safe_word(sysop_club) || !sysop_safe_word(sysop_code) || !sysop_safe_word(uid)) {
		printf("Invalid argument.\n");
		return 1;
	}

	strcpy(club_go.code, sysop_club);
	strcpy(go.code, sysop_code);
	club_mode = !is_same(club_go.code, "main");
	read_ccfg();
	read_bcfg();
	if (!read_pf(uid)) {
		printf("No such user: %s\n", uid);
		return 1;
	}
	if (club_mode) read_cpf(uid);

	if (!sysop_can_use()) {
		printf("SYSOP utility is restricted to sysop accounts.\n");
		sysop_wait();
		return 1;
	}

	sysop_loop();
	return 0;
}

