# resume-cb-en

Modular English CV in LaTeX.

## Structure
- main.tex: recommended entry point.
- preamble.tex: packages, margins and macros.
- data.tex: personal data.
- sections/: content sections.
- output/: build artifacts and final PDF.

## Build with Podman
From this directory:

```bash
cd ~/projects/latex-pilot/resume-cb-en
mkdir -p output

podman run --rm \
  -v "$PWD":/data:Z \
  -w /data \
  docker.io/texlive/texlive \
  pdflatex -interaction=nonstopmode -halt-on-error -output-directory=output main.tex

# recommended second pass
podman run --rm \
  -v "$PWD":/data:Z \
  -w /data \
  docker.io/texlive/texlive \
  pdflatex -interaction=nonstopmode -halt-on-error -output-directory=output main.tex
```

Expected PDF: output/main.pdf
