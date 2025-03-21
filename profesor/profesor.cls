\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{profesor}[2025/02/15 Clase personalizada para documentos de matemáticas]

% Cargar la clase base
\LoadClass[a4paper,12pt]{article}

% Paquetes necesarios
\RequirePackage[utf8]{inputenc}
\RequirePackage{amsmath, amssymb}
\RequirePackage{graphicx}  % Para imágenes si es necesario
\RequirePackage{hyperref}  % Para hipervínculos

% Definimos información del profesor
\newcommand{\profesor}{Christian Bueno}
\newcommand{\titulo}{Desarrollador de Software}
\newcommand{\fecha}{15 de febrero del 2025}
\newcommand{\contacto}{+593 99 028 8710}
\newcommand{\lugar}{Guayaquil, Ecuador}
\newcommand{\web}{\href{https://christianbueno.me}{christianbueno.me}}

% Definir título del documento
\renewcommand{\maketitle}{
    \begin{center}
        {\LARGE \bfseries \@title} \\[1em]
        {\large \profesor} \\[0.5em]
        {\small \titulo} \\[0.5em]
        {\small \fecha} \\[0.5em]
        {\small \contacto} \\[0.5em]
        {\small \lugar} \\[0.5em]
        {\small \web}
    \end{center}
    \vspace{1cm}
}
