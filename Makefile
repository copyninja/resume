all: index.html resume.pdf resume.txt

index.html: resume.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o index.html resume.md

resume.pdf: index.html
	wkhtmltopdf index.html resume.pdf

resume.txt: resume.md
	pandoc --standalone --smart --from markdown --to plain -o resume.txt resume.md

clean:
	rm -f *.html *.pdf *.txt
