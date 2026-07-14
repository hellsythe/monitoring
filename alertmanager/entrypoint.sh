#!/bin/ash
set -e

# Sustituir ${VAR} por el valor de las variables de entorno usando awk.
# Solo variables definidas; las no definidas se mantienen como literal para
# que alertmanager emita un error claro si falta una requerida.
awk '
  BEGIN {
    for (name in ENVIRON) {
      val = ENVIRON[name]
      # Escapar solo el ampersand para gsub
      gsub(/[&]/, "\\&", val)
      patterns[name] = "\\$\\{" name "\\}"
      values[name] = val
    }
  }
  {
    line = $0
    for (name in patterns) {
      gsub(patterns[name], values[name], line)
    }
    print line
  }
' /etc/alertmanager/alertmanager.yml.template > /tmp/alertmanager.yml

# Ejecutar Alertmanager con la config procesada
exec /bin/alertmanager --config.file=/tmp/alertmanager.yml --storage.path=/alertmanager "$@"
