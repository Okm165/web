FROM ubuntu
WORKDIR /project
COPY . /project/

RUN apt update
RUN apt install -yq python3
RUN apt install -yq python3-pip
RUN pip install -r docker_config/python_requirements.txt

RUN apt install -yq nodejs
RUN apt install -yq npm
RUN npm install -g @vue/cli
RUN npm install -g serve

