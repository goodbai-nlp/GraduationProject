export output_embeddings="new_location" #"/usr1/home/wammar/cca-embeddings/all_languages.cca.window_5+iter_10+size_40+threads_16"
export temp="/home/xfbai/cca-embeddings/"
export utils="/usr1/home/xfbai/utils/"
export word2vec="/home/xfbai/tools/word2vec"

# create temp dir
mkdir $temp

# remove old embeddings if any
rm $output_embeddings

# process en
export corpus_en="/home/xfbai/unfe/undoc.2000.en-fr.tok.cleaned.en"
$word2vec/word2vec -train $corpus_en -window 5 -iter 10 -size 40 -threads 16 -output $temp/embeddings_en.noprefix
# python $utils/	.py -i $temp/embeddings_en.noprefix -o $temp/embeddings_en.prefix -p en:
# python $utils/strip_lines.py -i $temp/embeddings_en.prefix -o $temp/embeddings_en


# process de
# export corpus_de="/usr1/home/wammar/monolingual/combo.de"
# export dictionary_de_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.de-en"
# $word2vec/word2vec -train $corpus_de -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_de.noprefix"
# python $utils/prefix_lines.py -i $temp/embeddings_de.noprefix -o $temp/embeddings_de.prefix -p de:
# python $utils/strip_lines.py -i $temp/embeddings_de.prefix -o $temp/embeddings_de
# ./project_vectors_to_lang2.sh "$temp/embeddings_de" "$temp/embeddings_en" $dictionary_de_en "$temp/dummy" "$temp/embeddings_de.projected" "$temp/embeddings_en.projected"
# cat "$temp/embeddings_de.projected" >> $output_embeddings


# process fr
export corpus_fr="/home/xfbai/unfe/undoc.2000.en-fr.tok.cleaned.fr"
# export dictionary_fr_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.fr-en"
$word2vec/word2vec -train $corpus_fr -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_fr.noprefix"
# python $utils/prefix_lines.py -i $temp/embeddings_fr.noprefix -o $temp/embeddings_fr.prefix -p fr:
# python $utils/strip_lines.py -i $temp/embeddings_fr.prefix -o $temp/embeddings_fr
# ./project_vectors_to_lang2.sh "$temp/embeddings_fr" "$temp/embeddings_en" $dictionary_fr_en "$temp/dummy" "$temp/embeddings_fr.projected" "$temp/embeddings_en.projected"
# cat "$temp/embeddings_fr.projected" >> $output_embeddings


# finally, concatenate normalized english embeddings
# cat "$temp/embeddings_en.projected" >> $output_embeddings
