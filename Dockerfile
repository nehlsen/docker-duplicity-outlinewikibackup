FROM ghcr.io/tecnativa/docker-duplicity-postgres:4.0.0 AS base
FROM ghcr.io/stenstromen/outlinewikibackup:v1.2.0 AS owb

COPY --from=owb /outlinewikibackup /
