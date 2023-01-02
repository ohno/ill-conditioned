# Ill-conditioned

Examples of ill-conditioned eigenvalue problems.

## Usage

Run following commands on WSL/Ubuntu.

```
git clone https://github.com/ohno/ill-conditioned.git
cd ill-conditioned
bash run.sh
```

GCC, [BLAS](https://netlib.org/blas/) and [LAPACK](https://netlib.org/lapack/) will be installed by `bash install.sh`. Eigenvalue problems of [Frank matrix](https://doi.org/10.1137/0106026) and [Hilbert matrix](https://doi.org/10.1007/BF02418278) will be solved by [SSYEV](https://netlib.org/lapack/explore-html/d3/d88/group__real_s_yeigen_ga63d8d12aef8f2711d711d9e6bd833e46.html) and [DSYEV](https://netlib.org/lapack/explore-html/d2/d8a/group__double_s_yeigen_ga442c43fca5493590f8f26cf42fed4044.html) by `bash run.sh`.

## Formulation

Eigenvalue problems

$$
A\lambda = \varepsilon\lambda
$$

are solved. For example, $5\times5$ [Frank matrix](https://doi.org/10.1137/0106026) is

$$
A = 
  \left[
  \begin{array}{ccccc}
  5 & 4 & 3 & 2 & 1 \\
  4 & 4 & 3 & 2 & 1 \\
  3 & 3 & 3 & 2 & 1 \\
  2 & 2 & 2 & 2 & 1 \\
  1 & 1 & 1 & 1 & 1 \\
  \end{array}
  \right],
$$

$5\times5$ [Hilbert matrix](https://doi.org/10.1007/BF02418278) is

$$
A = 
  \left[
  \begin{array}{ccccc}
  1 & \frac{1}{2} & \frac{1}{3} & \frac{1}{4} & \frac{1}{5} \\
  \frac{1}{2} & \frac{1}{3} & \frac{1}{4} & \frac{1}{5} & \frac{1}{6} \\
  \frac{1}{3} & \frac{1}{4} & \frac{1}{5} & \frac{1}{6} & \frac{1}{7} \\
  \frac{1}{4} & \frac{1}{5} & \frac{1}{6} & \frac{1}{7} & \frac{1}{8} \\
  \frac{1}{5} & \frac{1}{6} & \frac{1}{7} & \frac{1}{8} & \frac{1}{9} \\
  \end{array}
  \right].
$$

## Results

```
Frank matrix
n = 10
 SSYEV  0.255679399
 DSYEV  0.25567956279643672
n = 100
 SSYEV  0.250060558
 DSYEV  0.25006108272069305
n = 1000
 SSYEV  0.247511998
 DSYEV  0.25000061623489633
```

```
Hilbert matrix
n = 1
 SSYEV   1.00000000
 DSYEV   1.0000000000000000
n = 2
 SSYEV   6.57414496E-02
 DSYEV   6.5741454089335100E-002
n = 3
 SSYEV   2.68730382E-03
 DSYEV   2.6873403557734501E-003
n = 4
 SSYEV   9.66915541E-05
 DSYEV   9.6702304022688464E-005
n = 5
 SSYEV   3.30206194E-06
 DSYEV   3.2879287721638091E-006
n = 6
 SSYEV   7.15312751E-08
 DSYEV   1.0827994840427084E-007
```

## Reference

- W. L. Frank, Jpn J Ind Appl Math, 6, 378 (1958) https://doi.org/10.1137/0106026
- D. Hilbert, Acta Math., 18, 155 (1894) https://doi.org/10.1007/BF02418278
