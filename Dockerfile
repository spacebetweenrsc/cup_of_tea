#versions for docker enviroments
FROM python:3.9-alpine3.16

#build docker enviroments
COPY requirements.txt /temp/requirements.txt
COPY service /service
WORKDIR /service
EXPOSE 8000

#settings for packages psql for django
RUN apk add postgresql-client build-base postgresql-dev

#install pip requirements
RUN pip install -r /temp/requirements.txt

#add user for docker env
RUN adduser --disabled-password service-user

#user for development with all permissions
USER service-user