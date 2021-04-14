FROM ubuntu

RUN mkdir app

RUN apt update

RUN apt install nano

WORKDIR /app

# VOLUME [ "/data" ]

RUN touch test.sh 
RUN chmod 755 test.sh

# RUN vs ENTRYPOINT vs CMD
# ENTRYPOINT [ "ll" ]
# RUN echo "Hi there"

# Clean up APT when done.
# RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*