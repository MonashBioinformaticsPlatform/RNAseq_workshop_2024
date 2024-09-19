# Build the bookdown

> All commits to the `main` branch on Github automatically trigger a bookdown build and deployment to Pages automatically - you only need to do the steps below to render the HTML locally. The rendered pages can be found on the `gh-pages` branch.

## install bookdown

```
install.packages("renv")
renv::restore()

# alternatively
# install.packages(c("bookdown", "downlit", "xml2"))
```


## open project

open the .Rproj file and in the history panel of Rstudio you will see the ```build``` tab. ```Build Book``` from there.

Or, on the command line run:
```
./build.sh
```

Alternatively, in the R console run:
```
bookdown::render_book("index.Rmd")
```

# Add boxes in your pages

write your code in a block assigning any style described in style.css file. The options available are ``rationale`` or ``challenge`` but you can add any other style you want. Write your code as follow

```

#### Why do we need to do this?  {- .rationale}

Clustering the cells will allow you to visualise the variability of your data, can help to segregate cells into cell types.   

####  {-}
```