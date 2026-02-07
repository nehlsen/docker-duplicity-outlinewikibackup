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
      API_BASE_URL: https://my-outline.example.com
      AUTH_TOKEN: ol_api_asdlkasdkjasdkjasd982j2438h
      SAVE_DIR: "${SRC}"
      # create a backup and unzip it to make it easier for duplicity to save deltas
      JOB_190_WHAT: "/outlinewikibackup && mkdir -p ${SRC}/outline-export && cd ${SRC}/outline-export && unzip ../*-outline-backup-*.zip && rm -f ../*-outline-backup-*.zip"
      JOB_190_WHEN: "daily weekly"
      # cleanup
      JOB_890_WHAT: "rm -rf ${SRC}/outline-export"
      JOB_890_WHEN: "daily weekly"

```
