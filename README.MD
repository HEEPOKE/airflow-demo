# Start

- Build

```bash
docker build -t my-airflow-image .
```

- Docker Compose

```bash
docker compsoe up -d
```

- Add User

```bash
docker exec -it <container-id> airflow users create --username admin --password admin --firstname First --lastname Last --role Admin --email admin@example.com
```
