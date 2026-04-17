// ─────────────────────────────────────────────────────────────────────────────
// Reporte: Análisis de Delitos CABA 2020–2024
// Compilar con: typst compile reporte_delitos.typ
// ─────────────────────────────────────────────────────────────────────────────

#set document(title: "Análisis de Delitos CABA 2020–2024", author: "Análisis Estadístico")
#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.8cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(130))
      #grid(
        columns: (1fr, auto),
        [Análisis de Delitos CABA 2020–2024], [Página #counter(page).display()],
      )
      #line(length: 100%, stroke: 0.4pt + luma(200))
    ]
  },
  footer: context {
    set text(size: 8pt, fill: luma(150))
    align(center)[Datos: Ministerio de Justicia y Seguridad — Ciudad de Buenos Aires]
  },
)

#set text(font: "Linux Libertine", size: 10.5pt, lang: "es")
#set heading(numbering: "1.")
#set par(justify: true, leading: 0.65em)

// ── Colores ──────────────────────────────────────────────────────────────────
#let azul = rgb("#2D6A9F")
#let naranja = rgb("#E07B39")
#let gris = rgb("#5A5A5A")
#let claro = rgb("#F0F4F8")

// ── Cajas auxiliares ─────────────────────────────────────────────────────────
#let kpi(valor, etiqueta) = block(
  width: 100%,
  fill: claro,
  radius: 6pt,
  inset: 12pt,
  [
    #align(center)[
      #text(size: 22pt, weight: "bold", fill: azul)[#valor] \
      #text(size: 9pt, fill: gris)[#etiqueta]
    ]
  ],
)

#let nota(cuerpo) = block(
  fill: rgb("#FFF8F0"),
  stroke: 1pt + naranja,
  radius: 4pt,
  inset: 10pt,
  width: 100%,
  [#text(size: 9.5pt)[#cuerpo]],
)

// ─────────────────────────────────────────────────────────────────────────────
//  PORTADA
// ─────────────────────────────────────────────────────────────────────────────
#block(
  width: 100%,
  fill: azul,
  radius: 8pt,
  inset: 32pt,
)[
  #text(size: 24pt, weight: "bold", fill: white)[
    Análisis de Delitos
  ]
  #linebreak()
  #text(size: 16pt, fill: rgb("#BBDDFF"))[
    Ciudad Autónoma de Buenos Aires · 2020–2024
  ]
  #v(6pt)
  #text(size: 10pt, fill: rgb("#CCDDFF"))[
    Análisis estadístico anual e interanual sobre hechos delictivos
    registrados por el Ministerio de Justicia y Seguridad de la CABA.
  ]
]

#v(24pt)

// KPIs
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 14pt,
  kpi("653.790", "total de hechos registrados"),
  kpi("84,2 %", "de crecimiento 2020→2024"),
  kpi("Palermo", "barrio con más delitos"),
)

#v(10pt)
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 14pt,
  kpi("Robo", "tipo más frecuente"), kpi("Lunes", "día con más hechos"), kpi("20:00 h", "hora pico histórica"),
)

#pagebreak()

// ─────────────────────────────────────────────────────────────────────────────
//  1. INTRODUCCIÓN
// ─────────────────────────────────────────────────────────────────────────────
= Introducción

El presente informe analiza los hechos delictivos registrados en la Ciudad Autónoma
de Buenos Aires (CABA) entre 2020 y 2024, a partir de los registros abiertos
del Ministerio de Justicia y Seguridad. El conjunto de datos comprende
*653.790 hechos* distribuidos en seis categorías: Robo, Hurto, Lesiones,
Amenazas, Vialidad y Homicidios.

El análisis abarca tres dimensiones:

- *Temporal*: evolución anual, distribución mensual, día de la semana y franja horaria.
- *Tipológica*: composición y variación interanual de cada categoría delictiva.
- *Territorial*: concentración geográfica por barrio.

#nota[
  *Nota metodológica:* El año 2020 presenta valores notoriamente bajos debido
  al Aislamiento Social Preventivo y Obligatorio (ASPO) vigente durante gran
  parte del período, lo que limita la comparabilidad con años posteriores.
]

