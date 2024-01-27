#Official python image(tag == 3.12 version) available in DockerHub https://hub.docker.com/_/python
FROM python:3.12

##########################
#                        #
#        USER            #
#                        #
##########################
ENV USER analyst
ENV NB_UID 1000

RUN adduser --disabled-password \
	--uid 1000 \
	analyst

ENV HOME /home/analyst 

RUN chown -R 1000 ${HOME}

###########################
#                         # 
# Copying content to HOME #
#                         #
###########################


#Copy all( . ) current files into HOME DIRECTORY

COPY . ${HOME}

#Set working directory
WORKDIR ${HOME}

#Switching to user analyst
USER analyst


###########################
#                         # 
# Isolated environment    #
#                         #
###########################
#Update pip
#Progress bar causes bugs that's why we deactivated due to latence in internet speed

RUN pip install --upgrade pip --progress-bar off


#Install virtualenv 

RUN pip install virtualenv 

#Create pyenv

RUN python -m venv pyenv 

#You can now install libraries in pyenv

RUN pyenv/bin/pip install -r requirements.txt --progress-bar off


###########################
#                         # 
# Running process         #
#                         #
###########################
# Task 1 : Change default shell from /bin/sh to /bin/bash in order to be able to use source command
# Task 2 : Activate virtual environment
# Task 3 : Launch jupyter notebook
SHELL ["/bin/bash","-c"]

CMD source pyenv/bin/activate && \
	  jupyter notebook --ip 0.0.0.0 