# resume-cb-es

CV modular en LaTeX.

## Estructura
- main.tex: punto de entrada recomendado.
- preamble.tex: paquetes, márgenes y macros.
- data.tex: datos personales.
- sections/: secciones de contenido.
- output/: artefactos de compilación y PDF final.

## Build con Podman
Desde este directorio:

```bash
mkdir -p output
podman run --rm \
  -v "$PWD":/data:Z \
  -w /data \
  docker.io/texlive/texlive \
  pdflatex -interaction=nonstopmode -halt-on-error -output-directory=output main.tex

# segunda pasada recomendada
podman run --rm \
  -v "$PWD":/data:Z \
  -w /data \
  docker.io/texlive/texlive \
  pdflatex -interaction=nonstopmode -halt-on-error -output-directory=output main.tex
```

PDF esperado: output/main.pdf
