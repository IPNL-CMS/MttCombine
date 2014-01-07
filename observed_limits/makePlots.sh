#! /bin/bash

for m in 500 625 750 1000 1250 1500 2000; do
  root -l -b -q -n interval_plot_${m}.root makeBeautifulPlot.cc
  mv posterior_plot.pdf posterior_plot_${m}.pdf
done
