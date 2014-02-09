all: index.html resume.pdf resume.txt

index.html: resume.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o index.html resume.md

resume.pdf: index.html
	# wkhtmltopdf --page-size A4 index.html resume.pdf
	pandoc --standalone -c style.css --from markdown --to latex -o resume.tex resume.md
	pdflatex resume.tex

resume.txt: resume.md
	pandoc --standalone --smart --from markdown --to plain -o resume.txt resume.md

clean:
	rm -f *.html *.pdf *.txt
