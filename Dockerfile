FROM python:3.9
WORKDIR /data

COPY . .

RUN pip install django==3.2
RUN python manage.py migrate --noinput

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
