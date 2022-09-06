clean:
	sudo rm -rf ./cache
	sudo rm -rf ./out

.PHONY: build
build:
	@make clean
	sudo ./mkarchiso -v -w ./cache ./

.PHONY: run
run:
	run_archiso -u -i ./out/*