import "/models/models.dart";

final List<Materia> materias = [
  Materia(
    id: 1,
    nombre: 'Matemáticas',
    categorias: [
      Categoria(
        id: 1,
        nombre: 'Álgebra',
        niveles: [
          Nivel(
            id: 1,
            nombre: 'Nivel 1',
            desbloqueado: false,
            preguntas: [
              Pregunta(
                id: 1,
                texto: '¿Cuál es el valor de x en la ecuación 2x + 3 = 7?',
                opciones: [
                  Opcion(id: 1, texto: '1'),
                  Opcion(id: 2, texto: '2'),
                  Opcion(id: 3, texto: '3'),
                  Opcion(id: 4, texto: '4'),
                ],
                respuestaCorrectaId: 2,
              ),
              Pregunta(
                id: 2,
                texto: '¿Cuál es el valor de x en la ecuación 5x - 4 = 16?',
                opciones: [
                  Opcion(id: 1, texto: '3'),
                  Opcion(id: 2, texto: '4'),
                  Opcion(id: 3, texto: '5'),
                  Opcion(id: 4, texto: '6'),
                ],
                respuestaCorrectaId: 3,
              ),
              Pregunta(
                id: 3,
                texto: '¿Qué representa la pendiente en una ecuación lineal?',
                opciones: [
                  Opcion(id: 1, texto: 'El punto de intersección con el eje y'),
                  Opcion(id: 2, texto: 'El coeficiente de x'),
                  Opcion(id: 3, texto: 'El coeficiente de la constante'),
                  Opcion(id: 4, texto: 'El valor de y cuando x es 0'),
                ],
                respuestaCorrectaId: 2,
              ),
              Pregunta(
                id: 4,
                texto: '¿Cómo se llama la solución de una ecuación cuadrática?',
                opciones: [
                  Opcion(id: 1, texto: 'Raíz'),
                  Opcion(id: 2, texto: 'Coeficiente'),
                  Opcion(id: 3, texto: 'Intercepto'),
                  Opcion(id: 4, texto: 'Pendiente'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 5,
                texto: '¿Cuál es la forma estándar de una ecuación cuadrática?',
                opciones: [
                  Opcion(id: 1, texto: 'ax^2 + bx + c = 0'),
                  Opcion(id: 2, texto: 'ax + b = c'),
                  Opcion(id: 3, texto: 'a/x + b = c'),
                  Opcion(id: 4, texto: 'a(x + b)^2 = c'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 6,
                texto: '¿Cuál es la fórmula general para resolver ecuaciones cuadráticas?',
                opciones: [
                  Opcion(id: 1, texto: 'x = (-b ± √(b^2 - 4ac)) / 2a'),
                  Opcion(id: 2, texto: 'x = -b / (2a)'),
                  Opcion(id: 3, texto: 'x = √(b^2 - 4ac) / 2a'),
                  Opcion(id: 4, texto: 'x = (b ± √(a^2 - 4ac)) / 2a'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 7,
                texto: '¿Qué es un polinomio?',
                opciones: [
                  Opcion(id: 1, texto: 'Una expresión algebraica con dos términos'),
                  Opcion(id: 2, texto: 'Una expresión algebraica con tres o más términos'),
                  Opcion(id: 3, texto: 'Una ecuación de segundo grado'),
                  Opcion(id: 4, texto: 'Una constante'),
                ],
                respuestaCorrectaId: 2,
              ),
              Pregunta(
                id: 8,
                texto: '¿Cómo se llama el punto donde una función lineal cruza el eje y?',
                opciones: [
                  Opcion(id: 1, texto: 'Pendiente'),
                  Opcion(id: 2, texto: 'Intercepto'),
                  Opcion(id: 3, texto: 'Raíz'),
                  Opcion(id: 4, texto: 'Coeficiente'),
                ],
                respuestaCorrectaId: 2,
              ),
              Pregunta(
                id: 9,
                texto: '¿Qué es una ecuación racional?',
                opciones: [
                  Opcion(id: 1, texto: 'Una ecuación que incluye fracciones con polinomios en el numerador y denominador'),
                  Opcion(id: 2, texto: 'Una ecuación que incluye solo números enteros'),
                  Opcion(id: 3, texto: 'Una ecuación de primer grado'),
                  Opcion(id: 4, texto: 'Una ecuación cuadrática'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 10,
                texto: '¿Cuál es el método para resolver sistemas de ecuaciones lineales?',
                opciones: [
                  Opcion(id: 1, texto: 'Método de sustitución'),
                  Opcion(id: 2, texto: 'Método de fracciones'),
                  Opcion(id: 3, texto: 'Método de derivación'),
                  Opcion(id: 4, texto: 'Método de integración'),
                ],
                respuestaCorrectaId: 1,
              ),
            ],
          ),
          Nivel(
            id: 2,
            nombre: 'Nivel 2',
            preguntas: [
              Pregunta(
                id: 11,
                texto: '¿Cómo se llama la gráfica de una función cuadrática?',
                opciones: [
                  Opcion(id: 1, texto: 'Hipérbola'),
                  Opcion(id: 2, texto: 'Elipse'),
                  Opcion(id: 3, texto: 'Parábola'),
                  Opcion(id: 4, texto: 'Recta'),
                ],
                respuestaCorrectaId: 3,
              ),
              Pregunta(
                id: 12,
                texto: '¿Qué método se utiliza para encontrar las raíces de una ecuación cuadrática?',
                opciones: [
                  Opcion(id: 1, texto: 'Método de factorización'),
                  Opcion(id: 2, texto: 'Método de sustitución'),
                  Opcion(id: 3, texto: 'Método de integración'),
                  Opcion(id: 4, texto: 'Método de eliminación'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 13,
                texto: '¿Qué es la regla de Cramer?',
                opciones: [
                  Opcion(id: 1, texto: 'Un método para resolver sistemas de ecuaciones lineales usando determinantes'),
                  Opcion(id: 2, texto: 'Una fórmula para resolver ecuaciones cuadráticas'),
                  Opcion(id: 3, texto: 'Un método para integrar funciones'),
                  Opcion(id: 4, texto: 'Una técnica para derivar funciones'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 14,
                texto: '¿Qué significa el término "coeficiente" en una ecuación?',
                opciones: [
                  Opcion(id: 1, texto: 'El número que multiplica a una variable'),
                  Opcion(id: 2, texto: 'El número que divide a una variable'),
                  Opcion(id: 3, texto: 'El valor constante en la ecuación'),
                  Opcion(id: 4, texto: 'El exponente de la variable'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 15,
                texto: '¿Qué es una ecuación homogénea?',
                opciones: [
                  Opcion(id: 1, texto: 'Una ecuación en la que todos los términos tienen un grado igual'),
                  Opcion(id: 2, texto: 'Una ecuación que no tiene solución'),
                  Opcion(id: 3, texto: 'Una ecuación que incluye fracciones'),
                  Opcion(id: 4, texto: 'Una ecuación con términos de diferentes grados'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 16,
                texto: '¿Qué es el determinante de una matriz?',
                opciones: [
                  Opcion(id: 1, texto: 'Un valor escalar que se puede calcular a partir de una matriz'),
                  Opcion(id: 2, texto: 'El número de filas de la matriz'),
                  Opcion(id: 3, texto: 'El número de columnas de la matriz'),
                  Opcion(id: 4, texto: 'Una operación para transponer la matriz'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 17,
                texto: '¿Cuál es la relación entre los coeficientes y las raíces de un polinomio?',
                opciones: [
                  Opcion(id: 1, texto: 'Las raíces son los valores para los que el polinomio se iguala a cero'),
                  Opcion(id: 2, texto: 'Los coeficientes son las raíces del polinomio'),
                  Opcion(id: 3, texto: 'Las raíces y coeficientes no tienen relación'),
                  Opcion(id: 4, texto: 'Las raíces son el doble de los coeficientes'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 18,
                texto: '¿Qué es la factorización de polinomios?',
                opciones: [
                  Opcion(id: 1, texto: 'El proceso de escribir un polinomio como el producto de sus factores'),
                  Opcion(id: 2, texto: 'El proceso de encontrar las raíces de un polinomio'),
                  Opcion(id: 3, texto: 'El proceso de sumar polinomios'),
                  Opcion(id: 4, texto: 'El proceso de dividir un polinomio por un número'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 19,
                texto: '¿Cómo se llama el punto de intersección de dos rectas?',
                opciones: [
                  Opcion(id: 1, texto: 'El centro'),
                  Opcion(id: 2, texto: 'El punto de origen'),
                  Opcion(id: 3, texto: 'El punto de intersección'),
                  Opcion(id: 4, texto: 'El vértice'),
                ],
                respuestaCorrectaId: 3,
              ),
              Pregunta(
                id: 20,
                texto: '¿Qué es un sistema de ecuaciones lineales?',
                opciones: [
                  Opcion(id: 1, texto: 'Un conjunto de ecuaciones lineales que tienen las mismas variables'),
                  Opcion(id: 2, texto: 'Un conjunto de ecuaciones cuadráticas'),
                  Opcion(id: 3, texto: 'Un conjunto de ecuaciones no lineales'),
                  Opcion(id: 4, texto: 'Un conjunto de ecuaciones exponenciales'),
                ],
                respuestaCorrectaId: 1,
              ),
            ],
          ),
        ],
      ),
      Categoria(
        id: 2,
        nombre: 'Geometría',
        niveles: [
          Nivel(
            id: 1,
            nombre: 'Nivel 1',
            preguntas: [
              Pregunta(
                id: 21,
                texto: '¿Cuál es la fórmula para calcular el área de un triángulo?',
                opciones: [
                  Opcion(id: 1, texto: 'Base × Altura / 2'),
                  Opcion(id: 2, texto: 'Lado × Lado'),
                  Opcion(id: 3, texto: '2 × (Base + Altura)'),
                  Opcion(id: 4, texto: 'Base × Altura'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 22,
                texto: '¿Cómo se llama el ángulo mayor de 90 grados?',
                opciones: [
                  Opcion(id: 1, texto: 'Ángulo recto'),
                  Opcion(id: 2, texto: 'Ángulo agudo'),
                  Opcion(id: 3, texto: 'Ángulo obtuso'),
                  Opcion(id: 4, texto: 'Ángulo llano'),
                ],
                respuestaCorrectaId: 3,
              ),
              Pregunta(
                id: 23,
                texto: '¿Cuál es la fórmula para calcular el volumen de un cubo?',
                opciones: [
                  Opcion(id: 1, texto: 'Lado³'),
                  Opcion(id: 2, texto: 'Lado × Lado × Lado'),
                  Opcion(id: 3, texto: 'Base × Altura'),
                  Opcion(id: 4, texto: 'Lado × Lado'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 24,
                texto: '¿Cómo se llama el polígono con cinco lados?',
                opciones: [
                  Opcion(id: 1, texto: 'Pentágono'),
                  Opcion(id: 2, texto: 'Hexágono'),
                  Opcion(id: 3, texto: 'Heptágono'),
                  Opcion(id: 4, texto: 'Octágono'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 25,
                texto: '¿Cuál es la fórmula para calcular el perímetro de un círculo?',
                opciones: [
                  Opcion(id: 1, texto: '2 × π × Radio'),
                  Opcion(id: 2, texto: 'π × Radio²'),
                  Opcion(id: 3, texto: 'π × Diámetro'),
                  Opcion(id: 4, texto: '4 × Lado'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 26,
                texto: '¿Qué es un ángulo complementario?',
                opciones: [
                  Opcion(id: 1, texto: 'Dos ángulos cuya suma es 90 grados'),
                  Opcion(id: 2, texto: 'Dos ángulos cuya suma es 180 grados'),
                  Opcion(id: 3, texto: 'Dos ángulos cuya suma es 360 grados'),
                  Opcion(id: 4, texto: 'Dos ángulos iguales'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 27,
                texto: '¿Cómo se llama la línea que divide a un triángulo en dos partes iguales?',
                opciones: [
                  Opcion(id: 1, texto: 'Mediana'),
                  Opcion(id: 2, texto: 'Altura'),
                  Opcion(id: 3, texto: 'Bisectriz'),
                  Opcion(id: 4, texto: 'Base'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 28,
                texto: '¿Qué es un triángulo equilátero?',
                opciones: [
                  Opcion(id: 1, texto: 'Un triángulo con todos sus ángulos iguales'),
                  Opcion(id: 2, texto: 'Un triángulo con dos ángulos iguales'),
                  Opcion(id: 3, texto: 'Un triángulo con un ángulo recto'),
                  Opcion(id: 4, texto: 'Un triángulo con todos sus lados desiguales'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 29,
                texto: '¿Cuál es la suma de los ángulos internos de un cuadrado?',
                opciones: [
                  Opcion(id: 1, texto: '360 grados'),
                  Opcion(id: 2, texto: '180 grados'),
                  Opcion(id: 3, texto: '90 grados'),
                  Opcion(id: 4, texto: '270 grados'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 30,
                texto: '¿Qué es una circunferencia?',
                opciones: [
                  Opcion(id: 1, texto: 'El conjunto de todos los puntos equidistantes de un punto central'),
                  Opcion(id: 2, texto: 'Una línea recta que une dos puntos'),
                  Opcion(id: 3, texto: 'Una línea curva sin fin'),
                  Opcion(id: 4, texto: 'El área de un círculo'),
                ],
                respuestaCorrectaId: 1,
              ),
            ],
          ),
          Nivel(
            id: 2,
            nombre: 'Nivel 2',
            preguntas: [
              Pregunta(
                id: 31,
                texto: '¿Cómo se llama el ángulo formado por dos radii de un círculo?',
                opciones: [
                  Opcion(id: 1, texto: 'Ángulo central'),
                  Opcion(id: 2, texto: 'Ángulo inscripto'),
                  Opcion(id: 3, texto: 'Ángulo agudo'),
                  Opcion(id: 4, texto: 'Ángulo recto'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 32,
                texto: '¿Cuál es la fórmula para calcular el área de un trapecio?',
                opciones: [
                  Opcion(id: 1, texto: '((Base mayor + Base menor) × Altura) / 2'),
                  Opcion(id: 2, texto: 'Base × Altura'),
                  Opcion(id: 3, texto: 'Base mayor × Base menor'),
                  Opcion(id: 4, texto: 'Altura × Altura'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 33,
                texto: '¿Cómo se llama el segmento que une dos puntos en una circunferencia?',
                opciones: [
                  Opcion(id: 1, texto: 'Cuerda'),
                  Opcion(id: 2, texto: 'Radio'),
                  Opcion(id: 3, texto: 'Diámetro'),
                  Opcion(id: 4, texto: 'Secante'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 34,
                texto: '¿Qué es un prisma?',
                opciones: [
                  Opcion(id: 1, texto: 'Un sólido con dos bases paralelas y caras rectangulares'),
                  Opcion(id: 2, texto: 'Un sólido con una sola base'),
                  Opcion(id: 3, texto: 'Un sólido con una base circular'),
                  Opcion(id: 4, texto: 'Un sólido con todas las caras triangulares'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 35,
                texto: '¿Qué es una esfera?',
                opciones: [
                  Opcion(id: 1, texto: 'Un sólido redondeado en todas las direcciones'),
                  Opcion(id: 2, texto: 'Un sólido con dos bases paralelas'),
                  Opcion(id: 3, texto: 'Un sólido con caras rectangulares'),
                  Opcion(id: 4, texto: 'Un sólido con una base circular'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 36,
                texto: '¿Cómo se llama el punto central de una esfera?',
                opciones: [
                  Opcion(id: 1, texto: 'Centro'),
                  Opcion(id: 2, texto: 'Orto'),
                  Opcion(id: 3, texto: 'Foco'),
                  Opcion(id: 4, texto: 'Vértice'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 37,
                texto: '¿Cómo se calcula el área superficial de un cubo?',
                opciones: [
                  Opcion(id: 1, texto: '6 × Lado²'),
                  Opcion(id: 2, texto: '4 × Lado²'),
                  Opcion(id: 3, texto: '6 × Lado'),
                  Opcion(id: 4, texto: '8 × Lado'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 38,
                texto: '¿Cuál es la fórmula para calcular el volumen de una esfera?',
                opciones: [
                  Opcion(id: 1, texto: '(4/3) × π × Radio³'),
                  Opcion(id: 2, texto: '4 × π × Radio²'),
                  Opcion(id: 3, texto: 'π × Radio²'),
                  Opcion(id: 4, texto: '4 × Radio³'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 39,
                texto: '¿Cómo se llama la línea que toca una circunferencia en un solo punto?',
                opciones: [
                  Opcion(id: 1, texto: 'Tangente'),
                  Opcion(id: 2, texto: 'Secante'),
                  Opcion(id: 3, texto: 'Cuerda'),
                  Opcion(id: 4, texto: 'Diámetro'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 40,
                texto: '¿Qué es una sección cónica?',
                opciones: [
                  Opcion(id: 1, texto: 'La intersección de un plano con un cono'),
                  Opcion(id: 2, texto: 'Una parte de un círculo'),
                  Opcion(id: 3, texto: 'Una parte de una esfera'),
                  Opcion(id: 4, texto: 'Una figura hecha con polígonos'),
                ],
                respuestaCorrectaId: 1,
              ),
            ],
          ),
        ],
      ),
      Categoria(
        id: 3,
        nombre: 'Trigonometría',
        niveles: [
          Nivel(
            id: 1,
            nombre: 'Nivel 1',
            preguntas: [
              Pregunta(
                id: 41,
                texto: '¿Cuál es la razón trigonométrica fundamental en un triángulo rectángulo?',
                opciones: [
                  Opcion(id: 1, texto: 'Seno, coseno y tangente'),
                  Opcion(id: 2, texto: 'Seno y coseno'),
                  Opcion(id: 3, texto: 'Tangente y cotangente'),
                  Opcion(id: 4, texto: 'Seno y cotangente'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 42,
                texto: '¿Cómo se llama la función que relaciona el ángulo con el cociente del cateto opuesto sobre la hipotenusa?',
                opciones: [
                  Opcion(id: 1, texto: 'Seno'),
                  Opcion(id: 2, texto: 'Coseno'),
                  Opcion(id: 3, texto: 'Tangente'),
                  Opcion(id: 4, texto: 'Cotangente'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 43,
                texto: '¿Qué es la ley de los senos?',
                opciones: [
                  Opcion(id: 1, texto: 'Una relación en un triángulo entre las longitudes de los lados y los ángulos opuestos'),
                  Opcion(id: 2, texto: 'Una relación en un triángulo entre las longitudes de los lados y los ángulos adyacentes'),
                  Opcion(id: 3, texto: 'Una relación en un triángulo entre las áreas de los ángulos'),
                  Opcion(id: 4, texto: 'Una relación entre las longitudes de los lados de un triángulo'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 44,
                texto: '¿Cómo se llama la función que relaciona el ángulo con el cociente del cateto adyacente sobre la hipotenusa?',
                opciones: [
                  Opcion(id: 1, texto: 'Coseno'),
                  Opcion(id: 2, texto: 'Seno'),
                  Opcion(id: 3, texto: 'Tangente'),
                  Opcion(id: 4, texto: 'Cotangente'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 45,
                texto: '¿Qué es la ley de los cosenos?',
                opciones: [
                  Opcion(id: 1, texto: 'Una relación en un triángulo entre las longitudes de los lados y los cosenos de los ángulos'),
                  Opcion(id: 2, texto: 'Una relación entre las áreas de los ángulos'),
                  Opcion(id: 3, texto: 'Una relación entre las longitudes de los lados de un triángulo rectángulo'),
                  Opcion(id: 4, texto: 'Una relación en un triángulo entre las longitudes de los lados y los ángulos opuestos'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 46,
                texto: '¿Qué es un ángulo en radianes?',
                opciones: [
                  Opcion(id: 1, texto: 'Una medida del ángulo basada en la longitud del arco'),
                  Opcion(id: 2, texto: 'Una medida del ángulo basada en grados'),
                  Opcion(id: 3, texto: 'Una medida del ángulo basada en la longitud de la hipotenusa'),
                  Opcion(id: 4, texto: 'Una medida del ángulo basada en la suma de los ángulos internos'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 47,
                texto: '¿Cómo se llama la función que relaciona el ángulo con el cociente del cateto opuesto sobre el cateto adyacente?',
                opciones: [
                  Opcion(id: 1, texto: 'Tangente'),
                  Opcion(id: 2, texto: 'Seno'),
                  Opcion(id: 3, texto: 'Coseno'),
                  Opcion(id: 4, texto: 'Cotangente'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 48,
                texto: '¿Cuál es la fórmula para convertir grados a radianes?',
                opciones: [
                  Opcion(id: 1, texto: 'Grados × (π / 180)'),
                  Opcion(id: 2, texto: 'Grados × (180 / π)'),
                  Opcion(id: 3, texto: 'Grados + π'),
                  Opcion(id: 4, texto: 'Grados - π'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 49,
                texto: '¿Qué es un ángulo complementario en trigonometría?',
                opciones: [
                  Opcion(id: 1, texto: 'Dos ángulos cuya suma es 90 grados'),
                  Opcion(id: 2, texto: 'Dos ángulos cuya suma es 180 grados'),
                  Opcion(id: 3, texto: 'Dos ángulos cuya suma es 360 grados'),
                  Opcion(id: 4, texto: 'Dos ángulos iguales'),
                ],
                respuestaCorrectaId: 1,
              ),
              Pregunta(
                id: 50,
                texto: '¿Qué es un ángulo suplementario en trigonometría?',
                opciones: [
                  Opcion(id: 1, texto: 'Dos ángulos cuya suma es 180 grados'),
                  Opcion(id: 2, texto: 'Dos ángulos cuya suma es 90 grados'),
                  Opcion(id: 3, texto: 'Dos ángulos cuya suma es 360 grados'),
                  Opcion(id: 4, texto: 'Dos ángulos iguales'),
                ],
                respuestaCorrectaId: 1,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
