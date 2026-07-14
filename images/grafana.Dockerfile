FROM grafana/grafana:11.4.0

# Bakea provisioning + dashboards en la imagen para evitar que los bind
# mounts de Coolify reescriban/eliminen estos directorios durante el deploy.
# Coolify corrompe los bind mounts a archivos/dirs; los configs viven
# dentro de la imagen.
COPY grafana/provisioning/ /etc/grafana/provisioning/
COPY grafana/dashboards/ /var/lib/grafana/dashboards/
