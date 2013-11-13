all: index.html index.pdf index.txt

index.html: index.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o index.html index.md

index.pdf: index.html
	wkhtmltopdf index.html index.pdf

index.txt: index.md
	pandoc --standalone --smart --from markdown --to plain -o index.txt index.md

clean:
	rm -f *.html *.pdf *.docx *.txt
