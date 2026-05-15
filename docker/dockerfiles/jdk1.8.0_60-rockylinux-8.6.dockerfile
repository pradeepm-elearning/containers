# C E N T O S   B A S E   I M A G E
FROM rockylinux:8.6.20227707
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
ADD ./jdk-8u60-linux-x64.tar /app/ccengage/opt/java/

RUN update-alternatives --install /usr/bin/java java /app/ccengage/opt/java/jdk1.8.0_60/jre/bin/java 1 && \
    update-alternatives --install /usr/bin/javac javac /app/ccengage/opt/java/jdk1.8.0_60/bin/javac 1 && \
    update-alternatives --install /usr/bin/javaws javaws /app/ccengage/opt/java/jdk1.8.0_60/bin/javaws 1 && \
    update-alternatives --set java /app/ccengage/opt/java/jdk1.8.0_60/jre/bin/java && \
    update-alternatives --set javac /app/ccengage/opt/java/jdk1.8.0_60/bin/javac && \
    update-alternatives --set javaws /app/ccengage/opt/java/jdk1.8.0_60/bin/javaws

ENV JAVA_HOME=/app/ccengage/opt/java/jdk1.8.0_60
ENV PATH="$JAVA_HOME/bin:${PATH}"
RUN export JAVA_HOME

ENV JRE_HOME=/app/ccengage/opt/java/jdk1.8.0_60/jre
ENV PATH="$JRE_HOME/bin:${PATH}"
RUN export JRE_HOME
