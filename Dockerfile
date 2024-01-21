FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD [ "jupyter",\
		"notebook",\
		"--ip",\
		 "0.0.0.0",\
		 "--port",\
		 "8888",\
		 "--allow-root"]