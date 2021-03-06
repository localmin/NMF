# Non-negative Matrix Factorization(NMF)

Non-negative Matrix Factorization(NMF) by multiplicative update & Greedy Coordinate Descent(GCD) written in Octave.

## Features

You can execute NMF easily on Octave(of course MATLAB).

Using algorithm is multiplicative update rule on Euclid distance(EU), 
KL-divergence & IS(Itakura-Saito) divergence criterions.


## Background of NMF

You should read the following articles.

* NMF:
[http://www.nature.com/nature/journal/v401/n6755/abs/401788a0.html](http://www.nature.com/nature/journal/v401/n6755/abs/401788a0.html)

* Multiplicative Update: 
	- EU,KL [http://papers.nips.cc/paper/1861-algorithms-for-non-negative-matrix-factorization.pdf](http://papers.nips.cc/paper/1861-algorithms-for-non-negative-matrix-factorization.pdf)
	- others(beta-divergence) [http://ieeexplore.ieee.org/abstract/document/5589233/](http://ieeexplore.ieee.org/abstract/document/5589233/)

* Greedy Coordinate Descent(GCD) : This algorithm supports  EU only. 
	- [https://www.cs.utexas.edu/~cjhsieh/nmf_kdd11.pdf](https://www.cs.utexas.edu/~cjhsieh/nmf_kdd11.pdf)

## Usage

`./exc_nmf.m`

### Default Setting

* This default program execute a simulation by real number. If you want to deal with real data, change 
codes, for example, "parameter_setting.m", "input_data.m" etc., for your use.

* size of random non-negative observation matrix: (18,30)

* numbers of basis vectors: 4

* numbers of iterations: 200

* initial value setting method of update rules: random non-negative values

You can change these default settings on "parameter_setting.m" like the following,

```
% size of observation matrix
I = 18; J = 30; 
% number of basis vectors
K = 4; 
% iteration numbers
itr = 200; 
```

Data that you want to use can be also changed on "input_data.m"

Initial value setting can be changed on each functions, "EU.m KL.m & IS.m"

```
% random initialization
T = abs(randn( I, K ));
V = abs(randn( K, J ));
```

## Plans of additional features

- [ ] other algorithms
	- [x] GCD( on EU )
	- [ ] HALS( on EU )
	- [ ] sBCD( on KL & IS )
	- [ ] CCD ( on KL )

- [x] results visualization(ex. graph)
	- [x] error with regard to time
	- [x] final values of cost functions & relative error of NMF

- [ ] speed up
	- [ ] mex 
	- [x] brush up algorithms


This code is provided without liability and warranty.