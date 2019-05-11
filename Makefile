################
# Example Makefile
# Joseph Powers
################

# List all targets under all
.PHONY : all
all : reports/500.html reports/500.md reports/final_output.jpeg \
data/ds_small.rds data/ds_mt.rds

# Output a report
reports/500.html : analysis/500.Rmd data/ds_small.rds
	R -e "rmarkdown::render('analysis/500.Rmd')"
	mv analysis/500.html reports
	# __Try to use $^ with variables and render

# Demo moving knitr output	
reports/500.md : analysis/500.Rmd data/ds_small.rds
	R -e "knitr::knit('analysis/500.Rmd')"
	rm reports/500.md # ex. of how to remove a file

# output an individual figure
reports/final_output.jpeg : munge/400.R data/ds_small.rds
	Rscript $< # $< refers to first prereq
	mv final_output.jpeg reports

# Note that $^ refers to all prereqs, but will not cause a problem 
# having a dataset as a prerequisite. 
data/ds_small.rds : munge/300.R data/ds_mt.rds
	Rscript $^ # $^ refers to all prereqs, and is not undermined by the presence \
	of a data file as a prereq. 

data/ds_mt.rds : munge/100.R munge/200.R
	Rscript $^

.PHONY : clean
clean :
	-rm -f reports/*.html reports/*.jpeg reports/*.md data/*.rds 