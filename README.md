# Ubuntu-Debian-Systemd
Ubuntu/Debian funcionando con Systemd (service x start | restart | reload)
Recomendado para ejecutar varios servicios dentro de un solo contenedor, gracias a systemd solo instala el servicio y con service x start.

## Compilar
```sh
docker build -t ubuntu-systemd .
```

## Ejecutar
```sh
docker run -d --name systemd-ubuntu --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro ubuntu-systemd
```

## Ejecutar y que inicie automáticamente
```sh
docker run -d --restart always --name systemd-ubuntu --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro ubuntu-systemd
```
