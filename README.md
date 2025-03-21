# Latex Tutorial
## How to run on fedora
```bash
sudo dnf install texlive-scheme-full
# install inotify-tools
sudo dnf install inotify-tools
# compile the main.tex file
pdflatex main.tex

# run and watch for changes
# while true; do inotifywait -e close_write main.tex; pdflatex main.tex; done
# while true; do inotifywait -e close_write main.tex; pdflatex factorizacion.tex; done
```
