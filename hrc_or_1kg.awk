# Usage awk -v chrom=$i -f hrc_or_1kg.awk <(zcat HRC.r1-1.GRCh37.wgs.mac5.sites.tab.gz) ukb_mfi_chr${i}_v2.txt > ukb_hrc_chr${i}.txt ukb_1kg_chr${i}.txt

FNR == NR {
    snp=$3
    if ($1 == chrom) {
	if (snp == "."){
	    snp = $1":"$2"_"$4"_"$5
	}
	m[snp]=snp
    }
    next
}
{
    snpname_a=$1
    snpname_b=chrom":"$2"_"$3"_"$4
    if ((snpname_a in m) || (snpname_b in m)){
	print $1 
    }else{
	print $1 > "/dev/stderr"

    }
}
