# docker-duplicity-outlinewikibackup

docker-duplicity flavor with added outlinewiki backup.

Based on `docker-duplicity-postgres` from https://github.com/Tecnativa/docker-duplicity with added outlinewiki backup from https://github.com/Stenstromen/outlinewikibackup.

## Usage example

```yaml
# outline docker compose.yml
services:
  outline:
    image: outlinewiki/outline
    # ...

  backup:
    image: ghcr.io/nehlsen/docker-duplicity-outlinewikibackup:1.1.0
    env:
      API_BASE_URL: https://my-outline.example.com # this variable is used by outlinewikibackup
      AUTH_TOKEN: ol_api_asdlkasdkjasdkjasd982j2438h # this variable is used by outlinewikibackup
      SAVE_DIR: "${SRC}" # this variable is used by outlinewikibackup
      # create a backup and unzip it to make it easier for duplicity to save deltas
      JOB_190_WHAT: "/outlinewikibackup && mkdir -p ${SRC}/outline-export && cd ${SRC}/outline-export && unzip ../*-outline-backup-*.zip && rm -f ../*-outline-backup-*.zip"
      JOB_190_WHEN: "daily weekly"
      # cleanup
      JOB_890_WHAT: "rm -rf ${SRC}/outline-export"
      JOB_890_WHEN: "daily weekly"

```

For `API_BASE_URL`, `AUTH_TOKEN` and `SAVE_DIR` see https://github.com/Stenstromen/outlinewikibackup?tab=readme-ov-file#environment-variables

## Manual backup

As the container contains the outlinewiki backup tool, you can run it manually like this:
```shell
docker run -it --rm \
  --env API_BASE_URL=https://my-outline.example.com \
  --env AUTH_TOKEN=ol_api_asdlkasdkjasdkjasd982j2438h \
  --env SAVE_DIR=/backup \
  ghcr.io/nehlsen/docker-duplicity-outlinewikibackup:1.1.0 \
  /outlinewikibackup
```
