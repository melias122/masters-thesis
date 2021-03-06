#!/bin/bash

plot() {
    # settings
    i=$1
    j=$2
    lines="smooth csplines"
    data="data/ga/${i}_$j"

    cat << EOF > includes/plot/${i}_${j}.tex
\begin{figure}[!htbp]
\def\svgwidth{\columnwidth}
\centering
\begin{gnuplot}[terminal=pdf,terminaloptions=color]
set terminal pdf enhanced size 15cm, 9cm
set xrange [0:2000]
set yrange [0:1]

set key samplen 3 spacing 1 font ',10' left title 'Schéma'

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
\caption{Závislosť úspešnosti lúštenia od dĺžky ZT (${i} iterácií, ${j} jedincov)}
\label{schema:ga_${i}_${j}}
\end{figure}
EOF
}

plot2() {
    i=$1
    lines="smooth csplines"
    #data="data/${i}_${j}"

    cat << EOF > includes/plot/${i}.tex
\begin{figure}[!htbp]
\centering
\begin{gnuplot}[terminal=pdf,terminaloptions=color]
set terminal pdf enhanced size 15cm, 9cm
set xrange [0:2000]
set yrange [0:1]

set key samplen 3 spacing 1 font ',10' left title 'Počet iterácií/veľkosť populácie'

set xlabel "Počet znakov zašifrovaného textu"
set ylabel "Úspešnosť schémy (%)"

plot "data/ga/10000_10_${i}" $lines dt 1 title '10k/10', \\
     "data/ga/10000_20_${i}" $lines dt 2 title '10k/20', \\
     "data/ga/10000_50_${i}" $lines dt 3 title '10k/50', \\
     "data/ga/10000_100_${i}" $lines dt 4 title '10k/100', \\
     "data/ga/50000_10_${i}" $lines dt 5 title '50k/10', \\
     "data/ga/50000_20_${i}" $lines dt 1 title '50k/20', \\
     "data/ga/50000_50_${i}" $lines dt 2 title '50k/50', \\
     "data/ga/50000_100_${i}" $lines dt 3 title '50k/100'

\end{gnuplot}
\caption{Závislosť úspešnosti lúštenia od dĺžky ZT (schéma ${i})}
\label{schema:ga_${i}}
\end{figure}
EOF
}

# schemy a migracne casy
plot3() {

	local vp=$1 # velkost populacie
	local top=$2 # velkost topologie
	local vt=$3 # topologia
	
	x="${vp}_${top}_${vt}"
    local lines="smooth csplines"
    local c="data/pga/C_${x}"
	local j="data/pga/J_${x}"
	local e="data/pga/E_${x}"

	# echo "$x"
	
    cat << EOF > includes/plot/CJ_${x}.tex
\begin{figure}[!htbp]
\centering
\begin{gnuplot}[terminal=pdf,terminaloptions=color]
set terminal pdf enhanced size 15cm, 9cm
set xrange [0:2000]
set yrange [0:1]

set key samplen 3 spacing 1 font ',10' right bottom title 'Schéma/migračný čas'

set xlabel "Počet znakov zašifrovaného textu"
set ylabel "Úspešnosť (%)"

plot "${c}_1000.data" $lines dt 1 title 'C/1k', \\
     "${c}_5000.data" $lines dt 2 title 'C/5k', \\
     "${c}_10000.data" $lines dt 3 title 'C/10k', \\
     "${j}_1000.data" $lines dt 4 title 'J/1k', \\
     "${j}_5000.data" $lines dt 5 title 'J/5k', \\
     "${j}_10000.data" $lines dt 1 title 'J/10k', \\
	 "${e}_1000.data" $lines dt 2 title 'E/1k', \\
     "${e}_5000.data" $lines dt 3 title 'E/5k', \\
     "${e}_10000.data" $lines dt 4 title 'E/10k'
	 

\end{gnuplot}
\caption{Závislosť úspešnosti lúštenia od dĺžky ZT (topológia ${top}/${vt}, ${vp} jedincov)}
\label{schema:cj_${x}}
\end{figure}
EOF
	
}

for i in 10000 50000; do
    for j in 10 20 50 100; do
	plot $i $j
    done
done

for j in A B C D E F G H I J; do
    plot2 $j
done

for i in 10 20 50 100; do
	for j in b d e f; do
		for k in 3 5 11; do
			# J,C 1000,5000,10000
			plot3 $i $j $k
		done
	done
done
