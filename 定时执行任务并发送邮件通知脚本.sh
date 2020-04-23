#!/bin/bash
echo -e "\033[31m 这个是定时删除文件，获取更多工具及脚本请关注公众号： 波哥的IT人生  Please continue to enter or ctrl+C to cancel \033[0m"

riqi=`date +%Y%m%d`

#收件箱
EMAIL_RECIVER="想要发给的邮箱1 想要发给的邮箱2"
#发送者邮箱
EMAIL_SENDER=aaaaaa@qq.com
#邮箱用户名
EMAIL_USERNAME=aaaaaaa@qq.com
#邮箱密码
#使用qq邮箱进行发送需要注意：首先需要开启：POP3/SMTP服务，其次发送邮件的密码需要使用在开启POP3/SMTP服务时候腾讯提供的第三方客户端登陆码。
EMAIL_PASSWORD=aasdasdwwqwxxcfdqd
EMAIL_SMTPHOST=smtp.qq.com

#附件路径可以添加多个按我的写格式写绝对路径

FILE1_PATH=(
/appdata/webA/webapps/ROOT/aaa.properties
/appdata/webB/webapps/ROOT/bbbb.properties
)

# 提前一天发一封邮件警告！
if [[ $riqi == "20200427" ]];then
EMAIL_TITLE="4月30日正式删除并关闭业务"
FILE1_PATH="/appdata/webA/webapps/ROOT/aaa.properties /appdata/webB/webapps/ROOT/bbbb.properties"
EMAIL_CONTENT="
本月将web服务器中的：
/appdata/webA/webapps/ROOT/aaa.properties
，/appdata/webB/webapps/ROOT/bbbb.properties
4月30日上午10:00会对上面的相关文件进行删除，并且停止业务请知悉！
"
sendEmail -f ${EMAIL_SENDER} -t ${EMAIL_RECIVER} -s ${EMAIL_SMTPHOST} -u ${EMAIL_TITLE} -o tls=no  -xu ${EMAIL_USERNAME} -xp ${EMAIL_PASSWORD} -m ${EMAIL_CONTENT} -a ${FILE1_PATH} -o message-charset=utf-8

fi
#到日子了。开始干活
if [[ $riqi == "20200430" ]];then

EMAIL_TITLE="已经删除并关闭业务"
EMAIL_CONTENT="
本月将web服务器中的：
/appdata/webA/webapps/ROOT/aaa.properties
，/appdata/webB/webapps/ROOT/bbbb.properties
4月30日上午10:00会对上面的相关文件进行删除，并且停止业务请知悉！
"

for file in ${FILE1_PATH[@]}
do
rm -rf $file
done
`ps -ef | grep tomcat | grep -v grep | awk '{print $2}' | xargs kill -9` 
sendEmail -f ${EMAIL_SENDER} -t ${EMAIL_RECIVER} -s ${EMAIL_SMTPHOST} -u ${EMAIL_TITLE} -o tls=no  -xu ${EMAIL_USERNAME} -xp ${EMAIL_PASSWORD} -m ${EMAIL_CONTENT} -o message-charset=utf-8

fi



