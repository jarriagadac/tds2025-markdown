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

