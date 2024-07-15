FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN pip install git+https://github.com/myshell-ai/MeloTTS.git
RUN python -m unidic download

RUN apt-get update && \
    apt-get install -y libsndfile1

COPY ./ /opt/tiger/OpenVoice
ENV PYTHONPATH /opt/tiger/OpenVoice:$PYTHONPATH
WORKDIR /opt/tiger/OpenVoice
