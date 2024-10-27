#la imagen base para usar en docker vendrá de node en su versión 14, lo que nos dice que nuestra img será en un entorno que podrá ejecutar
#aplicaciones con node.js, todo esto se inidca con la palabra reservada FROM
FROM node:14

#se indica cuál sera nuestro nuestro directorio donde se ejecutarán todas las operaciones que realizaremos
WORKDIR /usr/src/app

#en este paso se copian todos los package desde el equipo al contenedor, ya que dichos archivos tienen las dependencias con las que 
#funcionarán los proyctos con Node.js
COPY package*.json ./

#Aquí se instalan las dependencias de la aplicación
RUN npm install

#con los .. se indica que se copiaran los archivos en el contenedor
COPY . .

# se abre el puerto que se usarpa  para que las peticiones http que entran al puerto 3000
# en el contenedor puedan ser gestionadas por la aplicación de Node.js
EXPOSE 3000

#npm start inicia la plicacion Node.js para que se asegure que la aplicación este siempre lista cuando el contenedor se inicie o ejecute
CMD [ "npm", "start" ]
