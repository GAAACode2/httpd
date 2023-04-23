FROM registry.access.redhat.com/ubi8
RUN yum install --nodocs --disableplugin=subscription-manager -y httpd && \
    yum clean all && \
    sed -i 's/^Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf && \
    chgrp -R 0 /run/httpd /etc/httpd/logs/ && \
    chmod g=u /run/httpd /etc/httpd/logs
USER 1001
EXPOSE 8080
CMD ["httpd","-D","FOREGROUND"]
