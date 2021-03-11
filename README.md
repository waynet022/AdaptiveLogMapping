## Description

Based on the paper [*Adaptive Logarithmic Mapping For Displaying High
Contrast Scenes*](http://resources.mpi-inf.mpg.de/tmo/logmap/logmap.pdf)

The algorithm is used for computer displays to accurately output lighting information when compared to the human visual system.
#### Original(left) vs Adapted(right)
| [![Original](images/sample_outputs/sp5_og.png)](images/sample_outputs/sp5_og.png) |  [![Bias=0.75](images/sample_outputs/sp5_b75.png)](images/sample_outputs/sp5_b75.png) |
|---|---|

Notice the shadow sections on the bottom left and right corners are dark in the original image. On the adapted image, with bias value of 0.75, the bottom corners' mural decorations have better lighting and are more distinguished compared to the original. 
