-- �� service.labs.cn ��ΪӦ�÷�����(TOMCAT)��������IP

CREATE USER 'labs'@'service.labs.cn';

UPDATE mysql.user set password='*8B296F41E4BD17AE2164031E23C88420FC948048' where user='labs' and host='service.labs.cn';

GRANT ALL ON *.* TO 'labs'@'service.labs.cn';

FLUSH PRIVILEGES;
