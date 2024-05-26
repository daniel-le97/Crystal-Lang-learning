# Set the virtual environment directory
APP = src/starter.cr

ARGS = $(filter-out $@,$(MAKECMDGOALS))
# Activate the virtual environment

fmt:
	crystal tool format src/

symlink:
	sudo ln -s "$(pwd)/main" /usr/local/bin/mycli

build:
	crystal build $(APP) --release --time --progress

run:
	crystal run $(APP) -d

cli:
	crystal run src/cli.cr $(ARGS)

# Clean up


bombardier:
	bombardier -c 125 -n 1000000 http://localhost:8080

# Prevent make from trying to use these as file targets
%:
	@:
