---
marp: true
paginate: true
author: 'Juan Arriagada (juan.arriagada@ucampus.cl)'
charset: UTF-8
title: Ucampus-python
---
<style>
@import url('https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap');
section {
    font-family: 'Lato', sans-serif;
    color: rgb(103, 104, 104);
    &.columns {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 1rem;
    }
    &.titulo {
        background-size: cover;
        background-position: center;

        padding-left: 240px;
        h1 {
            color: white;
            font-weight: 400;
            font-size: 64px;
        }
        h2 {
            color: white;
            margin-top: -40px;
            font-weight: 400;
            font-size: 32px;
        }
        &.bg-portada { background-image: url("images/bg_azul_claro.png"); }
        &.bg-blanco { 
            background-image: url("images/bg_blanco_1.png");
            h1 { color:rgb(12, 129, 135); }
            h2 { color: black; }
        }
        &.bg-azul-claro { background-image: url("images/bg_azul_claro.png"); }
    }
    &.bg-portada::before {
        content: "";
        position: absolute;
        top: 55px;
        left: 40px;
        width: 275px;
        height: 70px;
        background-image: url("images/bg_azul_claro.svg");
        background-size: contain;
        background-repeat: no-repeat;
        background-position: left top;
        z-index: 10;
    }
    &.contenido {
        background-size: cover;
        background-position: center;

        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        font-size: 24px;

        h1 {
            color:rgb(11, 130, 135);
            font-weight: 400;
            font-size: 48px;
        }
        h2 {
            color: black;
            margin-top: -40px;
            font-weight: 400;
            font-size: 36px;
        }
        
        &.bg-blanco-1 { background-image: url("images/bg_blanco_1.png"); }
        &.bg-blanco-2 { background-image: url("images/bg_blanco_2.png"); }
    }
    &.titulo:not(.bg-portada)::before, &&.contenido::before {
        content: "";
        position: absolute;
        bottom: 25px;
        left: 25px;
        width: 190px;
        height: 49px;
        background-size: contain;
        background-repeat: no-repeat;
        background-position: left bottom;
        z-index: 10;
    }
    &.titulo:is(.bg-blanco)::before, &.contenido::before { background-image: url("images/logo_default.svg"); }
    &.titulo:not(.bg-portada, .bg-blanco)::before { background-image: url("images/logo_white.svg"); }
}
</style>
<!-- _class: titulo bg-portada -->

# Extensión para la creacion de módulos con Python
## 🐍 Ucampus-python

---

<!-- _class: contenido bg-blanco-1 -->

# 🧭 Drivers de Arquitectura

Factores que guían las decisiones técnicas y estructurales:

- Expandir el **stack tecnológico** permitiendo la creación de módulos utilizando Python 🐍
- La integración de Python debe ser:
    - **Imperceptible** para las/os Usuarios
    - **Transparente**, **Escalable** y **Armónica** para las/os Devs y Sysadmins
    - **Innovadora** en integrar y mejorar las capacidades existentes en Ucampus

---

<!-- _class: contenido bg-blanco-2 -->

# ✅ Checklist (algunos)

- Todos los Devs puedan crear módulos
- Cargar la configuración desde Infonucleo.parametros.php
- Compartir sistema de sesiones usando Memcached ✓
- Compartir elementos comunes de interfaz gráfica (templates) ✓
- Compartir la administración existente (configuración, logs, etc.)
- Utilizar MariaDB (ISO8859-1 y UTF-8) ✓

---

<!-- _class: titulo bg-verde -->

# Todos los Devs puedan crear módulos

---

<!-- _class: contenido bg-blanco-2 -->

# Compatibilidad con flujo actual

Para tener compatibilidad con la infraestructura existente, se decidió utilizar Apache con `mod_userdir` y `mod_wsgi` para el despliegue Ucampus-python en cada una de las instalaciones de los devs.

Se asociaron los paths `/~usuario/<instalacion>/web/p/` con un router wsgi en la ruta `/home/usuario/public_html/<instalacion>/web/p/wsgi.py`. Desde el path `/p` hacia adentro, se utiliza encoding **UTF-8** por defecto.

Este enfoque permite compatibilidad con la infraestructura existente utilizando `~usuario` (`mod_userdir`), permitiendo además contar con múltiples `instalaciones` por usuario, cada uno con su propia configuración, sin que esto afecte negativamente los recursos de `dev.ucampus.cl`.

---

<!-- _class: titulo bg-azul-oscuro -->

# Cargar la configuración desde Infonucleo.parametros.php

---

<!-- _class: contenido bg-blanco-2 -->

# Configuración de Ucampus-python

```php
$info['ucampus_python'] = [
	'SCHEMA_BASE' => INFO_PREFIJO . "P",
	'SESSION_COOKIE_NAME' => '_ucampus',
	'DJANGO_SECRET_KEY' => 'p4bl0p4bl1t0cl4v0uncl4v1t0',
	'DEBUG' => true, // activa el debug de Django
];
```

---

<!-- _class: contenido bg-blanco-2 -->

# Configuración de un módulo

```php
$info['python'] = $info['db_master'] + [
	'python' => true,
	'ruta_base' => INFO_BASE.'/python',
	'ruta_assets' => INFO_BASE_PYTHON.'/#app#/static/',
];
```

---

<!-- _class: contenido bg-azul-claro -->

# Configuraciones específicas

Configuraciones específicas, comunes para todas las instalaciones:

- Ruta del entorno virtual de python
- Ruta a la libPHP
- Debug a nivel de apache_wsgi
- Usuario que "ejecuta" Python

<!-- _class: titulo bg-azul-claro -->

# Utilizar MariaDB

---

<!-- _class: titulo bg-verde -->

# Demo

---

<!-- _class: titulo bg-portada -->
