< hisat2.mk

all:VE:
	./targets | xargs mk

'results/%.sam':	'data/%_R1.fastq'	'data/%_R2.fastq'
	mkdir -p `dirname "$target"`
	hisat2 \
		-x "$HISAT2_REFERENCE" \
		-1 'data/'"$stem"'_R1.fastq' \
		-2 'data/'"$stem"'_R2.fastq' \
	> "$target"'.build' \
	&& mv "$target"'.build' "$target"
