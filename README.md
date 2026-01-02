# Latex Tutorial
## Set up a local LaTeX environment on Fedora
```bash
# install Tex Live basic distribution
sudo dnf install texlive-scheme-basic
sudo dnf install latexmk
sudo dnf install texlive-babel-spanish
# sudo dnf install texlive-microtype texlive-xspace
sudo dnf install texlive-tools texlive-microtype

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