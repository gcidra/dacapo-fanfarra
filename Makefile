# file = dacapo.lytex
# file = dacapo-vol1.lytex
# file = dacapo-vol2.lytex
# file = dacapo-resumido.lytex
file = teste.lytex
# file-regencia = dacapo-regencia.lytex
# file-regencia = dacapo-reg-vol1.lytex
file-regencia = dacapo-reg-vol2.lytex
# file-regencia = teste-regencia-dacapo.lytex
# file-percussao = dacapo-percussao.lytex
# file-percussao = dacapo-perc-vol1.lytex
file-percussao = dacapo-perc-vol2.lytex
# file-percussao = teste.lytex


vpath %.reg reg
vpath %.ly ly

all-reg := $(notdir $(patsubst %.ly,%.reg,$(wildcard ly/*.ly)))

regencia = regencia
percussao = percussao
instrumentos_clave_de_sol = cornetaSib cornetaFa cornetaMib
instrumentos_clave_de_fa = cornetaoSib cornetaoFa cornetaoMib contra-baixoSib contra-baixoMib
listlivros = cornetaSib cornetaFa cornetaMib cornetaoSib cornetaoFa cornetaoMib contra-baixoSib contra-baixoMib

all_ps_sol = $(addsuffix .ps,$(instrumentos_clave_de_sol))
all_ps_fa = $(addsuffix .ps,$(instrumentos_clave_de_fa))


all_pdf_sol = $(addsuffix .pdf,$(instrumentos_clave_de_sol))
all_pdf_fa = $(addsuffix .pdf,$(instrumentos_clave_de_fa))
all_pdf_livros = $(addsuffix .pdf,$(listlivros))

instrumentos_ps: all_sol all_fa

instrumentos_pdf: all_pdf_sol all_pdf_fa

all_sol: $(all_ps_sol)
all_fa: $(all_ps_fa)
all_pdf_sol: $(all_pdf_sol)
all_pdf_fa: $(all_pdf_fa)
all: $(all_pdf_livros)

arquivos_regencia: $(all-reg)

regencia.lytex: $(file-regencia)  Makefile arquivos_regencia
	sed  -e 's/instrumento{Original}/instrumento{Regencia}/g' \
	-e 's/instrumento{InstrCapa}/instrumento{Regência}/g' \
	-e 's/instrumento{Rodape}/instrumento{Regência}/g' \
	-e 's/jogocl/jogoct/g' \
	-e 's/%%break-reg/\\break/g' $< > $@


percussao.lytex: $(file-percussao) Makefile arquivos_regencia
	sed  -e 's/%#fasustenido#%/mi natural/g' \
	-e 's/jogocl/jogoper/g' \
	-e 's/%%historia-instrumento/\hist-percussao/g' \
	-e 's/%#fig-clave#%/clave-perc-/g' \
	-e 's/instrumento{Original}/instrumento{Percussão}/g' $< > $@

cornetaSib.lytex: $(file) Makefile
	sed -e "s/keepWithTag #'ct/\keepWithTag #'ct/g" \
	-e 's/instrumento{InstrCapa}/instrumento{Corneta Sib}/g' \
	-e 's/instrumento{Original}/instrumento{Corneta Sib}/g' \
	-e 's/instrumento{Rodape}/instrumento{Corneta Sib}/g' \
	-e 's/%%historia-instrumento/\hist-corneta-sib/g' \
	-e 's/%%break-ct/\\break/g' \
	-e "s/transpose c c/transpose c c/g" $< > $@

cornetaFa.lytex: $(file) Makefile
	sed -e "s/keepWithTag #'ct/\keepWithTag #'ctfa/g" \
	-e 's/instrumento{InstrCapa}/instrumento{Corneta Fá}/g' \
	-e 's/instrumento{Original}/instrumento{Corneta Fá}/g' \
	-e 's/instrumento{Rodape}/instrumento{Corneta Fá}/g' \
	-e 's/%%historia-instrumento/\hist-corneta-fa/g' \
	-e 's/%%break-ctfa/\\break/g' \
	-e "s/transpose c c/transpose c c/g" $< > $@

cornetaMib.lytex: $(file) Makefile
	sed -e "s/keepWithTag #'ct/\keepWithTag #'ctmib/g" \
	-e 's/instrumento{InstrCapa}/instrumento{Corneta Mib}/g' \
	-e 's/instrumento{Original}/instrumento{Corneta Mib}/g' \
	-e 's/instrumento{Rodape}/instrumento{Corneta Mib}/g' \
	-e 's/%%historia-instrumento/\hist-corneta-mib/g' \
	-e 's/%%break-ctmib/\\break/g' \
	-e "s/transpose c c/transpose c c/g" $< > $@

cornetaoSib.lytex: $(file) Makefile
	sed -e "s/keepWithTag #'ct/\keepWithTag #'ctao/g" \
	-e 's/instrumento{InstrCapa}/instrumento{Cornetao Sib}/g' \
	-e 's/instrumento{Original}/instrumento{Cornetao Sib}/g' \
	-e 's/instrumento{Rodape}/instrumento{Cornetao Sib}/g' \
	-e 's/%%historia-instrumento/\hist-cornetao-sib/g' \
	-e 's/%%break-ctao/\\break/g' \
	-e "s/transpose c c/transpose c c/g" $< > $@

cornetaoFa.lytex: $(file) Makefile
	sed -e "s/keepWithTag #'ct/\keepWithTag #'ctaofa/g" \
	-e 's/instrumento{InstrCapa}/instrumento{Cornetao Fá}/g' \
	-e 's/instrumento{Original}/instrumento{Cornetao Fá}/g' \
	-e 's/instrumento{Rodape}/instrumento{Cornetao Fá}/g' \
	-e 's/%%historia-instrumento/\hist-cornetao-fa/g' \
	-e 's/%%break-ctaofa/\\break/g' \
	-e "s/transpose c c/transpose c c/g" $< > $@

cornetaoMib.lytex: $(file) Makefile
	sed -e "s/keepWithTag #'ct/\keepWithTag #'ctaomib/g" \
	-e 's/instrumento{InstrCapa}/instrumento{Cornetao Mib}/g' \
	-e 's/instrumento{Original}/instrumento{Cornetao Mib}/g' \
	-e 's/instrumento{Rodape}/instrumento{Cornetao Mib}/g' \
	-e 's/%%historia-instrumento/\hist-cornetao-mib/g' \
	-e 's/%%break-ctaomib/\\break/g' \
	-e "s/transpose c c/transpose c c/g" $< > $@

contra-baixoSib.lytex: $(file) Makefile
	sed -e "s/keepWithTag #'ct/\keepWithTag #'bx/g" \
	-e 's/instrumento{InstrCapa}/instrumento{Contra-Baixo Sib}/g' \
	-e 's/instrumento{Original}/instrumento{Contra-Baixo Sib}/g' \
	-e 's/instrumento{Rodape}/instrumento{Contra-Baixo Sib}/g' \
	-e 's/%%historia-instrumento/\hist-contra-baixo-sib/g' \
	-e 's/%%break-bxao/\\break/g' \
	-e "s/transpose c c/transpose c c/g" $< > $@

contra-baixoFa.lytex: $(file) Makefile
	sed -e "s/keepWithTag #'ct/\keepWithTag #'bxfa/g" \
	-e 's/instrumento{InstrCapa}/instrumento{Contra-Baixo Fá}/g' \
	-e 's/instrumento{Original}/instrumento{Contra-Baixo Fá}/g' \
	-e 's/instrumento{Rodape}/instrumento{Contra-Baixo Fá}/g' \
	-e 's/%%historia-instrumento/\hist-contra-baixo-fa/g' \
	-e 's/%%break-bxaofa/\\break/g' \
	-e "s/transpose c c/transpose c c/g" $< > $@

contra-baixoMib.lytex: $(file) Makefile
	sed -e "s/keepWithTag #'ct/\keepWithTag #'bxmib/g" \
	-e 's/instrumento{InstrCapa}/instrumento{Contra-Baixo Mib}/g' \
	-e 's/instrumento{Original}/instrumento{Contra-Baixo Mib}/g' \
	-e 's/instrumento{Rodape}/instrumento{Contra-Baixo Mib}/g' \
	-e 's/%%historia-instrumento/\hist-contra-baixo-mib/g' \
	-e 's/%%break-bxaomib/\\break/g' \
	-e "s/transpose c c/transpose c c/g" $< > $@

%.reg: %.ly
	clisp scripts/remove-bloco.lisp $< reg/$@

%.pdf: %.tex
	cd out ;\
	pdflatex $< ;\
	pdflatex $< ;\
	cp $@ ..


%.dvi: %.tex
	cd out ;\
	latex $< ;\
	latex $< ;\

%.ps: %.dvi
	cd out ;\
	dvips -o $@ $< ;\
	cp $@ ..

%.eps: %.svg
        inkscape -T --export-eps=$@ $<

%.tex: %.lytex 
	lilypond-book --pdf -I ly -I ly/reg -I reg -o out $< ;\

cleanall: cleanregencia cleanpercussao cleanoutsol cleanoutfa clean

cleanregencia:
	for f in $(regencia) ;\
	do \
	rm -rf $$f.lytex $$f.ps $$f.pdf ;\
	done

cleanreg:
	find -name *.reg -exec rm -rfv {} \;

cleanpercussao:
	for f in $(percussao) ;\
	do \
	rm -rf $$f.lytex $$f.ps $$f.pdf ;\
	done

cleanoutsol:
	for f in $(instrumentos_clave_de_sol) ;\
	do \
	rm -rf $$f.lytex $$f.ps $$f.pdf ;\
	done

cleanoutfa:
	for f in $(instrumentos_clave_de_fa) ;\
	do \
	rm -rf $$f.lytex $$f.ps $$f.pdf ;\
	done

clean:
	rm -rf out ;\
	find -name \*~ -exec rm -rfv {} \;