// ─────────────────────────────────────────────────────────────────────────────
//  2. ANÁLISIS ANUAL
// ─────────────────────────────────────────────────────────────────────────────
= Análisis anual

== Evolución del total de delitos

El total de hechos registrados aumentó de manera sostenida a lo largo del período.
El mayor salto se produjo entre 2020 y 2021 (+29,9 %), en gran medida
por el levantamiento de las restricciones de movilidad asociadas a la pandemia.
En los años siguientes el ritmo de crecimiento se desaceleró: +25,9 % en 2022,
+10,6 % en 2023 y +1,9 % en 2024, lo que sugiere una estabilización en
el nivel de denuncias.

#figure(
  image("plots/01_total_anual.png", width: 90%),
  caption: [Total de delitos registrados por año. Los porcentajes dentro de
    cada barra indican la variación respecto al año anterior.],
)

#pagebreak()

== Distribución por tipo de delito

Los robos y hurtos concentran más del 78 % del total histórico.
El Robo es la categoría más frecuente con 269.275 hechos (41,2 %),
seguida por el Hurto con 242.006 (37,0 %). Las Lesiones (7,8 %),
Amenazas (7,0 %) y Vialidad (6,9 %) completan el cuadro, mientras
que los Homicidios representan una proporción marginal (0,1 %).

#figure(
  image("plots/02_por_tipo.png", width: 88%),
  caption: [Total acumulado por categoría delictiva (2020–2024).],
)

== Composición porcentual por año

La estructura relativa de los delitos se mantuvo relativamente estable.
No obstante, se observa un leve descenso en la participación del Robo
y un aumento de las categorías de Lesiones y Vialidad a partir de 2022.

#figure(
  image("plots/04_composicion_anual.png", width: 96%),
  caption: [Composición porcentual de delitos por año y tipo.],
)

#pagebreak()

// ─────────────────────────────────────────────────────────────────────────────
//  3. ANÁLISIS INTERANUAL
// ─────────────────────────────────────────────────────────────────────────────
= Análisis interanual

== Evolución por tipo de delito

#figure(
  image("plots/03_evolucion_tipos.png", width: 92%),
  caption: [Evolución absoluta de cada tipo de delito entre 2020 y 2024.],
)

Robo y Hurto comparten una trayectoria ascendente pero con
dinámicas distintas: el Hurto crece con mayor pendiente hasta 2022
y luego se aplana, mientras que el Robo muestra un crecimiento
más sostenido. Las Lesiones, Amenazas y Vialidad presentan
incrementos moderados y estables a partir de 2022.

== Variación porcentual interanual

#figure(
  image("plots/10_variacion_interanual.png", width: 92%),
  caption: [Variación porcentual año a año por tipo. La línea discontinua
    representa el 0 \%.],
)

El período 2020→2021 concentra las mayores variaciones positivas en
prácticamente todas las categorías, efecto directo del retorno a la
actividad tras el ASPO. La categoría Vialidad es la única que
registra variaciones negativas en algún subperíodo
(posiblemente relacionado con los patrones de movilidad).
En el tramo 2023→2024 todas las categorías convergieron
hacia tasas de variación cercanas a cero.

#pagebreak()

// ─────────────────────────────────────────────────────────────────────────────
//  4. DISTRIBUCIÓN TEMPORAL
// ─────────────────────────────────────────────────────────────────────────────
= Distribución temporal

== Estacionalidad mensual

#figure(
  image("plots/05_heatmap_mes.png", width: 100%),
  caption: [Cantidad de delitos por mes y año. Tonos más oscuros indican
    mayor cantidad.],
)

El primer semestre de 2020 muestra valores mínimos históricos
como consecuencia del ASPO. A partir de 2021, se aprecia una
estacionalidad leve con valores algo superiores en los meses
de verano (enero–marzo) y primavera (octubre–noviembre).
Diciembre tiende a registrar descensos moderados en todos los años,
posiblemente relacionados con el período vacacional y menor actividad comercial.

== Día de la semana

