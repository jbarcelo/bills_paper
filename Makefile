all:	clean bib pdf 

pdf: 
	latex barcelo2012mdc.tex
	latex barcelo2012mdc.tex
	#dvipdfm barcelo2012mdc.dvi
	dvips -o barcelo2012mdc.ps -Ppdf -G0 -t a4 barcelo2012mdc.dvi
	ps2pdf -sPAPERSIZE=a4 -dPDFSETTINGS=/prepress -dEmbedAllFonts=true barcelo2012mdc.ps
	evince barcelo2012mdc.pdf &

publish:
	cp barcelo2012mdc.pdf /media/USB20FD/upf2012/webs/s3web/papers/
	s3cmd put --acl-public barcelo2012mdc.pdf s3://www.jaumebarcelo.info/papers/ &


bib:	
	latex barcelo2012mdc.tex
	bibtex barcelo2012mdc
					
clean:
	rm -f barcelo2012mdc.aux barcelo2012mdc.log barcelo2012mdc.blg barcelo2012mdc.bbl barcelo2012mdc.out barcelo2012mdc.dvi barcelo2012mdc.ps barcelo2012mdc.pdf *diff* *~

differences:
	cp barcelo2012mdc.tex new.tex
	#git show HEAD~10:barcelo2012mdc.tex>old.tex
	latexdiff old.tex new.tex > barcelo2012mdc_diff.tex
	latex barcelo2012mdc_diff.tex
	latex barcelo2012mdc_diff.tex
	bibtex barcelo2012mdc_diff
	latex barcelo2012mdc_diff.tex
	latex barcelo2012mdc_diff.tex
	dvips -o barcelo2012mdc_diff.ps -Ppdf -G0 -t a4 barcelo2012mdc_diff.dvi
	ps2pdf -sPAPERSIZE=a4 -dPDFSETTINGS=/prepress -dEmbedAllFonts=true barcelo2012mdc_diff.ps
	evince barcelo2012mdc_diff.pdf &

publishdifferences:
	cp barcelo2012mdc_diff.pdf /media/USB20FD/upf2012/webs/s3web/papers/
	s3cmd put --acl-public barcelo2012mdc_diff.pdf s3://www.jaumebarcelo.info/papers/

