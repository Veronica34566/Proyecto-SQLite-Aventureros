# Proyecto-SQLite-Aventureros
Base de datos en SQLite para registrar héroes, misiones y monstruos en un mundo de aventuras.
# Proyecto SQLite Aventureros 🗡️🐉

Este proyecto implementa una **base de datos relacional en SQLite** para gestionar la información de un gremio de aventureros.  
El sistema permite registrar **héroes**, **misiones** y **monstruos**, así como las relaciones entre ellos.

---

## 📌 Objetivo
Diseñar un modelo de base de datos que permita:
- Registrar héroes (nombre, clase, nivel de experiencia).
- Registrar misiones (nombre, dificultad, localización, recompensa).
- Registrar monstruos (nombre, tipo, nivel de amenaza).
- Controlar las relaciones:
  - Héroes ↔ Misiones (muchos a muchos).
  - Misiones ↔ Monstruos (muchos a muchos).

---

## 🗂️ Tablas del modelo lógico

### `heroes`
| Campo             | Tipo    | Descripción |
|-------------------|---------|-------------|
| id                | INTEGER | PK |
| nombre            | TEXT    | Nombre del héroe |
| clase             | TEXT    | Clase (Guerrero, Mago, etc.) |
| nivel_experiencia | INTEGER | Nivel de experiencia |

### `misiones`
| Campo           | Tipo    | Descripción |
|-----------------|---------|-------------|
| id              | INTEGER | PK |
| nombre          | TEXT    | Nombre o descripción |
| nivel_dificultad| TEXT    | Fácil, Media, Difícil |
| localizacion    | TEXT    | Lugar de la misión |
| recompensa      | INTEGER | Monedas de oro |

### `monstruos`
| Campo          | Tipo    | Descripción |
|----------------|---------|-------------|
| id             | INTEGER | PK |
| nombre         | TEXT    | Nombre del monstruo |
| tipo           | TEXT    | Dragón, Goblin, etc. |
| nivel_amenaza  | TEXT    | Bajo, Medio, Alto |

### `misiones_heroes`
Tabla intermedia para la relación **héroes ↔ misiones**.

| Campo       | Tipo    | Descripción |
|-------------|---------|-------------|
| id_heroe    | INTEGER | FK → heroes |
| id_mision   | INTEGER | FK → misiones |

### `misiones_monstruos`
Tabla intermedia para la relación **misiones ↔ monstruos**.

| Campo       | Tipo    | Descripción |
|-------------|---------|-------------|
| id_mision   | INTEGER | FK → misiones |
| id_monstruo | INTEGER | FK → monstruos |

---

# Proyecto-SQLite-Aventureros 🗡️🐉

Base de datos en **SQLite** para registrar héroes, misiones y monstruos en un mundo de aventuras.

---

## 📂 Archivos del Proyecto

- [proyecto_aventureros.sql](proyecto_aventureros.sql) → Script SQL para crear y poblar la base de datos.
- `README.md` → Este archivo con la documentación del proyecto.

---

## 🚀 Cómo usar el proyecto

1. **Clonar el repositorio**  
   ```bash
   git clone https://github.com/Veronica34566/Proyecto-SQLite-Aventureros.git
   cd Proyecto-SQLite-Aventureros

