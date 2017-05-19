# UK Biobank Tools

Scripts to parse and analyze UK Biobank data.

## melt_tab.awk

 Awk script to _melt_ tab-delimited UK Biobank dataset, similar the _melt_ function of the [**reshape2**](https://cran.r-project.org/web/packages/reshape2/index.html) R package.

 The motivation for this script is to faciliate the convertion of **large** tab-delimited UK Biobank dataset to long format, or to _melt_ the dataset.  For a small dataset, please consider using the _melt_ function of the **reshape2** R package as it offers greater functionality.

### Usage

    awk -f melt_tab.awk ukb####.tab > ukb####.melt
	
### Output

  Missing values (**NA**) are discarded.
  
  Columns in tab-delimited output are:

1. **eid**: Participant id.
2. **df**: Data-field id.
3. **instnum**: Instance number for given data-field (0-based).
4. **itemnum**: Item number for given instance (0-based).
5. **value**: Data-field value for given participant, instance number and item number.

## fetch_tab.awk

 Gawk script to subset tab-delimited UK Bionank dataset by list of user-supplied data-fields.
 
### Usage

    gawk -f fetch_tab.awk data-fields.txt ukb####.tab | gzip -c > ukb####_fetch.tab.gz

 File **data-fields.txt** contains a line of data-field identifiers, one per line. Example:
 
    21022
	52
	34
	31

### Output

 Output is subset of input UK Biobank dataset by the supplied data-fields.  The format of the file remains as tab-delimited, and data-fields retain original order. For each data-field, all instance and items are output. All participants are output.