#figure(
  image("plots/06_por_dia.png", width: 88%),
  caption: [Total de delitos por día de la semana (2020–2024).],
)

El Lunes concentra la mayor cantidad de hechos del período,
seguido de cerca por Martes y Viernes. Los fines de semana
(Sábado y Domingo) muestran una reducción pronunciada,
consistente con la menor actividad comercial y circulación peatonal.

#pagebreak()

== Franja horaria

#figure(
  image("plots/07_por_hora.png", width: 100%),
  caption: [Distribución de delitos por hora del día (acumulado 2020–2024).],
)

La distribución horaria presenta dos momentos de mayor actividad:
una primera concentración entre las 11:00 y las 14:00 horas,
y un pico vespertino-nocturno entre las 19:00 y las 22:00 horas,
coincidiendo con los momentos de mayor circulación de personas
en zonas comerciales y de transporte. La madrugada (02:00–07:00 h)
registra los valores mínimos.

// ─────────────────────────────────────────────────────────────────────────────
//  5. DISTRIBUCIÓN GEOGRÁFICA
// ─────────────────────────────────────────────────────────────────────────────
= Distribución geográfica

#figure(
  image("plots/08_top_barrios.png", width: 88%),
  caption: [Diez barrios con mayor cantidad de hechos registrados (2020–2024).],
)

Palermo encabeza el ranking con 52.992 hechos, seguido por Balvanera
(42.073) y Flores (35.238). Esta concentración responde a factores
como la densidad comercial y peatonal, la extensión geográfica del barrio
y la mayor tasa de denuncia en zonas más céntricas. Recoleta, Caballito
y Villa Lugano completan los primeros puestos, mostrando que la problemática
no es exclusiva de barrios de alta densidad comercial.

#pagebreak()

// ─────────────────────────────────────────────────────────────────────────────
//  6. USO DE ARMA Y MOTO
// ─────────────────────────────────────────────────────────────────────────────
= Uso de arma y motocicleta

#figure(
  image("plots/09_arma_moto.png", width: 90%),
  caption: [Porcentaje de hechos con uso de arma y/o motocicleta por año.],
)

El porcentaje de delitos cometidos con uso de arma de fuego o blanca
ronda el 15–20 % del total anual, con una tendencia levemente decreciente
hacia 2024. El uso de motocicleta como medio de escape o comisión,
en cambio, permanece relativamente estable en torno al 8–10 %,
lo que representa un vector de riesgo consistente en el período analizado.

// ─────────────────────────────────────────────────────────────────────────────
//  7. CONCLUSIONES
// ─────────────────────────────────────────────────────────────────────────────
= Conclusiones

El análisis de los hechos delictivos en CABA entre 2020 y 2024 permite
extraer las siguientes conclusiones principales:

+ *Crecimiento sostenido pero desacelerado.* El volumen de delitos creció
  un 84,2 % en el período, con el salto más brusco en 2021 tras el ASPO.
  La tendencia en 2024 muestra una estabilización.

+ *Robo y Hurto dominan la estructura.* Juntos representan el 78 % del total.
  Ambas categorías crecieron en valores absolutos, aunque su participación
  relativa se mantuvo estable.

+ *Estacionalidad temporal bien definida.* Los lunes son los días de mayor
  actividad delictiva; la franja 19–22 h concentra el pico vespertino;
  los meses de verano y primavera presentan valores ligeramente superiores.

+ *Concentración territorial en barrios densos.* Palermo, Balvanera y Flores
  lideran el ranking, evidenciando la correlación entre densidad de actividad
  urbana y criminalidad registrada.

+ *Uso de arma estable, uso de moto persistente.* Ambos indicadores se
  mantienen relativamente constantes, lo que sugiere que no ha habido
  cambios estructurales en las modalidades delictivas más violentas.

#v(24pt)
#align(center)[
  #text(size: 9pt, fill: luma(140))[
    Fuente: datos.buenosaires.gob.ar —
    Ministerio de Justicia y Seguridad, GCBA.
    Procesamiento: Python (pandas, matplotlib, seaborn).
  ]
]
