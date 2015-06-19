path = "/Users/cl334/Box Sync/Home Folder cl334/Collections Assessment/Data sources/Circ data/"

files = [
        "circ-data-final-1.csv",
        "circ-data-final-2.csv",
        "circ-data-final-3.csv",
        "circ-data-final-4.csv"
        ]

options = {:remove_unmapped_keys => true,
                    :key_mapping => {
                                     :desc3 => :oclc_number, 
                    :history_item_open_date => :acquisition_date, 
                                 :publisher => :publisher, 
                                    :desc14 => :desc14, 
                      :primary_call_no_desc => :lc_number,                            
                          :sub_library_desc => :sub_library, 
                           :collection_desc => :collection, 
                        :material_type_desc => :material_type
            }
          }