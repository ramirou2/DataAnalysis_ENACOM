# <h1 align=center> **Análisis del Mercado de Telecomunicaciones Argentino - ENACOM** </h1>

# <h1 align=center>**Análisis descriptivo, situación actual y propuesta de oportunidades en el sector de internet**</h1>

# **Autor: Luna Paez Gaston**

## **Propuesta general**</h2>

**Se propone estudiar la evolución, comportamiento y situación actual de los servicios de telecomunicaciones a nivel nacional. Enfocando el análisis en el mercado de internet.**

## **Objetivos principales**</h2>

* Conocer la situación actual a nivel nacional.
* Identificar oportunidades de crecimiento y desarrollo.
* Identificar aspectos claves para una buena calidad de servicios.

## **Pasos a seguir**</h2>
## **ETL inicial**</h2>

**`Extracción de datos de ENACOM:`**
La extracción se realizo de manera automática en los casos donde fue posible, empleando la API del ente. En cuanto a formatos se empleo el formato **csv** siempre que fuera posible, caso contrario se transformaba a dicho formato.
Principalmente se usaron los datos apartados ene la categoría de "Acceso a Internet", sin embargo se uso *data* complementaria.
* Página principal del ente: [ENACOM](https://datosabiertos.enacom.gob.ar/) , ente nacional de comunicaciones de Argentina.
* Página principal de la API: [ENACOM - API](https://api.datosabiertos.enacom.gob.ar/api/v2/)

**`Tech Skills empleados:`**
* Python:
    * Pandas
    * Request


**`Limpieza inicial:`** 
Se realizó una limpieza general de los datos empleados, enfocándose en la eliminación de columnas invalidas, validación de tipos de datos y reemplazo de valores nulos.

**`Tech Skills empleados:`**
* Python:
    * Pandas
    * Numpy
    * Os

**`Selección de Datos a trabajar:`** 
Se selecciono un subconjunto de los datos para realizar un análisis descriptivo exploratorio en términos de posteriormente realizar dashboards interactivos  para presentar la situación actual de las conexiones a nivel nacional.

**Link a datos y archivos de procesamiento:**

[Datos Principales Procesados](./datastreams/)

[Datos Adicionales Procesados](./externaldata/)

[Archivo de Extracción](./obtencion_datos.ipynb)

[Archivo de Limpieza](./ETL.ipynb)

## **EDA**</h2>
Con la selección de datos se realizó una exploración y análisis de los datos. Se obtuvo información de las distribuciones y la evolución de las diferentes características a lo largo del tiempo. 

**`Tech Skills empleados:`**
* Python:
    * Pandas
    * Numpy
    * Matplotlib
    * Seaborn
    * Os

**Link archivo de procesamiento:**

[Archivo de EDA](./EDA_seleccion.ipynb)



## **Generación de DB reducida para análisis**</h2>
Con los datos procesados se generó una leve normalización de tablas para posteriormente generar una base de datos empleando MySQL. La que finalmente sería empleada para realizar los tableros de presentación.

**`Tech Skills empleados:`**
* Python:
    * Pandas
* MySQL

**Link archivo de procesamiento:**

[Archivo pre-SQL](./ETL_PreSQL.ipynb)


## **Generación de Dashboard**</h2>
Empleando herramientas de visualización interactiva se generaron tableros a modo de hacer amena la presentación de los análisis.

**`Tech Skills empleados:`**
* Python:
    * Pandas
    * Matplotlib
    * Seaborn
* MySQL
* Power BI

**Link directorio de Dashboard:**

[Directorio Tablero](./PowerBI/)

# **`ETL`**</h3>

Empleando la librería requests y la **API** junto con la clave de autenticación provista por la página de **ENACOM**, se obtuvieron los archivos relacionados con el "Acceso a Internet". Se usaron dos *endpoionts*, donde uno contenía la data en crudo, llamado ['datasets'](./datasets/) y otra la data levemente procesada, llamado ['datastreams'](./datastreams/), que finalmente fue la data usada y por ende se encuentra procesada. Ver en ['Extracción de archivos'](./obtencion_datos.ipynb)

Posteriormente se realizó la limpieza inicial, que incluye el casteo de tipos de datos, eliminación de nulos, *dropeo* de valores y columnas sobrantes o innecesarias. 
Ver más en ['ETL Inicial'](./ETL.ipynb)

Con esto realizado y habiendo observado de manera panorámica el contenido de los archivos procesados se seleccionó un subconjunto reducido de estos con la finalidad de obtener los archivos representativos de todo el conjunto general.

# **`EDA (Análisis Exploratorio de Datos)`**</h3>

Haciendo principal foco en las conexiones a internet se realizaron gráficos y diversos análisis que conforman el EDA ( ver en ['EDA'](./EDA_seleccion.ipynb) ).
Se plantearon las siguientes preguntas disparadoras para poder seguir de manera más dinámica el foco de análisis.

1) ¿Como evolucionan en el tiempo las conexiones a Internet en Argentina?. (Teniendo en cuenta los diferentes factores presentes)
    Factores: Velocidades de Descarga, Tecnologías de conexión, Tipo de Conexión (Ancha o Angosta), etc

2) ¿Que provincias se destacan en cuanto a número de conexiones? (Mismos factores de análisis)

