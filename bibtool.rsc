# look at ctan package for explanations

# delete abstract fields
delete.field = { abstract }
delete.field = { file }
# key formatting
key.format = "%-1n(author)%d(year)%-T(title)"
# for key generation, don't include et al
fmt.et.al = ""
# ignore comments
pass.comments = on
# don't look up fields via crossref
crossref.limit = 0
# ignore more words
ignored.word = {from}
ignored.word = {is}
ignored.word = {on}
ignored.word = {towards}
# umlauts
tex.define {¨o=oe}
tex.define {¨a=ae}
tex.define {\o=o}
tex.define {¨u=ue}
tex.define {-=}
tex.define { =}
tex.define{\"[1]=#1e}
