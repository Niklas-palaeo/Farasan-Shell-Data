Shellfish Resilience to Prehistoric Human consumption in the southern Red Sea
=============================================================================

This compendium contains the code and data to reproduce some of the figures and statistical data discussed in the article:

Hausmann, N., Meredith-Williams, M., and Laurie, E. (2020) [_Shellfish resilience to prehistoric human consumption in the southern Red Sea: Variability in_ Conomurex fasciatus _across time and space_](https://www.sciencedirect.com/science/article/abs/pii/S1040618220301981) _Quaternary international_.

The data itself is citeable using this [![ DOI](https://zenodo.org/badge/248758954.svg)](https://zenodo.org/badge/latestdoi/248758954)


How to run
------------------------

I suggest to run the code by downloading the entire repository and executing the steps within the .Rmd files in the "code" folder on your own PC. If you don’t want to run anything yourself, or if there is an error, you can see the finished figures in the “Figures and supplementary Material” folder and the individual tutorials that explain how to create them in the “Walkthrough” folder.

Walkthroughs
------------

This repository was created in a rush and by an R enthusiast, rather than an R expert. Some of the solutions that I have found are not straightforward and not the easiest way of doing things. So the walkthroughs shall only explain how I ended up doing the things, that I did for the paper, and to show what worked for me. Not how you should do things.

Farasan Shell Database
----------------------

Finally this dataset is a means to make the results of the malacological analysis of the Farasan shell middens more accessible. It is a rough format that needs tidying up, but there are lots of datasets in here, which remain unstudied. You can access the raw data either through the .csv files in "data/Raw Exports" or by using the `Farasan Database.R` file, which includes the same data as lists and which is described in more detail in `6. Farasan Database.Rmd`.  
Feel free to have a look around and please get in touch if you have any questions or ideas.

Niklas (niklas@palaeo.eu)
