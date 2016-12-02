FROM 10.8.46.202:5000/restapi/ubuntu/stateless/restapi:7.3.0000.0590

MAINTAINER chen.wang@emc.com

ENV KS_FILE security/rest-docker.jks
ENV KS_PWD passw0rd
ENV KS_ENTRY_ALIAS rest-docker
ENV KS_ENTRY_PWD passw0rd
ENV CONFIG_DIR /root/rest/saml
ENV COMM_KEYSTORE_FILE ${CONFIG_DIR}/tomcat.jks
ENV COMM_KEYSTORE_PWD passw0rd

COPY config/ ${CONFIG_DIR}/

RUN sed -i 's|$KS_FILE|'"${KS_FILE}"'|' ${CONFIG_DIR}/rest-api-runtime.properties && \
sed -i 's|$KS_PWD|'"${KS_PWD}"'|' ${CONFIG_DIR}/rest-api-runtime.properties && \
sed -i 's|$KS_ENTRY_ALIAS|'"${KS_ENTRY_ALIAS}"'|' ${CONFIG_DIR}/rest-api-runtime.properties && \
sed -i 's|$KS_ENTRY_PWD|'"${KS_ENTRY_PWD}"'|' ${CONFIG_DIR}/rest-api-runtime.properties

VOLUME ${CONFIG_DIR}
