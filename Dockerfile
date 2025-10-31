FROM ghcr.io/stenstromen/outlinewikibackup:v1.1.15 AS owb
FROM ghcr.io/tecnativa/docker-duplicity-postgres:4.0.0 AS base

COPY --from=owb /outlinewikibackup /
