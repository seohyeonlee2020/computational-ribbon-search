# Ribbon Link Identification

A computational tool for automating the identification of ribbon links using topological invariants and obstruction theory. This project systematically analyzes links up to 14 crossings to identify potential ribbon links from the KnotInfo and LinkInfo databases.
## Overview
This project automates the process of identifying ribbon links by applying a series of mathematical obstructions and topological invariants. The analysis covers:

 - Data up to 11 crossings: Sourced from the LinkInfo database
 - Data for 12-14 crossings: Extracted from SnapPy objects
 - Systematic filtering: Using multiple mathematical criteria to identify potential ribbon links

## Mathematical Background
### What are Ribbon Links?
Ribbon links are a special type of links that bounds a disk that crashes through itself. 

### Obstructions Used
The project employs six key mathematical obstructions to filter potential ribbon links:

 - Alexander Polynomial: Must equal zero
 - Linking Matrix: Must consist entirely of zeros
 - Jones Polynomial Factorization: Must be factorable by the Jones polynomial of the unlink with the same number of components
 - Jones Determinant Congruence (mod 8): Must be equivalent to 1 modulo 8
 - Jones Determinant Congruence (mod 32): Must equal the product of component determinants modulo 32
 - Fox-Milnor Condition: Must satisfy the classical Fox-Milnor obstruction

## References
'Bounding The Ribbon Numbers of Knots and Links', Stefan Friedl, Filip Misev, Alexander Zupan.
'The Jones polynomial of Ribbon Links', Michael Eisermann

## Please cite this repo as:
See citations.cff



