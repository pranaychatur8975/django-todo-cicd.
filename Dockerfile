FROM python:3.9
WORKDIR /data

COPY . .

# Remove --no-deps (जेणेकरून dependencies install होतील)
RUN pip install --no-cache-dir django==3.2

RUN python manage.py migrate --noinput

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
