clear
set seed 123
set obs 100
gen G = mod(_n-1, 25) + 1
bys G: gen T = _n
sum T
gen D = uniform() > 0.5 & T == r(max)
gen Y = uniform() * (1 + D)

qui do "C:/Users/39380/C DE CHAISEMARTIN Dropbox/RAs De Chaisemartin/RAs Really Credible DID-TWFE/GitHub repo - local/did_multiplegt_dyn/Stata/did_multiplegt_dyn.ado"
qui do "C:/Users/39380/C DE CHAISEMARTIN Dropbox/RAs De Chaisemartin/RAs Really Credible DID-TWFE/GitHub repo - local/did_multiplegt_dyn/Stata/did_multiplegt_dyn_all_pl.ado"

est clear
did_multiplegt_dyn Y G T D, effects(1) placebo(1) graph_off
eststo
did_multiplegt_dyn_all_pl Y G T D, effects(1) placebo(2) 
eststo

esttab, order(Effect_* Placebo_* Av_*) se html