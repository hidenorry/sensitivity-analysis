#!/home/miyamoto/gnuplot/bin/gnuplot

set size ratio 1 1
set key spacing 3
set key bottom right font "Arial, 24"

set tics font "Arial, 25"

set xlabel "\n{/Arial-Bold=30 {/Arial-Bold-Italic {/Symbol D}}Parameter [%]}"
set ylabel "{/Arial-Bold=30 {/Arial-Bold-Italic {/Symbol-Bold-Italic D} V}_{th} [%]}"

set xrange[-10:10]
set yrange[-10:10]


    center=0.29406480486158854
    filename="sensitivity_vth_short50n"
      plot "data5.dat" using (100*($1-1)):(100*($2-center)/center) every :::0::0 w l  t "TOX"
    replot "data5.dat" using (100*($1-1)):(100*($2-center)/center) every :::1::1 w l  t "NSUBC"
    replot "data5.dat" using (100*($1-1)):(100*($2-center)/center) every :::2::2 w l  t "NSUBP"
    replot "data5.dat" using (100*($1-1)):(100*($2-center)/center) every :::3::3 w l  t "XLD"
    replot "data5.dat" using (100*($1-1)):(100*($2-center)/center) every :::4::4 w l  t "MUESR1"
    replot "data5.dat" using (100*($1-1)):(100*($2-center)/center) every :::5::5 w l  t "MUECB0"

# if ( 0 == 0 ) {
#     center=0.4559400258707843
#     filename="sensitivity_vth_short80n"
#       plot "data3.dat" using (100*($1-1)):(100*($2-center)/center) every :::0::0 w l  t "TOX"
#     replot "data3.dat" using (100*($1-1)):(100*($2-center)/center) every :::1::1 w l  t "NSUBC"
#     replot "data3.dat" using (100*($1-1)):(100*($2-center)/center) every :::2::2 w l  t "NSUBP"
#     replot "data3.dat" using (100*($1-1)):(100*($2-center)/center) every :::3::3 w l  t "XLD"
#     replot "data3.dat" using (100*($1-1)):(100*($2-center)/center) every :::4::4 w l  t "MUESR1"
#     replot "data3.dat" using (100*($1-1)):(100*($2-center)/center) every :::5::5 w l  t "MUECB0"
# }else{
#     center=0.3967479594219486
#     filename="sensitivity_vth_short60n"
#       plot "data4.dat" using (100*($1-1)):(100*($2-center)/center) every :::0::0 w l  t "TOX"
#     replot "data4.dat" using (100*($1-1)):(100*($2-center)/center) every :::1::1 w l  t "NSUBC"
#     replot "data4.dat" using (100*($1-1)):(100*($2-center)/center) every :::2::2 w l  t "NSUBP"
#     replot "data4.dat" using (100*($1-1)):(100*($2-center)/center) every :::3::3 w l  t "XLD"
#     replot "data4.dat" using (100*($1-1)):(100*($2-center)/center) every :::4::4 w l  t "MUESR1"
#     replot "data4.dat" using (100*($1-1)):(100*($2-center)/center) every :::5::5 w l  t "MUECB0"
# }

# if ( 0 == 1 ) {
#     center=0.3731766029521245
#     filename="sensitivity_vth_long"    
#     plot "data1.dat" using (100*($1-1)):(100*($2-center)/center) every :::0::0 w l  t "TOX"
#     replot "data1.dat" using (100*($1-1)):(100*($2-center)/center) every :::1::1 w l  t "NSUBC"
#     replot "data1.dat" using (100*($1-1)):(100*($2-center)/center) every :::2::2 w l  t "NSUBP"
#     replot "data1.dat" using (100*($1-1)):(100*($2-center)/center) every :::3::3 w l  t "XLD"
#     replot "data1.dat" using (100*($1-1)):(100*($2-center)/center) every :::4::4 w l  t "MUESR1"
#     replot "data1.dat" using (100*($1-1)):(100*($2-center)/center) every :::5::5 w l  t "MUECB0"
# }else{
#     center=0.4652059508779029
#     filename="sensitivity_vth_short"
#     plot "data2.dat" using (100*($1-1)):(100*($2-center)/center) every :::0::0 w l  t "TOX"
#     replot "data2.dat" using (100*($1-1)):(100*($2-center)/center) every :::1::1 w l  t "NSUBC"
#     replot "data2.dat" using (100*($1-1)):(100*($2-center)/center) every :::2::2 w l  t "NSUBP"
#     replot "data2.dat" using (100*($1-1)):(100*($2-center)/center) every :::3::3 w l  t "XLD"
#     replot "data2.dat" using (100*($1-1)):(100*($2-center)/center) every :::4::4 w l  t "MUESR1"
#     replot "data2.dat" using (100*($1-1)):(100*($2-center)/center) every :::5::5 w l  t "MUECB0"
# }


set terminal postscript eps enhanced color
filename_eps=sprintf("%s.eps", filename)
set output filename_eps

replot

system(sprintf("eps2png.sh %s", filename_eps))

filename_png=sprintf("%s.png", filename)
comm=sprintf("display %s", filename_png)
system(comm)


replot

