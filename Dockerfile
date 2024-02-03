#Official python image(tag == 3.12 version) available in DockerHub https://hub.docker.com/_/python
FROM python:3.12

##########################
#                        #
#        USER            #
#                        #
##########################

RUN adduser --disabled-password \
	--uid 1000 \
	analyst

ENV HOME /home/analyst 



###########################
#                         # 
# Copying content to HOME #
#                         #
###########################


#Copy all( . ) current files into HOME DIRECTORY

COPY . ${HOME}

#Set working directory
WORKDIR ${HOME}


#Giving access to content 
RUN chown -R 1000 ${HOME}/*

#Switching to user analyst
USER analyst


###########################
#                         # 
# Isolated environment    #
#                         #
###########################
#Update pip
#Progress bar causes bugs that's why we deactivated it due to latence in ourinternet connetion

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
# Task 1 : Change default shell from /bin/sh to most popular /bin/bash with more commands and thus we will be able to use source command
# Task 2 : Activate virtual environment
# Task 3 : Launch jupyter notebook on ip 0.0.0.0 to enable mapping for Docker
SHELL ["/bin/bash","-c"]

CMD source pyenv/bin/activate && \
	  jupyter notebook --ip 0.0.0.0 