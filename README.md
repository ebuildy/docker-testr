# Testr with Docker

A Docker image to run web automatic tests, with CasperJS.

### Softwares

- Nginx 1.6
- Php 5.5
- Phantomjs 1.9.7
- Casperjs 1.1.3

### Uses

    docker run -P -p 8081:80 -v ~/www/public:/var/www:ro  -v ~/www/tests.js:/var/tests.js ebuildy/testr
