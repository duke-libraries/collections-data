path = "/Users/cl334/Box Sync/Home Folder cl334/Collections Assessment/Data sources/Aleph exports/final-csv/"

files = [
        #"CM-bio.csv",
        #"CM-div.csv",
        #"CM-dukeInternet.csv",
        #"CM-lilly.csv",
        #"CM-marine.csv",
        #"CM-music.csv",
        #"CM-pubdocs-01.csv",
        #"CM-pubdocs-02.csv",
        #"CM-pubdocs-03.csv",
        #"CM-pubdocs-04.csv",
        #"CM-pubdocs-05.csv",
        #"CM-pubdocs-06.csv",
        #"CM-rubenstein-01.csv",
        #"CM-rubenstein-02.csv",
        #"CM-rubenstein-03.csv",
        #"CM-rubenstein-04.csv",
        #"CM-rubenstein-05.csv",
        #"CM-rubenstein-06.csv",
        #"CM-rubenstein-07.csv",
        #"CM-rubenstein-08.csv"
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

files.each do |file|
  puts file
  SmarterCSV.process(path + file, options) do | row | 
    unless row[0][:oclc_number].blank?
      unless row[0][:oclc_number] == '"'
        if row[0][:desc14][7,1] == 'm'
          field_008 =  row[0][:desc14].gsub(/.*?[\.]{6}/, "")
          language =  field_008[35,3]
          publication_date = field_008[7,4] 
          if row[0][:acquisition_date].blank?
               acquisition_date = ""
          else
            if /\D{3}\s\d{1,2},\s\d{4}/.match(row[0][:acquisition_date])
              acquisition_date = Date.strptime(row[0][:acquisition_date], "%b %d, %Y").to_date
            else
              acquisition_date = Date.strptime(row[0][:acquisition_date], "%m/%d/%y").to_date
            end
          end
          MonographHolding.create(oclc_number: row[0][:oclc_number], acquisition_date: acquisition_date, publisher: row[0][:publisher], language: language, publication_year: publication_date, lc_number: row[0][:lc_number], sub_library: row[0][:sub_library], collection: row[0][:collection], material_type: row[0][:material_type])
        end
      end
    end
  end
end