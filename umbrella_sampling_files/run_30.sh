#!/bin/bash -le 

GMX_MAXBACKUP=-1

gmx grompp -f min.mdp -o NH3_min_30.tpr -c NH3_umb_30.pdb -po mdout_min_30.mdp -p topol.top -n index.ndx
gmx mdrun -v -deffnm NH3_min_30 -cpt 5 -nt 10 -gpu_id 0 -tunepme
gmx grompp -f eq.mdp -o NH3_eq_30.tpr -c NH3_min_30.gro -po mdout_eq_30.mdp -p topol.top -n index.ndx
gmx mdrun -v -deffnm NH3_eq_30 -cpt 5 -nt 10 -gpu_id 0 -tunepme
gmx grompp -f umbrella.mdp -o NH3_umb_30.tpr -c NH3_eq_30.gro -po mdout_umb_30.mdp -p topol.top -n index.ndx
gmx mdrun -v -deffnm NH3_umb_30 -cpt 5 -nt 10 -gpu_id 0 -tunepme
