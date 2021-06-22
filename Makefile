.PHONY: all

all:
	git log --pretty=format:"%s" | head -1 | grep '^Rebase patch for [0-9.]* build \d*$$' || (echo "Error: unexpected commit message" && false)
	./gradlew applyPatches
	./gradlew reobfJar
	mv ./Paper-Server/build/libs/Paper-Server-reobf.jar ./paper-`git log --pretty=format:"%s" | head -1 | sed -r 's/^Rebase patch for ([0-9.]+) build ([0-9]+)$$/\1/g'`-`git log --pretty=format:"%s" | head -1 | sed -r 's/^Rebase patch for ([0-9.]+) build ([0-9]+)$$/\2/g'`-giji34.jar
