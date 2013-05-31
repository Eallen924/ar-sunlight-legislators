require 'csv'
require_relative '../app/models/legislator'

class SunlightLegislatorsImporter
  def self.import(filename)
    congress_critters = []
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      name = " #{row[:firstname]} #{row[:lastname]}"
      congress_critters << { name:       name,
                             email:      row[:email],
                             phone:      row[:phone],
                             fax:        row[:fax],
                             website:    row[:website],
                             webform:    row[:webform],
                             party:      row[:party],
                             gender:     row[:gender],
                             birthdate:  row[:birthdate],
                             twitter_id: row[:twitter_id],
                                                          }

        #raise NotImplementedError, "TODO: figure out what to do with this row and do it!"
        # TODO: end
    end
    member = Legislator.create!(congress_critters)
  end
end

begin
  raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
  SunlightLegislatorsImporter.import(ARGV[0])
rescue ArgumentError => e
  $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
rescue NotImplementedError => e
  $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
end
#"title","firstname","middlename","lastname","name_suffix","nickname","party",
#""state","district","in_office","gender","phone","fax","website","webform",
#"congress_office","bioguide_id","votesmart_id","fec_id","govtrack_id","crp_id"
#","twitter_id","congresspedia_url","youtube_url","facebook_id","official_rss"
#","senate_class","birthdate"
