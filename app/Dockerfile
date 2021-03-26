FROM python:alpine

ADD requirements.txt .
ADD api.py .

RUN set -ex \
    && pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt 

CMD ["gunicorn", "--log-level", "debug", "api:app"]