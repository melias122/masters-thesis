#!/bin/bash

plot() {
    
    # plot "10000_50_H" smooth bezier, "10000_50_H" smooth csplines, "10000_50_H" w linespoints

    # settings
    i=$1
    j=$2
    lines="smooth csplines"
    data="data/${i}_$j"

    cat << EOF > includes/plot/${i}_${j}.tex
\begin{figure}[!ht]
\def\svgwidth{\columnwidth}
\centering
\begin{gnuplot}[terminal=pdf,terminaloptions=color]
set terminal pdf enhanced size 16cm, 10cm
set xrange [0:2000]
set yrange [0:1]

set key samplen 3 spacing 1 font ',10' left title 'Schema'

set xlabel "Počet znakov zašifrovaného textu"
set ylabel "Úspešnosť schémy (%)"

plot "${data}_A" $lines dt 1 title 'A', \\
     "${data}_B" $lines dt 2 title 'B', \\
     "${data}_C" $lines dt 3 title 'C', \\
     "${data}_D" $lines dt 4 title 'D', \\
     "${data}_E" $lines dt 5 title 'E', \\
     "${data}_F" $lines dt 1 title 'F', \\
     "${data}_G" $lines dt 2 title 'G', \\
     "${data}_H" $lines dt 3 title 'H', \\
     "${data}_I" $lines dt 4 title 'I', \\
     "${data}_J" $lines dt 5 title 'J'

\end{gnuplot}
\caption{Počet iterácii: ${i}, počiatočná populácia: ${j}}
\label{schema:ga_${i}_${j}}
\end{figure}
EOF
}

plot2() {
    i=$1
    lines="smooth csplines"
    #data="data/${i}_${j}"

    cat << EOF > includes/plot/${i}.tex
\begin{figure}[!ht]
\centering
\begin{gnuplot}[terminal=pdf,terminaloptions=color]
set terminal pdf enhanced size 15cm, 8cm
set xrange [0:2000]
set yrange [0:1]

set key samplen 3 spacing 1 font ',10' left title 'Počet iterácii/Veľkosť populácie'

set xlabel "Počet znakov zašifrovaného textu"
set ylabel "Úspešnosť schémy (%)"

plot "data/10000_10_${i}" $lines dt 1 title '10000/10', \\
     "data/10000_20_${i}" $lines dt 2 title '10000/20', \\
     "data/10000_50_${i}" $lines dt 3 title '10000/50', \\
     "data/10000_100_${i}" $lines dt 4 title '10000/100', \\
     "data/50000_10_${i}" $lines dt 5 title '50000/10', \\
     "data/50000_20_${i}" $lines dt 1 title '50000/20', \\
     "data/50000_50_${i}" $lines dt 2 title '50000/50', \\
     "data/50000_100_${i}" $lines dt 3 title '50000/100'

\end{gnuplot}
\caption{Schéma: ${i}}
\label{schema:ga_${i}}
\end{figure}
EOF
}

for i in 10000 50000; do
    for j in 10 20 50 100; do
	plot $i $j
    done
done

#for i in 10000 50000; do
for j in A B C D E F G H I J; do
    plot2 $j
done
#done
