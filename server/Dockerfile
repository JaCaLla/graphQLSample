# Usamos una imagen oficial de Node.js
FROM node:latest

# Establecemos el directorio de trabajo
WORKDIR /usr/src/app

# Copiamos los archivos del proyecto a la imagen
COPY . .

# Instalamos las dependencias del proyecto
RUN npm install

# Exponemos el puerto 4000
EXPOSE 4000

# Ejecutamos el servidor
CMD ["node", "server.js"]
