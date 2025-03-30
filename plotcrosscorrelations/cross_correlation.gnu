set terminal cairolatex size 3.5,2
set key left
set xlabel '$r$'
set ylabel '$G_{1,2}(r)$'

#################################
set style line 11 lc rgb '#808080' lt 1
set border 1 back ls 11
set tics nomirror
set key right top
#######################################

set arrow 1 from 0,-0.2 to 0,0.2 nohead
set arrow 2 from 0,0.25 to 0,0.7 nohead

set arrow 5 from -1,0.175 to 1,0.225 nohead
set arrow 6 from -1,0.225 to 1,0.275 nohead

set output '../../xcor.tex'

set ytics ("-0.1" -0.2,"-0.05" -0.1, "0" 0, "0.05" 0.1 , "0.2" 0.3, "0.4" 0.4, "0.6" 0.5,"0.8" 0.6, "1" 0.7)
set xrange [0:20]
set yrange [:1-0.3]
pl \
'cofi14n1_t_134217728_nl_4096_nsl_2048_nsl2_2048_beta_-200000_gam_-100000_beta2_-200000_gam2_100000.dat' u 1:($3<0.1 ? $3*2 : $3>0.2 ? ($3/2+0.2) : 1/0)  pt 9 lc rgb "orange" title "$\\{-,-,-,+\\}$",\
'cofi14n1_t_134217728_nl_4096_nsl_2048_nsl2_2048_beta_200000_gam_-100000_beta2_-200000_gam2_100000.dat' u 1:($3<0.1 ? $3*2 : $3>0.2 ? ($3/2+0.2) : 1/0)  pt 19 lc rgb "black" title "$\\{+,-,-,+\\}$", \
'cofi14n1_t_134217728_nl_4096_nsl_2048_nsl2_2048_beta_200000_gam_100000_beta2_-200000_gam2_100000.dat' u 1:($3<0.1 ? $3*2 : $3>0.2 ? ($3/2+0.2) : 1/0) pt 13 lc rgb "dark-green" title "$\\{+,+,-,+\\}$", \
'cofi14n1_t_134217728_nl_4096_nsl_2048_nsl2_2048_beta_200000_gam_100000_beta2_-200000_gam2_-100000.dat' u 1:($3<0.1 ? $3*2 : $3>0.2 ? ($3/2+0.2)  : 1/0) pt 15  lc rgb "dark-red" title "$\\{+,+,-,-\\}$"

unset output