#include <mysql/mysql.h>
#include <stdio.h> 

int main() { 
MYSQL *mysql; 
MYSQL_RES *result; 
MYSQL_ROW rows; 
MYSQL_FIELD *field; 

char *host = "localhost"; 
char *db = "test"; 
char *user = "sizer"; 
char *password = ""; 

unsigned int num_fields; 
unsigned int num_rows; 
unsigned int *lengths; 
unsigned int i; 

int ping_status; 

mysql = mysql_init(NULL); 

if (!mysql) 
printf("Out of Memory\n"); 
else 
printf("Success initialize MySQL\n"); 

mysql = mysql_connect(mysql, host, user, password); 

if (mysql) 
printf("Success connect MySQL DB Server\n"); 
else 
printf("Fail connect MySQL DB Server\n"); 

printf("This MySQL Client Version is %s\n", mysql_get_client_info()) 
; 
printf("This MySQL Host is %s\n", mysql_get_host_info(mysql)); 
printf("This MySQL Protocol Version is %u\n", mysql_get_proto_info(m 
ysql)); 
printf("This MySQL Server Version is %s\n", mysql_get_server_info(my 
sql)); 

if (!(mysql_select_db(mysql, db))) 
printf("Success change %s Database\n", db); 
else 
printf("Fail change %s Database\n", db); 

if (mysql_query(mysql, "select * from Test")) { 
printf("Fail query to %s\n", db); 
exit(1); 
} 
else 
printf("Success query to %s\n", db); 

result = mysql_store_result(mysql); 

num_fields = mysql_num_fields(result); 
printf("Fields number is %u\n", num_fields); 

num_rows = mysql_affected_rows(mysql); 
printf("Rows number is %u\n", num_rows); 

printf("This is Field Structure & Rows of Table Test in test Databas 
es\n"); 
while((field = mysql_fetch_field(result))) { 
printf("[%s] ", field->name); 
} 
printf("\n"); 


while ((rows = mysql_fetch_row(result))) { 
lengths = mysql_fetch_lengths(result); 

for (i = 0; i < num_fields; i++) { 
printf("[%.*s] ", (int)lengths[i], rows[i] ? rows[i] : "NULL"); 

} 
printf("\n"); 
} 

mysql_free_result(result); 
printf("Query results is freed\n"); 

if (!(ping_status = mysql_ping(mysql))) 
printf("Ping Result: Server is connected\n"); 
else 
printf("Ping Result: Server is not connected\n"); 

mysql_close(mysql); 
printf("Teminate Server connect\n"); 

if (!(ping_status = mysql_ping(mysql))) 
printf("Ping Result: Server is connected\n"); 
else 
printf("Ping Result: Server is not connected\n"); 

return 0; 
} 

