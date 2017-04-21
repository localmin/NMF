# Non-negative Matrix Factorization(NMF)

Non-negative Matrix Factorization(NMF) by multiplicative update on Octave.

## Features

You can execute NMF easily on Octave(of course MATLAB).

Using algorithm is multiplicative update rule on Euclid distance(EU), 
KL-divergence & IS(Itakura-Saito) divergence criteirions.


## Background of NMF

You should read the following ariticles.

* NMF:
[http://www.nature.com/nature/journal/v401/n6755/abs/401788a0.html]()

* Multiplicative Update: 
	- EU,KL [http://papers.nips.cc/paper/1861-algorithms-for-non-negative-matrix-factorization.pdf]()
	- others(beta-divergence) [http://ieeexplore.ieee.org/abstract/document/5589233/]()


## Usage

`./exc_all.m`

### Default Setting

* size of random non-negative observation matrix: (18,30)

* numbers of basis vectors: 4

* numbers of iterations: 200

* initial value setting method of update rules: random non-negative values

You can change these default setting on "exc_all.m"

```
% parameter setting
I = 18; J = 30; % size of observation matrix
K = 4; % number of basis vectors
itr = 200; % iteration numbers

% make random non-negative observation matrix
X = rand( I, J );
```

Initial value setting can be changed on each functions, "EU.m KL.m & IS.m"

```
% random initialization
T = rand( I, K );
V = rand( K, J );
```

## Plans of addtional features

- [ ] other alogorithms
	- [ ] GCD( on EU )
	- [ ] HALS( on EU )
	- [ ] sBCD( on KL & IS )
	- [ ] CCD ( on KL )

- [ ] results visualization(ex. graph)
	- [ ] error with regard to time
	- [ ] final values of cost functions
	- [ ] Spectrogram of observation, basis &  activation matrix

- [ ] speed up
	- [ ] mex 
	- [ ] brush up alogorithms(ex. using inner product)