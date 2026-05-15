# C E N T O S   B A S E   I M A G E
FROM centos:7.9.2009
# A L P I N E   B A S E   I M A G E
#FROM alpine


# C E N T O S   E X T R A   P A C K A G E S
RUN yum install -y -q ncurses
# A L P I N E   E X T R A   P A C K A G E S
#RUN apk update
#RUN apk add dpkg


#----------------------------------------------------------------------------------------------------
#               J A V A   J D K   1 . 8 . 0 _ 6 0   I N S T A L L A T I O N
#----------------------------------------------------------------------------------------------------
ADD ./jdk-8u60-linux-x64.tar /opt/java/

RUN update-alternatives --install /usr/bin/java java /opt/java/jdk1.8.0_60/jre/bin/java 1 && \
    update-alternatives --install /usr/bin/javac javac /opt/java/jdk1.8.0_60/bin/javac 1 && \
    update-alternatives --install /usr/bin/javaws javaws /opt/java/jdk1.8.0_60/bin/javaws 1 && \
    update-alternatives --set java /opt/java/jdk1.8.0_60/jre/bin/java && \
    update-alternatives --set javac /opt/java/jdk1.8.0_60/bin/javac && \
    update-alternatives --set javaws /opt/java/jdk1.8.0_60/bin/javaws

ENV JAVA_HOME=/opt/java/jdk1.8.0_60
ENV PATH="$JAVA_HOME/bin:${PATH}"
RUN export JAVA_HOME

ENV JRE_HOME=/opt/java/jdk1.8.0_60/jre
ENV PATH="$JRE_HOME/bin:${PATH}"
RUN export JRE_HOME
