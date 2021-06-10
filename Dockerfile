# the image that ours is built on top of
FROM python:3.7-alpine



# python must be run like this to avoid complications
ENV PYTHONUNBUFFERED 1


# copies a requirements text file in the same directory to a file of the same name inside the image
COPY ./requirements.txt /requirements.txt

# installs all the requirements declared within the text file created above
RUN pip install -r /requirements.txt


# creates a directory in the image called up
RUN mkdir /backend

# sets this directory as the default and enters it
WORKDIR /backend

# copies all code from the adjacent directory into the one in the image
COPY ./backend /backend

# creates a user called user, the -D means that it is only for running processes
# this user is created to limit the ability of hackers
RUN adduser -D user

# sets the default user to user
USER user