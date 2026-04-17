// ----------------------------------------------------------------------
// Reporte: Analisis de Delitos CABA 2020-2024
// Compilar con: typst compile reporte_delitos.typ
// ----------------------------------------------------------------------

#set document(title: "Análisis de Delitos CABA 2020-2024", author: "Ismael Merlo")
#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.8cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(130))
      #grid(
        columns: (1fr, auto),
        [Análisis de Delitos CABA 2020-2024], [Página #counter(page).display()],
      )
      #line(length: 100%, stroke: 0.4pt + luma(200))
    ]
  },
  footer: context {
    set text(size: 8pt, fill: luma(150))
    align(center)[Datos: Ministerio de Justicia y Seguridad - Ciudad de Buenos Aires]
  },
)

#set text(font: "Adwaita Mono", size: 10.5pt, lang: "es")
#set heading(numbering: "1.")
#set par(justify: true, leading: 0.65em)

// --- Colores ---------------------------------------------------------
#let azul = rgb("#2D6A9F")
#let naranja = rgb("#E07B39")
#let gris = rgb("#5A5A5A")
#let claro = rgb("#F0F4F8")

// --- Cajas auxiliares ------------------------------------------------
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

// ---------------------------------------------------------------------
// PORTADA
// ---------------------------------------------------------------------
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
    registrados por el Ministerio de Justicia y Seguridad de CABA.
  ]
]

#v(24pt)

// KPIs
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 14pt,
  kpi("653.790", "total de hechos registrados"),
  kpi("84,2 %", "de crecimiento 2020 -> 2024"),
  kpi("Palermo", "barrio con mas delitos registrados"),
)

#v(10pt)
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 14pt,
  kpi("Robo", "tipo más frecuente"), kpi("Viernes", "día con más hechos"), kpi("18:00 h", "hora pico histórica"),
)

#pagebreak()

// ---------------------------------------------------------------------
// 1. Introduccion
// ---------------------------------------------------------------------
= Introducción

El presente informe analiza los hechos delictivos registrados en la Ciudad Autónoma
de Buenos Aires (CABA) entre 2020 y 2024, a partir de los registros abiertos
del Ministerio de Justicia y Seguridad. El conjunto de datos comprende
*653.790 hechos* distribuidos en seis categorías: Robo, Hurto, Lesiones,
Amenazas, Vialidad y Homicidios.

El análisis abarca tres dimensiones:

- *Temporal*: evolución anual, distribución mensual, día de la semana y franja horaria.
- *Tipológica*: composición y variación interanual de cada categoría delictica.
- *Territorial*: concentración geográfica por barrio.

#nota[
  *Nota metodológica:* El año 2020 presenta valores notoriamente bajos debido
  al Aislamiento Social Preventivo y Obligatorio (ASPO) vigente durante gran
  parte del período, lo que limita la comparabilidad con años posteriores.
]

// ---------------------------------------------------------------------
// 2. ANALISIS ANUAL
// ---------------------------------------------------------------------
= Análisis anual

== Evolución del total de delitos
El total de hechos registrados aumentó de manera sostenida a lo largo del período.
El mayor salto se produjo entre 2020 y 2021 (+29,9%), en gran medida
Por el levantamiento de las restricciones de movilidad asociadas a la pandemia.
En los años siguientes el ritmo de crecimiento se desaceleró: +25,9% en 2022,
+10,6% en 2023 y + 1,9% en 2024, lo que sugiere una estabilización en
el nivel de denuncias.

#figure(
  image("delitos_figures/01_total_yearly.png", width: 80%),
  caption: [Total de delitos registrados por año. Los porcentajes dentro de
    cada barra indican la variación respecto al año anterior.],
)

#pagebreak()

== Distribución por tipo de delito

Los robos y hurtos concentran más del 78% del total histórico.
El robo es la categoría más frecuente con 269.275 hechos (41,2%),
seguida por el Hurto con 242.006 (37,0 %). Las lesiones (7,8 %),
Amenazas (7,0 %) y Vialidad (6,9 %) completan el cuadro, mientras
que los Homicidios representan una proporción marginal (0,1 %).

#figure(
  image("delitos_figures/02_por_tipo.png", width: 88%),
  caption: [Total acumulado por categoría delictiva (2020-2024).],
)

== Composición porcentual por año

La estructura relativa de los delitos se mantuvo relativamente estable.
No obstante, se observa un leve descenso en la participación del Robo
y un aumento de las categorías de Lesiones y vialidad a partir de 2022.

#figure(
  image("delitos_figures/04_composicion.png", width: 90%),
  caption: [Composición porcentual de delitos por año y tipo.],
)

#pagebreak()

