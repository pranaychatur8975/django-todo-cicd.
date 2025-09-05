FROM python:3.9

WORKDIR /data

COPY . .

# build-time फक्त requirements install कर
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
