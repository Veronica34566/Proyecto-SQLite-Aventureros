-- Creación de la base de datos de Aventureros

-- Tabla de héroes
CREATE TABLE heroes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    clase TEXT NOT NULL,          -- Ej: Guerrero, Mago, Arquero
    nivel INTEGER DEFAULT 1,      -- Nivel inicial
    experiencia INTEGER DEFAULT 0 -- Puntos de experiencia
);

-- Tabla de misiones
CREATE TABLE misiones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    descripcion TEXT,
    recompensa TEXT,              -- Ej: Oro, armas, experiencia
    dificultad TEXT CHECK(dificultad IN ('Baja','Media','Alta'))
);

-- Tabla de monstruos
CREATE TABLE monstruos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    tipo TEXT,                    -- Ej: Dragón, Goblin, Troll
    nivel_amenaza TEXT CHECK(nivel_amenaza IN ('Bajo','Medio','Alto'))
);

-- Tabla intermedia: héroes ↔ misiones
CREATE TABLE misiones_heroes (
    id_heroe INTEGER,
    id_mision INTEGER,
    PRIMARY KEY (id_heroe, id_mision),
    FOREIGN KEY (id_heroe) REFERENCES heroes(id) ON DELETE CASCADE,
    FOREIGN KEY (id_mision) REFERENCES misiones(id) ON DELETE CASCADE
);

-- Tabla intermedia: misiones ↔ monstruos
CREATE TABLE misiones_monstruos (
    id_mision INTEGER,
    id_monstruo INTEGER,
    PRIMARY KEY (id_mision, id_monstruo),
    FOREIGN KEY (id_mision) REFERENCES misiones(id) ON DELETE CASCADE,
    FOREIGN KEY (id_monstruo) REFERENCES monstruos(id) ON DELETE CASCADE
);

-- Datos de ejemplo (opcional)

INSERT INTO heroes (nombre, clase, nivel, experiencia) VALUES
('Arthas', 'Guerrero', 5, 1200),
('Lunara', 'Maga', 3, 600),
('Thalion', 'Arquero', 4, 900);

INSERT INTO misiones (titulo, descripcion, recompensa, dificultad) VALUES
('Defender la aldea', 'Proteger a los aldeanos de un ataque goblin', '50 de oro', 'Media'),
('Cazar al dragón', 'Derrotar al dragón de fuego en la montaña', 'Espada legendaria', 'Alta');

INSERT INTO monstruos (nombre, tipo, nivel_amenaza) VALUES
('Goblin', 'Humanoide', 'Bajo'),
('Dragón de fuego', 'Dragón', 'Alto');

INSERT INTO misiones_heroes (id_heroe, id_mision) VALUES
(1, 1), -- Arthas en misión "Defender la aldea"
(2, 1), -- Lunara también
(3, 2); -- Thalion en misión "Cazar al dragón"

INSERT INTO misiones_monstruos (id_mision, id_monstruo) VALUES
(1, 1), -- Misión 1 contra Goblin
(2, 2); -- Misión 2 contra Dragón