3) ¿Que tendencias se observan en el uso de tecnologías ? ¿Como se correlación con las velocidades?

4) ¿Cual es la tendencia de la telefonía fija? ¿Se refleja en las tecnologías empleadas para la conexión a internet?

5) En función de las tendencias observadas. ¿En que área se observa una oportunidad de desarrollo o inclusión en el mercado como prestador de servicios? ¿Con que tecnologías?

**En función de las preguntas anteriores se tomaron las siguientes conclusiones generales**

**Por simplicidad y a modo resumen solo se presentan algunas, para más detalle ['EDA'](./EDA_seleccion.ipynb)**

## **Accesos cada 100 hogares**

### Lineas telefónicas

Observando la siguientes imágenes, donde se presenta el promedio de lineas telefónicas cada 100 hogares, se puede observar una tendencia de disminución en lineas telefónicas a nivel nacional, lo mismo se observa a nivel provincial, sin excepción. Además, en termino de los datos de 2022, se presenta un leve incremento; sin embargo, en términos generales el desuso de este servicio es evidente.

<p align=center><img src=./imagenes/lineaTelefonica.png><p>
<p align=center><img src=./imagenes/lineaTelefonicaProvincias.png><p>

### Accesos a Internet

En primera instancia se presenta el acceso cada 100 hogares, a nivel nacional y provincial. En ambos casos el aumento de este indicador es evidente, notando el aumento de las conexiones a través del tiempo.

<p align=center><img src=./imagenes/accesoCada100Nacional.png><p>

Además se destacan los elevados promedios, Capital Federal, Tierra del Fuego y La Pampa, en cuanto a la primera se debe al nivel de urbanización que posee, y en cuanto las otras dos, dichas medidas se deben en gran parte al bajo número de habitantes y los indices de urbanización en general.

<p align=center><img src=./imagenes/accesoCada100Provincias.png><p>

En términos generales se puede decir que el acceso a internet a pasado a ser una necesidad y se encuentra en constante crecimiento a nivel de conexiones, sin embargo a pesar de esto hay regiones donde los promedios no son tan elevados, pudiendo ser posibles zonas con buen nivel de potentes consumidores. A su vez, combinando esto con algunos de los principales provincias a nivel de conexiones podría resultar en un buen área de despliegue o crecimiento, según se requiera.

Otro dato de color que merece mención, es el repentino aumento de esta métrica en la provincia de San Luis. Esto probablemente se debe a políticas provinciales.
<p align=center><img src=./imagenes/accesoCada100SanLuis.png><p>

Como ejemplo de lo dicho anteriormente podemos observar los promedios en algunas de las provincias pertenecientes al litoral, área que incluye a Santa Fé, provincia que destaca por su nivel de desarrollo y urbanización.

En este conjunto se nota la superioridad de Santa Fé, sin embargo, el promedio de las otras provincias demuestra un buen área de oportunidades, donde a su vez, su cercanía a Santa Fé lo hace un buen lugar para ingresar a la competencia.
<p align=center><img src=./imagenes/accesoCada100Litoral.png><p>

## **Accesos a internet según rangos de velocidad**

En términos generales se observo que existe una tendencia hacia las mayores velocidades, así como una gran caída en las velocidades de menor porte, tanto a nivel nacional como provincial. Ver ['EDA'](./EDA_seleccion.ipynb) para más detalle.

