all:
	mkdir -p data
	mkdir -p results
	Rscript analysis/01_load-data.R
	Rscript analysis/02_methods.R
	Rscript analysis/03_model.R

data:
	mkdir -p data

results:
	mkdir -p results

load:
	Rscript analysis/01_load-data.R

methods:
	Rscript analysis/02_methods.R
	
model:
	Rscript analysis/03_model.R

clean:
	rm -rf data
	rm -rf results