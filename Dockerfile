FROM python:3

WORKDIR /usr/src/workdir

COPY . ./

RUN pip install --upgrade pip

RUN pip install virtualenv

RUN virtualenv mlenv && . mlenv/bin/activate

RUN pip install -r requirements.txt --progress-bar off


CMD [ "jupyter",\
		"notebook",\
		"--ip",\
		 "0.0.0.0",\
		 "--port",\
		 "8888",\
		 "--allow-root"]