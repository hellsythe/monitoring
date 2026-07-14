FROM prom/prometheus:v2.55.1

# Bakea prometheus.yml y las reglas de alerta en la imagen.
# Coolify corrompe bind mounts a archivos/dirs durante el deploy.
COPY prometheus/prometheus.yml /etc/prometheus/prometheus.yml
COPY prometheus/rules /etc/prometheus/rules
