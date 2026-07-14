FROM grafana/promtail:3.3.2

# Bakea el config de Promtail en la imagen.
# Coolify corrompe bind mounts a archivos durante el deploy.
COPY promtail/promtail-config.yml /etc/promtail/config.yml
USER root
