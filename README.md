# Latex Tutorial
## Set up a local LaTeX environment on Fedora
```bash
# install Tex Live basic distribution
sudo dnf install texlive-scheme-basic
sudo dnf install latexmk
sudo dnf install texlive-babel-spanish
# sudo dnf install texlive-microtype texlive-xspace
sudo dnf install texlive-tools texlive-microtype

# ! LaTeX Error: File `fullpage.sty' not found.
sudo dnf install texlive-preprint
sudo dnf install texlive-ulem
# 💡 Tip: Instalar todos los paquetes comunes de una vez
sudo dnf install texlive-collection-latexextra
# En este punto, te recomiendo fuertemente instalar la colección completa para evitar seguir con este ciclo:
sudo dnf install texlive-collection-latexextra texlive-collection-fontsextra
# Esto instalará:
# ✅ sourcesanspro (fuentes)
# ✅ ulem (subrayado)
# ✅ fullpage (márgenes)
# ✅ Cientos de otros paquetes comunes

# El problema es que sourcesanspro está en la colección de fuentes, no en latexextra. Instala esto:
sudo dnf install texlive-sourcesanspro texlive-collection-fontsextra
# 🎯 Para compilar tu CV sin más problemas:
sudo dnf install texlive-collection-fontsextra texlive-collection-fontsrecommended
# El problema es que tu versión de enumitem puede ser incompatible o estar corrupta. Reinstálala:
sudo dnf reinstall texlive-enumitem
# O si no está instalada:
sudo dnf install texlive-enumitem

# Opción 1: Actualizar TeX Live completamente
sudo dnf update texlive-\*



# install Tex Live medium distribution
sudo dnf install texlive-scheme-medium
# install TeX Live full distribution
sudo dnf install texlive-scheme-full
# this will install a 3GB+ package, so be patient

# install inotify-tools
sudo dnf install inotify-tools
# compile the main.tex file
pdflatex main.tex

# run and watch for changes
# while true; do inotifywait -e close_write main.tex; pdflatex main.tex; done
# while true; do inotifywait -e close_write main.tex; pdflatex factorizacion.tex; done

```

## Use VS Code with LaTeX Workshop extension for easier editing and compiling
```bash
# install VS Code
# sudo snap install --classic code
# install LaTeX Workshop extension
code --install-extension James-Yu.latex-workshop


```