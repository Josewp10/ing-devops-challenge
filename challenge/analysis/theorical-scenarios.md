Prueba teórica o de conocimientos técnicos
El conjunto de escenarios presentados a continuación pretender entender un poco su
capacidad de resolución de problemas o incidentes, no hay respuesta mala o incorrecta.
No obstante, debe explicar detalladamente y justificar las soluciones ofrecidas a cada
uno de los casos expuestos de manera escrita.


## 1
Actualmente dispone de un servidor web alojado sobre su LAN (e.g
192.168.0.10), en el cual tiene instalado un apache-tomcat sobre la cual ha
alojado la página web de la empresa por el puerto 8080, y Web Services
desplegados sobre el puerto 8443. Se solicita hacer uso del dominio
mipruebaFinaktiva.com.co para publicar a internet tanto la página web, como
los web services. No obstante, se requiere que ambos sean accesibles por la
misma URL y puerto (HTTPS -443). Describa al menos 2 soluciones para resolver
este requerimiento, es libre de disponer el uso de cualquier dispositivo y/o
aplicación conocida para dar solución a lo anterior.

## 2
Un cliente indica que está intentando conectarse los servicios
https://mipruebaFinaktiva.com.co/servicio pero que cuando carga la página
web en su navegador no carga. sin embargo, al realizar usted la prueba
internamente si logra ver disponible los servicios. Describa y enuncie 5 razones
por la cual puede estar pasando el problema y como ayudar al cliente a resolverla
con su ayuda.

R=/

**Problemas de DNS:** El nombre de dominio no se resuelve en la máquina del cliente.
- Solución: Es necesario comprobar la configuración DNS. Debe ser correcta y estar propagada. Se debe pedir al cliente que vacíe la caché DNS del dispositivo.

**Configuración de firewall:** El firewall está configurado para bloquear el acceso al sitio.
- Solución: Asegurarse de que el firewall sí permite el tráfico desde y hacia el dominio y puerto correctos.

**Problemas con la caché del navegador:** Podría haber problemas de carga causados por problemas con la caché del navegador del cliente.
- Solución: Se pedirá al cliente que borre la caché del navegador o que acceda al sitio en una ventana de incógnito.

**Certificado SSL:** Puede haber un problema con el certificado SSL del sitio que el navegador del cliente no haya podido verificar.
- Solución: Se debe comprobar si el certificado SSL sigue siendo válido y si está instalado correctamente. Además, se debe pedir al cliente que actualice su navegador y compruebe la fecha y la hora de su sistema.


## 3
Un balanceador de carga dispone de diferentes algoritmos de balanceo como:
round robin, round robin weight, least connection, source, URI para tráfico TCP
y HTTP. Describa cada uno de estos y en qué casos ustedes utilizarían cada uno
de estos, su comportamiento para tráfico TCP y HTTP, además de las ventajas y
desventajas de estos.

R=/

 **Round Robin**
- Descripción: Esta técnica reparte uniformemente las peticiones entre todos los servidores.
- Utilización: Cuando todos los servidores tienen generalmente la misma capacidad.
- Ventajas: Es fácil de implementar y simple.
- Contras: No tiene en cuenta qué servidor tiene la carga actual.

**Peso Round Robin**
- Descripción: Divide las peticiones en función del peso asignado a un determinado servidor.
- Utilización: Cuando los servidores son de distinta capacidad.
- Ventajas: Los servidores se reparten la carga en función de su capacidad.
- Contras: Sus pesos deben ajustarse manualmente.

**Conexión mínima**
- Descripción: Envía peticiones al servidor que tenga menos conexiones activas.
- Utilización: Carga de trabajo variable o impredecible.
- Ventajas: Maneja bien las cargas desiguales.
- Desventajas: Requiere seguimiento de las conexiones activas.

* **Hash de IP de origen**
- Descripción: Utiliza el hash de la IP de origen para mapear el servidor.
- Uso: Afinidad de sesión, misma IP siempre al mismo servidor.
- Ventajas: Mantiene la afinidad de sesión.
- Desventajas: Puede causar desequilibrio en caso de una distribución no uniforme de direcciones IP.

**URI**
- Descripción: Divide las peticiones en función del Identificador Uniforme de Recursos solicitado.
- Uso: Aplicaciones que utilizan diferentes servicios o recursos.
- Ventajas: Distribuye la carga según recursos específicos.
- Desventajas: Configuración más complicada .


