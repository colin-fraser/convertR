# Very simple unit conversions package

This package just gives you one function: `convert`. 

## Examples

```R
> convert(100, 'lb', 'kg')
[1] 45.35924
> convert(5:10, 'kWh', 'therm')
[1] 0.1706071 0.2047285 0.2388499 0.2729713 0.3070927 0.3412141
> convert(933394, 'km', 'min')
Error in convert(933394, "km", "min") : 
  No conversion path found between units
```

## How does it work?
Inside this package is a forest. The forest looks like this
![Image of a graph]
(https://raw.githubusercontent.com/colin-fraser/convertR/master/graph.png)

Along each edge is a conversion factor. A path is drawn between the units, and the associated conversion factors multiplied together. The input is multiplied by the product of the conversion factors. That's it.

The unit symbols and conversion factors are taken from [this Wikipedia entry](https://en.wikipedia.org/wiki/Conversion_of_units#Tables_of_conversion_factors).

## Installation
At the moment, this requires the package [igraph](http://igraph.org/r/). That's okay, because that's a nice package.
Then if you have devtools you can just go ```devtools::install_github('colin-fraser/convertR')```.
