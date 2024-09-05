# IaaC

Para esta sección, deberás crear un clúster de Fargate alojado en AWS mediante el
servicio ECS y ECR. Para lograr esto, deberá proporcionar la siguiente lista de requisitos:
* El aprovisionamiento DEBE gestionarse mediante la técnica IaaC. Nuestra herramienta preferida para realizar el trabajo es AWS CDK, pero puedes sugerir cualquier otra herramienta que consiga el resultado final. Si opta por utilizar otra herramienta, nos gustaría que nos proporcione los motivos (beneficios, desventajas) de la herramienta de su elección. **DONE**
* El clúster DEBE vivir y utilizar VPC y subredes personalizadas. **DONE**
* Las subredes del clúster y la VPC DEBEN de igual construirse con IaaC. Los valores de estas (CDIR, cantidad de sus redes públicas, privadas y aislada) deben proporcionarse como valores parametrizables (archivo de variables) o calcularse mediante cualquier otro método. **DONE**
* El clúster DEBE tener al menos dos aplicaciones corriendo (es de tu libre elección elegir estas aplicaciones), debes definir la mejor arquitectura que consideres para desplegar estas aplicaciones (un servicio con dos tasks, dos servicios cada una con un task, u otra de tu preferencia) y los motivos (beneficios, desventajas) de tu elección. **DONE**
* La comunicación con las aplicaciones DEBE realizarse mediante una URL pública (Load Balancer, API Gateway u otro). El acceso a través de subredes privada NO DEBE estar habilitado.
* El grupo de nodos o tasks NO DEBE tener IP públicas habilitadas de forma predeterminada.
* Se DEBE poder acceder desde internet a las aplicaciones del clúster solo a través de HTTPS (puerto 443).
* Desde IaaC se DEBE establecer al menos una capa de seguridad para garantizar en caso de requerirse, poder limitar el acceso a un listado de IPs públicas registradas en un archivo de parametrización. **DONE**
* Se DEBE garantizar alta disponibilidad de las aplicaciones y disponer de escenarios de fallas sobre la misma y/o de autoescalado ante escenario como crecimiento de la CPU.

**Nota:** Recuerde que todos estos puntos deben ser configurados con IaaC.

# CI/CD
Para esta sección, necesitaremos que crees los pipelines para la implementación de la
aplicación descrita anteriormente. Puedes elegir la herramienta de tu preferencia,
Jenkins File, MakeFile, Code Pipeline, GitHub Actions u otra de tu preferencia, eres libre
de elegir la herramienta que te resulte más cómoda. No obstante, debes proporcionar
algunos aportes como beneficios o desventajas de la herramienta que elijas.

Para el pipeline en sí, queremos que:
* Crees un pipeline que permita la implementación de sus aplicaciones en tres ambientes distintos (dev, stg, prod) sobre tres regiones diferentes (virginia, Ohio y oregon), es decir la aplicación sobre un ambiente específico debe ser desplegada sobre una región determinada (ejemplo dev sobre Ohio). Esto debe ser parametrizable (ambientes y regiones) desde el archivo de propiedades. **DONE**
* Describa y configure 2 estrategias de despliegues y actualización de aplicaciones sobre contenedores en AWS (fargate), detalle las ventajas de cada una de estas estrategias, y en que tipo de aplicaciones es beneficioso o no utilizar una u otra.Recuerde documentar y evidencias las pruebas realizadas y deje como variables parametrizables el poder utilizar una estrategia u otra en su código IaaC.