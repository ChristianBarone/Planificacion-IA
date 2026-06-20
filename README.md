# Pràctica de planificació PDDL — Planificador de viatges

Implementació d'un planificador PDDL aplicat al problema de recomanació de viatges a un usuari amb preferencies i restriccions concretes. Pràctica de l'assignatura d'Intel·ligència Artificial.

## El Problema

Versió simplificada del problema de Sistemes Basats en el Coneixement. La idea és obtenir, a partir d'algunes restriccions de l'usuari i de la seva base de dades de vols i hotels, un pla de viatge.

## Nivells

A continuació s'explicarà el contingut de cada nivel present als directoris:

### Nivel_Basico
Donat el conjunt de ciutats disponibles, els hotels de cada ciutat i els vols que connecten les ciutats, volem que, donat un mínim nombre de ciutats a visitar, ens indiqui un hotel on allotjar-nos i els vols que cal prendre per viatjar entre les ciutats.

### Nivel_1
Nivel_Basico + S’indica quin és el mínim i màxim nombre de dies que s’ha d’estar a les ciutats i el mínim nombre de dies que ha de tenir el recorregut, i obtenim un pla que respecta aquestes restriccions i ens diu quants dies s’està a cada ciutat.

### Nivel_2 
Nivel_1 + Cada ciutat té un interès representat com un valor enter (per exemple d’1 a 3, sent 1 l’interès màxim). Volem un pla que maximitzi (tal com és, l’interès en realitat el que volem és minimitzar) l’interès de les ciutats que visitem.

### Nivel_3
Nivel_1 + Els vols i els hotels tenen un preu marcat i volem minimitzar el preu total del pla, però indicant un preu mínim i un preu màxim total.

### Nivel_4
Unim els nivells 2 i 3 de manera que el pla optimitzi l'interès de les ciutats visitades i el preu total del recorregut. Atès que l'interès i el preu tenen unitats molt diferents, hem utilitzat ponderacions a la mètrica que volem optimitzar.

## Requisits
- **Fast Forward** versió 2.3
- L'executable `setup-x86_64.exe` per a Windows x86 o un altre depenent del sistema operatiu.

## Compilació i Execució
A la terminal, dirigiu-vos al directori del nivell que voleu executar

```bash
cd Nivel_Basico
```
Executeu Fast Forward utilitzant la comanda `./ff`.

```bash
./ff -o Nivel_Basico/dominio_basico.pddl -f Nivel_Basico/caso1_basico_varias_rutas.pddl
```
