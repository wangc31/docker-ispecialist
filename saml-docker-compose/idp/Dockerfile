FROM docker.local:5000/unicon-shibboleth-idp

MAINTAINER chen.wang@emc.com

ENV JETTY_MAX_HEAP 64m
ENV JETTY_BROWSER_SSL_KEYSTORE_PASSWORD passw0rd
ENV JETTY_BACKCHANNEL_SSL_KEYSTORE_PASSWORD passw0rd
ENV REST_HOSTNAME rest-docker
ENV REST_ENTITY_ID https://${REST_HOSTNAME}:8443/dctm-rest/saml/metadata
ENV SHIB_HOME /opt/shibboleth-idp

ADD shibboleth-idp/ /opt/shibboleth-idp/
COPY conf/ldap.properties ${SHIB_HOME}/conf
COPY conf/saml-nameid.xml ${SHIB_HOME}/conf

# modify attribute-filter.xml
RUN sed -i 's/example1/dctm-rest/' ${SHIB_HOME}/conf/attribute-filter.xml && \
sed -i '/<AttributeFilterPolicy id="dctm-rest">$/{N;s|https:\/\/sp.example.org|'"${REST_ENTITY_ID}"'|}' ${SHIB_HOME}/conf/attribute-filter.xml && \
sed -i '/<AttributeRule attributeID="eduPersonPrincipalName">/{N;N;s|<AttributeRule .* <\/AttributeRule>||}' ${SHIB_HOME}/conf/attribute-filter.xml && \
sed -i '/<AttributeRule attributeID="mail">/{N;N;s|<AttributeRule .* <\/AttributeRule>||}' ${SHIB_HOME}/conf/attribute-filter.xml

# modify relying-party.xml
RUN sed -i '/<!--$/{N;/relyingPartyIds=\"https:\/\/sp.example.org\"/{N;N;N;N;N;N;N;s|.*<!--\n\(.*\)\n.*-->|\1|}}' ${SHIB_HOME}/conf/relying-party.xml && \
sed -i 's|https:\/\/sp.example.org|'"${REST_ENTITY_ID}"'|' ${SHIB_HOME}/conf/relying-party.xml

# modify metadata-providers.xml
RUN sed -i '$ i <MetadataProvider id=\"HTTPMetadataREST\" xsi:type=\"FileBackedHTTPMetadataProvider\"\ndisregardTLSCertificate=\"true\"\nbackingFile=\"'"${SHIB_HOME}"'/metadata/rest-docker.xml\"\nmetadataURL=\"'"${REST_ENTITY_ID}"'\"\/>\n' ${SHIB_HOME}/conf/metadata-providers.xml
