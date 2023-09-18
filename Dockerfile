FROM jupyter/datascience-notebook

COPY requirements.txt ./
RUN pip install -U pip
RUN pip install --no-cache-dir -r requirements.txt

ENV JUPYTER_ENABLE_LAB=yes

COPY --chown=${NB_UID}:${NB_GID} . /home/csepanyifl/work
WORKDIR /home/csepanyifl/work

#CMD ["python3", "-m", "spacy", "download", "en_core_web_md"]
#RUN python3 -m spacy download en_core_web_md
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--notebook-dir=/home/csepanyifl/work", "--allow-root"]