Por lo que se puede decir que al pasar el tiempo los consumidores optan por mejorar sus servicios siempre que les sea posible. Este aumento se destaca en las provincias con grandes y desarrolladas ciudades como Buenos Aires, Capital Federal, Córdoba y Santa Fe.

<p align=center><img src=./imagenes/rangosVelocidadNacional.png><p>

<p align=center><img src=./imagenes/1_6MBProvincias.png><p>

<p align=center><img src=./imagenes/6_10MBProvincias.png><p>

<p align=center><img src=./imagenes/20_30MBProvincias.png><p>

<p align=center><img src=./imagenes/30MBPRovincias.png><p>

En estas gráficas se observa la tendencia a mejorar el servicio en las diferentes provincias, a su vez, se observa un sector de consumo que parece estabilizarse, 6 - 10 Mbps, aparentemente este sector se siente cómodo con este nivel de velocidad. (Notar en el eje x, la correspondencia de periodos en los gráficos)

## **Accesos a internet según tecnologías**
Para corresponder este análisis con las conclusiones obtenidas en cuanto a rangos de velocidad, se presenta la siguiente tabla:

| Tecnología      | Velocidad (Mbps)            |
| --------------- | --------------------------- |
| ADSL            | 2-24                        |
| Cablemódem      | 10-1000                     |
| Fibra Óptica    | 100-1000 (o más)            |
| Wireless        | 1-100                       |

<p align=center><img src=./imagenes/tecnologiasNacional.png><p>

Se puede ver una clara tendencia al uso de las tecnologías que presentan limites más elevados de velocidades. Destacando entre estas, a nivel nacional, **Cablemódem** y **Fibra Óptica**. Además se observa la disminución de conexiones de tipo **ADSL** (mediante lineas telefónicas), lo que demuestra y reafirma el desuso de lineas telefónicas, tanto como medio de comunicación, o medio de conexión a internet. 

Esta gráfica se encuentra fielmente correlacionada con lo observado en los rangos de velocidades en el punto anterior.

<p align=center><img src=./imagenes/tecnologiasProvincial.png><p>

En la gráfica superior se puede observar la distribución del uso de tecnologías en las diferentes provincias en la última medición obtenida. Donde nuevamente desatacan las provincias mencionadas anteriormente. Entre ellas Santa Fé perteneciente al litoral. A su vez, el resto las provincias pertenecientes al litoral, incluyendo Santa Fé, presentan en general mayor desarrollo en conexiones **Cablemódem** que en **Fibra Óptica**, por lo que podría ser una buena selección de tecnología de conexión.

## **Velocidad promedia por provincia**

En torno a lo visto anteriormente se analizó la velocidad promedio a nivel provincia, donde se puede observar en el gráfico siguiente el destaque de la Capital Federal y Buenos Aires.

<p align=center><img src=./imagenes/velocidadesMedia.png><p>

Siguiendo con el análisis del Litoral, se observa una velocidad media máxima de aproximadamente 50 Mbps y una mínima de 30 Mbps, por lo que esto permite, por ejemplo, a futuros prestadores incorporarse con velocidades iguales o superiores a estos rangos.

<p align=center><img src=./imagenes/velocidadesMediaLitoral.png><p>

## **Ingresos a nivel nacional**

Por último, se presenta la evolución de los ingresos por la operación de servicios de internet, donde claramente se ve un crecimiento exponencial.

<p align=center><img src=./imagenes/ingresos.png><p>

# **`Dashboard interactivo Power BI`**</h3>

Empleando Power BI, de la mano de Python y MySQL se generaron un tablero interactivo a modo de presentar el análisis y las conclusiones obtenidas. A modo de vistazo preliminar se presentan unas capturas de pantalla. (Sujeto a modificación al momento de presentar)

Para visualizar el tablero, diríjase al directorio ['Power BI'](./PowerBI/)

<p align=left><img src=./imagenes/dashHome.jpeg><p>
<p align=left><img src=./imagenes/dashAccesoCada100.jpeg><p>
<p align=left><img src=./imagenes/dashAccesoVelocidades.jpeg><p>
<p align=left><img src=./imagenes/dashTecnologias.jpeg><p>
<p align=left><img src=./imagenes/dashLitoral.jpeg><p>



