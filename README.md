# UK Biobank Tools

Scripts to parse and analyze UK Biobank data.

## melt_tab.awk

Awk script to _melt_ tab-delimited UK Biobank dataset, similar the _melt_ function of the [**reshape2**](https://cran.r-project.org/web/packages/reshape2/index.html) R package.

The motivation for this script is to faciliate the convertion of **large** tab-delimited UK Biobank dataset to long format, or to _melt_ the dataset.  For a small dataset, please consider using the _melt_ function of the **reshape2** R package as it offer greater functionality.

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

