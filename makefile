all: graphobj masses points testuniformcentered graphdraw controls cS51 point_tests masses_tests testgraphs testalign graph

graphobj: graphobj.ml
	ocamlbuild -use-ocamlfind graphobj.byte

masses: masses.ml
	ocamlbuild -use-ocamlfind masses.byte

points: points.ml
	ocamlbuild -use-ocamlfind points.byte

testuniformcentered: testuniformcentered.ml
	ocamlbuild -use-ocamlfind testuniformcentered.byte

graphdraw: graphdraw.ml
	ocamlbuild -use-ocamlfind graphdraw.byte

controls: controls.ml
	ocamlbuild -use-ocamlfind controls.byte

cS51: cS51.ml
	ocamlbuild -use-ocamlfind cS51.byte

point_tests: point_tests.ml
	ocamlbuild -use-ocamlfind point_tests.byte

masses_tests: masses_tests.ml
	ocamlbuild -use-ocamlfind masses_tests.byte

testgraphs: testgraphs.ml
	ocamlbuild -use-ocamlfind testgraphs.byte

testalign: testalign.ml
	ocamlbuild -use-ocamlfind testalign.byte

graph: graph.ml
	ocamlbuild -use-ocamlfind graph.byte
clean:
	rm -rf _build *.byte