# podman
```bash
Variables
IMAGE=docker.io/texlive/texlive

cd ~/projects/latex-pilot/resume-cb-en
# GENERAL
podman run --rm -v "$PWD":/data:Z -w /data docker.io/texlive/texlive pdflatex resume-cb-en.tex

# DEVOPS
podman run --rm -v "$PWD":/data:Z -w /data docker.io/texlive/texlive pdflatex resume-cb-devops-es.tex

# El flag -w (o --workdir) establece el directorio de trabajo (working directory) dentro del contenedor.
podman run --rm \
  -v "$PWD":/data:Z \     # Monta tu directorio actual EN /data del contenedor
  -w /data \              # Establece /data como directorio de trabajo
  docker.io/texlive/texlive \
  pdflatex resume-cb-en.tex


podman run --rm \
  -v "$PWD":/data:Z \
  -w /data \
  docker.io/texlive/texlive \
  pdflatex resume-cb-en.tex

# remove files
rm -rf resume-cb-en.{aux,log,out,pdf}
rm -rf resume-cb-en.{fdb_latexmk,fls,synctex.gz}
# remove all at once
rm -rf resume-cb-en.{aux,log,out,pdf,fdb_latexmk,fls,synctex.gz}

# 🎉 Tu PDF está listo:
xdg-open resume-cb-en.pdf
