FROM python:alpine
LABEL Thiago Teixeira Magalhães <thiago.magalhaes@gmail.com>

ADD requirements.txt .
ADD api.py .

RUN set -ex \
    && pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt 

CMD ["gunicorn", "--log-level", "debug", "--bind", "0.0.0.0:8000", "api:app"]

EXPOSE 8000
