# bampfa exhibition history thing

## ... more details pending

using this GREL expression in OpenRefine to naively parse firstname/lastname (it's not at all best practices, doesn't account for middle names, etc., it's just for efficiency)

`value.match(/([\w\.à-üÀ-Ü\ ]+)(\ )([A-Za-zà-üÀ-Ü]+)/)[2]`

* [url](https://w.wiki/7b92) to query wikidata for films
