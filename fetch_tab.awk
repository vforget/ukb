#!/usr/bin/gawk

BEGIN {
    # Ensure array indicies are sorted by number ie, column index in the tab file
    PROCINFO["sorted_in"]="@ind_num_asc"
}

# Load data-fields from query file
FNR==NR {
    ql[$1]=$1
    next
}

# On header line of tab file find column indicies for query data-fields
# Also, print new header for query data-fields only
FNR==1 && NR!=1 {
    printf "%s", $1
    for (i=2;i<NF;i++){
	split($(i),a,".")
	if (a[2] in ql){
	    printf "Found data-field %s at col=%s, name=%s\n", a[2], i, $(i) > "/dev/stderr"
	    printf "\t%s", $(i)
	    dl[i]=$(i)
	    fl[a[2]]=a[2]
	}
    }
    print ""
    printf "                  " > "/dev/stderr"
    next	
}

# Report how many data fields where found
FNR==2 && NR!=1 {
    printf "Found %s of %s data-fields:\n", length(fl), length(ql) > "/dev/stderr"
    for (q in ql){
	if (!(q in fl)) {
	    printf "WARNING: Failed to find data-field %s\n", q > "/dev/stderr"
	}
    }
}

# Extract data-fields based on their column indicies
{
    printf "%s", $1
    for (i in dl){
	printf "\t%s", $(i)
    }
    print ""
    if ((NR % 10) == 0){ printf "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\bProcessing:%7d", NR > "/dev/stderr" }   
}
