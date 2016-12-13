< hisat2.mk

all:VE:	paired	single

paired:VE:
	./targets_paired | xargs mk

single:VE:
	./targets_single | xargs mk

'results/%.paired.sam':	'data/%_R1.fastq'	'data/%_R2.fastq'
	mkdir -p `dirname "$target"`
	hisat2 \
		-x "$HISAT2_REFERENCE" \
		-1 'data/'"$stem"'_R1.fastq' \
		-2 'data/'"$stem"'_R2.fastq' \
	> "$target"'.build' \
	&& mv "$target"'.build' "$target"

'results/%.single.sam':	'data/%_R1.fastq'	'data/%_R2.fastq'
	mkdir -p `dirname "$target"`
	hisat2 \
		-x "$HISAT2_REFERENCE" \
		-U 'data/'"$stem"'_R1.fastq','data/'"$stem"'_R2.fastq' \
	> "$target"'.build' \
	&& mv "$target"'.build' "$target"
