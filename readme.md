# bampfa exhibition history thing

## ... more details pending

using this GREL expression in OpenRefine to naively parse firstname/lastname (it's not at all best practices, doesn't account for middle names, etc., it's just for efficiency)

`value.match(/([\w\.à-üÀ-Ü\ ]+)(\ )([A-Za-zà-üÀ-Ü]+)/)[2]`

* [url](https://w.wiki/7b92) to query wikidata for films


Note to self: ask RIT to update the cinefiles title_ss field with a case insensitive copy following the example [here](https://stackoverflow.com/questions/2053214/how-to-create-a-case-insensitive-copy-of-a-string-field-in-solr) on SO.
