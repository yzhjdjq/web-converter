#!/bin/bash
set -e

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

update_postgres_conf() {
    local param="$1"
    local value="$2"
    local conf_file="$3"
    
    if grep -q "^#*\s*${param}\s*=" "$conf_file"; then
        sed -i "s|^#*\s*${param}\s*=.*|${param} = '${value}'|" "$conf_file"
    else
    cat >> $conf_file <<-EOCONF

    ${param} = '${value}'

EOCONF
    fi
}

log "Starting database initialization..."
log "Configuring pg_hba for docker network access"

cat >> /var/lib/postgresql/data/pg_hba.conf <<-EOCONF

host ${POSTGRES_DB} ${POSTGRES_USER} 172.80.0.0/24 trust

EOCONF

update_postgres_conf "listen_addresses" "*" /var/lib/postgresql/data/postgresql.conf
update_postgres_conf "timezone" "Europe/Moscow" /var/lib/postgresql/data/postgresql.conf
update_postgres_conf "log_timezone" "Europe/Moscow" /var/lib/postgresql/data/postgresql.conf

log "Database initialization completed successfully"

