import snappy
import pandas as pd
import re
import numpy as np

#initialize link table
#add information (definitely ribbon, unclear, definitely not ribbon)
link_iterator = snappy.HTLinkExteriors(knots_vs_links='links')

ribbon_checked = pd.read_csv('/Users/seohyeonlee/knotinfo/results/census_checked.csv')
potential_ribbons = set(ribbon_checked['name_unoriented'])
known_ribbons = set(ribbon_checked[ribbon_checked['known_ribbon']]['name_unoriented'])

link_dct = {}
keys = ['name_unoriented', 'determinant', 'num_crossings', 'matrix_zero', 'components', 'jones_factorable', 'jones_determinant']

for link in link_iterator:
    linkname = link.name()
    print(f'working on link {linkname}')
    L = link.link()
    num_crossings = int(re.findall('L(\d+)[an]\d+', linkname)[0])
    linking_matrix = L.linking_matrix()
    link_dct[linkname]= {}

    link_dct[linkname]['num_crossings'] = num_crossings
    link_dct[linkname]['determinant'] = L.determinant()
    link_dct[linkname]['matrix_zero'] =  all(x == 0 for row in linking_matrix for x in row)
    link_dct[linkname]['name_unoriented'] = linkname
    link_dct[linkname]['components'] = link.num_cusps()

    # 0 = definitely not ribbon, 1 = definitely ribbon, 2 = unclear
    #check: definitely not ribbon (fails some obstruction)
    #if not in the final 92
    if linkname not in potential_ribbons:
        link_dct[linkname]['ribbon'] = 0
    else:
        if linkname in known_ribbons:
            link_dct[linkname]['ribbon'] = 1
        else:
            link_dct[linkname]['ribbon'] = 2

snappy_links_all = pd.DataFrame.from_dict(link_dct, orient='index')


print(snappy_links_all.value_counts('ribbon'))
snappy_links_all.to_csv('/Users/seohyeonlee/knotinfo/results/snappy_everything.csv', index=False)
