FROM python:3.8 AS builder
COPY requirements.txt .

# install dependencies to the local user directory (eg. /root/.local)
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip3 install --user -r requirements.txt

# second unnamed stage
FROM python:3.8-slim
WORKDIR /code

# copy only the dependencies installation from the 1st stage image
COPY --from=builder /root/.local /root/.local
COPY ./* ./

# update PATH environment variable
ENV PATH=/root/.local:$PATH
# expose a specific input port

# EXPOSE 80
CMD [ "python", "./main.py" ]
