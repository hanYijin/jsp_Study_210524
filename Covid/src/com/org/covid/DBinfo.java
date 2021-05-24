package com.org.covid;

public interface DBinfo {
	String mysql_class="com.mysql.cj.jdbc.Driver";
	String mysql_url="\"jdbc:mysql://localhost:3306/jsppro?useUnicode=true&characterEncoding=utf-8";
	String mysql_id="hyj";
	String mysql_pw="2955";
	String oracle_class="oracle.jdbc.driver.OracleDriver";
	String oracle_user = "SHOP";
    String oracle_pw = "1234";
    String oracle_url = "jdbc:oracle:thin:@localhost:1521:orcle";
}
