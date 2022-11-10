# recetasBruno

Patrón de aquitectura usado: VIPER
Cumple con principios de SOLID:
- Responsabilidad única, ya que cada componente realiza un tipo de acción y en una sola clase no estan involucradas más de 1 capa de la arquitectura.
- Open close: Las clases se encuentran abiertas a extensión sin necesidad de modicarse ya que los componentes están enlazados entre sí, mediante abstracciones de las clases(protocolos).
- Sustitución de Liskov: Todas las capas dependen de abstracciones y no se enlazan a los objectos en sí.
- Segregación de interfaces: Los protocolos usados y creados son usados en su totalidad por la clase que los implementa, no hay metodos vacios o sin usar.


Patrones de diseño usados:

1. Factory: En los wireframes al inyectar dependencias usamos este patrón al centralizar todo lo necesario para inicializar un módulo.
2. Builder: Los ViewController reciben objetos simples como las interfaces que son extensiones de modelos, de esta manera un proceso complejo devuelve objetos simples y digeribles a la vista.
3. Facade: Ejemplo: presenter.filterRecetas(searchText: searchText), este metodo reducido y simple centraliza toda la lógica de filtrado hacia la vista.


Librerias usadas:

1. Alamofire: Para el networking
2. Japx/CodableAlamofire: Para facilitar la decodificacion de los datos, hacia json simples.
3. ProgressHUD: Para mostrar loadings de carga.

Json de recetas utilizado:

{"recetas":[{
"id": 0,
"imagen":"https://www.recetasderechupete.com/wp-content/uploads/2020/11/Tallarines-rojos-con-pollo-768x530.jpg",
"nombre":"tallarines rojos",
"descripcion":"descripcion de tallarines rojos descripcion de tallarines rojos descripcion de tallarines rojos descripcion de tallarines rojos descripcion de tallarines rojos descripcion de tallarines rojos ",
"latitude":-12.046374,
"longitude": -77.042793
},{
 "id": 1,
"imagen":"https://buenazo.cronosmedia.glr.pe/original/2020/09/18/5f6544571a9c1e194b1ec3e9.jpg", 
"nombre": "chanfainita",
"descripcion":"descripcion de chanfainita descripcion de chanfainita descripcion de chanfainita",
"latitude":-35.675147,
"longitude": -71.542969
},{
 "id": 2,
"imagen":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRupU2orIANQC1M1QlkAwQ_TXi9MVShVqEcB6qEogSDMQ&s", 
 "nombre": "cau cau",
"descripcion":"descripcion de cau cau descripcion de cau cau descripcion de cau cau descripcion de cau cau descripcion de cau cau descripcion de cau cau descripcion de cau cau descripcion de cau cau descripcion de cau cau descripcion de cau cau descripcion de cau cau descripcion de cau cau descripcion de cau cau descripcion de cau cau ",
"latitude":40.463667,
"longitude": -3.74922
}
,{
 "id": 3,
"imagen":"https://www.prensalibre.com/wp-content/uploads/2020/07/Pollo-a-la-naranja-ShutterStock.jpg", 
 "nombre": "pollo a la naranja",
"descripcion":"El pollo es una de las proteínas animales más versátiles y utilizadas en la cocina colombiana. Así que, si estás buscando nuevas recetas con pollo, en esta oportunidad te traemos un delicioso plato que es sencillo de preparar y con el que seguro conquistarás el paladar de tus familiares y amigos.",
"latitude":-12.046374,
"longitude": -77.042793
}]}
