---
title: "What I didn't know about R package submissions"
subtitle: []
authors: ["Katie Saund"]
tags: []
categories: []
date: "2020-01-16T00:00:00Z"
lastmod: "2020-01-16T00:00:00Z"
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal point options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
image: []

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

# R Package Submission to CRAN
I just submitted an R package, [prewas](https://github.com/Snitkin-Lab-Umich/prewas), that I wrote with my colleagues Zena and Stephanie. The whole process took many more hours than I had anticipated. This post details all of the snags I ran into and the fixes. Hopefully, this will help other package newbies!  

### General resources:
There are many resources that spell most of what you need to know to submit a package. My two favorites were (1) [R Packages by Hadley Wickham](http://r-pkgs.had.co.nz/release.html#release-check) and the much more compact version by [Karl Broman](https://kbroman.org/pkg_primer/pages/cran.html).

What follows are the issues that I ran into that these two resources didn't address.

## Issue 1: Working on R devel
R devel is the version of R currently under development. As of January 2020, the release version of R was 3.6.2 and the development version of R was 4.0. The development version of R is relevant to package development and submission because the package must pass the CHECK on R devel without ERRORs or WARNINGs. Naive programmer that I was, I assumed my code was robust and would work on 3.5 (where it was developed), 3.6.2 (what I'm currently working with), and on 4.0. Boy, was I wrong! 

### 1A) How to know if you code passes CHECK on R devel
I used `devtools::check_win_devel()` to test if my package passed the `CHECK` on R devel. This function tests the package on a windows server and emails you the results in ~15-30 minutes. I got my results back and learned that I had something like ~30 failed unit tests on 4.0 despite a perfect record on 3.6.2. Finding this out left me with the big question: "What do I do now?"

### CONTINUE WITH THE 1B - 1E IF YOUR CODE DIDN'T PASS CHECK ON R DEVEL
### 1B) Getting R devel on my mac
I installed R devel on my mac (and reinstalled R release for good measure so I'd know they both go to the same location):

* [Download devel and current release tarballs](http://mac.r-project.org/)
* Once they’re both downloaded, on the command line: 
```
> cd /
> tar -xvzf /path/to/R-release-name.tar.gz 
> tar -xvzf /path/to/R-devel-name.tar.gz
```

### 1C) Switching between R devel and R release
To access both R versions in RStudio and switch between them with ease I used the AMAZING program RSwitch.

* [Download RSwitch](https://rud.is/rswitch/)
* Use RSwitch to open RStudio -- and use it to select R devel. 

### 1D) Getting packages installed on R devel
Install your package's dependencies. While most CRAN packages should install with no trouble on R devel, but I ran into several problems: 

* Using the wrong install.packages() type
* Packages that depended on fortran/C/C++ (ex: `ape`)
* Packages that didn't pass `CHECK` on R devel

The most robust way to install R packages on R devel is `install.packages("package_name", type = "both")` because it looks for either source or binary installations (some packages only have one). Adding `type = "both"` saved me some trouble.

Packages that depended on fortran/C/C++:
I had to install fortran and Xcode on my mac.   
Xcode is available to download from the Apple store. Once it was installed I ran ``` sudo xcodebuild -license``` in terminal. 
[Fortran is available to download](https://github.com/fxcoudert/gfortran-for-macOS/releases)


Packages that don't pass `CHECK` on R devel:  
For the package prewas() depended on that didn't pass CHECK on R devel I simply rewrote my package's code so as to no longer depend on the bum package. It was very lucky for me that I could do this in <10 minutes.

### 1E) Resolving test failures in R devel 
The errors were caused by a change to 4.0 that broke several functions and unit tests.

In 4.0 you cannot use: 
```
if (class(r_object) == "class_name")  {}
```
Instead you should use 
```
if (methods::is(r_object, "class_name")  {}
```
[This is a wonderful post](https://developer.r-project.org/Blog/public/2019/11/09/when-you-think-class.-think-again/index.html) that brought this to my attention and explains the why behind the change. 

