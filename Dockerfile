FROM python:3.11-bullseye
WORKDIR /app
COPY . /app
RUN pip install -r requirement.txt
EXPOSE 3000
CMD python index.py
