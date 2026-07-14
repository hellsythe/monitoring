FROM grafana/loki:3.3.2

# Bakea el config de Loki en la imagen.
# Coolify corrompe bind mounts a archivos durante el deploy.
COPY loki/local-config.yaml /etc/loki/local-config.yaml
