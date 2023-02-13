# stf

helpers for calculating probabilities related to Star Traders: Frontiers

Run this once:

```r
if (!require("devtools")) install.packages("devtools")
devtools::install_github("daviddalpiaz/stf")
```

To run the application, run this:

```r
stf::runSTF()
```

To simulate a battle, use:

```r
stf::simBattle(
  a_ns = 100,
  a_nw = 100, 
  a_multi = 1, 
  d_ns = 100, 
  d_nw = 100, 
  d_multi = 1
)
```

For battle simulation documentation, use:

```r
?stf::simBattle
```
