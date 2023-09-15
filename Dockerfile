FROM apache/airflow:latest

ENV AIRFLOW_HOME=/usr/local/airflow

USER root

RUN mkdir -p ${AIRFLOW_HOME} && chown -R airflow: ${AIRFLOW_HOME}

USER airflow

RUN airflow db init

RUN echo "[core]" > /usr/local/airflow/airflow.cfg && \
    echo "airflow_home = /usr/local/airflow" >> /usr/local/airflow/airflow.cfg && \
    echo "executor = LocalExecutor" >> /usr/local/airflow/airflow.cfg && \
    echo "" >> /usr/local/airflow/airflow.cfg && \
    echo "[webserver]" > /usr/local/airflow/airflow.cfg && \
    echo "base_url = http://localhost:8080" >> /usr/local/airflow/airflow.cfg && \
    echo "web_server_host = 0.0.0.0" >> /usr/local/airflow/airflow.cfg && \
    echo "web_server_port = 8080" >> /usr/local/airflow/airflow.cfg
