# 🔍 Crime Analysis — Buenos Aires 2020–2024

Statistical analysis of **653,790 criminal incidents** recorded in the City of Buenos Aires (CABA) between 2020 and 2024, based on open data from the **Ministry of Justice and Security of the Buenos Aires City Government**.

The project produces a **professional multi-page PDF report** with charts, tables, and conclusions, generated fully automatically from the dataset.

---

## Key Findings

| Indicator | Value |
|---|---|
| Total incidents recorded | 653,790 |
| Growth 2020 → 2024 | +84.2% |
| Most frequent crime type | Robbery (41.2%) |
| Neighborhood with most incidents | Palermo (52,992) |
| Most active day of the week | Friday |
| Historical peak hour | 6:00 PM |


## Tech Stack

- **Python 3.x** — Main pipeline logic
- **Pandas** — Data cleaning, transformation, and aggregation
- **NumPy** — Numerical operations and variation calculations
- **Matplotlib** — Bar charts, line plots, and distributions
- **Seaborn** — Heatmaps and statistical visualizations
- **Typst** — Professional PDF report generation with polished layout

---

## Analyses Included

- **Annual evolution** of total incidents with year-over-year percentage change
- **Breakdown by crime type** (Robbery, Theft, Assault, Threats, Traffic, Homicide)
- **Monthly seasonality** via year × month heatmap
- **Distribution by day of week** and time of day
- **Top 10 neighborhoods** by incident concentration
- **Weapon and motorcycle usage** as criminal modality indicators

---


## Data Source

**datos.buenosaires.gob.ar** — Ministry of Justice and Security, Buenos Aires City Government.
Publicly available dataset under an open data license.

---

## Methodological Note

The year 2020 shows notably low values due to the **mandatory lockdown (ASPO)** in effect for most of that year, which limits direct comparability with subsequent years.

---

## 👤 Author

**Ismael Merlo**
[LinkedIn](linkedin.com/in/ismael-merlo-892518284)
