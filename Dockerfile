FROM pytorch/pytorch:2.3.1-cuda11.8-cudnn8-devel

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y libsndfile1 git

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/conda/lib/python3.10/site-packages/torch/lib

RUN pip install git+https://github.com/myshell-ai/MeloTTS.git
RUN python -m unidic download

COPY ./ /opt/tiger/OpenVoice
ENV PYTHONPATH /opt/tiger/OpenVoice:$PYTHONPATH
WORKDIR /opt/tiger/OpenVoice
