FROM ubuntu:18.04

RUN apt-get update && \
apt-get install -y redis-server && \
apt-get clean

EXPOSE 6379

ENTRYPOINT ["redis-server", "--protected-mode no"]


#Image Scanning variables, passed in from pipeline (See command below)
ARG CONSOLE=https://twistlock-console.apps.ocp.ys.com:8083
ARG USERNAME=admin
ARG PASSWORD=cplatform
ARG IMAGENAME=20230502

#Add Twistcli
RUN curl --progress-bar -L -k --header "authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJncm91cHMiOm51bGwsInJvbGVQZXJtcyI6W1syNTUsMjU1LDI1NSwyNTUsMjU1LDEyNywxXSxbMjU1LDI1NSwyNTUsMjU1LDI1NSwxMjcsMV1dLCJwZXJtaXNzaW9ucyI6W3sicHJvamVjdCI6IkNlbnRyYWwgQ29uc29sZSJ9XSwic2Vzc2lvblRpbWVvdXRTZWMiOjM2MDAsImV4cCI6MTY4MzAxMzI3MCwiaXNzIjoidHdpc3Rsb2NrIn0.5LkzpEBG_82zS2ogC25N6oDyzWjhrX97Yv_NXFOHFBQ" https://twistlock-console.apps.ocp.ys.com/api/v1/util/twistcli > twistcli; chmod a+x twistcli;

#Execute image scan
RUN ./twistcli images scan --containerized --details --address $CONSOLE --user $USERNAME --password $PASSWORD $IMAGENAME
