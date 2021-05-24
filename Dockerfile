FROM ibmcom/ace-server:latest
COPY petstore-api /home/aceuser/petstore-api
RUN export LICENSE="accept" \
    && source /opt/ibm/ace-11/server/bin/mqsiprofile \
    && mkdir /home/aceuser/bars \
    && mqsipackagebar -a bars/petstore-api.bar -k . \
    && mqsibar -a bars/petstore-api.bar -w /home/aceuser/ace-server \
    && chmod -R 777 /home/aceuser/ace-server/run/petstore-api