#!/bin/bash -le 


gmx wham -v -it custom_wham_tpr_files.dat -if pullf-files.dat -b 1000 -bins 200 -temp 303.15 -cycl -bs-method b-hist -nBootstrap 200 -bsres bs_error.xvg -min X -max Y
