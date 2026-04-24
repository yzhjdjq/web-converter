openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
  -keyout ./converter.key \
  -out ./converter.crt \
  -subj "/C=RU/ST=Voronezh/L=Voronezh/O=Converter/CN=converter.me" \
  -addext "subjectAltName=DNS:converter.me,DNS:localhost,IP:127.0.0.1"
