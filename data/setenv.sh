export CATALINA_OPTS="$CATALINA_OPTS -javaagent:/usr/local/tomcat/lib/opentelemetry-javaagent.jar"
export OTEL_EXPORTER_OTLP_ENDPOINT=http://10.0.5.17:8200
export OTEL_RESOURCE_ATTRIBUTES=service.name=igrp-opentelemetry
export OTEL_EXPORTER_OTLP_HEADERS="Authorization=Bearer eFhTV2dJY0JGN2xYMVFRYmxCOUM6VmxHaHd5c29RZUNfYUpXR1g4OVkzZw=="
export OTEL_LOGS_EXPORTER=otlp
export OTEL_METRICS_EXPORTER=otlp

			