FROM python:3.9

# install SSH client
RUN apt-get update && apt-get install -y openssh-client

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# install dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt


# copy application to work directory
COPY . /app/

# run server
CMD python manage.py runserver 0.0.0.0:8000