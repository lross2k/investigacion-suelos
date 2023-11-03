# Soil data processing

Scripts for data processing of multiple `.xlsx` files

# Simple usage example

## Data preparation

Need `csv` files with columns named FECHA, HORA, MINUTO, Lluvia, TemperaturaAmbiente, 
HumedadRelativa and it's very important that the date column follows the format 
mm/dd/yyyy identified as %d/%m/%Y within Rlang

```csv
     FECHA,   HORA,   MINUTO,   Lluvia
12/20/1929,      0,        0,        0
12/21/1929,      4,       16,        0
12/22/1929,      8,        4,    0.420
```

```csv
     FECHA,   HORA,   MINUTO,   TemperaturaAmbiente,   HumedadRelativa
09/29/2029,      1,        2,                  15.1,                 0
09/30/2029,      3,       32,                51.420,                11
09/31/2029,      0,       38,                  14.9,                69 
```

## Script running

Drop a `.csv` file called `CLEAN_DATA.csv` into the corresonding directory, which can be either 
`LLUVIA`, `SOIL` or `METEOROLOGICO` according to the data that needs to be grouped in the file

Then use the scripts `gen_lluvia.R`, `gen_soil.R` or `gen_meteor.R` according to the directory 
in which the data was dropped, running this scripts on \*nix systems will be as easy as follows 

```sh
./gen_lluvia.R
./gen_soil.R
./gen_meteor.R
```

If R is not correctly installed in your system or it's being ran under Windows, then use the 
following format

```sh
Rscript gen_lluvia.R
Rscript gen_soil.R
Rscript gen_meteor.R
```

## Other scripts

In this repository also reside the files `con_hora.R` and `base.R`, however I don't remember 
how to use this files because I wrote no documentation

# Naming scheme

Google style guide for R shall be used

# Programming environments

- RStudio IDE
- VSCode or VSCodium

These have been tested on the platforms Debian GNU/Linux, Windows 11 and Windows 10

# TODO

- Create a script that removes the repetitive process of `conteo-csv.R`
- Apply Google style to all existent scripts in the repo
- Remember how and why to use `base.R` and `con_hora.R`
- Write actual documentation for the whole repo, this documentationless life can't go on for much longer
