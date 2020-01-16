---
title: "Solving Issues to Submit Your R Package to CRAN"
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
I just submitted an R package, [prewas](https://github.com/Snitkin-Lab-Umich/prewas), that I wrote with my colleagues Zena and Stephanie. The whole process took many more hours than I had anticipated. This post details the snags I ran into and their fixes. Hopefully, this will help other package submission newbies!  

### General resources:
There are many resources that spell most of what you need to know to submit a package. My two favorites were [R Packages by Hadley Wickham](http://r-pkgs.had.co.nz/release.html#release-check) and a more compact version by [Karl Broman](https://kbroman.org/pkg_primer/pages/cran.html).

What follows are the issues that I ran into that these two resources didn't address.

# Issue 1: Working on R devel
R devel is the version of R currently under development. In January 2020, the release version of R was 3.6.2 and the development version of R was 4.0. The development version of R is relevant to package development and submission because the package must pass the `CHECK` on R devel without `ERRORs` or `WARNINGs`. Naive R programmer that I was, I assumed my code was robust and would therefore work on 3.5 (where it was developed), 3.6.2 (what I'm currently working with), and on 4.0. Boy, was I wrong! 

### 1A) How to know if you code passes CHECK on R devel
I used `devtools::check_win_devel()` to test if my package passed the `CHECK` on R devel. This function tests the package on a windows server and emails you the results in ~15-30 minutes. I got my results back and learned that I had something like ~30 failed unit tests on 4.0 despite a perfect record on 3.6.2. Finding this out left me with the big question: "What do I do now?" I decided to download 4.0 and troubleshoot on my local computer because I coudln't make sense of the `CHECK` results.  

Skip to 2) if your code passed `CHECK` on R devel  
  
### 1B) Getting R devel on my mac
I installed R devel on my mac (and reinstalled R release for good measure so I'd know they both go to the same location):

* [Download devel and current release tarballs](http://mac.r-project.org/)
* Install them from the terminal  

```
> cd /  
> tar -xvzf /path/to/R-release-name.tar.gz  
> tar -xvzf /path/to/R-devel-name.tar.gz  
```
  
### 1C) Switching between R devel and R release
To access both R versions in RStudio and switch between them with ease I used the AMAZING program RSwitch.

* [Download RSwitch](https://rud.is/rswitch/)
* Use RSwitch to open RStudio and use it to select R devel. 

### 1D) Getting packages installed on R devel
Install your package's dependencies. While most CRAN packages should install with no trouble on R devel, but I ran into several problems: 

* Using the wrong install.packages() type  
* Packages that depended on fortran/C/C++ (ex: `ape`)  
* Packages that didn't pass `CHECK` on R devel  
 
Using the wrong install.packages() type:  
The most robust way to install R packages on R devel is 
```
install.packages("package_name", type = "both")  
``` 
because it looks for either source or binary installations (some packages only have one).  
  
Packages that depended on fortran/C/C++:  
I had to install fortran and Xcode on my mac: 

* Xcode is available to download from the Apple store. Once it was installed I ran 
``` 
sudo xcodebuild -license  
``` 
in terminal. 
* [Fortran is available to download](https://github.com/fxcoudert/gfortran-for-macOS/releases)


Packages that don't pass `CHECK` on R devel:   
For prewas() dependencies that didn't pass `CHECK` on R devel I simply rewrote my package's code so as to no longer depend on the bum packages. Luckily for me, the changes were minor and I was done in less than ten minutes.  

### 1E) Resolving my test failures in R devel 
The errors in my package were caused by a change to 4.0 that broke several functions and unit tests.

In 4.0 you cannot use
```
if (class(r_object) == "class_name")  {}
```
Instead you should use 
```
if (methods::is(r_object, "class_name")  {}
```
[This wonderful post](https://developer.r-project.org/Blog/public/2019/11/09/when-you-think-class.-think-again/index.html)  brought this issue to my attention and explains the why behind the change. You can also check the [R news](https://stat.ethz.ch/R-manual/R-devel/doc/html/NEWS.html) to learn about changes occuring in R devel. 

Once I updated my class checking code I had just a couple minor unit test tweaks to make to get my code to pass `CHECK` on both R release and R devel. 
# Issue 2: Git 
At that point I tried to submit to CRAN with 
``` 
devtools::release()
```
but was foiled again, this time by git issues. I got the following error message
```
ERROR: Error in 'git2r_remote_fetch': unsupported URL protocol
```
To solve this problem I updated my authentication method.
### 2A) Getting a personal access token (PAT)
There are three ways to authenticate with git: 

1. ssh  
2. https + username + password
3. https + PAT 

I've loved using ssh, but `devtools::release()` wasn't playing nicely with ssh so I switched to https + PAT. To generate a PAT I used 
```
usethis::browse_github_token()  
```
which took me to github where I generated the token. I immediately saved the token in two locations: my password manager and my .Renviron. To edit the .Renviron:  
```
usethis::edit_r_environ()  
``` 
which opens the .Renviron file and I copied in  
```
GITHUB_PAT=my_really_long_numerical_token  

``` 
Notice that there is a empty new line in the file- I'm told this is necessary. Then I restarted R and checked that the PAT saved  
```
Sys.getenv("GITHUB_PAT") . 
``` 
### 2B) Switching from ssh to https + PAT  
I also changed from ssh to https on the terminal. This is what it looks like when you're set up with ssh:  
```
$ git remote -v  
> origin  git@github.com:user/repo.git (fetch)  
> origin  git@github.com:user/repo.git (push)  
```
To change to https:  
```
$ git remote set-url origin https://github.com/user/repo.git  
```
Then check that it worked:  
```
$ git remote -v  
> origin  https://github.com/user/repo.git (fetch)  
> origin  https://github.com/user/repo.git (push)  
```
After I made those two changes I could pass the github section of `devtools::release()`.   
  
Good luck on your package submission!  



