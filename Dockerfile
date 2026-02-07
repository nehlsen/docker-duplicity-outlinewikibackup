FROM ghcr.io/stenstromen/outlinewikibackup:v1.2.0 AS owb
FROM ghcr.io/tecnativa/docker-duplicity-postgres:4.1.0 AS base

COPY --from=owb /outlinewikibackup /
