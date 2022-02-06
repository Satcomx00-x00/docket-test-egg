FROM python:3.8-slim
COPY * ./

# install dependencies to the local user directory (eg. /root/.local)
#RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip3 install --user -r requirements.txt
#COPY main.py /usr/bin/ticker.py
#RUN chmod 777 /usr/bin/ticker.py
# second unnamed stage
#WORKDIR /code

# copy only the dependencies installation from the 1st stage image
#COPY --from=builder /root/.local /root/.local
#COPY ./* ./

# update PATH environment variable
ENV PATH=/root/.local:$PATH
# expose a specific input port

#EXPOSE 80
# CMD [ "python","ticker.py" ]
