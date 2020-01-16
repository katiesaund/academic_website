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
R devel is the version of R currently under development. As of January 2020, the release version of R was 3.6.2 and the development version of R was 4.0. The development version of R is relevant to package development and submission because the package must pass the CHECK on R devel. Naive programmer that I was, I assumed my code was robust and would work on 3.5 (where it was developed), 3.6.2 (what I'm currently working with), and on 4.0. Boy, was I wrong! There is an important change to 4.0 that broke several functions and unit tests. 

ps://twitter.com/RDCrawford26) while we discussed both the elegant [Bonsai tree generator for terminal by John Allbritten](https://gitlab.com/jallbrit/bonsai.sh/tree/master) and the goofy twitter account [@emojiDNA](https://twitter.com/emojiDNA). 
  
To run the script interactively simply run `bash /path/to/emoji_dna.sh` from your terminal as in the image below.   
  
I call this creation "Put a Ring on It" ![](img/put_a_ring_on_it.png).  
  
Other goodies:  
![](img/eagle_face.png)   
![](img/trident_moon.png)  

Enjoy!
