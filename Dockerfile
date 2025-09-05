FROM python:3.9

# Workdir सेट
WORKDIR /data

# Code copy
COPY . .

# Optimized pip install (cache नको, dependencies नको, version check नको)
RUN pip install --no-cache-dir --no-deps --disable-pip-version-check django==3.2

# Django migrations
RUN python manage.py migrate --noinput

# Run server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
