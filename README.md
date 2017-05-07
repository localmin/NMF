# Non-negative Matrix Factorization(NMF)

Non-negative Matrix Factorization(NMF) by multiplicative update on Octave.

## Features

You can execute NMF easily on Octave(of course MATLAB).

Using algorithm is multiplicative update rule on Euclid distance(EU), 
KL-divergence & IS(Itakura-Saito) divergence criteirions.


## Background of NMF

You should read the following ariticles.

* NMF:
[http://www.nature.com/nature/journal/v401/n6755/abs/401788a0.html](http://www.nature.com/nature/journal/v401/n6755/abs/401788a0.html)

* Multiplicative Update: 
	- EU,KL [http://papers.nips.cc/paper/1861-algorithms-for-non-negative-matrix-factorization.pdf](http://papers.nips.cc/paper/1861-algorithms-for-non-negative-matrix-factorization.pdf)
	- others(beta-divergence) [http://ieeexplore.ieee.org/abstract/document/5589233/](http://ieeexplore.ieee.org/abstract/document/5589233/)


## Usage

`./exc_nmf.m`

### Default Setting

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

## Plans of addtional features

- [ ] other alogorithms
	- [ ] GCD( on EU )
	- [ ] HALS( on EU )
	- [ ] sBCD( on KL & IS )
	- [ ] CCD ( on KL )

- [ ] results visualization(ex. graph)
	- [x] error with regard to time
	- [x] final values of cost functions & relative error of NMF
	- [ ] Spectrogram of observation, basis &  activation matrix

- [ ] speed up
	- [ ] mex 
	- [ ] brush up alogorithms