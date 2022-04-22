FROM python:latest
RUN apt clean all && apt update -y && \
	pip3 install flask  && \
	apt install git -y && \
	git clone https://github.com/egoulya/student-exam2.git
ENV FLASK_APP=student-exam2/js_example
ENTRYPOINT [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
