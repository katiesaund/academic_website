+++
title = "Test: 2nd test"
subtitle = ""

date = 2018-12-04T00:00:00
lastmod = 2018-12-04T00:00:00
draft = false

# Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
authors = ["Katie Saund"]

tags = ["RStats"]
summary = ""

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["deep-learning"]` references 
#   `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
# projects = ["internal-project"]

# Featured image
# To use, add an image named `featured.jpg/png` to your project's folder. 
#[image]
  # Caption (optional)
#  caption = "Image credit: [**Unsplash**](https://unsplash.com/photos/CpkOjOcXdUY)"

  # Focal point (optional)
  # Options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
#  focal_point = ""

  # Show image only in page previews?
#  preview_only = false

# Set captions for image.

+++

## Adding R code: example

```{r, eval=TRUE}
require(ggplot2)
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  geom_smooth(method = "lm") + 
  scale_color_manual(values = c("#3B9AB2", "#E4B80E", "#F21A00"))
```

```{r, message = FALSE, eval = TRUE}
# LIBRARIES -------------------------------------------------------------------#
library(tidyverse)
library(tidytext)
library(lubridate)
```

```{r, eval = TRUE}
# IMPORT DATA -----------------------------------------------------------------#
raw_metadata <- read_csv(file ="medium_datasci.csv", quote='"')
nrow(raw_metadata)
```