// ───────────────────────────────────────────────────────────────────────
//  3. ANÁLISIS INTERANUAL
// ───────────────────────────────────────────────────────────────────────
= Análisis interanual

== Evolución por tipo de delito

#figure(
  image("delitos_figures/03_evolucion_interanual.png", width: 92%),
  caption: [Evolución absoluta de cada tipo de delito entre 2020 y 2024.],
)

Robo y Hurto comparten una trayectoria ascendente pero con
dinámicas distintas: el Robo crece con mayor pendiente hasta 2022
y luego se aplana, mientras que el Hurto muestra crecimiento
más sostenido. Las lesiones, Amenazas y Vialidad presentan
fluctuaciones moderadas y estables a partir de 2022.

== Variación porcentual interanual

#figure(
  image("delitos_figures/10_variacion_interanual.png", width: 92%),
  caption: [Variación porcentual año a año por tipo. La línea discontinua
    representa el 0 \%.],
)

El período 2020->2021 concentra las mayores variaciones positivas en
prácticamente todas las categorías, efecto directo del retorno a la
actividad tras el ASPO. La categoría Vialidad es la única que
registra variaciones negativas en algún subperíodo
(posiblemente relacionado con los patrones de movilidad).
En el tramo 2023->2024 todas las categorías convergieron hacia
tasas de variación cercanas a cero.

// ─────────────────────────────────────────────────────────────────────────────
//  4. DISTRIBUCIÓN TEMPORAL
// ─────────────────────────────────────────────────────────────────────────────
= Distribución temporal

== Estacionalidad mensual

#figure(
  image("delitos_figures/05_heatmap_mes.png", width: 100%),
  caption: [Cantidad de delitos por mes y año. Tonos más oscuros indican
    mayor cantidad.],
)

El primer semestre de 2020 muestra valores mínimos históricos
como consecuencia del ASPO. A partir de 2021, se aprecia una
estacionalidad leve con valores algo superiores en los meses
de verano (enero-marzo) y primavera (octubre-noviembre).


== Día de la semana

#figure(
  image("delitos_figures/06_dia_semana.png", width: 88%),
  caption: [Total de delitos por día de la semana (2020-2024).],
)

El Viernes concentra la mayor cantidad de hechos del período,
seguido de cerca por Lunes y Miercoles. Los fines de semana
(Sábado y Domingo) muestran una reducción pronunciada,
consistente con la menor actividad comercial y circulación peatonal.

== Franja horaria

#figure(
  image("delitos_figures/07_distribucion_horarias.png", width: 100%),
  caption: [Distribución de delitos por hora del día (acumulado 2020-2024).],
)

La distribución horaria presenta dos momentos de mayor actividad:
una primera concentracion entre las 11:00 y las 14:00 horas,
y un pico vespertino entre las 17:00 y las 20:00 horas,
coincidiendo con los momentos de mayor circulación de las personas
en zonas comerciales y de transporte. La madrugada (02:00-07:00 h)
registra los valores mínimos.

#pagebreak()

// ─────────────────────────────────────────────────────────────────────────────
//  5. DISTRIBUCIÓN GEOGRÁFICA
// ────────────────────────────────────────────────────────────────────

= Distribución geográfica

#figure(
  image("delitos_figures/08_top_barrios.png", width: 88%),
  caption: [Diez barrios con mayor cantidad de hechos registrados],
)

Palermo encabeza el ranking con 52.992 hechos, seguido por Balvanera
(42.073) y Flores (35.238). Esta concentracino responde a factores
como la densidad comercial y peatonal, la extensión geográfica del barrio
y la mayor tasa de denuncia en zonas más céntricas. Recoleta, Caballito
y Villa Lugano completan los primeros puestos, mostrando que la problemática
no es exclusiva de barrios de alta densidad comercial.
#pagebreak()
// ─────────────────────────────────────────────────────────────────────────────
//  6. USO DE ARMA Y MOTO
// ──────────────────────────────────────────────────────────────────────

== Uso de arma y motocicleta

#figure(
  image("delitos_figures/09_arma_moto.png", width: 90%),
  caption: [Porcentaje de hechos con uso de arma y/o motocicleta.],
)

El porcentaje de delitos cometidos con uso de arma de fuego o blanca
ronda el 8% del total anual, con una tendencia levemente decreciente
hacia 2024. El uso de motocicleta como medio de escape o comisión,
en cambio, permaneca relativamente estable en torno al 4%,
lo que representa un vector de riesgo consistente en el período analizado.
#pagebreak()
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

+ *Estacionalidad temporal bien definida.* Los viernes son los días de mayor
  actividad delictiva; la franja 17–20 h concentra el pico vespertino;
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
